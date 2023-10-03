package com.example.inkspired.dao;

import com.example.inkspired.model.Author;

import java.util.List;
import java.util.Optional;

public class AuthorDAO implements DAO<Author>{

    @Override
    public List<Author> getAll() {
        return null;
    }

    @Override
    public Optional<Author> get(int id) {
        return Optional.empty();
    }

    @Override
    public void add(Author author) {

    }

    @Override
    public void update(Author author) {

    }

    @Override
    public void delete(Author author) {

    }
}
