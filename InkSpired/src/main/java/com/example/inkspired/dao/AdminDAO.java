package com.example.inkspired.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.inkspired.util.Utils;
import com.example.inkspired.model.Admin;
import com.example.inkspired.util.Utils;
import com.example.inkspired.dbconnection.PostgresqlConnection;

public class AdminDAO {

    private Connection connection;
    private Utils utils = new Utils();

    public AdminDAO() {
        connection = PostgresqlConnection.getConn();
    }



    public Admin checkLogin(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        Admin admin = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, utils.md5Hash(password));
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

    public Admin getAdmin(String username) {
        String sql = "SELECT * FROM admin WHERE username = ?";
        Admin admin = null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
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


    public void updateAdmin(Admin admin) {
        String sql = "UPDATE admin SET  full_name = ? WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, admin.getFullName());
            ps.setString(2, admin.getUsername());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
