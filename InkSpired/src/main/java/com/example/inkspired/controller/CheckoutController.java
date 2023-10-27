package com.example.inkspired.controller;

import com.example.inkspired.dao.BookDAO;
import com.example.inkspired.model.Book;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import static com.example.inkspired.controller.ShoppingCartController.booksChecked;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {

    static List<Integer> booksOrder = new ArrayList<>();

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
        BookDAO bDao = new BookDAO();
        String operator = request.getParameter("operator");
        int bookid = Integer.parseInt(request.getParameter("bookid"));
        boolean isChecked = Boolean.parseBoolean(request.getParameter("isChecked"));
        Book book = bDao.get(bookid).get();

        if (isChecked) {
            if (operator.equals("-")) {
                for (int i = 0; i < booksChecked.size(); i++) {
                    if (book.getBook_id() == booksChecked.get(i).getBook_id()) {
                        booksChecked.remove(i);
                        break;
                    }
                }
            } else {
                booksChecked.add(book);
            }
        } else {
            for (int i = 0; i < booksChecked.size(); i++) {
                if (book.getBook_id() == booksChecked.get(i).getBook_id()) {
                    booksChecked.remove(i);
                    --i;
                }
            }
        }

// Uncomment to test in console
//        for (Book b: booksChecked) {
//            System.out.println(b.getBook_id() + ": " + b.getTitle());
//        }
//        System.out.println("------");

        int subtotal = 0;
        for (Book b : booksChecked) {
            subtotal += b.getPrice();
        }

        response.getWriter().write(subtotal + "");
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