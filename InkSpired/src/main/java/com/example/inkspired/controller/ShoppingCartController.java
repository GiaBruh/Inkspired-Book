package com.example.inkspired.controller;

import com.example.inkspired.dao.BookDAO;
import com.example.inkspired.dao.ShoppingCartDAO;
import com.example.inkspired.model.Book;
import com.example.inkspired.model.ShoppingCart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.swing.text.html.Option;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "ShoppingCartController", value = "/cart")
public class ShoppingCartController extends HttpServlet {

    private static final String HOME = "/";
    private static final String CART = "/cart";
    private static final String BOOK = "/book";

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

        int cartid = Integer.parseInt(request.getParameter("cartid"));

        ShoppingCartDAO scDao = new ShoppingCartDAO();
        List<Book> books = scDao.getBookFromCartId(cartid);

        HttpSession session = request.getSession();
        session.setAttribute("CARTINFO", books);

        if (path.startsWith("/InkSpired/cart")) {
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        ShoppingCartDAO scDao = new ShoppingCartDAO();

        if (request.getParameter("btnaddtocart") != null) {
            int cartid = Integer.parseInt(((Cookie)session.getAttribute("userCookie")).getValue());
            int bookid = Integer.parseInt(request.getParameter("btnaddtocart"));
            int quantity = scDao.get(cartid).get().getQuantity();

            scDao.addToCart(cartid, bookid);
            scDao.update(new ShoppingCart(cartid, quantity + 1));
            response.sendRedirect(getServletContext().getContextPath() + "/book?bookid=" + bookid);
        }
    }
}