package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Book;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookDAO implements DAO<Book> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    Book book = new Book();
    List<Book> books = new ArrayList<>();
    String query = "";


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


    public List<Book> getAllBooks() {


         query = "SELECT " +
                "b.book_id, b.title, b.publication_date, b.quantity, b.price, " +
                "p.publisher_name, b.book_description, b.book_image, b.is_available, " +
                "string_agg(DISTINCT a.author_fullname, ', ') AS author_names, " +
                "string_agg(DISTINCT c.category_name, ', ') AS category_names " +
                "FROM book AS b " +
                "JOIN author_book AS ab ON b.book_id = ab.book_id " +
                "JOIN author AS a ON ab.author_id = a.author_id " +
                "JOIN category_book AS cb ON b.book_id = cb.book_id " +
                "JOIN category AS c ON cb.category_id = c.category_id " +
                "JOIN publisher AS p ON b.publisher_id = p.publisher_id " +
                "GROUP BY b.book_id, b.title, b.publication_date, b.quantity, b.price, p.publisher_name, b.book_description, b.book_image, b.is_available";
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
                book.setPublisher_name(rs.getString("publisher_name"));
                book.setBook_description(rs.getString("book_description"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                book.setAuthor_fullname(rs.getString("author_names"));
                book.setCategory_name(rs.getString("category_names"));
                books.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return books;
    }

    public Book selectBookByID(int book_id) {

         query = "SELECT " +
                "b.book_id, b.title, b.publication_date, b.quantity, b.price, " +
                "p.publisher_name, b.book_description, b.book_image, b.is_available, " +
                "string_agg(DISTINCT a.author_fullname, ', ') AS author_names, " +
                "string_agg(DISTINCT c.category_name, ', ') AS category_names " +
                "FROM book AS b " +
                "JOIN author_book AS ab ON b.book_id = ab.book_id " +
                "JOIN author AS a ON ab.author_id = a.author_id " +
                "JOIN category_book AS cb ON b.book_id = cb.book_id " +
                "JOIN category AS c ON cb.category_id = c.category_id " +
                "JOIN publisher AS p ON b.publisher_id = p.publisher_id " +
                "WHERE b.book_id = ? " +
                "GROUP BY b.book_id, b.title, b.publication_date, b.quantity, b.price, p.publisher_name, b.book_description, b.book_image, b.is_available";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, book_id);
            rs = ps.executeQuery();
            if (rs.next()) {

                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setPrice(rs.getInt("price"));
                book.setPublisher_name(rs.getString("publisher_name"));
                book.setBook_description(rs.getString("book_description"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                book.setAuthor_fullname(rs.getString("author_names"));
                book.setCategory_name(rs.getString("category_names"));

            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return book;
    }

    public Book updateBookByID(int book_id) {
         query = "UPDATE public.book SET title = ?, publication_date = ? , quantity = ? , price = ?," +
                "publisher_id = ?,book_description = ?, book_image = ?, is_available = ? " +
                "WHERE book_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, book_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setPrice(rs.getInt("price"));
                book.setPublisher_id(rs.getInt("publisher_id"));
                book.setBook_description(rs.getString("book_description"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                return book;
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
    //update category for book by delete and insert for book_category
    public void updateBookCategoryByID(int book_id, List<Integer> category_id) throws SQLException {
        String deleteQuery = "DELETE FROM category_book WHERE book_id = ?";
        ps = conn.prepareStatement(deleteQuery);
        ps.setInt(1, book_id);
        ps.executeUpdate();

        String insertQuery = "INSERT INTO category_book (book_id, category_id) VALUES (?, ?)";
        ps = conn.prepareStatement(insertQuery);
        for (int i = 0; i < category_id.size(); i++) {
            ps.setInt(1, book_id);
            ps.setInt(2, category_id.get(i)); // Set the second parameter to the category_id
            ps.executeUpdate();
        }
    }

    //update author for book by delete and insert for book_author
    public void updateBookAuthorByID(int book_id, List<Integer> author_id) throws SQLException {
        String deleteQuery = "DELETE FROM author_book WHERE book_id = ?";
        ps = conn.prepareStatement(deleteQuery);
        ps.setInt(1, book_id);
        ps.executeUpdate();

        String insertQuery = "INSERT INTO author_book (book_id, author_id) VALUES (?, ?)";
        ps = conn.prepareStatement(insertQuery);
        for (int i = 0; i < author_id.size(); i++) {
            ps.setInt(1, book_id);
            ps.setInt(2, author_id.get(i));
            ps.executeUpdate();
        }
    }




}
