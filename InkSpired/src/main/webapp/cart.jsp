<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--    <head>--%>
<%--        <title>Shopping cart</title>--%>
<%--        <link rel="stylesheet" href="css/dropdown.css">--%>
<%--        <link rel="stylesheet" href="css/background.css">--%>
<%--    </head>--%>
<%--    <%@include file="interface.jsp" %>--%>
<%--    <body>--%>
<%--        <%@include file="header-yes.jsp" %>--%>
<%--        <!-- Header-->--%>
<%--        <header class="bg-dark py-5">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <div class="text-center text-white">--%>
<%--                    <h1 class="display-4 fw-bolder">Shopping Cart</h1>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </header>--%>
<%--        <!-- Product section-->--%>
<%--        <--%>
<%--        <section class="py-5 gradient-custom">--%>
<%--            <div class="container-fluid pt-5">--%>
<%--                <div class="row px-xl-5">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${sessionScope.CARTINFO.size() == 0}">--%>
<%--                            <div class="col-lg-8 mb-5">--%>
<%--                                <div class="text-center">--%>
<%--                                    <h3>No book has been added to your cart yet.</h3>--%>
<%--                                    <h4>Click <a class="btn btn-block btn-outline-dark my-3"--%>
<%--                                                 href="<%= request.getServletContext().getContextPath()%>/">here</a> to--%>
<%--                                        start shopping</h4>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </c:when>--%>

<%--                        <c:otherwise>--%>
<%--                            <div class="col-lg-8 table-responsive mb-5">--%>
<%--                                <table class="table table-bordered text-center mb-0">--%>
<%--                                    <thead class="bg-secondary text-dark">--%>
<%--                                        <tr>--%>
<%--                                            <th colspan="2">Products</th>--%>
<%--                                            <th>Price</th>--%>
<%--                                            <th>Quantity</th>--%>
<%--                                            <th>Remove</th>--%>
<%--                                            <th>Add to order</th>--%>
<%--                                        </tr>--%>
<%--                                    </thead>--%>
<%--                                    <tbody class="align-middle">--%>

<%--                                        <c:forEach var="book" items="${sessionScope.CARTINFO}">--%>
<%--                                            <tr>--%>
<%--                                                <td class="align-left">--%>
<%--                                                    <img src="${book.getBook_image()}" alt="${book.getTitle()}"--%>
<%--                                                         style="height: 170px;">--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}">${book.getTitle()}</a>--%>
<%--                                                </td>--%>
<%--                                                <td class="align-middle">--%>
<%--                                                    <span class="price"><fmt:formatNumber value="${book.getPrice()}"--%>
<%--                                                                                          minFractionDigits="0"--%>
<%--                                                                                          maxFractionDigits="0"/></span>&#x20AB--%>
<%--                                                </td>--%>
<%--                                                <td class="align-middle">--%>
<%--                                                    <div id="quantity${book.getBook_id()}"--%>
<%--                                                         class="input-group quantity mx-auto"--%>
<%--                                                         style="width: 100px;">--%>
<%--                                                        <div class="input-group-btn">--%>
<%--                                                            <button--%>
<%--                                                                    onclick="countQuantity(${book.getBook_id()}, '-', ${book.getQuantity()})"--%>
<%--                                                                    class="btn btn-sm btn-dark btn-minus" disabled>--%>
<%--                                                                <i class="fa fa-minus"></i>--%>
<%--                                                            </button>--%>
<%--                                                        </div>--%>
<%--                                                        <input type="text"--%>
<%--                                                               id="quantityval${book.getBook_id()}"--%>
<%--                                                               class="form-control form-control-sm bg-white text-center"--%>
<%--                                                               value="1" disabled>--%>
<%--                                                        <div class="input-group-btn">--%>
<%--                                                            <button--%>
<%--                                                                    onclick="countQuantity(${book.getBook_id()}, '+', ${book.getQuantity()})"--%>
<%--                                                                    class="btn btn-sm btn-dark btn-plus" disabled>--%>
<%--                                                                <i class="fa fa-plus"></i>--%>
<%--                                                            </button>--%>
<%--                                                        </div>--%>
<%--                                                        <input type="text" name="maxquantity${book.getBook_id()}" value="${book.getQuantity()}" hidden />--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td class="align-middle">--%>
<%--                                                    <form method="POST"--%>
<%--                                                          action="<%= request.getServletContext().getContextPath()%>/cart/">--%>
<%--                                                        <button onclick="return confirm('Confirm removing this book from cart?')"--%>
<%--                                                                class="btn btn-sm btn-dark"--%>
<%--                                                                name="btndeletefromcart"--%>
<%--                                                                value="${book.getBook_id()}"--%>
<%--                                                        >--%>
<%--                                                            <i class="fa fa-times"></i>--%>
<%--                                                        </button>--%>
<%--                                                    </form>--%>
<%--                                                </td>--%>
<%--                                                <td>--%>
<%--                                                    <input--%>
<%--                                                            onclick="addTocheckout(${book.getBook_id()})"--%>
<%--                                                            type="checkbox" id="${book.getBook_id()}"--%>
<%--                                                            name="book${book.getBook_id()}" value="${book.getBook_id()}"--%>
<%--                                                            class="btn-check"--%>
<%--                                                    >--%>
<%--                                                    <label class="btn btn-outline-dark btn-circle btn-sm me-1"--%>
<%--                                                           for="${book.getBook_id()}"><i class="fa fa-check"></i>--%>
<%--                                                    </label>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                        </c:forEach>--%>

<%--                                    </tbody>--%>
<%--                                </table>--%>
<%--                            </div>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                    <div class="col-lg-4">--%>
<%--                        <form class="mb-5" action="<%= request.getServletContext().getContextPath()%>/checkout"--%>
<%--                              method="POST">--%>
<%--                            <div class="card border-secondary mb-5">--%>
<%--                                <div class="card-header bg-white border-0">--%>
<%--                                    <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>--%>
<%--                                </div>--%>
<%--                                <div class="card-body">--%>
<%--                                    <div class="d-flex justify-content-between mb-3 pt-1">--%>
<%--                                        <h6 class="font-weight-medium">Subtotal</h6>--%>
<%--                                        <h6 class="font-weight-medium"><span id="subtotal">0</span>&#x20AB</h6>--%>
<%--                                    </div>--%>
<%--                                    <div class="d-flex justify-content-between">--%>
<%--                                        <h6 class="font-weight-medium">Shipping</h6>--%>
<%--                                        <h6 class="font-weight-medium"><span id="shipping">10.000</span>&#x20AB</h6>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="card-footer border-secondary bg-transparent">--%>
<%--                                    <div class="d-flex justify-content-between mt-2">--%>
<%--                                        <h5 class="font-weight-bold">Total</h5>--%>
<%--                                        <h5 class="font-weight-bold"><span id="total">10.000</span>&#x20AB</h5>--%>
<%--                                    </div>--%>
<%--                                    <button class="btn btn-block btn-outline-dark my-3 py-3" name="btncheckout"--%>
<%--                                            value="checkout" disabled>--%>
<%--                                        Proceed To Checkout--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <script src="js/quantity-change.js"></script>--%>
<%--        <script src="js/checkout.js"></script>--%>
<%--        <!-- Footer-->--%>
<%--        <%@include file="footer.jsp" %>--%>
<%--    </body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Shopping Cart</title>
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
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="index.jsp">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shopping Cart</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <c:choose>
            <c:when test="${sessionScope.CARTINFO.size() == 0}">
                <div class="col-lg-8 mb-5">
                    <div class="text-center">
                        <h3>No book has been added to your cart yet.</h3>
                        <h4>Click <a class="btn btn-block btn-outline-dark my-3"
                                     href="<%= request.getServletContext().getContextPath()%>/">here</a> to
                            start shopping</h4>
                    </div>
                </div>
            </c:when>

            <c:otherwise>
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Remove</th>
                            <th>Add to order</th>
                        </tr>
                        </thead>
                        <c:forEach var="book" items="${sessionScope.CARTINFO}">--%>
                            <tbody class="align-middle">
                            <tr>
                                <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;">
                                    Colorful
                                    Stylish Shirt
                                </td>
                                <td class="align-middle">$150</td>
                                <td class="align-middle">
                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-primary btn-minus">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control form-control-sm bg-secondary text-center"
                                               value="1">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-primary btn-plus">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle">$150</td>
                                <td class="align-middle">
                                    <button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button>
                                </td>
                            </tr>
                                <%--                <tr>--%>
                                <%--                    <td class="align-middle"><img src="img/product-2.jpg" alt="" style="width: 50px;"> Colorful Stylish Shirt</td>--%>
                                <%--                    <td class="align-middle">$150</td>--%>
                                <%--                    <td class="align-middle">--%>
                                <%--                        <div class="input-group quantity mx-auto" style="width: 100px;">--%>
                                <%--                            <div class="input-group-btn">--%>
                                <%--                                <button class="btn btn-sm btn-primary btn-minus" >--%>
                                <%--                                    <i class="fa fa-minus"></i>--%>
                                <%--                                </button>--%>
                                <%--                            </div>--%>
                                <%--                            <input type="text" class="form-control form-control-sm bg-secondary text-center" value="1">--%>
                                <%--                            <div class="input-group-btn">--%>
                                <%--                                <button class="btn btn-sm btn-primary btn-plus">--%>
                                <%--                                    <i class="fa fa-plus"></i>--%>
                                <%--                                </button>--%>
                                <%--                            </div>--%>
                                <%--                        </div>--%>
                                <%--                    </td>--%>
                                <%--                    <td class="align-middle">$150</td>--%>
                                <%--                    <td class="align-middle"><button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></td>--%>
                                <%--                </tr>--%>
                                <%--                <tr>--%>
                                <%--                    <td class="align-middle"><img src="img/product-3.jpg" alt="" style="width: 50px;"> Colorful Stylish Shirt</td>--%>
                                <%--                    <td class="align-middle">$150</td>--%>
                                <%--                    <td class="align-middle">--%>
                                <%--                        <div class="input-group quantity mx-auto" style="width: 100px;">--%>
                                <%--                            <div class="input-group-btn">--%>
                                <%--                                <button class="btn btn-sm btn-primary btn-minus" >--%>
                                <%--                                    <i class="fa fa-minus"></i>--%>
                                <%--                                </button>--%>
                                <%--                            </div>--%>
                                <%--                            <input type="text" class="form-control form-control-sm bg-secondary text-center" value="1">--%>
                                <%--                            <div class="input-group-btn">--%>
                                <%--                                <button class="btn btn-sm btn-primary btn-plus">--%>
                                <%--                                    <i class="fa fa-plus"></i>--%>
                                <%--                                </button>--%>
                                <%--                            </div>--%>
                                <%--                        </div>--%>
                                <%--                    </td>--%>
                                <%--                    <td class="align-middle">$150</td>--%>
                                <%--                    <td class="align-middle"><button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></td>--%>
                                <%--                </tr>--%>
                                <%--                <tr>--%>
                                <%--                    <td class="align-middle"><img src="img/product-4.jpg" alt="" style="width: 50px;"> Colorful Stylish Shirt</td>--%>
                                <%--                    <td class="align-middle">$150</td>--%>
                                <%--                    <td class="align-middle">--%>
                                <%--                        <div class="input-group quantity mx-auto" style="width: 100px;">--%>
                                <%--                            <div class="input-group-btn">--%>
                                <%--                                <button class="btn btn-sm btn-primary btn-minus" >--%>
                                <%--                                    <i class="fa fa-minus"></i>--%>
                                <%--                                </button>--%>
                                <%--                            </div>--%>
                                <%--                            <input type="text" class="form-control form-control-sm bg-secondary text-center" value="1">--%>
                                <%--                            <div class="input-group-btn">--%>
                                <%--                                <button class="btn btn-sm btn-primary btn-plus">--%>
                                <%--                                    <i class="fa fa-plus"></i>--%>
                                <%--                                </button>--%>
                                <%--                            </div>--%>
                                <%--                        </div>--%>
                                <%--                    </td>--%>
                                <%--                    <td class="align-middle">$150</td>--%>
                                <%--                    <td class="align-middle"><button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></td>--%>
                                <%--                </tr>--%>
                                <%--                <tr>--%>
                                <%--                    <td class="align-middle"><img src="img/product-5.jpg" alt="" style="width: 50px;"> Colorful Stylish Shirt</td>--%>
                                <%--                    <td class="align-middle">$150</td>--%>
                                <%--                    <td class="align-middle">--%>
                                <%--                        <div class="input-group quantity mx-auto" style="width: 100px;">--%>
                                <%--                            <div class="input-group-btn">--%>
                                <%--                                <button class="btn btn-sm btn-primary btn-minus" >--%>
                                <%--                                    <i class="fa fa-minus"></i>--%>
                                <%--                                </button>--%>
                                <%--                            </div>--%>
                                <%--                            <input type="text" class="form-control form-control-sm bg-secondary text-center" value="1">--%>
                                <%--                            <div class="input-group-btn">--%>
                                <%--                                <button class="btn btn-sm btn-primary btn-plus">--%>
                                <%--                                    <i class="fa fa-plus"></i>--%>
                                <%--                                </button>--%>
                                <%--                            </div>--%>
                                <%--                        </div>--%>
                                <%--                    </td>--%>
                                <%--                    <td class="align-middle">$150</td>--%>
                                <%--                    <td class="align-middle"><button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></td>--%>
                                <%--                </tr>--%>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="col-lg-4">
            <form class="mb-5" action="<%= request.getServletContext().getContextPath()%>/checkout" method="POST">
                <%--            <form class="mb-5" action="">--%>
                <%--                <div class="input-group">--%>
                <%--                    <input type="text" class="form-control p-4" placeholder="Coupon Code">--%>
                <%--                    <div class="input-group-append">--%>
                <%--                        <button class="btn btn-primary">Apply Coupon</button>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--            </form>--%>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">$150</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">$10</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">$160</h5>
                        </div>
                        <button class="btn btn-block btn-primary my-3 py-3" name="btncheckout" value="checkout" disabled>
                                Proceed To Checkout</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Cart End -->


<!-- Footer Start -->
<%@include file="footer.jsp" %>
<!-- Footer End -->

<script src="js/quantity-change.js"></script>
--%>
<script src="js/checkout.js"></script>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


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
</body>

</html>