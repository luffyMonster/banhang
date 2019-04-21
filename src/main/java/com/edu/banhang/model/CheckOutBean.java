package com.edu.banhang.model;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

public class CheckOutBean implements Serializable {
    @NotEmpty(message = "*Please provide your full name")
    private String fullName;

    @NotEmpty(message = "*Please provide your phone number")
    private String phoneNumber;

    @NotEmpty(message = "*Please provide your address")
    private String address;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
