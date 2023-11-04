<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--    <head>--%>
<%--        <title>Checkout</title>--%>
<%--        <link rel="stylesheet" href="css/dropdown.css">--%>
<%--        <link rel="stylesheet" href="css/background.css">--%>

<%--        <style>--%>
<%--            .modal-backdrop {--%>
<%--                background-color: rgba(0, 0, 0, .999) !important;--%>
<%--            }--%>
<%--        </style>--%>
<%--    </head>--%>
<%--    <%@include file="interface.jsp" %>--%>
<%--    <body>--%>
<%--        <%@include file="header-yes.jsp" %>--%>
<%--        <!-- Header-->--%>
<%--        <header class="bg-dark py-5">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <div class="text-center text-white">--%>
<%--                    <h1 class="display-4 fw-bolder">Checkout</h1>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </header>--%>
<%--        <!-- Product section-->--%>
<%--        <section class="py-5 gradient-custom">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <div class="row gx-4 gx-lg-5 align-items-center">--%>
<%--                    <div class="container-fluid pt-5">--%>
<%--                        <div class="row px-xl-5">--%>
<%--                            <div class="col-lg-8">--%>
<%--                                <div class="mb-4">--%>
<%--                                    <div class="table-responsive mb-5">--%>
<%--                                        <table class="table table-bordered text-center mb-0">--%>
<%--                                            <thead class="bg-secondary text-dark">--%>
<%--                                                <tr>--%>
<%--                                                    <th colspan="2">Products</th>--%>
<%--                                                    <th>Price</th>--%>
<%--                                                    <th>Quantity</th>--%>
<%--                                                </tr>--%>
<%--                                            </thead>--%>
<%--                                            <tbody class="align-middle">--%>
<%--                                                <c:forEach var="orderdetail" items="${sessionScope.BOOKSORDERLIST}">--%>
<%--                                                    <tr>--%>
<%--                                                        <td class="align-left">--%>
<%--                                                            <img src="${orderdetail.getBook_image()}"--%>
<%--                                                                 alt="${orderdetail.getTitle()}"--%>
<%--                                                                 style="height: 170px;">--%>
<%--                                                        </td>--%>
<%--                                                        <td>--%>
<%--                                                            <a onclick="return confirm('Click this link without placing order might cancel the current checkout session' +--%>
<%--                                                                     '\nDo you wish to continue?')"--%>
<%--                                                               href="<%= request.getServletContext().getContextPath()%>/book?bookid=${orderdetail.getBook_id()}">${orderdetail.getTitle()}</a>--%>
<%--                                                        </td>--%>
<%--                                                        <td class="align-middle">--%>
<%--                                                        <span class="price"><fmt:formatNumber--%>
<%--                                                                value="${orderdetail.getPrice()}" minFractionDigits="0"--%>
<%--                                                                maxFractionDigits="0"/></span>&#x20AB--%>
<%--                                                        </td>--%>
<%--                                                        <td class="align-middle">--%>
<%--                                                            <div id="quantity${orderdetail.getBook_id()}">--%>
<%--                                                                <span>${orderdetail.getQuantity()}</span>--%>
<%--                                                            </div>--%>
<%--                                                        </td>--%>
<%--                                                    </tr>--%>
<%--                                                </c:forEach>--%>
<%--                                            </tbody>--%>
<%--                                        </table>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="col-lg-4">--%>
<%--                                <div class="card border-secondary mb-5">--%>
<%--                                    <div class="card-header border-0">--%>
<%--                                        <h4 class="font-weight-semi-bold m-0">Order Total</h4>--%>
<%--                                    </div>--%>
<%--                                    <div class="card-body">--%>
<%--                                        <div class="d-flex justify-content-between mb-3 pt-1">--%>
<%--                                            <h6 class="font-weight-medium">Subtotal</h6>--%>
<%--                                            <h6 class="font-weight-medium">--%>
<%--                                            <span class="price"><fmt:formatNumber value="${sessionScope.SUBTOTAL}"--%>
<%--                                                                                  minFractionDigits="0"--%>
<%--                                                                                  maxFractionDigits="0"/></span>&#x20AB--%>
<%--                                            </h6>--%>
<%--                                        </div>--%>
<%--                                        <div class="d-flex justify-content-between">--%>
<%--                                            <h6 class="font-weight-medium">Shipping</h6>--%>
<%--                                            <h6 class="font-weight-medium">--%>
<%--                                                <span class="price">10.000</span>&#x20AB--%>
<%--                                            </h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="card-footer border-secondary bg-transparent">--%>
<%--                                        <div class="d-flex justify-content-between mt-2">--%>
<%--                                            <h5 class="font-weight-bold">Total</h5>--%>
<%--                                            <h5 class="font-weight-bold">--%>
<%--                                                <c:set var="total"--%>
<%--                                                       value="${(sessionScope.SUBTOTAL + 10000) * (100 -sessionScope.TOTALDISCOUNT) / 100}"--%>
<%--                                                       scope="session"/>--%>
<%--                                                <c:choose>--%>
<%--                                                    <c:when test="${sessionScope.TOTALDISCOUNT != 0}">--%>
<%--                                                        <span style="color: white; background-color: #f2093b; border-radius: 5px; padding: 3px;">-${sessionScope.TOTALDISCOUNT}%</span>--%>
<%--                                                        <s><span class="price"><fmt:formatNumber--%>
<%--                                                                value="${sessionScope.SUBTOTAL + 10000}"--%>
<%--                                                                minFractionDigits="0" maxFractionDigits="0"/></span>&#x20AB</s>--%>
<%--                                                        <br/>--%>
<%--                                                        <span class="price float-end"><fmt:formatNumber value="${total}"--%>
<%--                                                                                                        minFractionDigits="0"--%>
<%--                                                                                                        maxFractionDigits="0"/>&#x20AB</span>--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:otherwise>--%>
<%--                                                    <span class="price"><fmt:formatNumber--%>
<%--                                                            value="${total}"--%>
<%--                                                            minFractionDigits="0" maxFractionDigits="0"/></span>&#x20AB--%>
<%--                                                    </c:otherwise>--%>
<%--                                                </c:choose>--%>
<%--                                            </h5>--%>
<%--                                        </div>--%>
<%--                                        <form method="POST"--%>
<%--                                              action="<%= request.getServletContext().getContextPath()%>/checkout">--%>
<%--                                            <div class="form-outline">--%>
<%--                                                <label for="address"><h5>Delivery Address</h5></label>--%>
<%--                                                <input--%>
<%--                                                        class="form-control form-control-lg"--%>
<%--                                                        id="address" type="text" name="address"--%>
<%--                                                        placeholder="Delivery Address"/>--%>
<%--                                                <span id="errormessage" class="text-danger"></span>--%>
<%--                                            </div>--%>
<%--                                            <button--%>
<%--                                                    onclick="return confirm('Confirm placing this order?')"--%>
<%--                                                    class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3"--%>
<%--                                                    name="btnPlaceOrder" value="placeorder" disabled>--%>
<%--                                                Place Order--%>
<%--                                            </button>--%>
<%--                                        </form>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <!-- Back to Top -->--%>
<%--        <a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>--%>

<%--        <c:choose>--%>
<%--            <c:when test="${sessionScope.CONFIRMORDER == true}">--%>
<%--                <!-- Modal -->--%>
<%--                <div class="modal fade" id="confirmmodal" tabindex="-1" aria-labelledby="exampleModalLabel"--%>
<%--                     aria-hidden="true" data-bs-backdrop='static'>--%>
<%--                    <div class="modal-dialog modal-dialog-centered">--%>
<%--                        <!-- Modal content-->--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-body">--%>
<%--                                <h3 class="text-success">Order Success!!!</h3>--%>
<%--                                <h5>Please wait for the admin to confirm the order...</h5>--%>
<%--                            </div>--%>
<%--                            <div class="modal-footer d-flex justify-content-center">--%>
<%--                                <a href="<%= request.getServletContext().getContextPath()%>/"--%>
<%--                                   class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3">Back To Home--%>
<%--                                    Page</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <c:set var="CONFIRMORDER" scope="session" value="${null}"/>--%>
<%--            </c:when>--%>

<%--            <c:when test="${sessionScope.CONFIRMORDER == false}">--%>
<%--                <div class="modal fade" id="confirmmodal" tabindex="-1" aria-labelledby="exampleModalLabel"--%>
<%--                     aria-hidden="true" data-bs-backdrop='static'>--%>
<%--                    <div class="modal-dialog modal-dialog-centered">--%>
<%--                        <!-- Modal content-->--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-body">--%>
<%--                                <h3 class="text-danger">Something went wrong...</h3>--%>
<%--                                <h5>Please consider creating another order or try again later...</h5>--%>
<%--                            </div>--%>
<%--                            <div class="modal-footer d-flex justify-content-center">--%>
<%--                                <a href="<%= request.getServletContext().getContextPath()%>/"--%>
<%--                                   class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3">Back To Home--%>
<%--                                    Page</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <c:set var="CONFIRMORDER" scope="session" value="${null}"/>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>

<%--        <!-- Footer-->--%>
<%--        <%@include file="footer.jsp" %>--%>
<%--        <script src="js/Validation/CheckoutValidation.js"></script>--%>
<%--        <script src="js/checkout.js"></script>--%>
<%--    </body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Checkout</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<%@include file="header-no.jsp" %>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="<%= request.getServletContext().getContextPath()%>/">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Checkout</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Checkout Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <div class="mb-4">
                <div class="table-responsive mb-5" style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3)">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                        <tr>
                            <th colspan="2">Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                        </thead>
                        <tbody class="align-middle">
                        <c:forEach var="orderdetail" items="${sessionScope.BOOKSORDERLIST}">
                            <tr>
                                <td class="align-left">
                                    <img src="${orderdetail.getBook_image()}"
                                         alt="${orderdetail.getTitle()}"
                                         style="height: 170px;">
                                </td>
                                <td class="align-middle">
                                    <a onclick="return confirm('Click this link without placing order might cancel the current checkout session' +
                                                                     '\nDo you wish to continue?')"
                                       href="<%= request.getServletContext().getContextPath()%>/book?bookid=${orderdetail.getBook_id()}">${orderdetail.getTitle()}</a>
                                </td>
                                <td class="align-middle">
                                                        <span class="price"><fmt:formatNumber
                                                                value="${orderdetail.getPrice()}" minFractionDigits="0"
                                                                maxFractionDigits="0"/></span>&#x20AB
                                </td>
                                <td class="align-middle">
                                    <div id="quantity${orderdetail.getBook_id()}">
                                        <span>${orderdetail.getQuantity()}</span>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card border-secondary mb-5" style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3)">
                <div class="card-header border-0">
                    <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">Subtotal</h6>
                        <h6 class="font-weight-medium">
                                            <span class="price"><fmt:formatNumber value="${sessionScope.SUBTOTAL}"
                                                                                  minFractionDigits="0"
                                                                                  maxFractionDigits="0"/></span>&#x20AB
                        </h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <h6 class="font-weight-medium">
                            <span class="price">10.000</span>&#x20AB
                        </h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Total</h5>
                        <h5 class="font-weight-bold">
                            <c:set var="total"
                                   value="${(sessionScope.SUBTOTAL + 10000) * (100 -sessionScope.TOTALDISCOUNT) / 100}"
                                   scope="session"/>
                            <c:choose>
                                <c:when test="${sessionScope.TOTALDISCOUNT != 0}">
                                    <span style="color: white; background-color: #f2093b; border-radius: 5px; padding: 3px;">-${sessionScope.TOTALDISCOUNT}%</span>
                                    <s><span class="price"><fmt:formatNumber
                                            value="${sessionScope.SUBTOTAL + 10000}"
                                            minFractionDigits="0" maxFractionDigits="0"/></span>&#x20AB</s>
                                    <br/>
                                    <span class="price float-end"><fmt:formatNumber value="${total}"
                                                                                    minFractionDigits="0"
                                                                                    maxFractionDigits="0"/>&#x20AB</span>
                                </c:when>
                                <c:otherwise>
                                                    <span class="price"><fmt:formatNumber
                                                            value="${total}"
                                                            minFractionDigits="0" maxFractionDigits="0"/></span>&#x20AB
                                </c:otherwise>
                            </c:choose>
                        </h5>
                    </div>
                    <form method="POST"
                          action="<%= request.getServletContext().getContextPath()%>/checkout">
                        <div class="form-outline">
                            <label for="address"><h5>Delivery Address</h5></label>
                            <input
                                    class="form-control form-control-lg mb-3"
                                    id="address" type="text" name="address"
                                    placeholder="Delivery Address"/>
                            <span id="errormessage" class="text-danger mt"></span>
                        </div>
                        <button
                                onclick="return confirm('Confirm placing this order?')"
                                class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3"
                                name="btnPlaceOrder" value="placeorder" disabled>
                            Place Order
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Checkout End -->

<%@include file="footer.jsp" %>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

<c:choose>
    <c:when test="${sessionScope.CONFIRMORDER == true}">
        <!-- Modal -->
        <div class="modal fade" id="confirmmodal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true" data-backdrop='static'>
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <h3 class="text-success">Order Success!!!</h3>
                        <h5>Please wait for the admin to confirm the order...</h5>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <form method="POST" action="<%= request.getServletContext().getContextPath()%>/checkout">
                            <button class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3" type="submit" name="btnHome" value="backhome" >Back to Home Page</button>
                        </form>

<%--                        <a href="<%= request.getServletContext().getContextPath()%>/"--%>
<%--                           class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3">Back To Home--%>
<%--                            Page</a>--%>
                    </div>
                </div>
            </div>
        </div>
<%--        <c:set var="CONFIRMORDER" scope="session" value="${null}"/>--%>
    </c:when>

    <c:when test="${sessionScope.CONFIRMORDER == false}">
        <div class="modal fade" id="confirmmodal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true" data-backdrop='static'>
            <div class="modal-dialog modal-dialog-centered">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <h3 class="text-danger">Something went wrong...</h3>
                        <h5>Please consider creating another order or try again later...</h5>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
<%--                        <a href="<%= request.getServletContext().getContextPath()%>/"--%>
<%--                           class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3">Back To Home--%>
<%--                            Page</a>--%>
                        <form method="POST" action="<%= request.getServletContext().getContextPath()%>/">
                            <button class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3" type="submit" name="btnHome" value="backhome" >Back to Home Page</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <c:set var="CONFIRMORDER" scope="session" value="${null}"/>
    </c:when>
</c:choose>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script src="js/checkout.js"></script>
<script src="js/Validation/CheckoutValidation.js"></script>
</body>

</html>