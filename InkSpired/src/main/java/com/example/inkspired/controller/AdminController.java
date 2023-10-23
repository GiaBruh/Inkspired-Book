package com.example.inkspired.controller;

import com.example.inkspired.dao.*;
import com.example.inkspired.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;


public class AdminController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();

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
//            if (session != null && session.getAttribute("admin") != null) {
//                // Retrieve the Admin object from the session
//                Admin admin = (Admin) session.getAttribute("admin");
//            }

            if(pathInfo.equals("/")){

                response.sendRedirect(request.getContextPath() + "/admin/dashboard");

            }

            else if(pathInfo.equals("/dashboard")){
                request.getRequestDispatcher("/admin-dashboard.jsp").forward(request, response);


            } else if (pathInfo.equals("/table-order")) {
                request.getRequestDispatcher("/admin-table-order.jsp").forward(request, response);

            } else if (pathInfo.equals("/table-bill")) {
                request.getRequestDispatcher("/admin-table-bill.jsp").forward(request, response);

            } else if (pathInfo.equals("/table-book")) {

                BookDAO bookDAO = new BookDAO();
                List<Book> books = bookDAO.getAllBooks();
                request.setAttribute("books", books);
                request.getRequestDispatcher("/admin-table-book.jsp").forward(request, response);

            } else if (pathInfo.startsWith("/update-book")) {
                String bookIdString = request.getParameter("book_id");

                if (bookIdString != null && !bookIdString.isEmpty()){
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

                    request.getRequestDispatcher("/admin-update-book.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/table-book");
                }
            }
            else if(pathInfo.equals("/login")){
                request.getRequestDispatcher("/admin-login.jsp").forward(request, response);

            } else if(pathInfo.equals("/logout")){
                // Delete the session cookie
                Cookie sessionCookie = new Cookie("sessionId", "");
                sessionCookie.setPath(request.getContextPath());
                sessionCookie.setMaxAge(0);  // Delete the cookie
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Assuming you have a method in AdminDAO to check credentials
        AdminDAO adminDAO = new AdminDAO();
        Admin validCredentials = adminDAO.checkLogin(username, password);

        if (validCredentials != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", validCredentials);
//            // Retrieve the full name from your Admin object, assuming it has a method getFullName()
//            String fullName = validCredentials.getFullName();
//
//            // URL encode the full name
//            String encodedFullName = URLEncoder.encode(fullName, StandardCharsets.UTF_8);

            // Create a session cookie
            Cookie sessionCookie = new Cookie("sessionId", "uniqueSessionId");
            sessionCookie.setPath(request.getContextPath());
            sessionCookie.setMaxAge(30 * 60);  // Set the session cookie's max age to 30 minutes
            response.addCookie(sessionCookie);

//            // Create a cookie for the full name
//            Cookie fullNameCookie = new Cookie("fullName", encodedFullName);
//            fullNameCookie.setPath(request.getContextPath());
//            fullNameCookie.setMaxAge(30 * 60);  // Set the cookie's max age to 30 minutes
//            response.addCookie(fullNameCookie);

            // Redirect to the dashboard
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        } else {
            // Invalid credentials, display the login form with error message
            request.setAttribute("errorMessage", "Invalid username or password");
            request.getRequestDispatcher("/admin-login.jsp").forward(request, response);
        }
    }





    // Other methods (e.g., doPut, doDelete) can be implemented for respective HTTP methods
}
