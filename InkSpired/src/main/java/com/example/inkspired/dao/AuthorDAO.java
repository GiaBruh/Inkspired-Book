package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Author;

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

    public AuthorDAO() {
        conn = PostgresqlConnection.getConn();
    }

    @Override
    public List<Author> getAll() {
        ArrayList<Author> result = new ArrayList<>();
        String query = "SELECT * FROM public.author";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
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

    @Override
    public Optional<Author> get(int id) {
        String query = "SELECT * FROM public.author where author_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
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

    @Override
    public void add(Author author) {
        String query = "INSERT INTO public.author VALUES (?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, author.getAuthor_fullname());
            ps.setString(2, author.getAuthor_image());
            ps.setString(3, author.getAuthor_description());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void update(Author author) {
        String query = "UPDATE public.author SET author_fullname = ?, author_image = ?, author_description";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, author.getAuthor_fullname());
            ps.setString(2, author.getAuthor_image());
            ps.setString(3, author.getAuthor_description());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void delete(Author author) {
        String query = "DELETE FROM public.author WHERE author_id = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, author.getAuthor_id());
            ps.executeUpdate();
        } catch(Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean delete(int author_id) {
        String query = "DELETE FROM public.author WHERE author_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, author_id);
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
}
