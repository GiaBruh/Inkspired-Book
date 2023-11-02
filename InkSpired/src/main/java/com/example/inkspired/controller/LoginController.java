package com.example.inkspired.controller;

import com.example.inkspired.dao.UserDAO;
import com.example.inkspired.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private static final String HOMEPAGE = "/";
    private static final String LOGIN = "/login";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI();

        if (path.endsWith(LOGIN)) {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        if (request.getParameter("btnLogin") != null && request.getParameter("btnLogin").equals("Login")) {
            response.sendRedirect(getServletContext().getContextPath() + LOGIN);
        }

        if (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("Submit")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = new User(username, password);
            UserDAO dao = new UserDAO();
            try {
                boolean isLogin = dao.login(user);
                if (isLogin) {
//                    Cookie[] cookies = request.getCookies();
//                    for(Cookie cookie : cookies) {
//                        if(cookie.getName().equals("adminId")) {
//                            cookie.setValue("");
//                            cookie.setMaxAge(0);
//                            response.addCookie(cookie);
//                            break;
//                        }
//                    }
                    int userid = dao.getUserIdFromUsername(user);
                    Cookie cookie = new Cookie("userWithAccount", "" + userid);

                    // Remember me function
                    if (request.getParameter("remembermecheckbox") != null && request.getParameter("remembermecheckbox").equals("on")) {
                        cookie.setMaxAge(3 * 24 * 60 * 60);
                    }

                    HttpSession session = request.getSession();
                    session.setAttribute("userCookie", cookie);
                    response.addCookie(cookie);
                    response.sendRedirect(getServletContext().getContextPath() + HOMEPAGE);
                } else {
                    response.sendRedirect(getServletContext().getContextPath() + LOGIN);
                }
            } catch (Exception e) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }
}