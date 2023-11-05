package com.example.inkspired.model;

import java.io.Serializable;

public class OrderDetail extends Book implements Serializable {
    private int order_detail_id;
    private int book_id;
    private int order_id;
    private int quantity;
    private long price;

    public OrderDetail() {
        super();
    }

    @Override
    public void setPrice(long price) {
        this.price = price;
    }

    @Override
    public long getPrice() {
        return price;
    }

    public OrderDetail(int order_detail_id, int book_id, int order_id, int quantity) {
        this.order_detail_id = order_detail_id;
        this.book_id = book_id;
        this.order_id = order_id;
        this.quantity = quantity;
    }

    public OrderDetail(int book_id, int order_id, int quantity, long price) {
        this.book_id = book_id;
        this.order_id = order_id;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderDetail(int book_id, String title, String book_image, long price, int order_id, int quantity) {
        super(book_id, title, book_image, price);
        this.book_id = book_id;
        this.order_id = order_id;
        this.quantity = quantity;
        this.price = price;
    }
    public OrderDetail(int book_id, int order_id, int quantity) {
        this.book_id = book_id;
        this.order_id = order_id;
        this.quantity = quantity;
    }

    public int getOrder_detail_id() {
        return order_detail_id;
    }

    public void setOrder_detail_id(int order_detail_id) {
        this.order_detail_id = order_detail_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "order_detail_id=" + order_detail_id +
                ", book_id=" + book_id +
                ", order_id=" + order_id +
                ", quantity=" + quantity +
                '}';
    }
}
