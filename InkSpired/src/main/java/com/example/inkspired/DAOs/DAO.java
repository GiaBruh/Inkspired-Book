package com.example.inkspired.DAOs;

import java.util.List;
import java.util.Optional;

public interface DAO<T> {
    List<T> getAll();
    Optional<T> get(int id);
    void add(T t);
    void update(T t);
    void delete(T t);
}
