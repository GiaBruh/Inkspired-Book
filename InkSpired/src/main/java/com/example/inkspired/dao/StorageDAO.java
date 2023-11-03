package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Storage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StorageDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    Storage storage = new Storage();

    List<Storage> storageList = new ArrayList<>();

    public StorageDAO() {
        conn = PostgresqlConnection.getConn();
    }

    public List<Storage> getAllStorage() {
        try {

            ps = conn.prepareStatement("SELECT * FROM storage");
            rs = ps.executeQuery();
            while (rs.next()) {
                storage = new Storage();
                storage.setStorage_id(rs.getInt("storage_id"));
                storage.setBook_id(rs.getInt("book_id"));

                storageList.add(storage);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return storageList;
    }

    public Storage getStorageById(int storage_id) {
        try {
            ps = conn.prepareStatement("SELECT * FROM storage WHERE storage_id = ?");
            ps.setInt(1, storage_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                storage = new Storage();
                storage.setStorage_id(rs.getInt("storage_id"));
                storage.setBook_id(rs.getInt("book_id"));
                storage.setBook_title(rs.getString("title"));
                storage.setQuantity(rs.getInt("quantity"));
                storage.setLocation(rs.getString("location"));
                storage.setOriginal_price(rs.getLong("original_price"));
                storage.setAdding_date(rs.getDate("date_buying"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return storage;
    }

    public List<Storage> getStorageWithTitle() {
     String query ="SELECT\n" +
             "    s.storage_id,\n" +
             "    s.book_id,\n" +
             "    b.title AS book_name,\n" +

             "    s.original_price," +
             "    s.adding_date," +
             "b.quantity\n" +

             "\n" +
             "FROM\n" +
             "    public.storage s\n" +
             "        JOIN\n" +
             "    public.book b ON s.book_id = b.book_id;";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                storage = new Storage();
                storage.setStorage_id(rs.getInt("storage_id"));
                storage.setBook_id(rs.getInt("book_id"));
                storage.setBook_title(rs.getString("book_name"));
                storage.setQuantity(rs.getInt("quantity"));
                storage.setOriginal_price(rs.getLong("original_price"));
                storage.setAdding_date(rs.getDate("adding_date"));

                storageList.add(storage);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return storageList;
    }

    public Storage getStorageByBookId(int book_id){
        String query ="SELECT\n" +
                "    s.storage_id,\n" +
                "    s.book_id,\n" +
                "    b.title AS book_name,\n" +


                "    s.original_price," +
                "    s.adding_date," +
                "b.quantity\n" +

                "\n" +
                "FROM\n" +
                "    public.storage s\n" +
                "        JOIN\n" +
                "    public.book b ON s.book_id = b.book_id where s.book_id=?;";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1,book_id);
            rs = ps.executeQuery();
            while (rs.next()) {

                storage.setStorage_id(rs.getInt("storage_id"));
                storage.setBook_id(rs.getInt("book_id"));
                storage.setBook_title(rs.getString("book_name"));
                storage.setQuantity(rs.getInt("quantity"));
                storage.setOriginal_price(rs.getLong("original_price"));
                storage.setAdding_date(rs.getDate("adding_date"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return storage;

    }



//test getStorageByBookId
    public static void main(String[] args) {
        StorageDAO storageDAO = new StorageDAO();
        Storage storage = storageDAO.getStorageByBookId(6);
        System.out.println("Book_id: " + storage.getBook_id());
        System.out.println(storage.getBook_title());
        System.out.println(storage.getOriginal_price());
        System.out.println(storage.getQuantity());
        System.out.println(storage.getAdding_date());
        System.out.println("=====================================");
    }





}
