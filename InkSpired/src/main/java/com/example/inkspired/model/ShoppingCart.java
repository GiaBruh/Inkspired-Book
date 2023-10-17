package com.example.inkspired.model;

import java.io.Serializable;

public class ShoppingCart implements Serializable {
    private int shopping_cart_id;
    //    private int user_id;
    private int book_id;
    private int quantity;

    public ShoppingCart() {
    }

    public int getShopping_card_id() {
        return shopping_cart_id;
    }

    public void setShopping_card_id(int shopping_cart_id) {
        this.shopping_cart_id = shopping_cart_id;
    }

//    public int getUser_id() {
//        return user_id;
//    }

//    public void setUser_id(int user_id) {
//        this.user_id = user_id;
//    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
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
                ", book_id=" + book_id +
                ", quantity=" + quantity +
                '}';
    }
}
