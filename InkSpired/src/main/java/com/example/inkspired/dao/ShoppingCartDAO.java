package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Author;
import com.example.inkspired.model.Book;
import com.example.inkspired.model.ShoppingCart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ShoppingCartDAO implements DAO<ShoppingCart> {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ShoppingCartDAO() {
        conn = PostgresqlConnection.getConn();
    }

    @Override
    public List<ShoppingCart> getAll() {
        ArrayList<ShoppingCart> result = new ArrayList<>();
        String query = "SELECT * FROM public.shopping_cart";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ShoppingCart shopping_cart = new ShoppingCart();
                shopping_cart.setShopping_card_id(rs.getInt("shopping_cart_id"));
                shopping_cart.setQuantity(rs.getInt("quantity"));
                result.add(shopping_cart);
            }
        } catch (Exception e) {
            Logger.getLogger(ShoppingCartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    @Override
    public Optional<ShoppingCart> get(int id) {
        String query = "SELECT * FROM public.shopping_cart where shopping_cart_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                ShoppingCart shopping_cart = new ShoppingCart();
                shopping_cart.setShopping_card_id(rs.getInt("shopping_cart_id"));
                shopping_cart.setQuantity(rs.getInt("quantity"));
                return Optional.of(shopping_cart);
            }
        } catch (Exception e) {
            Logger.getLogger(ShoppingCartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return Optional.empty();
    }

    @Override
    public void add(ShoppingCart shoppingCart) {
//        String query = "INSERT INTO public.shopping_cart VALUES (?,?)";
//        try {
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, shoppingCart.getBook_id());
//            ps.setInt(2, shoppingCart.getQuantity());
//            ps.executeUpdate();
//        } catch (Exception e) {
//            Logger.getLogger(ShoppingCartDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
    }

    @Override
    public void update(ShoppingCart shoppingCart) {
//        String query = "UPDATE public.shopping_cart SET book_id = ?, quantity = ?";
//        try {
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, shoppingCart.getBook_id());
//            ps.setInt(2, shoppingCart.getQuantity());
//            ps.executeUpdate();
//        } catch (Exception e) {
//            Logger.getLogger(ShoppingCartDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
    }

    @Override
    public void delete(ShoppingCart shoppingCart) {
        String query = "DELETE FROM public.shopping_cart WHERE shopping_cart_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, shoppingCart.getShopping_card_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ShoppingCartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    /**
     * Create new shopping cart when new account is registered
     */
    public void cartRegister() {
        String query = "INSERT INTO public.shopping_cart (quantity) VALUES (0)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);

            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(ShoppingCartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public List<Book> getBookFromCartId(int cartid) {
        ArrayList<Book> result = new ArrayList<>();
        String query = "SELECT b.book_id, b.book_image, b.title, b.price FROM public.shopping_cart\n" +
                "JOIN public.cart_book cb on shopping_cart.shopping_cart_id = cb.shopping_cart_id\n" +
                "JOIN public.book b on b.book_id = cb.book_id\n" +
                "WHERE cb.shopping_cart_id = ? and b.is_available = true";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, cartid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPrice(rs.getInt("price"));
                book.setBook_image(rs.getString("book_image"));
                result.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }
}
