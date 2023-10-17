<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Homepage</title>
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/background.css">
    </head>
    <%@include file="interface.jsp" %>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired Books</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">

                    <c:choose>

                        <c:when test="${sessionScope.userCookie == null}">

                            <form class="d-flex pe-lg-3">
                                <button class="btn btn-outline-dark" type="submit">
                                    <i class="bi-cart-fill me-1"></i>
                                    <a href="#">Cart</a>
                                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                                </button>
                            </form>

                            <form class="d-flex" method="POST"
                                  action="<%= request.getServletContext().getContextPath()%>/login">
                                <button class="btn btn-outline-dark" type="submit" name="btnLogin"
                                        value="Login">
                                    <i class="bi-person-fill"></i>
                                    Login
                                </button>
                            </form>
                        </c:when>

                        <c:otherwise>

                            <form class="d-flex pe-lg-3">
                                <button class="btn btn-outline-dark" type="submit">
                                    <i class="bi-cart-fill me-1"></i>
                                    <a href="<%= request.getServletContext().getContextPath()%>/cart?cartid=${sessionScope.userCookie.getValue()}">Cart</a>
                                    <span class="badge bg-dark text-white ms-1 rounded-pill">
                                                <%
                                                    ShoppingCartDAO scDao = new ShoppingCartDAO();
                                                    int cartid = Integer.parseInt(((Cookie) session.getAttribute("userCookie")).getValue());
                                                    Optional<ShoppingCart> cart = scDao.get(cartid);
                                                    String quantity = String.valueOf(cart.get().getQuantity());
                                                    out.print(quantity);
                                                %>
                                            </span>
                                </button>
                            </form>

                            <div class="dropdown">
                                <button class="btn btn-outline-dark dropdown-toggle" type="button"
                                        id="dropdownMenuButton" data-mdb-toggle="dropdown" aria-expanded="false">
                                    Account
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li><a class="item-dropdown" href="account.jsp">User Information</a></li>
                                    <li><a class="item-dropdown" href="#">Order History</a></li>
                                    <li><a class="item-dropdown" href="#">Review History</a></li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li><a class="item-dropdown"
                                           href="<%= request.getServletContext().getContextPath()%>/logout">Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </c:otherwise>

                    </c:choose>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Account page</h1>
                </div>
            </div>
        </header>
        <!-- Product section-->
        <section class="py-5 gradient-custom">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-body">
                                <div id="username-input" class="d-flex justify-content-center align-items-center mb-4">
                                    <label for="username" class="me-3">Username:</label>
                                    <input
                                            type="text"
                                            id="username"
                                            class="form-control"
                                            name="username"
                                            disabled
                                    />
                                </div>
                                <div id="fullname-input" class="d-flex justify-content-center align-items-center mb-4">
                                    <label for="fullname" class="me-3">Full Name:</label>
                                    <input
                                            type="text"
                                            id="fullname"
                                            class="form-control"
                                            name="fullname"
                                            disabled
                                    />
                                </div>
                                <div class="col-md-6 d-flex mb-4" id="gender-input">

                                    <h6 class="pe-5">Gender: </h6>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="inlineRadioOptions" id="femaleGender"
                                               value="option1"
                                               disabled/>
                                        <label class="form-check-label" for="femaleGender">Female</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="inlineRadioOptions" id="maleGender"
                                               value="option2"
                                               disabled/>
                                        <label class="form-check-label" for="maleGender">Male</label>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio"
                                               name="inlineRadioOptions" id="otherGender"
                                               value="option3"
                                               disabled/>
                                        <label class="form-check-label" for="otherGender">Other</label>
                                    </div>

                                </div>
                                <div id="email-input" class="d-flex justify-content-center align-items-center mb-4">
                                    <label for="email" class="me-3">Email:</label>
                                    <input
                                            type="text"
                                            id="email"
                                            class="form-control"
                                            name="email"
                                            disabled
                                    />
                                </div>
                                <div id="phone-input" class="d-flex justify-content-center align-items-center mb-4">
                                    <label for="phone" class="me-3">Phone Number:</label>
                                    <input
                                            type="text"
                                            id="phone"
                                            class="form-control"
                                            name="phone"
                                            disabled
                                    />
                                </div>
                                <div class="d-flex">
                                    <div class="mt-4 me-3 pt-2">
                                        <input class="btn btn-outline-dark btn-lg" type="submit" value="Submit"/>
                                    </div>
                                    <div class="mt-4 pt-2">
                                        <button class="btn btn-outline-dark btn-lg" onclick="toggleEditing()">Edit
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card">
                            <img class="card-img-top"
                                 src="https://dummyimage.com/50x50/dee2e6/DoDucDat.png&text=DoDucDat"
                                 alt="Card image cap">
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="formFile" class="form-label">Dụng lượng file tối đa 1 MB
                                        Định dạng:.JPEG, .PNG</label>
                                    <input class="form-control" type="file" id="formFile">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark" id="footer">
            <div class="container"><p class="m-0 text-center text-white">Copyright INKSPIRED BOOKS 2023, always
                reserved.</p>
            </div>
        </footer>
        <script src="js/edit.js"></script>
    </body>
</html>