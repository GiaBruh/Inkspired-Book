package com.example.inkspired.DAOs;

import com.example.inkspired.Models.User;

import java.util.List;
import java.util.Optional;

public class UserDAO implements DAO<User>{
    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public Optional<User> get(int id) {
        return Optional.empty();
    }

    @Override
    public void add(User user) {

    }

    @Override
    public void update(User user) {

    }

    @Override
    public void delete(User user) {

    }
}
