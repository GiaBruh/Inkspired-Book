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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ForgotController", value = "/forgot")
public class ForgotController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String verificationCode = String.valueOf(generateVerificationCode());
        String email = request.getParameter("email");

        sendVerificationCodeEmail(email, verificationCode);

        // Send the verification code as the response
        response.setContentType("text/plain");
        response.getWriter().write("Verification code sent to your email: " + email);
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



