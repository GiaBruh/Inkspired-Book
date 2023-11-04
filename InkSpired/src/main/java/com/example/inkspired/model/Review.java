package com.example.inkspired.model;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {
    private int review_id;
    private Date review_date;
    private int user_id;
    private int ordered_book_id;
    private int rating;
    private String comment;
    private String username;
    private String user_image;
    private String book_image;
    private String book_name;
    public Review() {

    }
    public Review(Date review_date, int user_id, int ordered_book_id, int rating, String comment){
        this.review_date = review_date;
        this.user_id = user_id;
        this.ordered_book_id = ordered_book_id;
        this.rating = rating;
        this.comment = comment;
    }
    public int getReview_id() {
        return review_id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public Date getReview_date() {
        return review_date;
    }

    public void setReview_date(Date review_date) {
        this.review_date = review_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getOrdered_book_id() {
        return ordered_book_id;
    }

    public void setOrdered_book_id(int ordered_book_id) {
        this.ordered_book_id = ordered_book_id;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUser_image() {
        return user_image;
    }

    public void setUser_image(String user_image) {
        this.user_image = user_image;
    }
    public String getBook_image() {
        return book_image;
    }

    public String getBook_image() {
        return book_image;
    }

    public void setBook_image(String book_image) {
        this.book_image = book_image;
    }
    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    @Override
    public String toString() {
        return "Review{" +
                "review_id=" + review_id +
                ", review_date=" + review_date +
                ", user_id=" + user_id +
                ", ordered_book_id=" + ordered_book_id +
                ", rating=" + rating +
                ", comment=" + comment +
                ", username=" + username +
                ", user_image=" + user_image+
                '}';
    }
}