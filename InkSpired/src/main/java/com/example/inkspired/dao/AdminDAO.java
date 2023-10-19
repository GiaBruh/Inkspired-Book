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
    public void addAdmin(Admin admin) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO public.admin(admin_id, username, password, full_name, email_address) VALUES (?, ?, ?, ?, ?)");
            // Set the parameters for the SQL statement
            preparedStatement.setInt(1, admin.getAdminId());
            preparedStatement.setString(2, admin.getUsername());
            preparedStatement.setString(3, admin.getPassword());
            preparedStatement.setString(4, admin.getFullName());
            preparedStatement.setString(5, admin.getEmailAddress());

            // Execute the SQL statement
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to retrieve all admins
    public List<Admin> getAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        try {
            ResultSet resultSet = connection.createStatement().
                    executeQuery("SELECT * FROM public.admin");
            while (resultSet.next()) {
                Admin admin = new Admin();
                admin.setAdminId(resultSet.getInt("admin_id"));
                admin.setUsername(resultSet.getString("username"));
                admin.setPassword(resultSet.getString("password"));
                admin.setFullName(resultSet.getString("full_name"));
                admin.setEmailAddress(resultSet.getString("email_address"));
                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admins;
    }


    public boolean checkCredentials(String username, String password) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("SELECT * FROM public.admin WHERE username = ? AND password = ?");
            // Set the parameters for the SQL statement
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            // Execute the SQL statement
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Admin checkLogin(String username, String password) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("SELECT * FROM public.admin WHERE username = ? AND password = ?");
            // Set the parameters for the SQL statement
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Admin admin = new Admin();
                admin.setAdminId(resultSet.getInt("admin_id"));
                admin.setUsername(resultSet.getString("username"));
                admin.setPassword(resultSet.getString("password"));
                admin.setFullName(resultSet.getString("full_name"));
                admin.setEmailAddress(resultSet.getString("email_address"));
                return admin;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

}
