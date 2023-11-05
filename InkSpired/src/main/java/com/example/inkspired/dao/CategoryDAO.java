package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Book;
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
    public List<Category> getAll() {
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
        String query = "UPDATE public.category SET category_name = ? WHERE category_id = ?";
        try{
            ps = conn.prepareStatement(query);
            ps.setString(1, o.getCategory_name());
            ps.setInt(2, o.getCategory_id());
            ps.executeUpdate();
        }catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Failed to update category", ex.getMessage());

        }
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

    public List<Category> getAllCategories() {
        List<Category> result = new ArrayList<>();
        String query = "SELECT c.category_id, c.category_name, COUNT(cb.book_id) AS number_of_usage " +
                "FROM category c " +
                "LEFT JOIN category_book cb ON c.category_id = cb.category_id " +
                "GROUP BY c.category_id, c.category_name " +
                "ORDER BY c.category_id";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
                category.setNumber_of_usage(rs.getInt("number_of_usage"));
                result.add(category);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    public List<Book> searchByCategory(String category_name) {
        List<Book> result = new ArrayList<>();
        String query = "SELECT category.category_name, b.* " +
                "FROM public.category " +
                "JOIN public.category_book cb ON category.category_id = cb.category_id " +
                "JOIN public.book b ON cb.book_id = b.book_id " +
                "WHERE category.category_name ILIKE ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + category_name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPrice(rs.getInt("price"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                result.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public Category selectCategoryByID(int categoryId) {
        String query = "SELECT * FROM public.category where category_id = ?";
        Category category = null;
        try{
            ps = conn.prepareStatement(query);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                category = new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
            }

        }catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }
    public Category selectCategoryByName(String category_name){
        String query = "SELECT * FROM public.category where category_name = ?";
        Category category = null;
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, category_name);
            rs = ps.executeQuery();
            while (rs.next()) {
                category = new Category();
                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;

    }

    public void deleteCategoryByID(int categoryId) {
        String query = "DELETE FROM public.category where category_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, categoryId);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Failed to delete category", ex.getMessage());
        }
    }
    //make class test selectCategoryByID

    public void addCategory(Category category) {
        String query = "INSERT INTO public.category (category_id, category_name) VALUES (?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, category.getCategory_id());
            ps.setString(2, category.getCategory_name());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, "Failed to insert new category", ex.getMessage());
        }
    }



}
