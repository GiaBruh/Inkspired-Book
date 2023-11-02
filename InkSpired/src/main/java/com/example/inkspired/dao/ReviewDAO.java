package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReviewDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ReviewDAO() {
        conn = PostgresqlConnection.getConn();
    }

    public List<Review> getBookReview(int bookId) {
        ArrayList<Review> result = new ArrayList<>();
        String query = "Select * from public.review where ordered_book_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setReview_id(rs.getInt("review_id"));
                review.setReview_date(rs.getDate("review_date"));
                review.setUser_id(rs.getInt("user_id"));
                review.setOrdered_book_id(rs.getInt("ordered_book_id"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                review.setUsername(getFullNameFromUserId(rs.getInt("user_id")));
                review.setUser_image(getImageFromUserId(rs.getInt("user_id")));
                result.add(review);
            }
        } catch (Exception e) {
            Logger.getLogger(ReviewDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public List<Review> getBookReview_User(int bookId, int userId) {
        ArrayList<Review> result = new ArrayList<>();
        String query = "select * from review where ordered_book_id = ? order by (case when user_id = ? then '1' else '2' end), review_id";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookId);
            ps.setInt(2, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Review review = new Review();
                review.setReview_id(rs.getInt("review_id"));
                review.setReview_date(rs.getDate("review_date"));
                review.setUser_id(rs.getInt("user_id"));
                review.setOrdered_book_id(rs.getInt("ordered_book_id"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                review.setUsername(getFullNameFromUserId(rs.getInt("user_id")));
                review.setUser_image(getImageFromUserId(rs.getInt("user_id")));
                result.add(review);
            }
        } catch (Exception e) {
            Logger.getLogger(ReviewDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public String getFullNameFromUserId(int id) {
        PreparedStatement psDumb = null;
        ResultSet rsDumb = null;
        String result = "Error";
        String query = "Select * from public.user where id = ?";

        try {
            psDumb = conn.prepareStatement(query);
            psDumb.setInt(1, id);
            rsDumb = psDumb.executeQuery();

            if (rsDumb.next()) {
                result = rsDumb.getString("full_name");
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return result;
    }

    public String getImageFromUserId(int id){
        PreparedStatement psDumb = null;
        ResultSet rsDumb = null;
        String result = "Error";
        String query = "Select * from public.user where id = ?";

        try {
            psDumb = conn.prepareStatement(query);
            psDumb.setInt(1, id);
            rsDumb = psDumb.executeQuery();

            if (rsDumb.next()) {
                result = rsDumb.getString("user_image");
            }
        } catch (Exception e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return result;
    }
    public boolean isBought(int userId, int bookId) {
        String query = "select public.order.user_id, order_detail.book_id, public.order.order_status " +
                "from public.order " +
                "join order_detail " +
                "on public.order.order_id = order_detail.order_id " +
                "where order_status = 4 and user_id = ? and book_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            Logger.getLogger(ReviewDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public Review getUserReview(int userId, int bookId) {
        String query = "select * from review where user_id = ? and ordered_book_id = ?";
        Review review = new Review();
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, bookId);
            rs = ps.executeQuery();
            while (rs.next()) {
                review.setReview_id(rs.getInt("review_id"));
                review.setReview_date(rs.getDate("review_date"));
                review.setUser_id(rs.getInt("user_id"));
                review.setOrdered_book_id(rs.getInt("ordered_book_id"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                review.setUsername(getFullNameFromUserId(rs.getInt("user_id")));
                return review;
            }
        } catch (Exception e) {
            Logger.getLogger(ReviewDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public boolean createReview(Review review) {
        String query = "Insert into public.review (review_date, user_id, ordered_book_id, rating, comment) " +
                "values (?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setDate(1, review.getReview_date());
            ps.setInt(2, review.getUser_id());
            ps.setInt(3, review.getOrdered_book_id());
            ps.setInt(4, review.getRating());
            ps.setString(5, review.getComment());
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            Logger.getLogger(ReviewDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    //Delete
    public boolean deleteReview(int id) {
        String query = "Delete from public.review where review_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            Logger.getLogger(ReviewDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
}
