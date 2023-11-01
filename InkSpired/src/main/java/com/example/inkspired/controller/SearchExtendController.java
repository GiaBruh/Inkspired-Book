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
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "SearchExtendController", value = "/search/extend")
public class SearchExtendController extends HttpServlet {

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

        response.setContentType("text/html;charset=UTF-8");
        String path = request.getRequestURI();

//        HttpSession session = request.getSession();
//
//        if (path.endsWith(SEARCH)) {
//            String[] selectedCategories = request.getParameterValues("checkbox-filter");
//            if (selectedCategories != null && selectedCategories.length > 0) {
//                // Convert selected categories to a list of integers
//                List<Integer> selectedCategoryIds = new ArrayList<>();
//                for (String categoryId : selectedCategories) {
//                    selectedCategoryIds.add(Integer.parseInt(categoryId));
//                }
//
//                // Perform the category search based on selectedCategoryIds
//                CategoryDAO categoryDAO = new CategoryDAO();
//                List<Book> searchResultByCategory = categoryDAO.searchByCategories(selectedCategoryIds);
//
//                // Store the search results in the session
//                session.setAttribute("searchResultByCategory", searchResultByCategory);
//
//                // Redirect to the search result page
//                response.sendRedirect(getServletContext().getContextPath() + SEARCH);
//                return;
//            }
//        }
        request.getRequestDispatcher("/searchResult.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        int category = Integer.parseInt((request.getParameter("category_id") == null) ? "0" : request.getParameter("category_id"));
        session.setAttribute("category_id", category);
        CategoryDAO categoryDAO = new CategoryDAO();
        String categoryName = categoryDAO.getCategoryName(category);
        session.setAttribute("categoryName", categoryName);

        if (request.getParameter("btn-search") != null &&
                request.getParameter("btn-search").equals("search-by-keyword")) {

            if (session.getAttribute("searchResultByCategory") != null) {
                session.setAttribute("searchResultByCategory", null);
            }

            String keyword = request.getParameter("keyword").trim();
            keyword = removeExtraSpaces(keyword);

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

    private String removeExtraSpaces(String input) {
        Pattern pattern = Pattern.compile("\\s+");
        Matcher matcher = pattern.matcher(input);
        return matcher.replaceAll(" ").trim();
    }
}