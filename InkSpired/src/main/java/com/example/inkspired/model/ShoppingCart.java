package com.example.inkspired.model;

import java.io.Serializable;

public class ShoppingCart implements Serializable {
    private int shopping_cart_id;
    private int quantity;

    public ShoppingCart() {
    }

    public int getShopping_card_id() {
        return shopping_cart_id;
    }

    public void setShopping_card_id(int shopping_cart_id) {
        this.shopping_cart_id = shopping_cart_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ShoppingCart{" +
                "shopping_card_id=" + shopping_cart_id +
                ", quantity=" + quantity +
                '}';
    }
}
