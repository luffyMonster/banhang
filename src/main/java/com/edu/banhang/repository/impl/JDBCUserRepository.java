package com.edu.banhang.repository.impl;

import com.edu.banhang.model.Role;
import com.edu.banhang.model.User;
import com.edu.banhang.repository.RoleRepository;
import com.edu.banhang.repository.UserRepository;
import com.edu.banhang.repository.common.AbstractJdbcRepository;
import com.edu.banhang.repository.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.text.MessageFormat;
import java.util.List;
import java.util.Optional;

import static com.edu.banhang.constant.DBConstants.*;

@Repository
public class JDBCUserRepository extends AbstractJdbcRepository<User, Long> implements UserRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    RoleRepository roleRepository;

    @Override
    public void initialize() {
        this.rowMapper = new UserMapper();
        this.tableName = USER;
        this.idColumn = USER_ID;
        this.updater = (user, mapping) -> {
            mapping.put(USER_ID, user.getId());
            mapping.put(NAME, user.getName());
            mapping.put(ADDRESS, user.getAddress());
            mapping.put(ACTIVE, user.getActive());
            mapping.put(EMAIL, user.getEmail());
            mapping.put(USERNAME, user.getUsername());
            mapping.put(PASSWORD, user.getPassword());
        };
        afterPropertiesSet();
    }

    @Override
    public Optional<User> findByEmail(String email) {
        return getUser(email, EMAIL);
    }

    @Override
    public Optional<User> findByUsername(String username) {
        return getUser(username, USERNAME);
    }

    private Optional<User> getUser(Object param, String field) {
        String sql = MessageFormat.format("SELECT * FROM {0} WHERE {1} = ?", USER, field);
        List<User> userList = jdbcTemplate.query(sql, new Object[]{param}, new UserMapper());
        User u = userList.size() > 0 ? userList.get(0) : null;
        if (u != null) {
            u.setRoles(roleRepository.findByUserID(u.getId()));
        }
        return  Optional.ofNullable(u);
    }


    @Override
    public User save(User user) {
        String sqlRole = MessageFormat.format("INSERT INTO {0} ({1}, {2}) VALUES (?,?)", USER_ROLE, ROLE_ID, USER_ID);
        super.save(user);
        Optional<User> optionalUser = findByUsername(user.getUsername());
        optionalUser.ifPresent(u -> {
            if (u.getRoles() != null) {
                for (Role userRole : user.getRoles()) {
                    jdbcTemplate.update(sqlRole, userRole.getId(), u.getId());
                }
            }
        });
        return optionalUser.orElse(null);
    }

}
