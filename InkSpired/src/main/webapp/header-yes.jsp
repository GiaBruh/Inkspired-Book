<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%--change one line just to push to github--%>
<%--<%@include file="interface.jsp" %>--%>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--    <div class="container px-4 px-lg-5">--%>
<%--        <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired--%>
<%--            Books</a>--%>
<%--        <div class="col-lg-6 col-6 offset-md-1 text-left">--%>
<%--            <div class="input-group pe-5">--%>
<%--                <div id="navbarExample1">--%>
<%--                    <ul class="navbar-nav me-auto ps-lg-0" style="padding-left: 0.15rem">--%>
<%--                        <li class="nav-item dropdown position-static">--%>
<%--                            <button class="btn btn-outline-dark dropdown-toggle" type="button"--%>
<%--                                    id="navbarDropdown" data-mdb-toggle="dropdown"--%>
<%--                                    aria-expanded="false">--%>
<%--                                <i class="fa fa-book"></i>--%>
<%--                            </button>--%>
<%--                            <div class="dropdown-menu w-100 mt-0" aria-labelledby="navbarDropdown"--%>
<%--                                 style="border-top-left-radius: 0;border-top-right-radius: 0;">--%>
<%--                                <div class="container">--%>
<%--                                    <div class="row my-4">--%>
<%--                                        <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">--%>
<%--                                            <div class="list-group list-group-flush">--%>
<%--                                                <c:forEach items="${sessionScope.categoryList}" var="category">--%>
<%--                                                    <form method="POST"--%>
<%--                                                          action="<%= request.getServletContext().getContextPath()%>/search">--%>
<%--                                                        <button class="list-group-item list-group-item-action" name="category_id" value="${category.category_id}">${category.category_name}</button>--%>
<%--                                                    </form>--%>
<%--                                                </c:forEach>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        &lt;%&ndash;                                        <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                            <div class="list-group list-group-flush">&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                <c:set var="menuItems" value="${['DD', 'aa', 'category7', 'jesus', 'alahu abkba']}"/>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                <c:forEach items="${menuItems}" var="menuItem">&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                    <a href="<%= request.getServletContext().getContextPath()%>/search" class="list-group-item list-group-item-action">${menuItem}</a>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                </c:forEach>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                        <div class="col-md-6 col-lg-3 mb-3 mb-md-0">&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                            <div class="list-group list-group-flush">&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                <c:set var="menuItems" value="${['Lorem ipsum', 'Dolor sit', 'Amet consectetur', 'Cras justo odio', 'Adipisicing elit']}"/>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                <c:forEach items="${menuItems}" var="menuItem">&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                    <a href="<%= request.getServletContext().getContextPath()%>/search" class="list-group-item list-group-item-action">${menuItem}</a>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                </c:forEach>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                        <div class="col-md-6 col-lg-3">&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                            <div class="list-group list-group-flush">&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                <c:set var="menuItems" value="${['Lorem ipsum', 'Dolor sit', 'Amet consectetur', 'Cras justo odio', 'Adipisicing elit']}"/>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                <c:forEach items="${menuItems}" var="menuItem">&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                    <a href="<%= request.getServletContext().getContextPath()%>/search" class="list-group-item list-group-item-action">${menuItem}</a>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                                </c:forEach>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                            </div>&ndash;%&gt;--%>
<%--                                        &lt;%&ndash;                                        </div>&ndash;%&gt;--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <form class="d-flex w-75" method="POST"--%>
<%--                      action="<%= request.getServletContext().getContextPath()%>/search">--%>
<%--                    <input type="text" id="searchBar" class="form-control border-black" name="keyword"--%>
<%--                           placeholder="Search for products">--%>
<%--                    <div class="input-group-append">--%>
<%--                        &lt;%&ndash;                    <button class="btn btn-dark btn-small">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                        <i class="fa fa-search"></i>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                    </button>&ndash;%&gt;--%>
<%--                        <button class="btn btn-dark btn-small" name="btn-search" value="search-by-keyword">--%>
<%--                            &lt;%&ndash;                        onclick="location.href = 'http://localhost:8080/InkSpired/searchResult.jsp'; "&ndash;%&gt;--%>
<%--                            <i class="fa fa-search"></i>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        &lt;%&ndash;                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"&ndash;%&gt;--%>
<%--        &lt;%&ndash;                        aria-expanded="false" aria-label="Toggle navigation">&ndash;%&gt;--%>
<%--        &lt;%&ndash;                    <span class="navbar-toggler-icon"></span>&ndash;%&gt;--%>
<%--        &lt;%&ndash;                </button>&ndash;%&gt;--%>
<%--        <div class="navbar justify-content-end" id="navbarSupportedContent">--%>

<%--            <c:choose>--%>

<%--                <c:when test="${sessionScope.userCookie == null}">--%>

<%--                    <form class="d-flex pe-lg-3 cart-form">--%>
<%--                        <div>--%>
<%--                            <ul class="navbar-nav me-auto ps-lg-0" style="padding-left: 0.15rem">--%>
<%--                                <li class="nav-item dropdown position-static">--%>
<%--                                    <button class="btn btn-outline-dark " type="button"--%>
<%--                                            data-mdb-toggle="dropdown"--%>
<%--                                            aria-expanded="false">--%>
<%--                                        <i class="bi-cart-fill me-1"></i>--%>
<%--                                        <span class="cart-text">Cart</span>--%>
<%--                                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>--%>
<%--                                    </button>--%>
<%--                                    <div class="dropdown-menu w-100 mt-0" aria-labelledby="navbarDropdown"--%>
<%--                                         style="border-top-left-radius: 0;border-top-right-radius: 0;">--%>
<%--                                        <div class="container">--%>
<%--                                            <div class="row my-4">--%>
<%--                                                <div class="col-md-12 col-lg-12 mb-3 mb-lg-0">--%>
<%--                                                    <div class="list-group list-group-flush">--%>
<%--                                                        <p>It seems like you haven't logged in.</p>--%>
<%--                                                        <p>Please consider login with your account or</p>--%>
<%--                                                        <p>create a new account to use our services.</p>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </form>--%>

<%--                    <form class="d-flex login-form" method="POST"--%>
<%--                          action="<%= request.getServletContext().getContextPath()%>/login">--%>
<%--                        <button class="btn btn-outline-dark" type="submit" name="btnLogin"--%>
<%--                                value="Login">--%>
<%--                            <i class="bi-person-fill"></i>--%>
<%--                            <span>Login</span>--%>
<%--                        </button>--%>
<%--                    </form>--%>
<%--                </c:when>--%>

<%--                <c:otherwise>--%>

<%--                    <form class="d-flex pe-lg-3 cart-form">--%>
<%--                        <button class="btn btn-outline-dark"--%>
<%--                                type="button"--%>
<%--                                onclick="location.href--%>
<%--                                        = 'http://localhost:8080' +--%>
<%--                                        '<%= request.getServletContext().getContextPath()%>/cart?cartid=${sessionScope.userCookie.getValue()}'; ">--%>
<%--                            <i class="bi-cart-fill me-1"></i>--%>
<%--                                &lt;%&ndash;                            <a href="<%= request.getServletContext().getContextPath()%>/cart?cartid=${sessionScope.userCookie.getValue()}">Cart</a>&ndash;%&gt;--%>
<%--                            <span>Cart</span>--%>
<%--                            <span class="badge bg-dark text-white ms-1 rounded-pill">--%>
<%--                                                <%--%>
<%--                                                    ShoppingCartDAO scDao = new ShoppingCartDAO();--%>
<%--                                                    int cartid = Integer.parseInt(((Cookie) session.getAttribute("userCookie")).getValue());--%>
<%--                                                    Optional<ShoppingCart> cart = scDao.get(cartid);--%>
<%--                                                    String quantity = String.valueOf(cart.get().getQuantity());--%>
<%--                                                    out.print(quantity);--%>
<%--                                                %>--%>
<%--                                            </span>--%>
<%--                        </button>--%>
<%--                    </form>--%>

<%--                    <div class="dropdown account-dropdown">--%>
<%--                        <button class="btn btn-outline-dark dropdown-toggle" type="button"--%>
<%--                                id="dropdownMenuButton" data-mdb-toggle="dropdown" aria-expanded="false">--%>

<%--                            <i class="bi-person-fill"></i>--%>
<%--                            <span>Account</span>--%>
<%--                        </button>--%>
<%--                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">--%>
<%--                            <li><a class="item-dropdown"--%>
<%--                                   href="<%= request.getServletContext().getContextPath()%>/user">User--%>
<%--                                Information</a></li>--%>
<%--                            <li><a class="item-dropdown" href="<%= request.getServletContext().getContextPath()%>/order">Order History</a></li>--%>
<%--                            <li><a class="item-dropdown" href="#">Review History</a></li>--%>
<%--                            <li>--%>
<%--                                <div class="dropdown-divider"></div>--%>
<%--                            </li>--%>
<%--                            <li><a class="item-dropdown"--%>
<%--                                   href="<%= request.getServletContext().getContextPath()%>/logout">Logout</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </c:otherwise>--%>

<%--            </c:choose>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<div class="container-fluid">
    <div class="row bg-secondary py-2 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
            <!-- <div class="d-inline-flex align-items-center">
                <a class="text-dark" href="">FAQs</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Help</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Support</a>
            </div> -->
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <!-- <a class="text-dark px-2" href="">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-twitter"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-instagram"></i>
                </a>
                <a class="text-dark pl-2" href="">
                    <i class="fab fa-youtube"></i>
                </a> -->
            </div>
        </div>
    </div>
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="<%= request.getServletContext().getContextPath()%>/" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span
                        class="font-weight-bold border px-3 mr-0" style="color: rgb(0, 109, 255);">INK</span>Spired</h1>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <form method="POST" action="<%= request.getServletContext().getContextPath()%>/search">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for products" name="keyword">
                    <div class="input-group-append">
                        <button class="btn border" name="btn-search"
                                value="search-by-keyword"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-3 col-6 text-right">

            <c:choose>

                <c:when test="${sessionScope.userCookie == null}">
                    <button class="btn border"
                            type="button"
                    >
                        <i class="fas fa-shopping-cart"></i>
                        <span class="badge">0</span>
                    </button>
                </c:when>
                <c:otherwise>
                    <button class="btn border"
                            type="button"
                            onclick="location.href
                                    = 'http://localhost:8080' +
                                    '<%= request.getServletContext().getContextPath()%>/cart?cartid=${sessionScope.userCookie.getValue()}'; ">
                        <i class="fas fa-shopping-cart text-primary"></i>
                        <%
                            ShoppingCartDAO scDao = new ShoppingCartDAO();
                            int cartid = Integer.parseInt(((Cookie) session.getAttribute("userCookie")).getValue());
                            Optional<ShoppingCart> cart = scDao.get(cartid);
                            String quantity = String.valueOf(cart.get().getQuantity());
                            out.print("<span class=\"badge\">" + quantity + "</span>");
                        %>
                    </button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid mb-5">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between text-white w-100"
               data-toggle="collapse" href="#navbar-vertical" style="height: 65px;
               margin-top: -1px; padding: 0 30px; background-color: rgb(29, 160, 255);">
                <h6 class="m-0">Categories</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0"
                 id="navbar-vertical">
                <div class="navbar-nav w-100" style="height: 410px; overflow-y: auto">
                    <div class="nav-item dropdown">
                        <c:forEach items="${sessionScope.categoryList}" var="category">
                            <form method="POST"
                                  action="<%= request.getServletContext().getContextPath()%>/search">
                                <button class="list-group-item list-group-item-action" name="category_id"
                                        value="${category.category_id}">${category.category_name}</button>
                            </form>
                        </c:forEach>
                    </div>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span
                            class="text-primary font-weight-bold border px-3 mr-0"
                            style="color: rgb(0, 109, 255);">INK</span>Spired</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <h1>Welcome to </h1>&nbsp;&nbsp;<h1 style="color: rgb(0, 109, 255);">INK</h1><h1>Spired</h1>
                        <%--                        <a href="index.html" class="nav-item nav-link active">Home</a>--%>
                        <%--                        <a href="shop.html" class="nav-item nav-link">Shop</a>--%>
                        <%--                        <a href="detail.html" class="nav-item nav-link">Shop Detail</a>--%>
                        <%--                        <div class="nav-item dropdown">--%>
                        <%--                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>--%>
                        <%--                            <div class="dropdown-menu rounded-0 m-0">--%>
                        <%--                                <a href="cart.html" class="dropdown-item">Shopping Cart</a>--%>
                        <%--                                <a href="checkout.html" class="dropdown-item">Checkout</a>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <%--                        <a href="contact.html" class="nav-item nav-link">Contact</a>--%>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        <%--                        <a href="login.jsp" class="nav-item nav-link">Customer Login</a>--%>
                        <c:choose>

                            <c:when test="${sessionScope.userCookie == null}">
                                <form class="d-flex login-form" method="POST"
                                      action="<%= request.getServletContext().getContextPath()%>/login">
                                    <button class="btn nav-item nav-link" type="submit" name="btnLogin"
                                            value="Login">
                                        <i class="bi-person-fill"></i>
                                        <span>Customer Login</span>
                                    </button>
                                </form>
<%--                                <a href="<%=request.getServletContext().getContextPath()%>/admin" class="nav-item nav-link">Admin Login</a>--%>
                            </c:when>
                            <c:otherwise>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Account</a>
                                    <div class="dropdown-menu dropdown-menu-right rounded-0 m-0">
                                        <a href="<%= request.getServletContext().getContextPath()%>/user"
                                           class="dropdown-item">Profile</a>
                                        <a href="<%= request.getServletContext().getContextPath()%>/order"
                                           class="dropdown-item">Order History</a>
                                        <a href="" class="dropdown-item">Review History</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item"
                                           href="<%= request.getServletContext().getContextPath()%>/logout">Logout</a>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </nav>
            <div id="header-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" style="height: 410px;">
                        <img class="img-fluid" src="assets/images/new-carousel-1.jpg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h4 class="text-light text-uppercase font-weight-medium mb-3">Have a good time browsing
                                    our books</h4>
                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Best Seller</h3>
                                <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style="height: 410px;">
                        <img class="img-fluid" src="assets/images/new-carousel-2.jpg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First
                                    Order</h4>
                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-prev-icon mb-n2"></span>
                    </div>
                </a>
                <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-next-icon mb-n2"></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>