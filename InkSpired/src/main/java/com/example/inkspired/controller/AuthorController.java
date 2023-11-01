package com.example.inkspired.controller;

import com.example.inkspired.dao.AuthorDAO;
import com.example.inkspired.dao.BookDAO;
import com.example.inkspired.model.Author;
import com.example.inkspired.model.Book;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@WebServlet(name = "AuthorController", value = "/author")
public class AuthorController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // System.out.println(request.getSession().getAttribute("BOOKINFO"));
        // Optional<Book> book = (Optional<Book>)
        // request.getSession().getAttribute("BOOKINFO");
        // System.out.println(book.get().getBook_id());
        String path = request.getRequestURI();
        try {
            int authorid = Integer.parseInt(request.getParameter("authorid"));
            AuthorDAO aDao = new AuthorDAO();
            BookDAO bDAO = new BookDAO();
            Optional<Author> author = aDao.get(authorid);
//        if(!author.isPresent()) {
//             response.sendRedirect(getServletContext().getContextPath() + "/");
//        }
            String authorName = author.get().getAuthor_fullname();
            List<Book> booksByAuthor = bDAO.searchByAuthor(authorName);
            // HttpSession session = request.getSession();
            request.setAttribute("AUTHORINFO", author);
            request.setAttribute("BOOKSBYAUTHOR", booksByAuthor);

            if (path.startsWith("/InkSpired/author")) {
                request.getRequestDispatcher("/author.jsp").forward(request, response);
            }
        }catch (NoSuchElementException e) {
            response.sendRedirect(getServletContext().getContextPath() + "/404NotFound");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);

    }
}