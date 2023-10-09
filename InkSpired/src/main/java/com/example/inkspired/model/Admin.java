package com.example.inkspired.model;

public class Admin {
    private String username;
    private String password;
    private String email_address;
    private String phone_number;
    private String full_name;

    public Admin() {
    }

    public Admin(String username, String password, String email_address, String phone_number, String full_name) {
        this.username = username;
        this.password = password;
        this.email_address = email_address;
        this.phone_number = phone_number;
        this.full_name = full_name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail_address() {
        return email_address;
    }

    public void setEmail_address(String email_address) {
        this.email_address = email_address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email_address='" + email_address + '\'' +
                ", phone_number='" + phone_number + '\'' +
                ", full_name='" + full_name + '\'' +
                '}';
    }
}