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
<%@include file="footer.jsp"%>
</body>
</html>
