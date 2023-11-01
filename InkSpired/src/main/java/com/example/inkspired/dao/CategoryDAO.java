package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Book;
import com.example.inkspired.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
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
    public Optional<Category> get(int id) {
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

    public List<Book> searchByCategory(int category_id) {
        List<Book> result = new ArrayList<>();
        String query = "SELECT b.* " +
                "FROM public.book b " +
                "JOIN public.category_book cb ON b.book_id = cb.book_id " +
                "WHERE cb.category_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, category_id);
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

//    public  List<Book> searchByCategories(List<Integer> categoryIds) {
//        List<Book> result = new ArrayList<>();
//
//        if(categoryIds.isEmpty()) {
//            return result;
//        }
//
//        String questionMarks = String.join(",", Collections.nCopies(categoryIds.size(), "?"));
//
//        String query = "SELECT b.* " +
//                "FROM public.book b " +
//                "JOIN public.category_book cb ON b.book_id = cb.book_id " +
//                "WHERE cb.category_id IN (" + questionMarks + ")";
//
//        try {
//            ps = conn.prepareStatement(query);
//
//            for (int i = 0; i < categoryIds.size(); i++) {
//                ps.setInt(i + 1, categoryIds.get(i));
//            }
//
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Book book = new Book();
//                book.setBook_id(rs.getInt("book_id"));
//                book.setTitle(rs.getString("title"));
//                book.setPrice(rs.getInt("price"));
//                book.setBook_image(rs.getString("book_image"));
//                book.setIs_available(rs.getBoolean("is_available"));
//                result.add(book);
//            }
//        } catch (Exception e) {
//            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//
//        return result;
//    }

    public List<Book> searchByCategories(List<Integer> categoryIds) {
        List<Book> result = new ArrayList<>();
        if (categoryIds == null || categoryIds.isEmpty()) {
            return result; // Return an empty list if no categories are provided
        }

        // Create a parameterized query with dynamic number of category IDs
        StringBuilder query = new StringBuilder("SELECT b.* FROM public.book b " +
                "JOIN public.category_book cb ON b.book_id = cb.book_id " +
                "WHERE cb.category_id IN (");

        for (int i = 0; i < categoryIds.size(); i++) {
            query.append("?");
            if (i < categoryIds.size() - 1) {
                query.append(", ");
            }
        }
        query.append(")");

        try {
            ps = conn.prepareStatement(query.toString());

            // Set the category IDs as parameters
            for (int i = 0; i < categoryIds.size(); i++) {
                ps.setInt(i + 1, categoryIds.get(i));
            }

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




    // return category name by category id
    public String getCategoryName(int category_id) {
        String result = null;
        String query = "SELECT * FROM public.category where category_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
//                category.setCategory_id(rs.getInt("category_id"));
                category.setCategory_name(rs.getString("category_name"));
                result = category.getCategory_name();
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
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
