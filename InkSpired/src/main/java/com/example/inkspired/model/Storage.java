package com.example.inkspired.model;

import java.io.Serializable;
import java.sql.Date;

public class Storage implements Serializable {
    private int storage_id;
    private int quantity;
    private String location;
    private long original_price;
    private int book_id;

    private String book_title;

    private Date adding_date;
    private int book_quantity;
    private int storage_sales_id;
    private int total_quantity;
    private long latest_original_price;

    public int getStorage_id() {
        return storage_id;
    }

    public void setStorage_id(int storage_id) {
        this.storage_id = storage_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public long getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(long original_price) {
        this.original_price = original_price;
    }

    public Date getAdding_date() {
        return adding_date;
    }

    public void setAdding_date(Date adding_date) {
        this.adding_date = adding_date;
    }

    public int getBook_quantity() {
        return book_quantity;
    }

    public void setBook_quantity(int book_quantity) {
        this.book_quantity = book_quantity;
    }

    public int getTotal_quantity() {
        return total_quantity;
    }

    public void setTotal_quantity(int total_quantity) {
        this.total_quantity = total_quantity;
    }

    public long getLatest_original_price() {
        return latest_original_price;
    }

    public void setLatest_original_price(long latest_original_price) {
        this.latest_original_price = latest_original_price;
    }

    public int getBook_id() {
        return book_id;
    }

    public String getBook_title() {
        return book_title;
    }

    public void setBook_title(String book_title) {
        this.book_title = book_title;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getStorage_sales_id() {
        return storage_sales_id;
    }

    public void setStorage_sales_id(int storage_sales_id) {
        this.storage_sales_id = storage_sales_id;
    }
}
