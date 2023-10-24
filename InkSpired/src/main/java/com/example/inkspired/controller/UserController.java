package com.example.inkspired.controller;

import com.example.inkspired.dao.UserDAO;
import com.example.inkspired.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserController", value = "/user")
@MultipartConfig(
        fileSizeThreshold=1024*1024*10, 	// 10 MB
        maxFileSize=1024*1024*5,      	// 5 MB
        maxRequestSize=1024*1024*10)   	// 100 MB
public class UserController extends HttpServlet {
    private  static  final  String USER = "/user";

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
//        processRequest(request, response);
        String cookieName = "";
        String cookieValue = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
//            for (int i = 0; i < cookies.length; ++i) {
//                Cookie cookie = cookies[i];
//                cookieName = cookie.getName();
//                cookieValue = cookie.getValue();
//            }
            for (Cookie cookie : cookies) {
                cookieName = cookie.getName();
                cookieValue = cookie.getValue();
            }
        }
//        System.out.println(cookieName);
//        System.out.println(cookieValue);
        UserDAO userDAO = new UserDAO();
        HttpSession session = null;
        session = request.getSession();
        User user = userDAO.get(Integer.parseInt(cookieValue)).get();
        session.setAttribute("userInfo", user);
        request.getRequestDispatcher("/account.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String email_address = request.getParameter("email");
//        Date birthdate = Date.valueOf(request.getParameter("birthdate"));
        String date = request.getParameter("birthdate");
        Date birthdate = date != null ? Date.valueOf(date) : null;
        String phone_number = request.getParameter("phone");
        String user_image = "./uploadphotos/";
        int user_id = Integer.parseInt(getCookie(request).getValue());

        //Upload images
        try {
            Part part = request.getPart("upload");

            String realPath = request.getServletContext().getRealPath("/uploadphotos/userphotos/user" + user_id);
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }

            user_image = "./uploadphotos/userphotos/user" + user_id + "/" + fileName;
            System.out.println(realPath + "/" + fileName);
            part.write(realPath + "/" + fileName);
        } catch (Exception e) {

        }

        UserDAO uDao = new UserDAO();
        User user = new User(username, fullname, gender, email_address, birthdate, phone_number, user_image);
//        user.setUserId(user_id);
//        System.out.println(uDao.update(user_id, user));
        if(uDao.update(user_id, user)) {
            System.out.println("Upload success");
            response.sendRedirect(getServletContext().getContextPath() + USER);
        } else {
            System.out.println("Upload failed");
            response.sendRedirect(getServletContext().getContextPath() + USER);
        }
    }

    private Cookie getCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        Cookie userCookie = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (!cookie.getName().equals("JSESSIONID")) {
                    userCookie = cookie;
                    break;
                }
            }
        }
        return userCookie;
    }
}