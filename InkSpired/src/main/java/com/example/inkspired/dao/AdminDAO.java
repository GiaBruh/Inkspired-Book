package com.example.inkspired.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.example.inkspired.model.Admin;
import com.example.inkspired.dbconnection.PostgresqlConnection;
public class AdminDAO {

    private Connection connection;

    public AdminDAO() {
        connection = PostgresqlConnection.getConn();
    }

    // Method to insert a new admin record


    public Admin checkLogin(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        Admin admin = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setEmailAddress(rs.getString("email_address"));
                admin.setFullName(rs.getString("full_name"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return admin;
    }



}
