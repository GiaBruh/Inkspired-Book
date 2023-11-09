package com.example.inkspired.controller;
import com.example.inkspired.dao.ReviewDAO;

import com.example.inkspired.dao.BookDAO;
import com.example.inkspired.dao.ShoppingCartDAO;
import com.example.inkspired.dao.UserDAO;
import com.example.inkspired.model.*;
import com.example.inkspired.dao.ReviewDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "BookController", value = "/book")
public class ReviewController extends HttpServlet {

    private static final String Home = "/";

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
        Cookie[] cookies = request.getCookies();
        try {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("adminId")) {
                    response.sendRedirect(getServletContext().getContextPath() + "/admin/dashboard");
                    return;
                }
            }
        } catch (Exception e) {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        String path = request.getRequestURI();
        HttpSession session = request.getSession();
        ReviewDAO rDAO = new ReviewDAO();
        if (((Cookie) session.getAttribute("userCookie")) != null) {
            List<Review> userReviews = rDAO.getAllUserReviews(Integer.parseInt(((Cookie)session.getAttribute("userCookie")).getValue()));
            request.setAttribute("reviews", userReviews);
            request.getRequestDispatcher("/reviewHistory.jsp").forward(request, response);
        } else {
            response.sendRedirect(getServletContext().getContextPath() + "/");
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
        if (request.getParameter("btnComment") != null && request.getParameter("btnComment").equals("com")) {
            Date review_date = Date.valueOf(request.getParameter("review_date"));
            int user_id = Integer.parseInt(request.getParameter("user_id"));
            int ordered_book_id = Integer.parseInt(request.getParameter("ordered_book_id"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            Review review = new Review(review_date, user_id, ordered_book_id, rating, comment);
            ReviewDAO rDao = new ReviewDAO();
            String Book = "/book?bookid=";
            Book += request.getParameter("ordered_book_id");
            if (rDao.createReview(review)) {
                response.sendRedirect(getServletContext().getContextPath() + Book);
            } else {
                response.sendRedirect(getServletContext().getContextPath() + Home);
            }
        }

        if (request.getParameter("btnDeleteReview") != null) {
            int review_id = Integer.parseInt(request.getParameter("btnDeleteReview"));
            ReviewDAO rDao = new ReviewDAO();
            String Book = "/book?bookid=";
            Book += request.getParameter("ordered_book_id");
            if (rDao.deleteReview(review_id)) {
                response.sendRedirect(getServletContext().getContextPath() + Book);
            } else {
                response.sendRedirect(getServletContext().getContextPath() + Home);
            }
        }
    }
}