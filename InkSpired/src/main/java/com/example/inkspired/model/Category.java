package com.example.inkspired.model;

import java.io.Serializable;

public class Category implements Serializable {
    private int category_id;
    private String category_name;

    private int number_of_usage;
    public Category() {
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public int getNumber_of_usage() {
        return number_of_usage;
    }

    public void setNumber_of_usage(int number_of_usage) {
        this.number_of_usage = number_of_usage;
    }

    @Override
    public String toString() {
        return "Category{" +
                "category_id=" + category_id +
                ", category_name='" + category_name + '\'' +
                '}';
    }
}
