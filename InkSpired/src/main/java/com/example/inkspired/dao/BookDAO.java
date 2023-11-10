package com.example.inkspired.dao;

import com.example.inkspired.dbconnection.PostgresqlConnection;
import com.example.inkspired.model.Author;
import com.example.inkspired.model.Book;
import com.example.inkspired.model.Storage;
import com.example.inkspired.model.Publisher;

import java.sql.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookDAO extends Storage implements DAO<Book>  {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    Book book = new Book();
    Storage storage = new Storage();
    List<Book> books = new ArrayList<>();
    String query = "";




    public BookDAO() {
        conn = PostgresqlConnection.getConn();
    }

    @Override
    public List<Book> getAll() {
        ArrayList<Book> result = new ArrayList<>();
        String query = "SELECT * FROM book";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setPrice(rs.getInt("price"));
                book.setPublisher_id(rs.getInt("publisher_id"));
                book.setBook_description(rs.getString("book_description"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                result.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }



    @Override
    public Optional<Book> get(int id) {
        String query = "SELECT * FROM book where book_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setPrice(rs.getInt("price"));
                book.setPublisher_id(rs.getInt("publisher_id"));
                book.setBook_description(rs.getString("book_description"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                return Optional.of(book);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return Optional.empty();
    }

    @Override
    public void add(Book book) {
        String query = "INSERT INTO public.book (title, publication_date, quantity, price, publisher_id, book_description, book_image, is_available) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, book.getTitle());
            ps.setDate(2, book.getPublication_date());
            ps.setInt(3, book.getQuantity());
            ps.setLong(4, book.getPrice());
            ps.setInt(5, book.getPublisher_id());
            ps.setString(6, book.getBook_description());
            ps.setString(7, book.getBook_image());
            ps.setBoolean(8, book.isAvailable());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void addInStorage(Book book, Storage storage) {
        String getMaxIdQuery = "SELECT MAX(storage_id) FROM public.storage";
        String insertQuery = "INSERT INTO public.storage (storage_id, book_id, original_price, adding_date) VALUES (?, ?, ?, ?)";

        try {
            // Get the maximum storage_id from the storage table
            ps = conn.prepareStatement(getMaxIdQuery);
            ResultSet rs = ps.executeQuery();
            int maxId = 0;
            if (rs.next()) {
                maxId = rs.getInt(1);
            }

            // Insert the new row with storage_id set to maxId + 1
            ps = conn.prepareStatement(insertQuery);
            ps.setInt(1, maxId + 1);
            ps.setInt(2, book.getBook_id());
            ps.setLong(3, storage.getOriginal_price());
            ps.setDate(4, storage.getAdding_date());

            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void updateInStorage(int book_id, Storage storage) {
        String query = " UPDATE public.storage SET original_price = ?,adding_date = ? WHERE book_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, storage.getOriginal_price());
            ps.setDate(2,storage.getAdding_date());
            ps.setInt(3, book.getBook_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }






    @Override
    public void update(Book book) {
        String query = "UPDATE public.book SET title = ?, publication_date = ? , quantity = ? , price = ?, publisher_id = ?,book_description = ?, book_image = ?, is_available = ? WHERE book_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, book.getTitle());
            ps.setDate(2, book.getPublication_date());
            ps.setInt(3, book.getQuantity());
            ps.setLong(4, book.getPrice());
            ps.setInt(5, book.getPublisher_id());
            ps.setString(6, book.getBook_description());
            ps.setString(7, book.getBook_image());
            ps.setBoolean(8, book.isAvailable());
            ps.setInt(9, book.getBook_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int getBookIdByTitle(String title) {
        int bookId = -1; // Initialize with a value that indicates failure or not found
        String query = "SELECT book_id FROM book WHERE title = ?";
        try{
            ps = conn.prepareStatement(query);
            ps.setString(1, title);
            rs = ps.executeQuery();
            if (rs.next()) {
                bookId = rs.getInt("book_id");
            }

        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return bookId;
    }


    @Override
    public void delete(Book book) {
        String query = "DELETE FROM public.book WHERE book_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, book.getBook_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public boolean isInUserCart(int cartid, int bookid) {
        String query = "SELECT * FROM public.cart_book WHERE shopping_cart_id = ? and book_id = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, cartid);
            ps.setInt(2, bookid);
            rs = ps.executeQuery();

            return rs.next();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return false;
    }

//    public List<Book> searchByTitle(String title) {
//        List<Book> result = new ArrayList<>();
//        String query = "SELECT * FROM public.book WHERE title ILIKE ?";
//        try {
//            ps = conn.prepareStatement(query);
//            ps.setString(1, "%" + title + "%");
//            rs = ps.executeQuery();
//
//            while (rs.next()) {
//                Book book = new Book();
//                book.setBook_id(rs.getInt("book_id"));
//                book.setTitle(rs.getString("title"));
//                book.setPrice(rs.getInt("price"));
//                book.setBook_image(rs.getString("book_image"));
//                book.setIs_available(rs.getBoolean("is_available"));
//                result.add(book);
//            }
//        } catch (Exception e) {
//            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
//        }
//        return result;
//    }
//
    public List<Book> searchByAuthor(String author_fullname) {
        List<Book> result = new ArrayList<>();
        String query = "SELECT author.author_fullname, b.*" +
                "FROM public.author " +
                "JOIN public.author_book ab ON author.author_id = ab.author_id " +
                "JOIN public.book b ON ab.book_id = b.book_id " +
                "WHERE author.author_fullname ILIKE ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + author_fullname + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPrice(rs.getInt("price"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                result.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public List<Book> searchByTitleAndAuthor(String keyword) {
        Set<Integer> uniqueBookIds = new HashSet<>(); // Use a Set to track unique book id
        List<Book> result = new ArrayList<>();
        String query = "SELECT * FROM public.book WHERE title ILIKE ? OR book_id IN (" +
                "SELECT book_id FROM public.author_book ab " +
                "JOIN public.author a ON ab.author_id = a.author_id " +
                "WHERE a.author_fullname ILIKE ?)";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                // Check if the book has already been added to the result
                if (!uniqueBookIds.contains(bookId)) {
                    Book book = new Book();
                    book.setBook_id(bookId);
                    book.setTitle(rs.getString("title"));
                    book.setPrice(rs.getInt("price"));
                    book.setBook_image(rs.getString("book_image"));
                    book.setIs_available(rs.getBoolean("is_available"));
                    result.add(book);
                    uniqueBookIds.add(bookId); // Add book id to the set to prevent duplicates
                }
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public List<Book> getAllBooks() {
        query = "WITH sold_books AS (" +
                "SELECT " +
                "od.book_id, " +
                "COALESCE(SUM(CASE WHEN o.order_status NOT IN (0, 5, 6) THEN od.quantity ELSE 0 END), 0) as quantity_sold " +
                "FROM " +
                "order_detail AS od " +
                "LEFT JOIN \"order\" AS o ON od.order_id = o.order_id " +
                "GROUP BY od.book_id" +
                ") " +
                "SELECT " +
                "b.book_id, b.title, b.publication_date, sb.quantity_sold, b.quantity, b.price, s.original_price,s.adding_date, " +
                "p.publisher_name, b.book_description, b.book_image, b.is_available, " +
                "string_agg(DISTINCT a.author_fullname, ', ') AS author_names, " +
                "string_agg(DISTINCT c.category_name, ', ') AS category_names " +
                "FROM book AS b " +
                "JOIN author_book AS ab ON b.book_id = ab.book_id " +
                "JOIN author AS a ON ab.author_id = a.author_id " +
                "JOIN category_book AS cb ON b.book_id = cb.book_id " +
                "JOIN category AS c ON cb.category_id = c.category_id " +
                "JOIN publisher AS p ON b.publisher_id = p.publisher_id " +
                "JOIN storage AS s ON b.book_id = s.book_id " +
                "LEFT JOIN sold_books AS sb ON b.book_id = sb.book_id " +
                "GROUP BY b.book_id, b.title, b.publication_date, sb.quantity_sold, b.quantity, b.price, s.original_price,s.adding_date, p.publisher_name, b.book_description, b.book_image, b.is_available";
        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Book book = new Book();

                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setQuantity_sold(rs.getInt("quantity_sold"));
                book.setPrice(rs.getInt("price"));
                book.setOriginal_price(rs.getInt("original_price"));
                book.setAdding_date(rs.getDate("adding_date"));
                book.setPublisher_name(rs.getString("publisher_name"));
                book.setBook_description(rs.getString("book_description"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                book.setAuthor_fullname(rs.getString("author_names"));
                book.setCategory_name(rs.getString("category_names"));
                books.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return books;
    }

    public Book selectBookByID(int book_id) {

        query = "SELECT " +
                "b.book_id, b.title, b.publication_date,COALESCE(SUM(CASE WHEN o.order_status NOT IN (0, 5, 6) THEN od.quantity ELSE 0 END), 0) as quantity_sold, b.quantity, b.price, s.original_price,s.adding_date, " +
                "p.publisher_name, b.book_description, b.book_image, b.is_available, " +
                "string_agg(DISTINCT a.author_fullname, ', ') AS author_names, " +
                "string_agg(DISTINCT c.category_name, ', ') AS category_names " +
                "FROM book AS b " +
                "JOIN author_book AS ab ON b.book_id = ab.book_id " +
                "JOIN author AS a ON ab.author_id = a.author_id " +
                "JOIN category_book AS cb ON b.book_id = cb.book_id " +
                "JOIN category AS c ON cb.category_id = c.category_id " +
                "JOIN publisher AS p ON b.publisher_id = p.publisher_id " +
                "JOIN storage AS s ON b.book_id = s.book_id " +
                "LEFT JOIN order_detail AS od ON b.book_id = od.book_id "+
                "LEFT JOIN \"order\" AS o ON od.order_id = o.order_id "+
                "WHERE b.book_id = ? " +
                "GROUP BY b.book_id, b.title, b.publication_date, b.quantity, b.price, s.original_price,s.adding_date, p.publisher_name, b.book_description, b.book_image, b.is_available";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, book_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPublication_date(rs.getDate("publication_date"));
                book.setQuantity(rs.getInt("quantity"));
                book.setQuantity_sold(rs.getInt("quantity_sold"));
                book.setPrice(rs.getInt("price"));
                book.setOriginal_price(rs.getInt("original_price"));
                book.setAdding_date(rs.getDate("adding_date"));
                book.setPublisher_name(rs.getString("publisher_name"));
                book.setBook_description(rs.getString("book_description"));
                book.setBook_image(rs.getString("book_image"));
                book.setIs_available(rs.getBoolean("is_available"));
                book.setAuthor_fullname(rs.getString("author_names"));
                book.setCategory_name(rs.getString("category_names"));
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return book;
    }




        public void updateBookByID(Book book) throws SQLException {
        String query = "UPDATE public.book SET title = ?, publication_date = ? , quantity = ? , price = ?," +
                "publisher_id = ?,book_description = ?, book_image = ?, is_available = ? " +
                "WHERE book_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, book.getTitle());
            ps.setDate(2, book.getPublication_date());
            ps.setInt(3, book.getQuantity());
            ps.setLong(4, book.getPrice());
            ps.setInt(5, book.getPublisher_id());
            ps.setString(6, book.getBook_description());
            ps.setString(7, book.getBook_image());
            ps.setBoolean(8, book.isAvailable());
            ps.setInt(9, book.getBook_id());
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    //update category for book by delete and insert for book_category
    public void updateBookCategoryByID(int book_id, List<Integer> category_id) throws SQLException {
        String deleteQuery = "DELETE FROM category_book WHERE book_id = ?";
        ps = conn.prepareStatement(deleteQuery);
        ps.setInt(1, book_id);
        ps.executeUpdate();

        String insertQuery = "INSERT INTO category_book (book_id, category_id) VALUES (?, ?)";
        ps = conn.prepareStatement(insertQuery);
        for (int i = 0; i < category_id.size(); i++) {
            ps.setInt(1, book_id);
            ps.setInt(2, category_id.get(i)); // Set the second parameter to the category_id
            ps.executeUpdate();
        }
    }

    public void addBookCategories(int book_id, List<Integer> category_ids) throws SQLException {
        String insertQuery = "INSERT INTO category_book (book_id, category_id) VALUES (?, ?)";
        ps = conn.prepareStatement(insertQuery);
        for (int category_id : category_ids) {
            ps.setInt(1, book_id);
            ps.setInt(2, category_id);
            ps.executeUpdate();
        }
    }

    //update author for book by delete and insert for book_author
    public void updateBookAuthorByID(int book_id, List<Integer> author_id) throws SQLException {
        String deleteQuery = "DELETE FROM author_book WHERE book_id = ?";
        ps = conn.prepareStatement(deleteQuery);
        ps.setInt(1, book_id);
        ps.executeUpdate();

        String insertQuery = "INSERT INTO author_book (book_id, author_id) VALUES (?, ?)";
        ps = conn.prepareStatement(insertQuery);
        for (int i = 0; i < author_id.size(); i++) {
            ps.setInt(1, book_id);
            ps.setInt(2, author_id.get(i));
            ps.executeUpdate();
        }
    }
    public void addBookAuthors(int book_id, List<Integer> author_ids) throws SQLException {
        String insertQuery = "INSERT INTO author_book (book_id, author_id) VALUES (?, ?)";
        ps = conn.prepareStatement(insertQuery);
        for (int author_id : author_ids) {
            ps.setInt(1, book_id);
            ps.setInt(2, author_id);
            ps.executeUpdate();
        }
    }


    public void deleteBookByID(int book_id) throws SQLException {
        String deleteQuery = "DELETE FROM book WHERE book_id = ?";
        ps = conn.prepareStatement(deleteQuery);
        ps.setInt(1, book_id);
        ps.executeUpdate();
    }

    public void insertBook(Book book) throws SQLException {
        String insertQuery = "INSERT INTO book (book_id, title, publication_date, quantity, price, publisher_id, book_description, book_image, is_available) VALUES (?,?,?,?,?,?,?,?,?)";
        ps = conn.prepareStatement(insertQuery);
        ps.setInt(1, book.getBook_id());
        ps.setString(2, book.getTitle());
        ps.setDate(3, book.getPublication_date());
        ps.setInt(4, book.getQuantity());
        ps.setLong(5, book.getPrice());
        ps.setInt(6, book.getPublisher_id());
        ps.setString(7, book.getBook_description());
        ps.setString(8, "/" + book.getBook_image());
        ps.setBoolean(9, book.isAvailable());
        ps.executeUpdate();
    }
    public boolean doesBookExist1(int book_id) {
        String query = "SELECT 1 FROM book WHERE book_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, book_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean doesBookExist(String book_title, Date adding_date) {
        String query = "SELECT 1 FROM book b JOIN storage s ON b.book_id = s.book_id WHERE b.title = ? AND s.adding_date = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, book_title);
            ps.setDate(2, adding_date);
            rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
//test doesBookExist


    public List<Book> getBooksByPublisher(int selectedPublisherId) {

        try {
            Connection connection = PostgresqlConnection.getConn();
                     query = "SELECT b.book_id, b.title, b.publication_date " +
                    "FROM book b " +
                    "WHERE b.publisher_id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, selectedPublisherId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Book book = new Book();
                book.setBook_id(resultSet.getInt("book_id"));
                book.setTitle(resultSet.getString("title"));
                book.setPublication_date(resultSet.getDate("publication_date"));
                books.add(book);
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }


    public List<Book> getBooksByAuthor(int authorId) {
        query = "SELECT b.* FROM book b JOIN author_book ab ON b.book_id = ab.book_id WHERE ab.author_id = ?";
        books = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, authorId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Book book = new Book();
                    book.setBook_id(rs.getInt("book_id"));
                    book.setTitle(rs.getString("title"));
                    book.setIs_available(rs.getBoolean("is_available"));
                    books.add(book);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log any SQL-related exceptions
        }
        return books;
    }

    public List<Book> getBooksByCategory(int categoryId) {
        query = "SELECT b.* FROM book b JOIN category_book cb ON b.book_id = cb.book_id WHERE cb.category_id = ?";
        books = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, categoryId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Book book = new Book();
                    book.setBook_id(rs.getInt("book_id"));
                    book.setTitle(rs.getString("title"));
                    book.setIs_available(rs.getBoolean("is_available"));
                    books.add(book);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log any SQL-related exceptions
        }
        return books;
    }





    public List<Author> getBookAuthors(int id) {
        List<Author> result = new ArrayList<>();
        String query = "SELECT\n" +
                "    author.author_id,\n" +
                "    author.author_fullname,\n" +
                "    author.author_description,\n" +
                "    author.author_image\n" +
                "\n" +
                "FROM author_book\n" +
                "         INNER JOIN author ON author_book.author_id = author.author_id\n" +
                "WHERE author_book.book_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Author author = new Author();
                author.setAuthor_id(rs.getInt("author_id"));
                author.setAuthor_fullname(rs.getString("author_fullname"));
                author.setAuthor_description(rs.getString("author_description"));
                author.setAuthor_image(rs.getString("author_image"));
                result.add(author);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public Publisher getPublisher(int id) {
        String query = "SELECT * FROM public.publisher where publisher_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Publisher publisher = new Publisher();
                publisher.setPublisher_id(rs.getInt("publisher_id"));
                publisher.setPublisher_name(rs.getString("publisher_name"));
                return publisher;
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }

    public List<Book> searchByPublisher(int id) {
        List<Book> result = new ArrayList<>();
        String query = "SELECT * FROM public.book WHERE publisher_id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()) {
                Book book = new Book();
                book.setBook_id(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setPrice(rs.getLong("price"));
                book.setBook_image(rs.getString("book_image"));
                result.add(book);
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return result;
    }

    public int getTotalSold(int bookid) {
        int result = 0;
        String query = "SELECT b.book_id, SUM(od.quantity) as totalSold\n" +
                "FROM \"order\"\n" +
                "         JOIN public.order_detail od on \"order\".order_id = od.order_id\n" +
                "         JOIN public.book b on b.book_id = od.book_id\n" +
                "WHERE b.book_id = ? AND \"order\".order_status='1' \n" +
                "GROUP BY b.book_id, title";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookid);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = rs.getInt("totalSold");
            }
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return result;
    }

    public void updateQuantityByBookID(int bookid, int bookquantity, int quantity) {
        String query = "UPDATE public.book SET quantity = ? WHERE book_id = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, bookquantity - quantity);
            ps.setInt(2, bookid);
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public static void main(String[] args) {
        BookDAO dao = new BookDAO();
        for (Author a : dao.getBookAuthors(1)) {
            System.out.println(a);
        }
    }
}
