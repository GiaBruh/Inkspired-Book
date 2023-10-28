package com.example.inkspired.controller;

import com.example.inkspired.dao.BookDAO;
import com.example.inkspired.model.Book;
import com.example.inkspired.model.Order;
import com.example.inkspired.model.OrderDetail;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import static com.example.inkspired.controller.ShoppingCartController.booksChecked;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {

    private static final String HOME = "/";
    private static final String CHECKOUT = "/checkout";
    protected static Hashtable<Integer, Integer> booksOrder = null;
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
        HttpSession session = request.getSession();

        if (path.endsWith("/InkSpired/checkout")) {

            List<OrderDetail> od = new ArrayList<>();
            BookDAO bDao = new BookDAO();
            booksOrder.forEach((key, quantity) -> {
                String title = bDao.get(key).get().getTitle();
                String book_image = bDao.get(key).get().getBook_image();
                long price = bDao.get(key).get().getPrice();
                od.add(new OrderDetail(key, title, book_image, price, 0, quantity));
            });

            for (OrderDetail b : od) {
                System.out.println(b.getBook_id() + ": " + b.getTitle() + ": " + b.getQuantity());
            }
            session.setAttribute("BOOKSORDERLIST", od);

            request.getRequestDispatcher("./checkout.jsp").forward(request, response);
        } else {
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
        if (request.getParameter("btncheckout") != null && request.getParameter("btncheckout").equals("checkout")) {
            booksOrder = new Hashtable<>();

            for (int i = 0; i < booksChecked.size(); i++) {
                int bookid = booksChecked.get(i).getBook_id();
                if (booksOrder.containsKey(bookid)) {
                    booksOrder.put(bookid, booksOrder.get(bookid) + 1);
                } else {
                    booksOrder.put(bookid, 1);
                }
            }

            response.sendRedirect(getServletContext().getContextPath() + CHECKOUT);
        }
    }
}