package com.example.inkspired.controller;

import com.example.inkspired.dao.ShoppingCartDAO;
import com.example.inkspired.dao.UserDAO;
import com.example.inkspired.model.ShoppingCart;
import com.example.inkspired.model.User;
import com.oracle.wls.shaded.org.apache.regexp.RE;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.postgresql.util.PSQLException;
import org.postgresql.util.ServerErrorMessage;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
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


        String path = request.getRequestURI();

        if (path.endsWith(REGISTER)) {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");

        if (request.getParameter("btnsubmitRegister") != null && request.getParameter("btnsubmitRegister").equals("Submit")) {
            String username = request.getParameter("registerusername");
            String password = request.getParameter("registerpassword");
            String fullname = request.getParameter("fullname");
            Date birthdate = Date.valueOf(request.getParameter("birthdate"));
            String gender = request.getParameter("genders");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            User user = new User(username, password, email, fullname, gender, birthdate, phone, "https://dummyimage.com/100x100/000/fff", true);
            ShoppingCart cart = new ShoppingCart();

            UserDAO uDao = new UserDAO();
            ShoppingCartDAO scDao = new ShoppingCartDAO();

            try {
                if (uDao.register(user)) {
                    scDao.cartRegister(username);

                    session.setAttribute("EMAILEXISTED", false);
                    response.sendRedirect(getServletContext().getContextPath() + LOGIN);
                } else {
                    throw new PSQLException(new ServerErrorMessage("Failed to register"));
                }
            } catch (PSQLException psqle) {
                session.setAttribute("EMAILEXISTED", true);
                response.sendRedirect(getServletContext().getContextPath() + LOGIN);
            }
        }
    }
}