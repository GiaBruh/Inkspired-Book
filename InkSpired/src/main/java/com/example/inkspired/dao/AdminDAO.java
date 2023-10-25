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
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("SELECT * FROM public.admin WHERE username = ? AND password = ?");
            // Set the parameters for the SQL statement
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, utils.md5Hash(password));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Admin admin = new Admin();
                admin.setUsername(resultSet.getString("username"));
                admin.setPassword(resultSet.getString("password"));
                return admin;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

}
