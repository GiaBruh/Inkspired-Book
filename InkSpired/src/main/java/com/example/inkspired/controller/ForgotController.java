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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ForgotController", value = "/forgot")
public class ForgotController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String verificationCode = String.valueOf(generateVerificationCode());
        String email = request.getParameter("email");
//        // store email in session
//        session.setAttribute("email", email);
//        // Store the verification code in the session
//        session.setAttribute("verificationCode", verificationCode);
//        // Send the verification code to the user
//        sendVerificationCodeEmail(email, verificationCode);
//        // Send the status as the response
//        response.setContentType("text/plain");
//        response.getWriter().write("Verification code sent to your email: " + email);

        // check if email exists in database
        UserDAO userDAO = new UserDAO();
        User user = new User();
        user.setEmail_address(email);
        try {
            boolean emailExists = userDAO.checkExistingUserByEmail(email);
            if (emailExists) {
                // store email in session
                session.setAttribute("email", email);
                // Store the verification code in the session
                session.setAttribute("verificationCode", verificationCode);
                // Send the verification code to the user
                sendVerificationCodeEmail(email, verificationCode);
                // Send the status as the response
                response.setContentType("text/plain");
                response.getWriter().write("Verification code sent to your email: " + email);
            } else {
                response.getWriter().write("Email does not exist.");
            }
            return;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        String storedVerificationCode = (String) session.getAttribute("verificationCode");

        if (String.valueOf(code).equals(storedVerificationCode)) {
            response.getWriter().write("Correct verification code.");
            // Remove the stored verification code from the session
            session.removeAttribute("verificationCode");
//            response.sendRedirect("reset-password.jsp");
        } else {
            response.getWriter().write("Incorrect verification code.");
        }
    }

    private int generateVerificationCode() {
        int code = (int) (Math.random() * 999999);
        return code > 100000 && code  < 1000000 ? code : generateVerificationCode();
    }

    private void sendVerificationCodeEmail(String recipientEmail, String verificationCode) {
        String host = "smtp.gmail.com";
        String username = "InkSpiredBooks911@gmail.com";
        String password = "tcbc msne mbwj yyma";

        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.ssl.trust", host);
//        props.put("mail.smtp.socketFactory.port", "25");
        props.put("mail.smtp.port", "587");
//        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//        props.put("mail.smtp.socketFactory.fallback", "false");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Verification Code");
            message.setText("Your verification code is: " + verificationCode);

            Transport.send(message);
            System.out.println("Verification code email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
            System.err.println("Error sending verification code email: " + e.getMessage());
        }
    }


}



