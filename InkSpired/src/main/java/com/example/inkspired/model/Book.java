package com.example.inkspired.model;

import java.io.Serializable;
import java.sql.Date;

public class Book implements Serializable {
    private int book_id;
    private String title;
    private String book_image;
    private Date publication_date;
    private int quantity;
    private long price;
    private String book_description;
    private int publisher_id;
    private boolean is_available;

    public Book() {

    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getPublication_date() {
        return publication_date;
    }

    public void setPublication_date(Date publication_date) {
        this.publication_date = publication_date;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getBook_description() {
        return book_description;
    }

    public void setBook_description(String book_description) {
        this.book_description = book_description;
    }

    public int getPublisher_id() {
        return publisher_id;
    }

    public void setPublisher_id(int publisher_id) {
        this.publisher_id = publisher_id;
    }

    public boolean isAvailable() {
        return is_available;
    }

    public void setIs_available(boolean is_available) {
        this.is_available = is_available;
    }

    public String getBook_image() {
        return book_image;
    }

    public void setBook_image(String book_image) {
        this.book_image = book_image;
    }

    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", title='" + title + '\'' +
                ", publication_date=" + publication_date +
                ", quantity=" + quantity +
                ", price=" + price +
                ", publisher_id=" + publisher_id +
                ", author_id=" + book_description +
                ", is_available=" + is_available +
                ", book_image='" + book_image + '\'' +
                '}';
    }
}
