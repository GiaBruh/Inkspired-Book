<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row bg-secondary py-2 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
            <div class="d-inline-flex align-items-center">
                <%--                <a class="text-dark" href="">FAQs</a>--%>
                <%--                <span class="text-muted px-2">|</span>--%>
                <%--                <a class="text-dark" href="">Help</a>--%>
                <%--                <span class="text-muted px-2">|</span>--%>
                <%--                <a class="text-dark" href="">Support</a>--%>
            </div>
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <%--                <a class="text-dark px-2" href="">--%>
                <%--                    <i class="fab fa-facebook-f"></i>--%>
                <%--                </a>--%>
                <%--                <a class="text-dark px-2" href="">--%>
                <%--                    <i class="fab fa-twitter"></i>--%>
                <%--                </a>--%>
                <%--                <a class="text-dark px-2" href="">--%>
                <%--                    <i class="fab fa-linkedin-in"></i>--%>
                <%--                </a>--%>
                <%--                <a class="text-dark px-2" href="">--%>
                <%--                    <i class="fab fa-instagram"></i>--%>
                <%--                </a>--%>
                <%--                <a class="text-dark pl-2" href="">--%>
                <%--                    <i class="fab fa-youtube"></i>--%>
                <%--                </a>--%>
            </div>
        </div>
    </div>
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="<%= request.getServletContext().getContextPath()%>/" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span
                        class="font-weight-bold border px-3 mr-0"
                        style="color: rgb(0, 109, 255);">INK</span>Spired</h1>
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
                        <i class="fas fa-shopping-cart text-primary"></i>
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
                            int quantity = cart.get().getQuantity();
                            if (quantity < 0) quantity = 0;
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
<div class="container-fluid">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between text-white w-100"
               data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;
                background-color: rgb(29, 160, 255);">
                <h6 class="m-0">Categories</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light"
                 id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
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
                    <%--                    <div class="navbar-nav mr-auto py-0">--%>
                    <%--                        <a href="index.html" class="nav-item nav-link">Home</a>--%>
                    <%--                        <a href="shop.html" class="nav-item nav-link">Shop</a>--%>
                    <%--                        <a href="detail.html" class="nav-item nav-link">Shop Detail</a>--%>
                    <%--                        <div class="nav-item dropdown">--%>
                    <%--                            <a href="#" class="nav-link dropdown-toggle active" data-toggle="dropdown">Pages</a>--%>
                    <%--                            <div class="dropdown-menu rounded-0 m-0">--%>
                    <%--                                <a href="cart.html" class="dropdown-item">Shopping Cart</a>--%>
                    <%--                                <a href="checkout.html" class="dropdown-item">Checkout</a>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                        <a href="contact.html" class="nav-item nav-link">Contact</a>--%>
                    <%--                    </div>--%>
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
<%--                                <a href="" class="nav-item nav-link">Admin Login</a>--%>
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
        </div>
    </div>
</div>
<!-- Navbar End -->