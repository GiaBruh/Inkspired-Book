package com.example.inkspired.model;

import java.io.Serializable;

public class Author implements Serializable {
    private int author_id;
    private String author_fullname;
    private String author_description;
    private String author_image;
    private int number_of_books;
private boolean author_status;

    public boolean getAuthor_status() {
        return author_status;
    }

    public void setAuthor_status(boolean author_status) {
        this.author_status = author_status;
    }

    public Author() {

    }

    public int getNumber_of_books() {
        return number_of_books;
    }


    public void setNumber_of_books(int number_of_books) {
        this.number_of_books = number_of_books;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public String getAuthor_fullname() {
        return author_fullname;
    }

    public void setAuthor_fullname(String author_fullname) {
        this.author_fullname = author_fullname;
    }

    public String getAuthor_description() {
        return author_description;
    }

    public void setAuthor_description(String author_description) {
        this.author_description = author_description;
    }

    public String getAuthor_image() {
        return author_image;
    }

    public void setAuthor_image(String author_image) {
        this.author_image = author_image;
    }

    @Override
    public String toString() {
        return "Author{" +
                "author_id=" + author_id +
                ", author_fullname='" + author_fullname + '\'' +
                ", author_description='" + author_description + '\'' +
                ", author_image='" + author_image + '\'' +
                '}';
    }
}
