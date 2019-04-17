package com.edu.banhang.model;

import java.util.Collection;

public class Role extends BaseModel{

    private String role;

    private Collection<User> users;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Collection<User> getUsers() {
        return users;
    }

    public void setUsers(Collection<User> users) {
        this.users = users;
    }

}
