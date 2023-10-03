package com.example.inkspired.model;

import java.io.Serializable;
import java.sql.Date;

public class PaymentMethod implements Serializable {
    private int payment_method_id;
    private int user_id;
    private int payment_type_id;
    private String provider;
    private String card_number;
    private Date expiry_date;
    private String card_owner;

    public int getPayment_method_id() {
        return payment_method_id;
    }

    public void setPayment_method_id(int payment_method_id) {
        this.payment_method_id = payment_method_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getPayment_type_id() {
        return payment_type_id;
    }

    public void setPayment_type_id(int payment_type_id) {
        this.payment_type_id = payment_type_id;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public String getCard_number() {
        return card_number;
    }

    public void setCard_number(String card_number) {
        this.card_number = card_number;
    }

    public Date getExpiry_date() {
        return expiry_date;
    }

    public void setExpiry_date(Date expiry_date) {
        this.expiry_date = expiry_date;
    }

    public String getCard_owner() {
        return card_owner;
    }

    public void setCard_owner(String card_owner) {
        this.card_owner = card_owner;
    }

    @Override
    public String toString() {
        return "PaymentMethod{" +
                "payment_method_id=" + payment_method_id +
                ", user_id=" + user_id +
                ", payment_type_id=" + payment_type_id +
                ", provider='" + provider + '\'' +
                ", card_number='" + card_number + '\'' +
                ", expiry_date=" + expiry_date +
                ", card_owner='" + card_owner + '\'' +
                '}';
    }
}
