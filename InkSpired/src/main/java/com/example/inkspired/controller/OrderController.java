package com.example.inkspired.controller;

import com.example.inkspired.dao.OrderDAO;
import com.example.inkspired.dao.OrderDetailDAO;
import com.example.inkspired.model.Order;
import com.example.inkspired.model.OrderDetail;
import com.oracle.wls.shaded.org.apache.xpath.operations.Or;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {

    private static final String HOME = "/";
    private static final String ORDER = "/order";

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

        OrderDAO oDao = new OrderDAO();
        int orderid = Integer.parseInt((request.getParameter("orderid") == null) ? "0" : request.getParameter("orderid"));

        if (path.endsWith("/InkSpired/order") && orderid == 0) {

            int userid = Integer.parseInt(((Cookie) session.getAttribute("userCookie")).getValue());
            List<Order> orderHistory = oDao.getAllFromUserId(userid);

            session.setAttribute("ORDERHISTORY", orderHistory);

            request.getRequestDispatcher("/orderHistory.jsp").forward(request, response);
        } else if (path.endsWith("/InkSpired/order") && orderid != 0) {
            OrderDetailDAO odDao = new OrderDetailDAO();
            List<OrderDetail> orderDetails = odDao.getOrderDetailByOrderId(orderid);

            session.setAttribute("ORDERDETAIL", orderDetails);

            request.getRequestDispatcher("/orderDetail.jsp").forward(request, response);
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
        OrderDAO oDao = new OrderDAO();

        if (request.getParameter("btnconfirmcancel") != null) {
            int orderid = Integer.parseInt(request.getParameter("btnconfirmcancel"));
            oDao.cancelOrder(orderid);

            response.sendRedirect(getServletContext().getContextPath() + ORDER);
        }

        if (request.getParameter("btnconfirmreceived") != null) {
            int orderid = Integer.parseInt(request.getParameter("btnconfirmreceived"));
            oDao.confirmOrderReceived(orderid);

            response.sendRedirect(getServletContext().getContextPath() + ORDER);
        }
    }
}