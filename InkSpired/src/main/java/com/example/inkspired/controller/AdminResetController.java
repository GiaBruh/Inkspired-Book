package com.example.inkspired.controller;

import com.example.inkspired.dao.AdminDAO;
import com.example.inkspired.dao.UserDAO;
import com.example.inkspired.model.Admin;
import com.example.inkspired.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.Authenticator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Objects;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AdminResetController", value = "/admin/reset")
public class AdminResetController extends HttpServlet {
    private static final String LOGIN = "/admin";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin-reset.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String newPassword = request.getParameter("newPassword");

        AdminDAO adminDAO = new AdminDAO();
        Admin admin = new Admin();
        admin.setEmailAddress(email);
        try {
            boolean emailExists = adminDAO.checkExistingUserByEmail(email);
            if (emailExists) {
                admin.setPassword(newPassword);
                adminDAO.updatePasswordByEmail(newPassword, email);

                // remove email from session
                session.removeAttribute("email");
                response.sendRedirect(request.getContextPath() + LOGIN);
            } else {
                request.setAttribute("error", "Email does not exist.");
                request.getRequestDispatcher("/admin-reset.jsp").forward(request, response);
            }
            return;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }




    }
}
