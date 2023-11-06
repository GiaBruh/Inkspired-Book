package com.example.inkspired.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.example.inkspired.util.Utils;
import com.example.inkspired.model.Admin;
import com.example.inkspired.dbconnection.PostgresqlConnection;

public class AdminDAO {

    private Connection conn;
    private Utils utils = new Utils();

    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public AdminDAO() {
        conn = PostgresqlConnection.getConn();
    }


    public Admin checkLogin(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        Admin admin = null;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, utils.md5Hash(password));
            rs = ps.executeQuery();
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

    public Admin getAdminInfo() {
        Admin admin = new Admin();
        String query = "SELECT * FROM ADMIN";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                admin = new Admin();
                admin.setUsername(rs.getString("username"));
                admin.setEmailAddress(rs.getString("email_address"));
                admin.setFullName(rs.getString("full_name"));
            }
        } catch (Exception e) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return admin;
    }

    public boolean checkExistingUserByEmail(String email_address) throws SQLException {
        String query = "SELECT * FROM public.admin WHERE email_address = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, email_address);
            rs = ps.executeQuery();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return rs.next();
    }

    public void updatePasswordByEmail(String password, String email_address) throws SQLException {
        String query = "UPDATE public.admin SET password = ? WHERE email_address = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, utils.md5Hash(password));
            ps.setString(2, email_address);
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }


}
