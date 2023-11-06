package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Publisher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class PublisherDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public PublisherDAO() {
        conn = PostgresqlConnection.getConn();
    }

    public List<Publisher> getAll(){
        ArrayList<Publisher> result = new ArrayList<>();
        String query = "SELECT p.publisher_id, p.publisher_name, COUNT(b.book_id) " +
                "AS number_of_books FROM publisher p LEFT JOIN book b ON p.publisher_id = b.publisher_id GROUP BY p.publisher_id, p.publisher_name";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Publisher publisher = new Publisher();
                publisher.setPublisher_id(rs.getInt("publisher_id"));
                publisher.setPublisher_name(rs.getString("publisher_name"));
                publisher.setNumber_of_books(rs.getInt("number_of_books"));
                result.add(publisher);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public void add(Publisher publisher) {
        String query = "INSERT INTO public.publisher(publisher_name) VALUES (?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, publisher.getPublisher_name());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updatePublisher(Publisher publisher) {
        String query = "UPDATE public.publisher SET publisher_name=? WHERE publisher_id=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, publisher.getPublisher_name());
            ps.setInt(2, publisher.getPublisher_id());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deletePublisher(int publisher_id) {
        String query = "DELETE FROM public.publisher WHERE publisher_id=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, publisher_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Publisher selectPublisherbyID(int publisher_id){
        String query = "SELECT * FROM public.publisher WHERE publisher_id=?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, publisher_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Publisher publisher = new Publisher();
                publisher.setPublisher_id(rs.getInt("publisher_id"));
                publisher.setPublisher_name(rs.getString("publisher_name"));
                return publisher;
            }
        }catch (Exception e){
                Logger.getLogger(e.toString());
            }
        return null;
        }



    }

