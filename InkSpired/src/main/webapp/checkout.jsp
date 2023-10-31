<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Checkout</title>
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/background.css">

        <style>
            .modal-backdrop {
                background-color: rgba(0, 0, 0, .999) !important;
            }
        </style>
    </head>
    <%@include file="interface.jsp" %>
    <body>
        <%@include file="header-yes.jsp" %>
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
                                    <div class="table-responsive mb-5">
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
                                                        <td>
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
                                <div class="card border-secondary mb-5">
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
                                                        class="form-control form-control-lg"
                                                        id="address" type="text" name="address"
                                                        placeholder="Delivery Address"/>
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
                </div>
            </div>
        </section>
        <!-- Back to Top -->
        <a href="#" class="btn btn-light back-to-top"><i class="fa fa-angle-double-up"></i></a>

        <c:choose>
            <c:when test="${sessionScope.CONFIRMORDER == true}">
                <!-- Modal -->
                <div class="modal fade" id="confirmmodal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true" data-bs-backdrop='static'>
                    <div class="modal-dialog modal-dialog-centered">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-body">
                                <h3 class="text-success">Order Success!!!</h3>
                                <h5>Please wait for the admin to confirm the order...</h5>
                            </div>
                            <div class="modal-footer d-flex justify-content-center">
                                <a href="<%= request.getServletContext().getContextPath()%>/"
                                   class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3">Back To Home
                                    Page</a>
                            </div>
                        </div>
                    </div>
                </div>
                <c:set var="CONFIRMORDER" scope="session" value="${null}"/>
            </c:when>

            <c:when test="${sessionScope.CONFIRMORDER == false}">
                <div class="modal fade" id="confirmmodal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true" data-bs-backdrop='static'>
                    <div class="modal-dialog modal-dialog-centered">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-body">
                                <h3 class="text-danger">Something went wrong...</h3>
                                <h5>Please consider creating another order or try again later...</h5>
                            </div>
                            <div class="modal-footer d-flex justify-content-center">
                                <a href="<%= request.getServletContext().getContextPath()%>/"
                                   class="btn btn-lg btn-block btn-outline-dark font-weight-bold my-3 py-3">Back To Home
                                    Page</a>
                            </div>
                        </div>
                    </div>
                </div>
                <c:set var="CONFIRMORDER" scope="session" value="${null}"/>
            </c:when>
        </c:choose>

        <!-- Footer-->
        <%@include file="footer.jsp" %>
        <script src="js/checkout.js"></script>
    </body>
</html>
