package com.edu.banhang.repository;

import com.edu.banhang.model.Role;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.io.Serializable;
import java.util.List;


public interface RoleRepository extends PagingAndSortingRepository<Role, Long> {
    Role findByRole(String role);
    List<Role> findByUserID(Long id);
}
