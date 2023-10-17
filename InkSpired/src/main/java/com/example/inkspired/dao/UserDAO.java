package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.User;

import org.apache.commons.codec.digest.DigestUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO implements DAO<User> {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public UserDAO() {
        conn = PostgresqlConnection.getConn();
    }

    private void closeConnection() throws SQLException {
        if (conn != null) {
            conn.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (rs != null) {
            rs.close();
        }
    }

    public boolean login(User u) throws SQLException {
        String query = "SELECT * FROM public.user WHERE username = ? and password = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, u.getUsername());
            ps.setString(2, md5Hash(u.getPassword()));
            rs = ps.executeQuery();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return rs.next();
    }

    public boolean register(User u) {
        String query = "INSERT INTO public.user VALUES (?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, u.getUsername());
            ps.setString(2, md5Hash(u.getPassword()));
            ps.setString(3, u.getEmail_address());
            ps.setString(4, u.getFull_name());
            ps.setString(5, u.getGender());
            ps.setDate(6, u.getBirthdate());
            ps.setString(7, u.getPhone_number());
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    // public User login(String username, String password) throws SQLException {
    // String query = "SELECT * FROM public.user WHERE username = ? and password =
    // ?";
    // User result = null;
    // try {
    // ps = conn.prepareStatement(query);
    // ps.setString(1, username);
    // ps.setString(2, md5Hash(password));
    // rs = ps.executeQuery();
    // if (rs.next()) {
    // result = new User();
    // result.setUsername(rs.getString("username"));
    // result.setPassword(rs.getString("password"));
    // }
    // } catch (Exception e) {
    // Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
    // } finally {
    // closeConnection();
    // }
    // return result;
    // }

    @Override
    public List<User> getAll() {
        ArrayList<User> result = new ArrayList<>();
        String query = "SELECT * FROM public.user";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail_address(rs.getString("email_address"));
                user.setFull_name(rs.getString("full_name"));
                user.setGender(rs.getString("gender"));
                user.setBirthdate(rs.getDate("birthdate"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setUser_image(rs.getString("user_image"));
                user.setUser_status(rs.getBoolean("user_status"));
                result.add(user);
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    @Override
    public Optional<User> get(int id) {
        String query = "SELECT * FROM public.user where id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail_address(rs.getString("email_address"));
                user.setFull_name(rs.getString("full_name"));
                user.setGender(rs.getString("gender"));
                user.setBirthdate(rs.getDate("birthdate"));
                user.setPhone_number(rs.getString("phone_number"));
                user.setUser_image(rs.getString("user_image"));
                user.setUser_status(rs.getBoolean("user_status"));
                return Optional.of(user);
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return Optional.empty();
    }

    @Override
    public void add(User user) {
    }

    @Override
    public void update(User user) {
        String query = "UPDATE public.user SET username = ? , full_name = ? , gender = ? , birthdate = ? , phone_number = ? , user_image = ? WHERE id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getFull_name());
            ps.setString(3, user.getGender());
            ps.setDate(4, user.getBirthdate());
            ps.setString(5, user.getPhone_number());
            ps.setString(6, user.getUser_image());
            ps.setInt(7, user.getUserId());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void delete(User user) {
        String query = "DELETE FROM public.user WHERE id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, user.getUserId());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean delete(int id) {
        String query = "DELETE FROM public.user WHERE id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

//    public boolean update(int id) {
//       String query =  "UPDATE public.user SET username = ? , full_name = ? , gender = ? , birthdate = ? , phone_number = ? , user_image = ? WHERE id = ?";
//       try {
//           PreparedStatement ps = conn.prepareStatement(query);
//           ps.setString(1, user.getUsername());
//           ps.setString(2, user.getFull_name());
//           ps.setString(3, user.getGender());
//           ps.setDate(4, user.getBirthdate());
//           ps.setString(5, user.getPhone_number());
//           ps.setString(6, user.getUser_image());
//           ps.setInt(7, user.getUserId());
//           return ps.executeUpdate() == 1;
//       } catch (Exception e) {
//
//           Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
//       }
//       return false;
//    }

    private String md5Hash(String password) {
        return DigestUtils.md5Hex(password).toLowerCase();
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.delete(4));
    }
}
