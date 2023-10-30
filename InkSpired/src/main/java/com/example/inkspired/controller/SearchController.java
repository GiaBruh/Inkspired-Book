package com.example.inkspired.controller;

import com.example.inkspired.dao.BookDAO;
import com.example.inkspired.dao.CategoryDAO;
import com.example.inkspired.model.Book;
import com.example.inkspired.model.Category;
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
        String path = request.getRequestURI();
        if (path.endsWith(SEARCH)) {
            request.getRequestDispatcher("/searchResult.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        processRequest(request, response);
        HttpSession session = request.getSession();
        int category = Integer.parseInt((request.getParameter("category_id") == null)? "0" : request.getParameter("category_id"));

        CategoryDAO categoryDAO = new CategoryDAO();

        if (request.getParameter("btn-search") != null &&
                request.getParameter("btn-search").equals("search-by-keyword")) {

            if (session.getAttribute("searchResultByCategory") != null) {
                session.setAttribute("searchResultByCategory", null);
            }

            String keyword = request.getParameter("keyword").trim();

            if (keyword != null && !keyword.isEmpty()) {
                BookDAO bookDAO = new BookDAO();

                List<Book> searchResultByKeyword = bookDAO.searchByTitleAndAuthor(keyword);

                session.setAttribute("searchResultByKeyword", searchResultByKeyword);
                session.setAttribute("keyword", keyword);

                response.sendRedirect(getServletContext().getContextPath() + SEARCH);
            } else {
                response.sendRedirect(getServletContext().getContextPath() + "/");
            }
        }
        if (request.getParameter("category_id") != null && category != 0) {
            List<Book> searchResultByCategory = categoryDAO.searchByCategory(category);
            session.setAttribute("searchResultByCategory", searchResultByCategory);

            response.sendRedirect(getServletContext().getContextPath() + SEARCH);
        }
    }
}