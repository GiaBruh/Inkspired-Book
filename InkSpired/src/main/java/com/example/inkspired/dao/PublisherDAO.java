package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Publisher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PublisherDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public PublisherDAO() {
        conn = PostgresqlConnection.getConn();
    }

    public List getAll(){
        ArrayList<Publisher> result = new ArrayList<>();
        String query = "SELECT * FROM public.publisher";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Publisher publisher = new Publisher();
                publisher.setPublisher_id(rs.getInt("publisher_id"));
                publisher.setPublisher_name(rs.getString("publisher_name"));
                result.add(publisher);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
