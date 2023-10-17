package com.example.inkspired.model;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable {
    private int order_id;
    private int user_id;
    private Date order_date;
    private int delivery_address;
    private long order_total;
    private int order_status;

    public Order() {

    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }


    public int getDelivery_address() {
        return delivery_address;
    }

    public void setDelivery_address(int delivery_address) {
        this.delivery_address = delivery_address;
    }


    public long getOrder_total() {
        return order_total;
    }

    public void setOrder_total(long order_total) {
        this.order_total = order_total;
    }

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", user_id=" + user_id +
                ", order_date=" + order_date +
                ", shipping_address_id=" + delivery_address +
                ", order_total=" + order_total +
                ", order_status=" + order_status +
                '}';
    }
}
