<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping cart</title>
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/background.css">
    </head>
    <%@include file="interface.jsp" %>
    <body>
    <%@include file="header-yes.jsp" %>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Shopping Cart</h1>
                </div>
            </div>
        </header>
        <!-- Product section-->
        <section class="py-5 gradient-custom">
            <div class="container-fluid pt-5">
                <div class="row px-xl-5">
                    <div class="col-lg-8 table-responsive mb-5">
                        <table class="table table-bordered text-center mb-0">
                            <thead class="bg-secondary text-dark">
                                <tr>
                                    <th colspan="2">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Remove</th>
                                    <th>Add to order</th>
                                </tr>
                            </thead>
                            <tbody class="align-middle">

                                <c:forEach var="book" items="${sessionScope.CARTINFO}">
                                    <tr>
                                        <td class="align-left">
                                            <img src="${book.getBook_image()}" alt="${book.getTitle()}"
                                                 style="height: 170px;">
                                        </td>
                                        <td>
                                            <a href="<%= request.getServletContext().getContextPath()%>/book?bookid=${book.getBook_id()}">${book.getTitle()}</a>
                                        </td>
                                        <td class="align-middle">${book.getPrice()}&#x20AB</td>
                                        <td class="align-middle">
                                            <div class="input-group quantity mx-auto" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-dark btn-minus">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text"
                                                       class="form-control form-control-sm bg-white text-center"
                                                       value="1">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-dark btn-plus">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <form method="POST"
                                                  action="<%= request.getServletContext().getContextPath()%>/cart/">
                                                <button onclick="return confirm('Confirm removing this book from cart?')"
                                                        class="btn btn-sm btn-dark"
                                                        name="btndeletefromcart"
                                                        value="${book.getBook_id()}"
                                                >
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </form>
                                        </td>
                                        <td>
                                            <input type="checkbox" id="${book.getBook_id()}" name="book${book.getBook_id()}" value="${book.getBook_id()}" hidden>
                                            <button
                                                    onclick="AddTO(${book.getBook_id()})"
                                                    class="btn btn-sm btn-dark"
                                                    id="btn_${book.getBook_id()}"
                                                    style="color: white;"
                                            >
                                                <i class="fa fa-check"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-4">
                        <form class="mb-5" action="">
                            <div class="card border-secondary mb-5">
                                <div class="card-header bg-white border-0">
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
                                    <button class="btn btn-block btn-outline-dark my-3 py-3">
                                        <a href="checkout.jsp" class="text-decoration-none">
                                            Proceed To Checkout
                                        </a>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="js/quantity-change.js"></script>
<!-- Footer--><%@include file="footer.jsp"%>
</body>
</html>