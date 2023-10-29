package com.example.inkspired.model;

import java.io.Serializable;

public class Publisher implements Serializable {
    private int publisher_id;
    private String publisher_name;

    private int number_of_books;

    public Publisher() {

    }

    public int getNumber_of_books() {
        return number_of_books;
    }

    public void setNumber_of_books(int number_of_books) {
        this.number_of_books = number_of_books;
    }

    public int getPublisher_id() {
        return publisher_id;
    }

    public void setPublisher_id(int publisher_id) {
        this.publisher_id = publisher_id;
    }

    public String getPublisher_name() {
        return publisher_name;
    }

    public void setPublisher_name(String publisher_name) {
        this.publisher_name = publisher_name;
    }

    @Override
    public String toString() {
        return "Publisher{" +
                "publisher_id=" + publisher_id +
                ", publisher_name='" + publisher_name + '\'' +
                '}';
    }
}
