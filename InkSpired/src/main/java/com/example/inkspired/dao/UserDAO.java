package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserDAO implements DAO<User> {
    private Connection conn = null;

    public UserDAO() {
        conn = PostgresqlConnection.getConn();
    }

    @Override
    public List<User> getAll() {
        ArrayList<User> result = new ArrayList<>();
        String query = "SELECT * FROM public.user";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("id"));
                user.setEmail_address(rs.getString("email_address"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFull_name(rs.getString("full_name"));
                user.setGender(rs.getString("gender"));
                user.setBirthday(rs.getDate("birthday"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setUser_image(rs.getString("user_image"));
                user.setUser_status(rs.getBoolean("user_status"));
                result.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Optional<User> get(int id) {
        String query = "SELECT * FROM public.user where id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail_address(rs.getString("email_address"));
                return Optional.of(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public void add(User user) {

    }

    @Override
    public void update(User user) {
        String query = "UPDATE public.user set id = ? ";
    }

    @Override
    public void delete(User user) {
        String query = "DELETE FROM public.user WHERE id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, user.getUserId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public boolean delete(int id) {
        String query = "DELETE FROM public.user WHERE id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            return ps.executeUpdate() == 1;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
