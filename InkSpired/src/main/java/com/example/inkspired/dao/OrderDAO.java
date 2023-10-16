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

    public OrderDAO() {
        conn = PostgresqlConnection.getConn();
    }

    @Override
    public List<Order> getAll() {
        ArrayList<Order> result = new ArrayList<>();
        String query = "SELECT * FROM public.order";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_date(rs.getDate("order_date"));
                order.setPayment_method_id(rs.getInt("payment_method_id"));
                order.setShipping_address_id(rs.getInt("shipping_address_id"));
                order.setShipping_method(rs.getInt("shipping_method"));
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
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_date(rs.getDate("order_date"));
                order.setPayment_method_id(rs.getInt("payment_method_id"));
                order.setShipping_address_id(rs.getInt("shipping_address_id"));
                order.setShipping_method(rs.getInt("shipping_method"));
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
        String query = "INSERT INTO public.order VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, order.getUser_id());
            ps.setDate(2, order.getOrder_date());
            ps.setInt(3, order.getPayment_method_id());
            ps.setInt(4, order.getShipping_address_id());
            ps.setInt(5, order.getShipping_method());
            ps.setLong(6, order.getOrder_total());
            ps.setInt(7, order.getOrder_status());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(AuthorDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void update(Order order) {
        String query = "UPDATE public.order user_id = ?, order_date = ?, payment_method_id = ?, shipping_method_id = ?, shipping_method = ?, " +
                "order_total = ?, order_status = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, order.getOrder_id());
            ps.setInt(2, order.getUser_id());
            ps.setDate(3, order.getOrder_date());
            ps.setInt(4, order.getPayment_method_id());
            ps.setInt(5, order.getShipping_address_id());
            ps.setInt(5, order.getShipping_method());
            ps.setLong(6, order.getOrder_total());
            ps.setInt(7, order.getOrder_status());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void delete(Order order) {
        String query = "DELETE FROM public.order WHERE order_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, order.getOrder_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
