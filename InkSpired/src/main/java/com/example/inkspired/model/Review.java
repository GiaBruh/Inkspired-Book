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

    @Override
    public String toString() {
        return "Review{" +
                "review_id=" + review_id +
                ", review_date=" + review_date +
                ", user_id=" + user_id +
                ", ordered_book_id=" + ordered_book_id +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                '}';
    }
}
