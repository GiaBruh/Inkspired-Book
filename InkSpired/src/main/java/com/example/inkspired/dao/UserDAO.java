package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.User;

import com.example.inkspired.util.Utils;
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
    private Utils utils = null;

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

    public boolean checkExistingUserByEmail(String email_address) throws SQLException {
        String query = "SELECT * FROM public.user WHERE email_address = ?";
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
        String query = "UPDATE public.user SET password = ? WHERE email_address = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, utils.md5Hash(password));
            ps.setString(2, email_address);
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean login(User u) throws SQLException {
        String query = "SELECT * FROM public.user WHERE username = ? and password = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, u.getUsername());
            ps.setString(2, utils.md5Hash(u.getPassword()));
            rs = ps.executeQuery();
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return rs.next();
    }

    public boolean register(User u) {
        String query = "INSERT INTO public.user (username, password, email_address, full_name, gender, birthdate, phone_number, user_image, user_status)" +
                "VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, u.getUsername());
            ps.setString(2, utils.md5Hash(u.getPassword()));
            ps.setString(3, u.getEmail_address());
            ps.setString(4, u.getFull_name());
            ps.setString(5, u.getGender());
            ps.setDate(6, u.getBirthdate());
            ps.setString(7, u.getPhone_number());
            ps.setString(8, u.getUser_image());
            ps.setBoolean(9, u.isUser_status());
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Failed to register a new user", e);
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

    public boolean checkExistUser(User user) {
        boolean result = false;
        String query = "SELECT * from public.user where username = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsername());
            rs = ps.executeQuery();
            result = rs.next();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Can not find user with provided username", ex);
        }
        return result;
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

    public boolean update(int id, User user) {
        String query = "UPDATE public.user SET username = ? , full_name = ? , gender = ? , birthdate = ? , phone_number = ? , user_image = ? WHERE id = ?";
        boolean result = false;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getFull_name());
            ps.setString(3, user.getGender());
            ps.setDate(4, user.getBirthdate());
            ps.setString(5, user.getPhone_number());
            ps.setString(6, user.getUser_image());
            ps.setInt(7, id);
            result = ps.executeUpdate() == 1;
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    /**
     * Get user id from current login account to add to session cookie
     *
     * @param user
     * @return
     */
    public int getUserIdFromUsername(User user) {
        String query = "SELECT * FROM public.user WHERE username = ? and password = ?";
        int userid = 0;

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, utils.md5Hash(user.getPassword()));
            rs = ps.executeQuery();

            if (rs.next()) {
                userid = rs.getInt("id");
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return userid;
    }


    public static void main(String[] args) {
//        UserDAO dao = new UserDAO();
//        System.out.println(dao.delete(4));
//        Optional<User> optionalUser = dao.get(1);
//        System.out.println(optionalUser.get().getUsername());
//        User user = new User();
//        user.setUsername("ntba");
//        System.out.println(dao.checkExistUser(user));
    }
}
