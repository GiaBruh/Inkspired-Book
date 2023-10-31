package com.example.inkspired.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;

import com.example.inkspired.dao.UserDAO;
import com.example.inkspired.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(name = "UserController", value = "/user")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10) // 100 MB
public class UserController extends HttpServlet {

    private static final String HOME = "/";
    private static final String USER = "/user";

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
        response.setContentType("text/html;charset=UTF-8");
        String path = request.getRequestURI();
        HttpSession session = request.getSession();

        UserDAO userDAO = new UserDAO();
        Cookie cookie = (Cookie) session.getAttribute("userCookie");
        try {
            String cookieValue = cookie.getValue();
            User user = userDAO.get(Integer.parseInt(cookieValue)).get();
            session.setAttribute("userInfo", user);
            request.getRequestDispatcher("/account.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String email_address = request.getParameter("email");
        String date = request.getParameter("birthdate");
        Date birthdate = date != null ? Date.valueOf(date) : null;
        String phone_number = request.getParameter("phone");
        String user_image = request.getParameter("image");

        HttpSession session = null;
        session = request.getSession();
        Cookie cookie = (Cookie) session.getAttribute("userCookie");
        int user_id = Integer.parseInt(cookie.getValue());

        // Upload images
        try {
            Part part = request.getPart("upload");

            String realPath = request.getServletContext().getRealPath("/uploadphotos/userphotos/user" + user_id);
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }

            if (!fileName.equals("")) {
                user_image = "./uploadphotos/userphotos/user" + user_id + "/" + fileName;
            }

            System.out.println(realPath + "/" + fileName);
            part.write(realPath + "/" + fileName);
        } catch (IllegalStateException ise) {
            System.out.println("Upload failed");
            session.setAttribute("FILESIZEEXCEEDED", true);
            response.sendRedirect(getServletContext().getContextPath() + USER);
            return;
        }

        UserDAO uDao = new UserDAO();
        User user = new User(username, fullname, gender, email_address, birthdate, phone_number, user_image);
        session.setAttribute("FILESIZEEXCEEDED", false);

        if (uDao.update(user_id, user)) {
            System.out.println("Upload success");
            response.sendRedirect(getServletContext().getContextPath() + USER);
        } else {
            System.out.println("Upload failed");
            response.sendRedirect(getServletContext().getContextPath() + USER);
        }
    }
}