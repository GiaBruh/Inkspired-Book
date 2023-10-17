package com.example.inkspired.controller;

import com.example.inkspired.dao.UserDAO;
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

@WebServlet(name = "ResetController", value = "/reset")
public class ResetController extends HttpServlet {
    private static final String LOGIN = "/login";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/reset.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String newPassword = request.getParameter("newPassword");

            UserDAO userDAO = new UserDAO();
            User user = new User();
            user.setEmail_address(email);
            try {
                boolean emailExists = userDAO.checkExistingUserByEmail(email);
                if (emailExists) {
                    user.setPassword(newPassword);
                    userDAO.updatePasswordByEmail(newPassword, email);

                    // remove email from session
                    session.removeAttribute("email");
                    response.sendRedirect(request.getContextPath() + LOGIN);
                } else {
                    request.setAttribute("error", "Email does not exist.");
                    request.getRequestDispatcher("/reset.jsp").forward(request, response);
                }
                return;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }




    }
}
