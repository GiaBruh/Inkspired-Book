package com.example.inkspired.model;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {
    private int user_id;
    private String username;
    private String password;
    private String email_address;
    private String full_name;
    private String gender;
    private Date birthdate;
    private String phone_number;
    private String user_image;
    private boolean user_status;

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String email_address) {
        this.email_address = email_address;
    }


    public User(String username, String password, String email_address, String full_name, String gender, Date birthdate,
            String phone_number) {
        this.username = username;
        this.password = password;
        this.email_address = email_address;
        this.full_name = full_name;
        this.gender = gender;
        this.birthdate = birthdate;
        this.phone_number = phone_number;
    }

    public int getUserId() {
        return user_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
    }

    public String getEmail_address() {
        return email_address;
    }

    public void setEmail_address(String email_address) {
        this.email_address = email_address;
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

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getUser_image() {
        return user_image;
    }

    public void setUser_image(String user_image) {
        this.user_image = user_image;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public boolean isUser_status() {
        return user_status;
    }

    public void setUser_status(boolean user_status) {
        this.user_status = user_status;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", email_address='" + email_address + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", full_name='" + full_name + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthdate +
                ", phone_number='" + phone_number + '\'' +
                ", user_image='" + user_image + '\'' +
                '}';
    }
}
