package com.example.inkspired.controller;

import com.example.inkspired.dao.BookDAO;
import com.example.inkspired.model.Book;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {

    private static final String HOMEPAGE = "/";

    private static final String SEARCH = "/search";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("You forgot to comment this method boi!");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getRequestDispatcher("./login.jsp");
//        dispatcher.forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        processRequest(request, response);
        if (request.getParameter("btn-search") != null &&
                request.getParameter("btn-search").equals("search-by-keyword")){
            String keyword = request.getParameter("keyword").trim();

            if (keyword != null && !keyword.isEmpty()) {
                BookDAO bookDAO = new BookDAO();
                List<Book> searchResultByTitle = bookDAO.searchByTitle(keyword);
                request.setAttribute("searchResultByTitle", searchResultByTitle);
                List<Book> searchResultByAuthor = bookDAO.searchByAuthor(keyword);
                request.setAttribute("searchResultByAuthor", searchResultByAuthor);
                response.sendRedirect(getServletContext().getContextPath() + "/login");
            } else {
                response.sendRedirect(getServletContext().getContextPath() + "/register");
            }
        }
    }
}