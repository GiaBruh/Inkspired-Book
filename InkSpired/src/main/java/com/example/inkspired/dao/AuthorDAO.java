package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Author;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AuthorDAO implements DAO<Author> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public AuthorDAO() {
        conn = PostgresqlConnection.getConn();
    }

    @Override
    public List<Author> getAll() {
        ArrayList<Author> result = new ArrayList<>();
        String query = "SELECT * FROM public.author";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Author author = new Author();
                author.setAuthor_id(rs.getInt("author_id"));
                author.setAuthor_fullname(rs.getString("author_fullname"));
                author.setAuthor_image(rs.getString("author_image"));
                author.setAuthor_description(rs.getString("author_description"));
                result.add(author);
            }
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public List<Author> getAllAuthors() {
        List<Author> authors = new ArrayList<>();
        String query = "SELECT a.author_id, a.author_fullname, a.author_description, a.author_image, COUNT(b.book_id) as number_of_books " +
                "FROM author a " +
                "JOIN author_book ab ON a.author_id = ab.author_id " +
                "JOIN book b ON ab.book_id = b.book_id " +
                "GROUP BY a.author_id, a.author_fullname, a.author_description, a.author_image";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Author author = new Author();
                author.setAuthor_id(rs.getInt("author_id"));
                author.setAuthor_fullname(rs.getString("author_fullname"));
                author.setAuthor_image(rs.getString("author_image"));
                author.setAuthor_description(rs.getString("author_description"));
                author.setNumber_of_books(rs.getInt("number_of_books"));
                authors.add(author);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return authors;
    }

    @Override
    public Optional<Author> get(int id) {
        String query = "SELECT * FROM public.author where author_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Author author = new Author();
                author.setAuthor_id(rs.getInt("author_id"));
                author.setAuthor_fullname(rs.getString("author_fullname"));
                author.setAuthor_image(rs.getString("author_image"));
                author.setAuthor_description(rs.getString("author_description"));
                return Optional.of(author);
            }
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return Optional.empty();
    }

    public Author selectAuthorByID(int id) {
        String query = "SELECT * FROM public.author where author_id = ?";
        Author author = null; // Initialize the author as null
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                author = new Author(); // Create an Author object
                author.setAuthor_id(rs.getInt("author_id"));
                author.setAuthor_fullname(rs.getString("author_fullname"));
                author.setAuthor_image(rs.getString("author_image"));
                author.setAuthor_description(rs.getString("author_description"));
                author.setAuthor_status(rs.getBoolean("author_status"));
            }
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return author; // Return the Author object (could be null if not found)
    }


    @Override
    public void add(Author author) {
        String query = "INSERT INTO public.author (author_fullname, author_description, author_image, author_status) VALUES (?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, author.getAuthor_fullname());
            ps.setString(2, author.getAuthor_description());
            ps.setString(3, author.getAuthor_image());
            ps.setBoolean(4, author.getAuthor_status());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void addAuthor(Author author) {
        String query = "INSERT INTO public.author VALUES (?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, author.getAuthor_id());
            ps.setString(2, author.getAuthor_fullname());
            ps.setString(3, author.getAuthor_description());
            ps.setString(4, author.getAuthor_image());

            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void update(Author author) {
        String query = "UPDATE public.author SET author_fullname = ?,  author_description = ?, author_image = ? where author_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, author.getAuthor_fullname());
            ps.setString(2, author.getAuthor_description());
            ps.setString(3, author.getAuthor_image());
            ps.setInt(4, author.getAuthor_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateAuthor(Author author) {
        String query = "UPDATE public.author SET author_fullname = ?,  author_description = ?, author_image = ?,author_status=? where author_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, author.getAuthor_fullname());
            ps.setString(2, author.getAuthor_description());
            ps.setString(3,"/"+ author.getAuthor_image());
            ps.setBoolean(4, author.getAuthor_status());
            ps.setInt(5, author.getAuthor_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void delete(Author author) {
        String query = "DELETE FROM public.author WHERE author_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, author.getAuthor_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean delete(int author_id) {
        String query = "DELETE FROM public.author WHERE author_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, author_id);
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public List<Author> getBooksByAuthor() {
        String query = "SELECT a.author_id, a.author_fullname, a.author_status, a.author_image, COUNT(ab.book_id) AS number_of_books " +
                "FROM author a " +
                "LEFT JOIN author_book ab ON a.author_id = ab.author_id " +
                "GROUP BY a.author_id, a.author_fullname, a.author_image " +
                "ORDER BY a.author_id";

        List<Author> authors = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Author author = new Author();
                author.setAuthor_id(rs.getInt("author_id"));
                author.setAuthor_fullname(rs.getString("author_fullname"));
                author.setAuthor_status(rs.getBoolean("author_status"));
                author.setAuthor_image(rs.getString("author_image"));
                author.setNumber_of_books(rs.getInt("number_of_books"));
                authors.add(author);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log any SQL-related exceptions
        }
        return authors;
    }




    public boolean doesAuthorExist(String authorFullname) {
        String query = "SELECT * FROM public.author WHERE author_fullname = ?";
        try{
            ps = conn.prepareStatement(query);
            ps.setString(1, authorFullname);
            rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch (Exception e){
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
}
