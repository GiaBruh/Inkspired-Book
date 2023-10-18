<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" href="css/dropdown.css">
    <link rel="stylesheet" href="css/background.css">
</head>
<%@include file="interface.jsp" %>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired Books</a>
        <div class="col-lg-6 col-6 offset-md-1 text-left">
            <form action="">
                <div class="input-group">
                    <div id="navbarExample1">
                        <ul class="navbar-nav me-auto ps-lg-0" style="padding-left: 0.15rem">
                            <li class="nav-item dropdown position-static">
                                <button
                                        class="btn btn-outline-dark dropdown-toggle"
                                        type="button"
                                        id="navbarDropdown"
                                        data-mdb-toggle="dropdown"
                                        aria-expanded="false"
                                >
                                    <i class="fa fa-book"></i>
                                </button>
                                <div class="dropdown-menu w-100 mt-0" aria-labelledby="navbarDropdown"
                                     style="border-top-left-radius: 0;border-top-right-radius: 0;">
                                    <div class="container">
                                        <div class="row my-4">
                                            <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                                                <div class="list-group list-group-flush">
                                                    <a href="" class="list-group-item list-group-item-action">Lorem
                                                        ipsum</a>
                                                    <a href="" class="list-group-item list-group-item-action">Dolor
                                                        sit</a>
                                                    <a href="" class="list-group-item list-group-item-action">Amet
                                                        consectetur</a>
                                                    <a href="" class="list-group-item list-group-item-action">Cras justo
                                                        odio</a>
                                                    <a href="" class="list-group-item list-group-item-action">Adipisicing
                                                        elit</a>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-3 mb-3 mb-lg-0">
                                                <div class="list-group list-group-flush">
                                                    <a href="" class="list-group-item list-group-item-action">Explicabo
                                                        voluptas</a>
                                                    <a href="" class="list-group-item list-group-item-action">Perspiciatis
                                                        quo</a>
                                                    <a href="" class="list-group-item list-group-item-action">Cras justo
                                                        odio</a>
                                                    <a href="" class="list-group-item list-group-item-action">Laudantium
                                                        maiores</a>
                                                    <a href="" class="list-group-item list-group-item-action">Provident
                                                        dolor</a>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-3 mb-3 mb-md-0">
                                                <div class="list-group list-group-flush">
                                                    <a href="" class="list-group-item list-group-item-action">Iste
                                                        quaerato</a>
                                                    <a href="" class="list-group-item list-group-item-action">Cras justo
                                                        odio</a>
                                                    <a href="" class="list-group-item list-group-item-action">Est
                                                        iure</a>
                                                    <a href="" class="list-group-item list-group-item-action">Praesentium</a>
                                                    <a href=""
                                                       class="list-group-item list-group-item-action">Laboriosam</a>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-3">
                                                <div class="list-group list-group-flush">
                                                    <a href="" class="list-group-item list-group-item-action">Cras justo
                                                        odio</a>
                                                    <a href="" class="list-group-item list-group-item-action">Saepe</a>
                                                    <a href="" class="list-group-item list-group-item-action">Vel
                                                        alias</a>
                                                    <a href="" class="list-group-item list-group-item-action">Sunt
                                                        doloribus</a>
                                                    <a href="" class="list-group-item list-group-item-action">Cum
                                                        dolores</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <input type="text" class="form-control border-black" placeholder="Search for products">
                    <div class="input-group-append">
                        <button class="btn btn-dark btn-small">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
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
            <h1 class="display-4 fw-bolder">Checkout</h1>
        </div>
    </div>
</header>
<!-- Product section-->
<section class="py-5 gradient-custom">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="container-fluid pt-5">
                <div class="row px-xl-5">
                    <div class="col-lg-8">
                        <div class="mb-4">
                            <h4 class="font-weight-semi-bold mb-4"> Choose Billing Address</h4>
                            <p>Saved address go here</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card border-secondary mb-5">
                            <div class="card-header border-0">
                                <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                            </div>
                            <div class="card-body">
                                <h5 class="font-weight-medium mb-3">Products</h5>
                                <div class="d-flex justify-content-between">
                                    <p>Do Duc Dat</p>
                                    <p>$69</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Do Duc Dat</p>
                                    <p>$69</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p>Do Duc Dat</p>
                                    <p>$69</p>
                                </div>
                                <hr class="mt-0">
                                <div class="d-flex justify-content-between mb-3 pt-1">
                                    <h6 class="font-weight-medium">Subtotal</h6>
                                    <h6 class="font-weight-medium">$420</h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Shipping</h6>
                                    <h6 class="font-weight-medium">$0</h6>
                                </div>
                            </div>
                            <div class="card-footer border-secondary bg-transparent">
                                <div class="d-flex justify-content-between mt-2">
                                    <h5 class="font-weight-bold">Total</h5>
                                    <h5 class="font-weight-bold">$69420</h5>
                                </div>
                            </div>
                        </div>
                        <div class="card border-secondary mb-5">
                            <div class="card-header border-0">
                                <h4 class="font-weight-semi-bold m-0">Payment</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" id="momo">
                                        <label class="custom-control-label" for="momo">Paypal</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" id="directpay">
                                        <label class="custom-control-label" for="directpay">Direct Pay</label>
                                    </div>
                                </div>
                                <div class="">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" id="banktransfer">
                                        <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer border-secondary bg-transparent">
                                <button class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3">Place Order</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Back to Top -->
<a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">
            Copyright INKSPIRED BOOKS 2023, always reserved.
        </p>
    </div>
</footer>
</body>
</html>
