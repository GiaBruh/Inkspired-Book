package com.example.inkspired.controller;

import com.example.inkspired.dao.ShoppingCartDAO;
import com.example.inkspired.dao.UserDAO;
import com.example.inkspired.model.ShoppingCart;
import com.example.inkspired.model.User;
import com.oracle.wls.shaded.org.apache.regexp.RE;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {

    private static final String HOMEPAGE = "/";
    private static final String REGISTER = "/register";
    private static final String LOGIN = "/login";

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
//        processRequest(request, response);
        String path = request.getRequestURI();

        if (path.endsWith(REGISTER)) {
            request.getRequestDispatcher("/register.jsp").forward(request, response);
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
        if (request.getParameter("btnRegister") != null && request.getParameter("btnRegister").equals("Register")) {
            response.sendRedirect(getServletContext().getContextPath() + REGISTER);
        }

        if (request.getParameter("btnsubmit") != null && request.getParameter("btnsubmit").equals("Submit")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            String gender = request.getParameter("genders");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            User user = new User(username, password, email, fullname, gender, birthdate, phone, "https://dummyimage.com/100x100/000/fff", true);
            ShoppingCart cart = new ShoppingCart();

            UserDAO uDao = new UserDAO();
            ShoppingCartDAO scDao = new ShoppingCartDAO();

            if (uDao.register(user)) {
                scDao.cartRegister();

                response.sendRedirect(getServletContext().getContextPath() + LOGIN);
            } else {
                response.sendRedirect(getServletContext().getContextPath() + REGISTER);
            }
        }
    }
}