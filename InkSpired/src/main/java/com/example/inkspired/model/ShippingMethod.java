package com.example.inkspired.model;

import java.io.Serializable;

public class ShippingMethod implements Serializable {
    private int shipping_method_id;
    private String name;
    private long price;

    public int getShipping_method_id() {
        return shipping_method_id;
    }

    public void setShipping_method_id(int shipping_method_id) {
        this.shipping_method_id = shipping_method_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ShippingMethod{" +
                "shipping_method_id=" + shipping_method_id +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
