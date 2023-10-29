package com.example.inkspired.dao;


import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDAO implements DAO<Order> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public OrderDAO() {
        conn = PostgresqlConnection.getConn();
    }

    @Override
    public List<Order> getAll() {
        ArrayList<Order> result = new ArrayList<>();
        String query = "SELECT * FROM public.order";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_date(rs.getDate("order_date"));
                order.setDelivery_address(rs.getString("shipping_address_id"));
                order.setOrder_total(rs.getLong("order_total"));
                order.setOrder_status(rs.getInt("order_status"));
                result.add(order);
            }
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    @Override
    public Optional<Order> get(int id) {
        String query = "SELECT * FROM public.order where order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_date(rs.getDate("order_date"));
                order.setDelivery_address(rs.getString("delivery_address"));
                order.setOrder_total(rs.getLong("order_total"));
                order.setOrder_status(rs.getInt("order_status"));
                return Optional.of(order);
            }
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return Optional.empty();
    }

    @Override
    public void add(Order order) {
        String query = "INSERT INTO public.\"order\" (user_id, order_date, delivery_address, order_total, order_status) " +
                "VALUES (?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, order.getUser_id());
            ps.setDate(2, order.getOrder_date());
            ps.setString(3, order.getDelivery_address());
            ps.setLong(4, order.getOrder_total());
            ps.setInt(5, order.getOrder_status());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void update(Order order) {
        String query = "UPDATE public.order SET order_status = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, order.getOrder_status());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void delete(Order order) {
        String query = "DELETE FROM public.order WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, order.getOrder_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int getOrderId(int userid) {
        String query = "SELECT order_id FROM public.\"order\" WHERE user_id = ? ORDER BY order_date DESC, order_id DESC LIMIT 1";
        int result = 0;

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userid);
            rs = ps.executeQuery();

            if (rs.next()) {
                result = rs.getInt("order_id");
            }
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return result;
    }

    public void confirmCheckoutDelete(int orderid) {
        String query = "DELETE FROM public.order WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderid);
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
