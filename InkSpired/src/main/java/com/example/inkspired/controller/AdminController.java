package com.example.inkspired.controller;

import com.example.inkspired.dao.*;
import com.example.inkspired.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Paths;
import java.nio.file.Files;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10) // 100 MB
public class AdminController extends HttpServlet {
    private static final String ADMIN = "/admin";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();

        if (path.endsWith(ADMIN)) {
            request.getRequestDispatcher("/admin-login.jsp").forward(request, response);
        }

        Cookie[] cookies = request.getCookies();
        request.setCharacterEncoding("UTF-8");
//        // Retrieve the username from the cookie
//        String fullName = null;
//
//        if (cookies != null) {
//            for (Cookie cookie : cookies) {
//                if (cookie.getName().equals("fullName")) {
//                    fullName = cookie.getValue();
//                    break;
//                }
//            }
//        }
//
//        if (fullName != null) {
//            // Set the full name as a request attribute to display in the JSP
//            request.setAttribute("fullName", fullName);
//        }

        boolean isLoggedIn = false;
        String pathInfo = request.getPathInfo();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("sessionId") && cookie.getValue().equals("uniqueSessionId")) {
                    isLoggedIn = true;
                    break;
                }
            }
        }
        HttpSession session = request.getSession(false);
        if (isLoggedIn) {
            // if (session != null && session.getAttribute("admin") != null) {
            // // Retrieve the Admin object from the session
            // Admin admin = (Admin) session.getAttribute("admin");
            // }

            if (pathInfo.equals("/")) {

                response.sendRedirect(request.getContextPath() + "/admin/dashboard");

            } else if (pathInfo.equals("/dashboard")) {
                request.getRequestDispatcher("/admin-dashboard.jsp").forward(request, response);

            } else if (pathInfo.equals("/table-order")) {
                {
                    OrderDAO orderDAO = new OrderDAO();
                    List<Order> orders = orderDAO.getAll();
                    request.setAttribute("orders", orders);
                    request.getRequestDispatcher("/admin-table-order.jsp").forward(request, response);
                }

            }  else if (pathInfo.equals("/table-book")) {
                {
                    BookDAO bookDAO = new BookDAO();
                    List<Book> books = bookDAO.getAllBooks();
                    request.setAttribute("books", books);
                    request.getRequestDispatcher("/admin-table-book.jsp").forward(request, response);
                }

            } else if (pathInfo.equals("/table-publisher")) {
                {
                    PublisherDAO publisherDAO = new PublisherDAO();
                    List<Publisher> publishers = publisherDAO.getAll();
                    request.setAttribute("publishers", publishers);
                    request.getRequestDispatcher("/admin-table-publisher.jsp").forward(request, response);
                }

            }else if (pathInfo.equals("/table-author")) {
                {
                    AuthorDAO authorDAO = new AuthorDAO();
                    List<Author> authors = authorDAO.getBooksByAuthor();
                    request.setAttribute("authors", authors);
                    request.getRequestDispatcher("/admin-table-author.jsp").forward(request, response);
                }

            } else if (pathInfo.equals("/table-category")) {
                {
                    CategoryDAO categoryDAO = new CategoryDAO();
                    List<Category> categories = categoryDAO.getAllCategories();
                    request.setAttribute("categories", categories);
                    request.getRequestDispatcher("/admin-table-category.jsp").forward(request, response);
                }

            } else if (pathInfo.equals("/table-user")) {
                {
                    UserDAO userDAO = new UserDAO();
                    List<User> users = userDAO.getAll();
                    request.setAttribute("users", users);
                    request.getRequestDispatcher("/admin-table-user.jsp").forward(request, response);
                }

            } else if (pathInfo.startsWith("/book-info")) {
                {
                    String bookIdString = request.getParameter("book_id");

                    if (bookIdString != null && !bookIdString.isEmpty()) {
                        int bookId = Integer.parseInt(bookIdString);
                        BookDAO bookDAO = new BookDAO();
                        Book book = bookDAO.selectBookByID(bookId);
                        request.setAttribute("book", book);

                        // Fetch all authors and categories
                        AuthorDAO authorDAO = new AuthorDAO();
                        List<Author> authors = authorDAO.getAll();
                        request.setAttribute("authors", authors);

                        CategoryDAO categoryDAO = new CategoryDAO();
                        List<Category> categories = categoryDAO.getAll();
                        request.setAttribute("categories", categories);

                        PublisherDAO publisherDAO = new PublisherDAO();
                        List<Publisher> publishers = publisherDAO.getAll();
                        request.setAttribute("publishers", publishers);

                        request.getRequestDispatcher("/admin-info-book.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/table-book");
                    }
                }

            } else if (pathInfo.startsWith("/publisher-info")) {
                {
                    String publisherIdString = request.getParameter("publisher_id");

                    if (publisherIdString != null && !publisherIdString.isEmpty()) {
                        int publisherId = Integer.parseInt(publisherIdString);

                        BookDAO books = new BookDAO();
                        List<Book> book = books.getBooksByPublisher(publisherId);
                        request.setAttribute("books", book);

                        PublisherDAO publisherDAO = new PublisherDAO();
                        Publisher publisher = publisherDAO.selectPublisherbyID(publisherId);
                        request.setAttribute("publisher", publisher);

                        request.getRequestDispatcher("/admin-info-publisher.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/table-publisher");
                    }
                }

            } else if (pathInfo.startsWith("/author-info")) {
                {
                    String author_id = request.getParameter("author_id");
                    if (author_id != null && !author_id.isEmpty()) {
                        int authorId = Integer.parseInt(author_id);

                        System.out.println("Author ID: " + authorId); // Print the author ID for testing


                        BookDAO books = new BookDAO();
                        List<Book> book = books.getBooksByAuthor(authorId);

                        AuthorDAO authorDAO = new AuthorDAO();

                        Author author = authorDAO.selectAuthorByID(authorId);

                        request.setAttribute("books", book);
                        request.setAttribute("author", author);

                        request.getRequestDispatcher("/admin-info-author.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/table-author");
                    }
                }
                
            } else if (pathInfo.startsWith("/category-info")) {
                {
                    String categoryIdString = request.getParameter("category_id");

                    if (categoryIdString != null && !categoryIdString.isEmpty()) {
                        int categoryId = Integer.parseInt(categoryIdString);

                        BookDAO books = new BookDAO();
                        List<Book> book = books.getBooksByCategory(categoryId);
                        request.setAttribute("books", book);

                        CategoryDAO categoryDAO = new CategoryDAO();
                        Category category = categoryDAO.selectCategoryByID(categoryId);
                        request.setAttribute("category", category);

                        request.getRequestDispatcher("/admin-info-category.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/table-category");
                    }
                }

            }else if (pathInfo.startsWith("/delete-book")) {
                {
                    int bookId = Integer.parseInt(request.getParameter("book_id"));

                    // Call your DAO method to delete the book by its ID
                    BookDAO bookDAO = new BookDAO();
                    try {
                        bookDAO.deleteBookByID(bookId);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    response.sendRedirect(request.getContextPath() + "/admin/table-book");
                }

            }else if (pathInfo.startsWith("/delete-publisher")){
                {
                    int publisherId = Integer.parseInt(request.getParameter("publisher_id"));

                    // Call your DAO method to delete the book by its ID
                    PublisherDAO publisherDAO = new PublisherDAO();
                    publisherDAO.deletePublisher(publisherId);

                    response.sendRedirect(request.getContextPath() + "/admin/table-publisher");
                }

            } else if (pathInfo.startsWith("/delete-author") ){
                {
                    int authorId = Integer.parseInt(request.getParameter("author_id"));

                    // Call your DAO method to delete the book by its ID
                    AuthorDAO authorDAO = new AuthorDAO();
                    authorDAO.delete(authorId);

                    response.sendRedirect(request.getContextPath() + "/admin/table-author");
                }

            } else if (pathInfo.startsWith("/delete-category")) {
                {
                    int categoryId = Integer.parseInt(request.getParameter("category_id"));

                    // Call your DAO method to delete the book by its ID
                    CategoryDAO categoryDAO = new CategoryDAO();
                    categoryDAO.deleteCategoryByID(categoryId);

                    response.sendRedirect(request.getContextPath() + "/admin/table-category");
                }

            } else if(pathInfo.equals("/add-book")){
                {
                    AuthorDAO authorDAO = new AuthorDAO();
                    List<Author> authors = authorDAO.getAll();
                    request.setAttribute("authors", authors);

                    CategoryDAO categoryDAO = new CategoryDAO();
                    List<Category> categories = categoryDAO.getAll();
                    request.setAttribute("categories", categories);

                    PublisherDAO publisherDAO = new PublisherDAO();
                    List<Publisher> publishers = publisherDAO.getAll();
                    request.setAttribute("publishers", publishers);

                    request.getRequestDispatcher("/admin-add-book.jsp").forward(request, response);
                }

            }else if(pathInfo.equals("/add-publisher")) {
                request.getRequestDispatcher("/admin-add-publisher.jsp").forward(request, response);
            }else if(pathInfo.equals("/add-author")) {
                request.getRequestDispatcher("/admin-add-author.jsp").forward(request, response);
            }else if(pathInfo.equals("/add-category")) {
                request.getRequestDispatcher("/admin-add-category.jsp").forward(request, response);
            }


            else if(pathInfo.equals("/login")){
                request.getRequestDispatcher("/admin-login.jsp").forward(request, response);

            } else if (pathInfo.equals("/logout")) {
                // Delete the session cookie
                Cookie sessionCookie = new Cookie("sessionId", "");
                sessionCookie.setPath(request.getContextPath());
                sessionCookie.setMaxAge(0); // Delete the cookie
                response.addCookie(sessionCookie);

                // Redirect to the login page
                response.sendRedirect(request.getContextPath() + "/admin/login");

            } else {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            }

        } else {
            // User is not logged in, display the login form
            request.getRequestDispatcher("/admin-login.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // Check if this is a login request
        if ("login".equals(request.getParameter("action"))) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");


            // Assuming you have a method in AdminDAO to check credentials
            AdminDAO adminDAO = new AdminDAO();
            Admin validCredentials = adminDAO.checkLogin(username, password);

            if (validCredentials != null) {
                // Create a session cookie
                Cookie sessionCookie = new Cookie("sessionId", "uniqueSessionId");
                sessionCookie.setPath(request.getContextPath());
                //set 1 days for cookie
                int cookieMaxAge = 60 * 60 * 24;
                sessionCookie.setMaxAge(cookieMaxAge);
                response.addCookie(sessionCookie);

                // Store user information in server-side session
                HttpSession session = request.getSession();
                session.setAttribute("adminUsername", validCredentials.getUsername());
                session.setAttribute("adminEmail", validCredentials.getEmailAddress());
                session.setAttribute("adminFullname", validCredentials.getFullName());


                // Redirect to the dashboard
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                // Invalid credentials, display the login form with an error message
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("/admin-login.jsp").forward(request, response);
            }

        }else if (request.getParameter("updateBookSubmit") != null) {
            {
                String book_image = "./uploadphotos/";
                Part part = request.getPart("upload");
                String realPath = request.getServletContext().getRealPath("/uploadphotos/bookphotos");
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }

                book_image = "./uploadphotos/bookphotos" + "/" + fileName;
                System.out.println(realPath + "/" + fileName);
                part.write(realPath + "/" + fileName);
                // Parse the request to get the new book details
                int bookId = Integer.parseInt(request.getParameter("book_id"));
                BookDAO bookDAO = new BookDAO();
                Book book = bookDAO.selectBookByID(bookId); // Assuming you have a selectBookByID method to fetch the book by ID

                book.setTitle(request.getParameter("title"));
                book.setPublication_date(Date.valueOf(request.getParameter("date"))); // Assuming date is in yyyy-MM-dd format
                book.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                book.setPrice(Long.parseLong(request.getParameter("price")));
                book.setPublisher_id(Integer.parseInt(request.getParameter("publisherId")));
                book.setBook_description(request.getParameter("description"));
                book.setBook_image(book_image);
                book.setIs_available(Boolean.parseBoolean(request.getParameter("available")));


                // Get arrays of new category and author ids
                String[] authorIds = request.getParameterValues("authorIds");
                List<Integer> newAuthorIds = Arrays.stream(authorIds).map(Integer::parseInt).collect(Collectors.toList());

                String[] categoryIds = request.getParameterValues("categoryIds");
                List<Integer> newCategoryIds = Arrays.stream(categoryIds).map(Integer::parseInt).collect(Collectors.toList());

                // Call methods to update the book in the database
                try {
                    bookDAO.updateBookByID(book);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                try {
                    bookDAO.updateBookAuthorByID(bookId, newAuthorIds);
                    bookDAO.updateBookCategoryByID(bookId, newCategoryIds);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                response.sendRedirect(request.getContextPath() + "/admin/table-book");
            }

        }else if (request.getParameter("addBookSubmit") != null) {
            {  // Parse the request to get the new book details

                String book_image = "./uploadphotos/";
                Part part = request.getPart("upload");
                String realPath = request.getServletContext().getRealPath("/uploadphotos/bookphotos");
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }

                book_image = "./uploadphotos/bookphotos" + "/" + fileName;
                System.out.println(realPath + "/" + fileName);
                part.write(realPath + "/" + fileName);

                Book book = new Book();
                book.setTitle(request.getParameter("title"));
                book.setPublication_date(Date.valueOf(request.getParameter("date"))); // Assuming date is in yyyy-MM-dd format
                book.setQuantity(Integer.parseInt(request.getParameter("quantity")));
                book.setPrice(Long.parseLong(request.getParameter("price")));
                book.setPublisher_id(Integer.parseInt(request.getParameter("publisherId")));
                book.setBook_description(request.getParameter("description"));
                book.setBook_image(book_image);
                book.setIs_available(Boolean.parseBoolean(request.getParameter("available")));

                // Get arrays of new category and author ids
                String[] authorIds = request.getParameterValues("authorIds");
                List<Integer> newAuthorIds = Arrays.stream(authorIds).map(Integer::parseInt).collect(Collectors.toList());

                String[] categoryIds = request.getParameterValues("categoryIds");
                List<Integer> newCategoryIds = Arrays.stream(categoryIds).map(Integer::parseInt).collect(Collectors.toList());

                // Call methods to update the book in the database
                BookDAO bookDAO = new BookDAO();
                if  (bookDAO.doesBookExist(book.getBook_id())) {

                    HttpSession session = request.getSession();
                    session.setAttribute("errorMessage", "This book is already existed");
                    response.sendRedirect(request.getContextPath() + "/admin/add-book");
                } else {

                        bookDAO.add(book);
                    int bookId = bookDAO.getBookIdByTitle(book.getTitle());

                    try {
                        bookDAO.addBookAuthors(bookId, newAuthorIds);
                        bookDAO.addBookCategories(bookId, newCategoryIds);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    response.sendRedirect(request.getContextPath() + "/admin/table-book");
                }
            }

        } else if (request.getParameter("addPublisherSubmit") != null) {
            {
                Publisher publisher = new Publisher();
//                publisher.setPublisher_id(Integer.parseInt(request.getParameter("publisher_id")));
                publisher.setPublisher_name(request.getParameter("publisher_name"));
                PublisherDAO publisherDAO = new PublisherDAO();
                if (publisherDAO.selectPublisherbyID(publisher.getPublisher_id()) != null) {

                    HttpSession session = request.getSession();
                    session.setAttribute("errorMessage", "This publisher ID is already existed");
                    response.sendRedirect(request.getContextPath() + "/admin/add-publisher");
                } else {

                    publisherDAO.add(publisher);

                    response.sendRedirect(request.getContextPath() + "/admin/table-publisher");
                }
            }
        } else if (request.getParameter("updatePublisherSubmit") != null) {
            {
                Publisher publisher = new Publisher();
                publisher.setPublisher_id(Integer.parseInt(request.getParameter("publisher_id")));
                publisher.setPublisher_name(request.getParameter("publisher_name"));

                PublisherDAO publisherDAO = new PublisherDAO();
                publisherDAO.updatePublisher(publisher);

                response.sendRedirect(request.getContextPath() + "/admin/table-publisher");
            }
        } else if (request.getParameter("deletePublisherSubmit") != null) {
            {
                int publisher_id = Integer.parseInt(request.getParameter("publisher_id"));

                PublisherDAO publisherDAO = new PublisherDAO();
                publisherDAO.deletePublisher(publisher_id);

                response.sendRedirect(request.getContextPath() + "/admin/table-publisher");
            }
        }else if (request.getParameter("addAuthorSubmit") != null){
            {
                String author_image = "./uploadphotos/";
                Part part = request.getPart("upload");
                String realPath = request.getServletContext().getRealPath("/uploadphotos/authorphotos");
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }

                author_image = "./uploadphotos/authorphotos" + "/" + fileName;
                System.out.println(realPath + "/" + fileName);
                part.write(realPath + "/" + fileName);
                Author author = new Author();
//                author.setAuthor_id(Integer.parseInt(request.getParameter("author_id")));
                author.setAuthor_fullname(request.getParameter("author_fullname"));
                author.setAuthor_image(author_image);
                author.setAuthor_status(Boolean.parseBoolean(request.getParameter("author_status")));
                author.setAuthor_description(request.getParameter("author_description"));

                AuthorDAO authorDAO = new AuthorDAO();
                {

                    authorDAO.add(author);

                    response.sendRedirect(request.getContextPath() + "/admin/table-author");
                }
            }
        } else if (request.getParameter("updateAuthorSubmit") != null) {
            {
                String author_image = "./uploadphotos/";
                Part part = request.getPart("upload");
                String realPath = request.getServletContext().getRealPath("/uploadphotos/authorphotos");
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }

                author_image = "./uploadphotos/authorphotos" + "/" + fileName;
                System.out.println(realPath + "/" + fileName);
                part.write(realPath + "/" + fileName);
                Author author = new Author();
                author.setAuthor_id(Integer.parseInt(request.getParameter("author_id")));
                author.setAuthor_fullname(request.getParameter("author_fullname"));
                author.setAuthor_image(author_image);
                author.setAuthor_status(Boolean.parseBoolean(request.getParameter("author_status")));
                author.setAuthor_description(request.getParameter("author_description"));

                AuthorDAO authorDAO = new AuthorDAO();
                authorDAO.updateAuthor(author);

                response.sendRedirect(request.getContextPath() + "/admin/table-author");
            }
        } else if (request.getParameter("deleteAuthorSubmit") != null){
            {
                AuthorDAO authorDAO = new AuthorDAO();
                int author_id = Integer.parseInt(request.getParameter("author_id"));
                authorDAO.delete(author_id);
                response.sendRedirect(request.getContextPath() + "/admin/table-author");
            }
        } else if (request.getParameter("addCategorySubmit") != null){
            {
                Category category = new Category();
//                category.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
                category.setCategory_name(request.getParameter("category_name"));

                CategoryDAO categoryDAO = new CategoryDAO();
                if (categoryDAO.selectCategoryByID(category.getCategory_id()) != null) {

                    HttpSession session = request.getSession();
                    session.setAttribute("errorMessage", "This category ID is already existed");
                    response.sendRedirect(request.getContextPath() + "/admin/add-category");
                } else {

                    categoryDAO.add(category);

                    response.sendRedirect(request.getContextPath() + "/admin/table-category");
                }
            }
        } else if (request.getParameter("updateCategorySubmit") != null) {
            {
                Category category = new Category();
                category.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
                category.setCategory_name(request.getParameter("category_name"));

                CategoryDAO categoryDAO = new CategoryDAO();
                categoryDAO.update(category);

                response.sendRedirect(request.getContextPath() + "/admin/table-category");
            }
        } else if (request.getParameter("deleteCategorySubmit") != null){
            {
                CategoryDAO categoryDAO = new CategoryDAO();
                int category_id = Integer.parseInt(request.getParameter("category_id"));
                categoryDAO.deleteCategoryByID(category_id);
                response.sendRedirect(request.getContextPath() + "/admin/table-category");
            }

        }
    }






    // Other methods (e.g., doPut, doDelete) can be implemented for respective HTTP methods
}
