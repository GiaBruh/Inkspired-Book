package com.example.inkspired.DAOs;

import com.example.inkspired.Models.ShoppingCart;

import java.util.List;
import java.util.Optional;

public class ShoppingCartDAO implements DAO<ShoppingCart> {
    @Override
    public List<ShoppingCart> getAll() {
        return null;
    }

    @Override
    public Optional<ShoppingCart> get(int id) {
        return Optional.empty();
    }

    @Override
    public void add(ShoppingCart shoppingCart) {

    }

    @Override
    public void update(ShoppingCart shoppingCart) {

    }

    @Override
    public void delete(ShoppingCart shoppingCart) {

    }


}
