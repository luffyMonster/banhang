package com.edu.banhang.service;

import com.edu.banhang.model.User;

import java.util.Optional;

public interface UserService {
    Optional<User> findByUsername(String username);
    Optional<User> findByEmail(String email);
    User saveUser(User user);
}
