package com.example.inkspired.DAOs;

import com.example.inkspired.Models.Book;

import java.util.List;
import java.util.Optional;

public class BookDAO implements DAO<Book> {
    @Override
    public List<Book> getAll() {
        return null;
    }

    @Override
    public Optional<Book> get(int id) {
        return Optional.empty();
    }

    @Override
    public void add(Book t) {

    }

    @Override
    public void update(Book t) {

    }

    @Override
    public void delete(Book t) {

    }
}
