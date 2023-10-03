package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class BookDAO implements DAO<Book> {
    private Connection conn = null;

    public BookDAO() {
        conn = PostgresqlConnection.getConn();
    }

    @Override
    public List<Book> getAll() {
        ArrayList<Book> result = new ArrayList<>();
        String query = "SELECT * FROM book";

        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setBook_image(rs.getString("book_image"));
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setPrice(rs.getInt("price"));
                book.setBook_description(rs.getString("book_description"));
                book.setPublisher_id(rs.getInt("publisher_id"));
                book.setIs_available(rs.getBoolean("is_available"));
                result.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public Optional<Book> get(int id) {
        String query = "SELECT * FROM book where book_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Book book = new Book();
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setBook_image(rs.getString("book_image"));
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setPrice(rs.getInt("price"));
                book.setBook_description(rs.getString("book_description"));
                book.setPublisher_id(rs.getInt("publisher_id"));
                book.setIs_available(rs.getBoolean("is_available"));
                return Optional.of(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public void add(Book t) {

    }

    @Override
    public void update(Book t) {

    }

    @Override
    public void delete(Book t) {
    }

    public static void main(String[] args) {
        BookDAO dao = new BookDAO();
        System.out.println(dao.get(1));
    }
}
