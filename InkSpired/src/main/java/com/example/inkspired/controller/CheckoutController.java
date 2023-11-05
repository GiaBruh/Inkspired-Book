package com.example.inkspired.controller;

import com.example.inkspired.dao.BookDAO;
import com.example.inkspired.dao.OrderDAO;
import com.example.inkspired.dao.OrderDetailDAO;
import com.example.inkspired.dao.ShoppingCartDAO;
import com.example.inkspired.model.Book;
import com.example.inkspired.model.Order;
import com.example.inkspired.model.OrderDetail;
import com.example.inkspired.model.ShoppingCart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.validation.constraints.Null;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

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
        response.setContentType("text/html;charset=UTF-8");
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

        try {

            String path = request.getRequestURI();
            HttpSession session = request.getSession();
            Cookie cookie = (Cookie) session.getAttribute("userCookie");

            if (path.endsWith("/InkSpired/checkout")) {


                String cookieValue = cookie.getValue();
                List<OrderDetail> od = new ArrayList<>();
                BookDAO bDao = new BookDAO();
                booksOrder.forEach((key, quantity) -> {
                    String title = bDao.get(key).get().getTitle();
                    String book_image = bDao.get(key).get().getBook_image();
                    long price = bDao.get(key).get().getPrice();
                    od.add(new OrderDetail(key, title, book_image, price, 0, quantity));
                });

                int subtotal = 0;

                for (OrderDetail b : od) {
                    int quantity = b.getQuantity();
                    while (quantity != 0) {
                        subtotal += b.getPrice();

                        --quantity;
                    }
                }

                session.setAttribute("SUBTOTAL", subtotal);

                session.setAttribute("BOOKSORDERLIST", od);

                request.getRequestDispatcher("./checkout.jsp").forward(request, response);

            } else {
                try {
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

                            boolean isFound = false;
                            for (int i = 0; i < booksChecked.size(); i++) {
                                if (book.getBook_id() == booksChecked.get(i).getBook_id()) {
                                    isFound = true;
                                }
                            }

                            if (!isFound) {
                                booksChecked.add(book);
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
                } catch (NumberFormatException nfe) {
                    response.sendRedirect(getServletContext().getContextPath() + HOME);
                }
            }
        } catch (NullPointerException npe) {
            response.sendRedirect(getServletContext().getContextPath() + HOME);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

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

        if (request.getParameter("btnPlaceOrder") != null && request.getParameter("btnPlaceOrder").equals("placeorder")) {
            HttpSession session = request.getSession();

            OrderDAO oDao = new OrderDAO();
            OrderDetailDAO odDao = new OrderDetailDAO();
            ShoppingCartDAO scDao = new ShoppingCartDAO();
            BookDAO bDao = new BookDAO();

            int userid = Integer.parseInt(((Cookie) session.getAttribute("userCookie")).getValue());
            Date date = new java.sql.Date(System.currentTimeMillis());
            String address = request.getParameter("address");
            int total = (int) Float.parseFloat(session.getAttribute("total").toString());
            int status = 0;

            try {
                oDao.add(new Order(userid, date, address, total, status));
                int orderid = oDao.getOrderId(userid);
                for (Map.Entry<Integer, Integer> entry : booksOrder.entrySet()) {
                    Integer bookid = entry.getKey();
                    Integer quantity = entry.getValue();
                    Book book = bDao.get(bookid).get();

                    // Delete latest order id if quantity is not match
                    if (book.getQuantity() < quantity) {
                        oDao.confirmCheckoutDelete(orderid);
                        throw new Exception();
                    }

                    odDao.add(new OrderDetail(bookid, orderid, quantity, book.getPrice()));
                    // Delete from cart
                    scDao.deleteFromCart(userid, bookid);
                    scDao.update(new ShoppingCart(userid, scDao.get(userid).get().getQuantity() - 1));
                    // Delete from book
                    bDao.update(new Book(bookid,
                            book.getTitle(),
                            book.getBook_image(),
                            book.getPublication_date(),
                            book.getQuantity() - quantity,
                            book.getPrice(),
                            book.getBook_description(),
                            book.getPublisher_id(),
                            book.isAvailable()));
                }


                session.setAttribute("CONFIRMORDER", true);
                response.sendRedirect(getServletContext().getContextPath() + CHECKOUT);
            } catch (Exception e) {
                session.setAttribute("CONFIRMORDER", false);
                response.sendRedirect(getServletContext().getContextPath() + CHECKOUT);
            }


        }

        if (request.getParameter("btnHome") != null && request.getParameter("btnHome").equals("backhome")) {
            booksOrder = null;
            response.sendRedirect(getServletContext().getContextPath() + HOME);
        }
    }
}