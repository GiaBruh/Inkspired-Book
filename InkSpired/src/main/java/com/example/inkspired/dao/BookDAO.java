package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

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
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setPrice(rs.getInt("price"));
                book.setPublisher_id(rs.getInt("publisher_id"));
                book.setBook_description(rs.getString("book_description"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                result.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
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
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setPrice(rs.getInt("price"));
                book.setPublisher_id(rs.getInt("publisher_id"));
                book.setBook_description(rs.getString("book_description"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                return Optional.of(book);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return Optional.empty();
    }

    @Override
    public void add(Book book) {
        String query = "INSERT INTO public.book VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, book.getTitle());
            ps.setDate(2, book.getPublication_date());
            ps.setInt(3, book.getQuantity());
            ps.setLong(4, book.getPrice());
            ps.setInt(5, book.getPublisher_id());
            ps.setString(6, book.getBook_description());
            ps.setString(7, book.getBook_image());
            ps.setBoolean(8, book.isAvailable());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void update(Book book) {
        String query = "UPDATE public.book SET title = ?, publication_date = ? , quantity = ? , price = ?, publisher_id = ?,book_description = ?, book_image = ?, is_available = ? WHERE book_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, book.getTitle());
            ps.setDate(2, book.getPublication_date());
            ps.setInt(3, book.getQuantity());
            ps.setLong(4, book.getPrice());
            ps.setInt(5, book.getPublisher_id());
            ps.setString(6, book.getBook_description());
            ps.setString(7, book.getBook_image());
            ps.setBoolean(8, book.isAvailable());
            ps.setInt(9, book.getBook_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void delete(Book book) {
        String query = "DELETE FROM public.book WHERE book_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, book.getBook_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static void main(String[] args) {
    }
}
