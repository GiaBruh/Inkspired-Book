package com.example.inkspired.DAOs;


import com.example.inkspired.Models.Order;

import java.util.List;
import java.util.Optional;

public class OrderDAO implements DAO<Order> {
    @Override
    public List<Order> getAll() {
        return null;
    }
    @Override
    public Optional<Order> get(int id) {
        return Optional.empty();
    }

    @Override
    public void add(Order order) {

    }

    @Override
    public void update(Order order) {

    }

    @Override
    public void delete(Order order) {

    }
}
