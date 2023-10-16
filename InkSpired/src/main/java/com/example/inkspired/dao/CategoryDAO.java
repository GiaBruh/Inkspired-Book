package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CategoryDAO implements DAO<Category> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public CategoryDAO() {
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

    @Override
    public List getAll() {
        ArrayList<Category> result = new ArrayList<>();
        String query = "SELECT * FROM public.category";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
                result.add(category);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    @Override
    public Optional get(int id) {
        String query = "SELECT * FROM public.category where category_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Category category = new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
                return Optional.of(category);
            }
        } catch (
                Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Optional.empty();
    }

    @Override
    public void add(Category o) {
        String query = "INSERT INTO public.category (category_name) VALUES (?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, o.getCategory_name());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Failed to insert new category", ex.getMessage());
        }
    }

    @Override
    public void update(Category o) {
    }

    @Override
    public void delete(Category o) {
        String query = "DELETE FROM public.category where category_name = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, o.getCategory_name());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Failed to delete category", ex.getMessage());
        }
    }


    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        Category category = new Category();
        category.setCategory_name("Porn");
//        dao.add(category);
        dao.delete(category);
        System.out.println(dao.getAll());
    }
}
