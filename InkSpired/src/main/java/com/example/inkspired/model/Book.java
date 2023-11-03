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

    private String author_fullname;
    private String publisher_name;
    private String category_name;
    private int category_id;
    private int author_id;

    private Date adding_date;

    private int quantity_sold;
private long original_price;

    public String getAuthor_fullname() {
        return author_fullname;
    }

    public void setAuthor_fullname(String author_fullname) {
        this.author_fullname = author_fullname;
    }

    public String getPublisher_name() {
        return publisher_name;
    }

    public void setPublisher_name(String publisher_name) {
        this.publisher_name = publisher_name;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public long getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(long original_price) {
        this.original_price = original_price;
    }

    public Book() {

    }

    public Book(int book_id, String title, String book_image, long price) {
        this.book_id = book_id;
        this.title = title;
        this.book_image = book_image;
        this.price = price;
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

    public boolean getIs_available() {
        return this.is_available;
    }
    public String getBook_image() {
        return book_image;
    }

    public void setBook_image(String book_image) {
        this.book_image = book_image;
    }

    public int getQuantity_sold() {
        return quantity_sold;
    }

    public void setQuantity_sold(int quantity_sold) {
        this.quantity_sold = quantity_sold;
    }

    public Date getAdding_date() {
        return adding_date;
    }

    public void setAdding_date(Date adding_date) {
        this.adding_date = adding_date;
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
