package com.edu.banhang.repository.impl;

import com.edu.banhang.model.Role;
import com.edu.banhang.repository.RoleRepository;
import com.edu.banhang.repository.common.AbstractJdbcRepository;
import com.edu.banhang.repository.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

import static com.edu.banhang.constant.DBConstants.*;

@Repository
public class JDBCRoleRepository extends AbstractJdbcRepository<Role, Long> implements RoleRepository {


    public JDBCRoleRepository() {
        this.rowMapper = new RoleMapper();
        this.tableName = ROLE;
        this.idColumn = ROLE_ID;
        this.updater = (role, mapping) -> {
            mapping.put(ROLE_ID, role.getId());
            mapping.put(ROLE, role.getRole());
        };
        afterPropertiesSet();
    }

    @Override
    public Role findByRole(String role) {
        String sql = MessageFormat.format("SELECT * FROM {0} WHERE {1} = ?", ROLE, ROLE);
        List<Role> roles = jdbcTemplate.query(sql, new Object[]{role}, new RoleMapper());
        Role roleObject = null;
        if (roles.size() > 0) roleObject = roles.get(0);
        return roleObject;
    }

    @Override
    public List<Role> findByUserID(Long id) {
        String sql = "SELECT R." + ROLE_ID + ", R." + ROLE + " FROM " + USER + " U INNER JOIN " + USER_ROLE + " UR ON(U." + USER_ID +"=UR." + USER_ID +
                        ") INNER JOIN " + ROLE + " R ON(UR." + ROLE_ID + "=R." + ROLE_ID + ") WHERE U." + USER_ID + "=?";
        return jdbcTemplate.query(sql, new Object[]{id}, new RoleMapper());
    }
}
