package com.example.inkspired.Models;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable {
    private int order_id;
    private int user_id;
    private Date order_date;
    private int payment_method_id;
    private int shipping_address_id;
    private int shipping_method;
    private long order_total;
    private int order_status;

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

    public int getPayment_method_id() {
        return payment_method_id;
    }

    public void setPayment_method_id(int payment_method_id) {
        this.payment_method_id = payment_method_id;
    }

    public int getShipping_address_id() {
        return shipping_address_id;
    }

    public void setShipping_address_id(int shipping_address_id) {
        this.shipping_address_id = shipping_address_id;
    }

    public int getShipping_method() {
        return shipping_method;
    }

    public void setShipping_method(int shipping_method) {
        this.shipping_method = shipping_method;
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
                ", payment_method_id=" + payment_method_id +
                ", shipping_address_id=" + shipping_address_id +
                ", shipping_method=" + shipping_method +
                ", order_total=" + order_total +
                ", order_status=" + order_status +
                '}';
    }
}
