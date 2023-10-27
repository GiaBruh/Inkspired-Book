package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookDAO implements DAO<Book> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public BookDAO() {
        conn = PostgresqlConnection.getConn();
    }


    @Override
    public List<Book> getAll() {
        ArrayList<Book> result = new ArrayList<>();
        String query = "SELECT * FROM book";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
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
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
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
            ps = conn.prepareStatement(query);
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
            ps = conn.prepareStatement(query);
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
            ps = conn.prepareStatement(query);
            ps.setInt(1, book.getBook_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean isInUserCart(int cartid, int bookid) {
        String query = "SELECT * FROM public.cart_book WHERE shopping_cart_id = ? and book_id = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, cartid);
            ps.setInt(2, bookid);
            rs = ps.executeQuery();

            return rs.next();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return false;
    }

//    public List<Book> searchByTitle(String title) {
//        List<Book> result = new ArrayList<>();
//        String query = "SELECT * FROM public.book WHERE title ILIKE ?";
//        try {
//            ps = conn.prepareStatement(query);
//            ps.setString(1, "%" + title + "%");
//            rs = ps.executeQuery();
//
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
//            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//        return result;
//    }
//
//    public List<Book> searchByAuthor(String author_fullname) {
//        List<Book> result = new ArrayList<>();
//        String query = "SELECT author.author_fullname, b.*" +
//                "FROM public.author " +
//                "JOIN public.author_book ab ON author.author_id = ab.author_id " +
//                "JOIN public.book b ON ab.book_id = b.book_id " +
//                "WHERE author.author_fullname ILIKE ?";
//        try {
//            ps = conn.prepareStatement(query);
//            ps.setString(1, "%" + author_fullname + "%");
//            rs = ps.executeQuery();
//
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
//            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//        return result;
//    }

    public List<Book> searchByTitleAndAuthor(String keyword) {
        Set<Integer> uniqueBookIds = new HashSet<>(); // Use a Set to track unique book id
        List<Book> result = new ArrayList<>();
        String query = "SELECT * FROM public.book WHERE title ILIKE ? OR book_id IN (" +
                "SELECT book_id FROM public.author_book ab " +
                "JOIN public.author a ON ab.author_id = a.author_id " +
                "WHERE a.author_fullname ILIKE ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                // Check if the book has already been added to the result
                if (!uniqueBookIds.contains(bookId)) {
                    Book book = new Book();
                    book.setBook_id(bookId);
                    book.setTitle(rs.getString("title"));
                    book.setPrice(rs.getInt("price"));
                    book.setBook_image(rs.getString("book_image"));
                    book.setIs_available(rs.getBoolean("is_available"));
                    result.add(book);
                    uniqueBookIds.add(bookId); // Add book id to the set to prevent duplicates
                }
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public static void main(String[] args) {
    }
}
