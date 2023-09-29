package com.example.inkspired.Models;

import java.io.Serializable;

public class Author implements Serializable {
    private int author_id;
    private String author_fullname;
    private String author_description;
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

    public String getAuthorDescription() {
        return author_description;
    }

    public void setAuthorDescription(String author_description) {
        this.author_description = author_description;
    }

    public String getImage() {
        return author_image;
    }

    public void setImage(String author_image) {
        this.author_image = author_image;
    }

    @Override
    public String toString() {
        return "Author{" +
                "author_id=" + author_id +
                ", author_fullname='" + author_fullname + '\'' +
                ", author_description='" + author_description + '\'' +
                ", image='" + author_image + '\'' +
                '}';
    }
}
