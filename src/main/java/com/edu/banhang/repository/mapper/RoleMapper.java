package com.edu.banhang.repository.mapper;

import com.edu.banhang.model.Role;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.edu.banhang.constant.DBConstants.ROLE;
import static com.edu.banhang.constant.DBConstants.ROLE_ID;

public class RoleMapper implements RowMapper<Role> {
    @Override
    public Role mapRow(ResultSet resultSet, int i) throws SQLException {
        Role role = new Role();
        role.setId(resultSet.getLong(ROLE_ID));
        role.setRole(resultSet.getString(ROLE));
        return role;
    }
}
