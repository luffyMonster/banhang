package com.edu.banhang.repository.mapper;

import com.edu.banhang.model.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import static com.edu.banhang.constant.DBConstants.*;
public class UserMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();

        user.setId(rs.getLong(USER_ID));
        user.setName(rs.getString(NAME));
        user.setAddress(rs.getString(ADDRESS));
        user.setActive(rs.getInt(ACTIVE));
        user.setEmail(rs.getString(EMAIL));
        user.setUsername(rs.getString(USERNAME));
        user.setPassword(rs.getString(PASSWORD));

        return user;
    }
}