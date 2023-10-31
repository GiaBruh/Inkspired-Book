package com.example.inkspired.model;

public class Admin {
    private int adminId;
    private String username;
    private String password;
    private String fullName;
    private String emailAddress;

    public Admin() {
    }

    public Admin(int adminId, String username, String password, String fullName, String emailAddress) {
        this.adminId = adminId;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.emailAddress = emailAddress;
    }

    public Admin (String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public Admin (String username, String password) {
        this.username = username;
        this.password = password;
    }

    public int getAdminId() {
        return this.adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return this.fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmailAddress() {
        return this.emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
}