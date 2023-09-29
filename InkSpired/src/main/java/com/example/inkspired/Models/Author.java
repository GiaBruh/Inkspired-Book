package com.example.inkspired.Models;

import java.io.Serializable;

public class Admin implements Serializable {
    private int author_id;
    private String author_fullname;
    private String description;
    private String author_image;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return author_image;
    }

    public void setImage(String author_image) {
        this.author_image = author_image;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "author_id=" + author_id +
                ", author_fullname='" + author_fullname + '\'' +
                ", description='" + description + '\'' +
                ", image='" + author_image + '\'' +
                '}';
    }
}
