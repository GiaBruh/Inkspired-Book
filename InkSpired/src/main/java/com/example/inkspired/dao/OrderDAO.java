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
                order.setDelivery_address(rs.getString("delivery_address"));
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
    public List<Order> getAllFromUserId(int userid) {
        String query = "SELECT order_id, user_id, u.username, order_date, delivery_address, order_total, os.status FROM public.\"order\"\n" +
                "JOIN public.\"user\" u on u.id = \"order\".user_id\n" +
                "JOIN public.order_status os on os.order_status_id = \"order\".order_status\n" +
                "WHERE user_id = ? ORDER BY order_date DESC, order_id DESC";
        ArrayList<Order> result = new ArrayList<>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setUsername(rs.getString("username"));
                order.setOrder_date(rs.getDate("order_date"));
                order.setDelivery_address(rs.getString("delivery_address"));
                order.setOrder_total(rs.getLong("order_total"));
                order.setStatus(rs.getString("status"));
                result.add(order);
            }
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public void cancelOrder(int orderid) {
        String query = "UPDATE public.order SET order_status = 6 WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderid);
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<Order> getOrdersByUser(int userId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM \"order\" where user_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setOrder_date(rs.getDate("order_date"));
                order.setDelivery_address(rs.getString("delivery_address"));
                order.setOrder_total(rs.getLong("order_total"));
                order.setOrder_status(rs.getInt("order_status"));
                orders.add(order);
            }
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return orders;
    }

    public void updateOrderStatus(int orderId, int newStatus) {
        String sql = "UPDATE \"order\" SET order_status = ? WHERE order_id = ?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, newStatus);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<Order> getAllOrderStatus(){
        String query = "SELECT * FROM order_status";
        List<Order> orderStatuses = new ArrayList<>();
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order orderStatus = new Order();
                orderStatus.setOrder_status(rs.getInt("order_status_id"));
                orderStatus.setOrder_status_name(rs.getString("status")); // Changed to "status"
                orderStatuses.add(orderStatus);
            }
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return orderStatuses;
    }


    public List<Order> getAllWithUser(){
        String query = "SELECT o.order_id, o.user_id, o.order_date, o.delivery_address, o.order_total,o.order_status, os.status AS order_status_name, u.full_name\n" +
                "FROM \"order\" AS o\n" +
                "         JOIN \"user\" AS u ON o.user_id = u.id\n" +
                "         JOIN order_status AS os ON o.order_status = os.order_status_id;";
        List<Order> orders = new ArrayList<>();
        try{
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                Order order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setFull_name(rs.getString("full_name"));
                order.setOrder_date(rs.getDate("order_date"));
                order.setDelivery_address(rs.getString("delivery_address"));
                order.setOrder_total(rs.getLong("order_total"));
                order.setOrder_status(rs.getInt("order_status"));
                order.setOrder_status_name(rs.getString("order_status_name"));
                orders.add(order);
            }
        }catch (Exception e){
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return orders;
    }

    public List<Order> getAllOrderDetail(){
        String query = "SELECT\n" +
                "    od.order_detail_id,\n" +
                "    od.book_id,\n" +
                "    b.title AS book_name,\n" +
                "    u.id AS user_id,\n" +
                "    u.full_name AS full_name,--or u.user-name\n" +
                "    od.quantity,\n" +
                "    od.price, -- Add the 'price' column from 'order_detail'\n" +
                "    od.quantity * od.price AS total_price, -- Update to use 'od.price'\n" +
                "    od.order_id,\n" +
                "    o.order_date\n" +
                "FROM\n" +
                "    order_detail od\n" +
                "        JOIN\n" +
                "    book b ON od.book_id = b.book_id\n" +
                "        JOIN\n" +
                "    \"user\" u ON u.id = (SELECT user_id FROM \"order\" WHERE order_id = od.order_id)\n" +
                "        JOIN\n" +
                "    \"order\" o ON od.order_id = o.order_id;";
        List<Order> orders = new ArrayList<>();
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_detail_id(rs.getInt("order_detail_id"));
                order.setBook_id(rs.getInt("book_id"));
                order.setBook_title(rs.getString("book_name"));
                order.setUser_id(rs.getInt("user_id"));
                order.setFull_name(rs.getString("full_name"));
                order.setQuantity(rs.getInt("quantity"));
                order.setPrice(rs.getLong("price"));
                order.setTotal_price(rs.getLong("total_price"));
                order.setOrder_id(rs.getInt("order_id"));
                order.setOrder_date(rs.getDate("order_date"));
                orders.add(order);
                updateBookAvailability(rs.getInt("book_id"));
            }
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return orders;

    }
    public void updateBookAvailability(int book_id) {
        String query = "UPDATE book SET is_available = false WHERE book_id = ? AND quantity = (SELECT COALESCE(SUM(CASE WHEN o.order_status NOT IN (0, 5, 6) THEN od.quantity ELSE 0 END), 0) FROM order_detail AS od JOIN \"order\" AS o ON od.order_id = o.order_id WHERE od.book_id = ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, book_id);
            ps.setInt(2, book_id);
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    public Order getByOrder(int orderId){
        String query = "SELECT o.order_id, o.user_id, o.order_date, o.delivery_address, o.order_total,o.order_status, os.status AS order_status_name, u.full_name\n" +
                "FROM \"order\" AS o\n" +
                "         JOIN \"user\" AS u ON o.user_id = u.id\n" +
                "         JOIN order_status AS os ON o.order_status = os.order_status_id where  o.order_id = ?;";
        Order order = new Order();
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderId);
            rs = ps.executeQuery();
            while (rs.next()) {
                order.setOrder_id(rs.getInt("order_id"));
                order.setUser_id(rs.getInt("user_id"));
                order.setFull_name(rs.getString("full_name"));
                order.setOrder_date(rs.getDate("order_date"));
                order.setDelivery_address(rs.getString("delivery_address"));
                order.setOrder_total(rs.getLong("order_total"));
                order.setOrder_status(rs.getInt("order_status"));
                order.setOrder_status_name(rs.getString("order_status_name"));
            }
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return order;

    }

    //test getAllOrderDetail
    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.getAllOrderDetail();
        for (Order order : orders) {
            System.out.println(order.getOrder_detail_id() + " " + order.getBook_id() + " " + order.getBook_title() + " " + order.getUser_id() + " " + order.getFull_name() + " " + order.getQuantity() + " " + order.getPrice() + " " + order.getTotal_price() + " " + order.getOrder_id() + " " + order.getOrder_date());
        }
    }



    public void confirmOrderReceived(int orderid) {
        String query = "UPDATE public.order SET order_status = 4 WHERE order_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, orderid);
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}

