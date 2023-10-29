package com.example.inkspired.model;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable {
    private int order_id;
    private int user_id;
    private String username;
    private Date order_date;
    private String delivery_address;
    private long order_total;
    private int order_status;
    private String status;

    public Order() {

    }

    public Order(int user_id, Date order_date, String delivery_address, long order_total, int order_status) {
        this.user_id = user_id;
        this.order_date = order_date;
        this.delivery_address = delivery_address;
        this.order_total = order_total;
        this.order_status = order_status;
    }

    public Order(int order_id, int user_id, String username, Date order_date, String delivery_address, long order_total, String status) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.username = username;
        this.order_date = order_date;
        this.delivery_address = delivery_address;
        this.order_total = order_total;
        this.status = status;
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


    public String getDelivery_address() {
        return delivery_address;
    }

    public void setDelivery_address(String delivery_address) {
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", user_id=" + user_id +
                ", username='" + username + '\'' +
                ", order_date=" + order_date +
                ", delivery_address='" + delivery_address + '\'' +
                ", order_total=" + order_total +
                ", order_status=" + order_status +
                ", status='" + status + '\'' +
                '}';
    }
}
