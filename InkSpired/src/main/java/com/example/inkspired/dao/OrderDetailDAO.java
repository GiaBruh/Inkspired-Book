package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDetailDAO implements DAO<OrderDetail> {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public OrderDetailDAO() {
        conn = PostgresqlConnection.getConn();
    }

    @Override
    public List<OrderDetail> getAll() {
        ArrayList<OrderDetail> result = new ArrayList<>();
        String query = "SELECT * FROM public.order_detail";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setOrder_detail_id(rs.getInt("order_detail_id"));
                od.setBook_id(rs.getInt("book_id"));
                od.setOrder_id(rs.getInt("order_id"));
                od.setQuantity(rs.getInt("quantity"));
                result.add(od);
            }

        } catch (Exception e) {
            Logger.getLogger(OrderDetail.class.getName()).log(Level.SEVERE, null, e);
        }

        return result;
    }

    @Override
    public Optional<OrderDetail> get(int bookid) {
        String query = "SELECT od.book_id, title, price, od.quantity FROM book\n" +
                "JOIN public.order_detail od on book.book_id = od.book_id " +
                "WHERE od.book_id = ? AND is_available = true";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();

            if (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setOrder_detail_id(rs.getInt("order_detail_id"));
                od.setBook_id(rs.getInt("book_id"));
                od.setOrder_id(rs.getInt("order_id"));
                od.setQuantity(rs.getInt("quantity"));
                return Optional.of(od);
            }

        } catch (Exception e) {
            Logger.getLogger(OrderDetail.class.getName()).log(Level.SEVERE, null, e);
        }

        return Optional.empty();
    }

    @Override
    public void add(OrderDetail orderDetail) {
        String query = "INSERT INTO public.order_detail (book_id, order_id, quantity)\n" +
                "VALUES (?, ?, ?)";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderDetail.getBook_id());
            ps.setInt(2, orderDetail.getOrder_id());
            ps.setInt(3, orderDetail.getQuantity());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDetail.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    public void update(OrderDetail orderDetail) {
        // Not using
    }

    @Override
    public void delete(OrderDetail orderDetail) {
        String query = "DELETE FROM public.order_detail WHERE order_detail_id = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderDetail.getOrder_detail_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDetail.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<OrderDetail> getFromOrderId(int order_id) {
        ArrayList<OrderDetail> result = new ArrayList<>();
        String query = "SELECT * FROM public.order_detail WHERE order_id = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, order_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setOrder_detail_id(rs.getInt("order_detail_id"));
                od.setBook_id(rs.getInt("book_id"));
                od.setOrder_id(rs.getInt("order_id"));
                od.setQuantity(rs.getInt("quantity"));
                result.add(od);
            }

        } catch (Exception e) {
            Logger.getLogger(OrderDetail.class.getName()).log(Level.SEVERE, null, e);
        }

        return result;
    }
    public List<OrderDetail> getOrderDetailByOrderId(int orderid) {
        ArrayList<OrderDetail> result = new ArrayList<>();
        String query = "SELECT order_id, order_detail.book_id, title, book_image, price, order_detail.quantity FROM public.order_detail\n" +
                "JOIN public.book b on b.book_id = order_detail.book_id\n" +
                "WHERE order_id = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderid);
            rs = ps.executeQuery();

            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setBook_id(rs.getInt("book_id"));
                od.setOrder_id(rs.getInt("order_id"));
                od.setQuantity(rs.getInt("quantity"));
                od.setTitle(rs.getString("title"));
                od.setPrice(rs.getLong("price"));
                od.setBook_image(rs.getString("book_image"));
                result.add(od);
            }

        } catch (Exception e) {
            Logger.getLogger(OrderDetail.class.getName()).log(Level.SEVERE, null, e);
        }

        return result;
    }
}
