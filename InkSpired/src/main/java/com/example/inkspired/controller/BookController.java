package com.example.inkspired.controller;

import com.example.inkspired.dao.BookDAO;
import com.example.inkspired.model.Author;
import com.example.inkspired.model.Book;
import com.example.inkspired.dao.ReviewDAO;
import com.example.inkspired.model.Review;
import com.example.inkspired.model.Publisher;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@WebServlet(name = "BookController", value = "/book")
public class BookController extends HttpServlet {


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
        String path = request.getRequestURI();
        try {
            int bookid = Integer.parseInt(request.getParameter("bookid"));
            BookDAO bDao = new BookDAO();
            ReviewDAO rDao = new ReviewDAO();
            Optional<Book> book = bDao.get(bookid);

            List<Author> authors = bDao.getBookAuthors(bookid);
            Publisher publisher = bDao.getPublisher(book.get().getPublisher_id());
            List<Book> booksByPublisher = bDao.searchByPublisher(publisher.getPublisher_id());

            HttpSession session = request.getSession();
            session.setAttribute("BOOKINFO", book);
            request.setAttribute("AUTHORLIST", authors);
            request.setAttribute("PUBLISHERINFO", publisher);
            request.setAttribute("BOOKSBYPUBLISHER", booksByPublisher);

            if (((Cookie) session.getAttribute("userCookie")) != null) {
                boolean isInCart = bDao.isInUserCart(Integer.parseInt(((Cookie) session.getAttribute("userCookie")).getValue()), bookid);
                if (isInCart) {
                    session.setAttribute("ISINCART", true);
                } else {
                    session.setAttribute("ISINCART", false);
                }
                boolean isBought = rDao.isBought(Integer.parseInt(((Cookie)session.getAttribute("userCookie")).getValue()), bookid);
                if (isBought) {
                    session.setAttribute("isbought", true);
                    session.setAttribute("isbought2", true);
                    Review userReview = rDao.getUserReview(Integer.parseInt(((Cookie) session.getAttribute("userCookie")).getValue()), bookid);
                    if (userReview != null) {
                        session.setAttribute("isCom", true);
                        session.setAttribute("userReview", userReview);
                    } else {
                        session.setAttribute("isCom", false);
                    }
                } else {
                    session.setAttribute("isbought", false);
                    session.setAttribute("isbought2", false);
                }
            }
            if (((Cookie)session.getAttribute("userCookie")) != null) {
                List<Review> reviews = rDao.getBookReview_User(bookid, Integer.parseInt(((Cookie)session.getAttribute("userCookie")).getValue()));
                request.setAttribute("reviews", reviews);
                if (!reviews.isEmpty()) {
                    request.setAttribute("reviews", reviews);
                    request.setAttribute("noReviews", false);
                } else {
                    request.setAttribute("noReviews", true);
                }
            } else {
                List<Review> reviews = rDao.getBookReview(bookid);
                if (!reviews.isEmpty()) {
                    request.setAttribute("reviews", reviews);
                    request.setAttribute("noReviews", false);
                } else {
                    request.setAttribute("noReviews", true);
                }
            }

            if (path.startsWith("/InkSpired/book")) {
                request.getRequestDispatcher("/book.jsp").forward(request, response);
            }
        } catch (NoSuchElementException e) {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}