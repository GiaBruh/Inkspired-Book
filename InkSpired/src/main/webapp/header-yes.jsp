<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@include file="interface.jsp" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired
            Books</a>
        <div class="col-lg-6 col-6 offset-md-1 text-left">
            <div class="input-group pe-5">
                <div id="navbarExample1">
                    <ul class="navbar-nav me-auto ps-lg-0" style="padding-left: 0.15rem">
                        <li class="nav-item dropdown position-static">
                            <button class="btn btn-outline-dark dropdown-toggle" type="button"
                                    id="navbarDropdown" data-mdb-toggle="dropdown"
                                    aria-expanded="false">
                                <i class="fa fa-book"></i>
                            </button>
                            <div class="dropdown-menu w-100 mt-0" aria-labelledby="navbarDropdown"
                                 style="border-top-left-radius: 0;border-top-right-radius: 0;">
                                <div class="container">
                                    <div class="row my-4">
                                        <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                                            <div class="list-group list-group-flush">
                                                <c:forEach items="${sessionScope.categoryList}" var="category">
                                                    <form method="POST"
                                                          action="<%= request.getServletContext().getContextPath()%>/search">
                                                        <button class="list-group-item list-group-item-action" name="category_id" value="${category.category_id}">${category.category_name}</button>
                                                    </form>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <%--                                        <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">--%>
                                        <%--                                            <div class="list-group list-group-flush">--%>
                                        <%--                                                <c:set var="menuItems" value="${['DD', 'aa', 'category7', 'jesus', 'alahu abkba']}"/>--%>
                                        <%--                                                <c:forEach items="${menuItems}" var="menuItem">--%>
                                        <%--                                                    <a href="<%= request.getServletContext().getContextPath()%>/search" class="list-group-item list-group-item-action">${menuItem}</a>--%>
                                        <%--                                                </c:forEach>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <%--                                        <div class="col-md-6 col-lg-3 mb-3 mb-md-0">--%>
                                        <%--                                            <div class="list-group list-group-flush">--%>
                                        <%--                                                <c:set var="menuItems" value="${['Lorem ipsum', 'Dolor sit', 'Amet consectetur', 'Cras justo odio', 'Adipisicing elit']}"/>--%>
                                        <%--                                                <c:forEach items="${menuItems}" var="menuItem">--%>
                                        <%--                                                    <a href="<%= request.getServletContext().getContextPath()%>/search" class="list-group-item list-group-item-action">${menuItem}</a>--%>
                                        <%--                                                </c:forEach>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                        <%--                                        <div class="col-md-6 col-lg-3">--%>
                                        <%--                                            <div class="list-group list-group-flush">--%>
                                        <%--                                                <c:set var="menuItems" value="${['Lorem ipsum', 'Dolor sit', 'Amet consectetur', 'Cras justo odio', 'Adipisicing elit']}"/>--%>
                                        <%--                                                <c:forEach items="${menuItems}" var="menuItem">--%>
                                        <%--                                                    <a href="<%= request.getServletContext().getContextPath()%>/search" class="list-group-item list-group-item-action">${menuItem}</a>--%>
                                        <%--                                                </c:forEach>--%>
                                        <%--                                            </div>--%>
                                        <%--                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <form class="d-flex w-75" method="POST"
                      action="<%= request.getServletContext().getContextPath()%>/search">
                    <input type="text" id="searchBar" class="form-control border-black" name="keyword"
                           placeholder="Search for products">
                    <div class="input-group-append">
                        <%--                    <button class="btn btn-dark btn-small">--%>
                        <%--                        <i class="fa fa-search"></i>--%>
                        <%--                    </button>--%>
                        <button class="btn btn-dark btn-small" name="btn-search" value="search-by-keyword">
                            <%--                        onclick="location.href = 'http://localhost:8080/InkSpired/searchResult.jsp'; "--%>
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <%--                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
        <%--                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
        <%--                        aria-expanded="false" aria-label="Toggle navigation">--%>
        <%--                    <span class="navbar-toggler-icon"></span>--%>
        <%--                </button>--%>
        <div class="navbar justify-content-end" id="navbarSupportedContent">

            <c:choose>

                <c:when test="${sessionScope.userCookie == null}">

                    <form class="d-flex pe-lg-3 cart-form">
                        <div>
                            <ul class="navbar-nav me-auto ps-lg-0" style="padding-left: 0.15rem">
                                <li class="nav-item dropdown position-static">
                                    <button class="btn btn-outline-dark " type="button"
                                            data-mdb-toggle="dropdown"
                                            aria-expanded="false">
                                        <i class="bi-cart-fill me-1"></i>
                                        <span class="cart-text">Cart</span>
                                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                                    </button>
                                    <div class="dropdown-menu w-100 mt-0" aria-labelledby="navbarDropdown"
                                         style="border-top-left-radius: 0;border-top-right-radius: 0;">
                                        <div class="container">
                                            <div class="row my-4">
                                                <div class="col-md-12 col-lg-12 mb-3 mb-lg-0">
                                                    <div class="list-group list-group-flush">
                                                        <p>It seems like you haven't logged in.</p>
                                                        <p>Please consider login with your account or</p>
                                                        <p>create a new account to use our services.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </form>

                    <form class="d-flex login-form" method="POST"
                          action="<%= request.getServletContext().getContextPath()%>/login">
                        <button class="btn btn-outline-dark" type="submit" name="btnLogin"
                                value="Login">
                            <i class="bi-person-fill"></i>
                            <span>Login</span>
                        </button>
                    </form>
                </c:when>

                <c:otherwise>

                    <form class="d-flex pe-lg-3 cart-form">
                        <button class="btn btn-outline-dark"
                                type="button"
                                onclick="location.href
                                        = 'http://localhost:8080' +
                                        '<%= request.getServletContext().getContextPath()%>/cart?cartid=${sessionScope.userCookie.getValue()}'; ">
                            <i class="bi-cart-fill me-1"></i>
                                <%--                            <a href="<%= request.getServletContext().getContextPath()%>/cart?cartid=${sessionScope.userCookie.getValue()}">Cart</a>--%>
                            <span>Cart</span>
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
                            <li><a class="item-dropdown"
                                   href="<%= request.getServletContext().getContextPath()%>/user">User
                                Information</a></li>
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