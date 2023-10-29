<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Homepage</title>
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/background.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    </head>
    <%@include file="interface.jsp" %>
    <body>
        <%@include file="header-yes.jsp" %>
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Order History</h1>
                </div>
            </div>
        </header>
        <section class="py-5 gradient-custom">
            <div class="container px-4 px-lg-5 my-5">
                <div class="card">
                    <div class="card-body">
                        <table id="example" class="table table-striped" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Total Charge</th>
                                    <th>Order Date</th>
                                    <th>Purchaser</th>
                                    <th>Status</th>
                                    <th>Shipped To</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${sessionScope.ORDERHISTORY}">
                                    <tr>
                                        <td>${order.getOrder_id()}</td>
                                        <td><fmt:formatNumber value="${order.getOrder_total()}" minFractionDigits="0" maxFractionDigits="0"/>&#x20AB</td>
                                        <td>${order.getOrder_date()}</td>
                                        <td>${order.getUsername()}</td>
                                        <td>${order.getStatus()}</td>
                                        <td>${order.getDelivery_address()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <script>
            new DataTable('#example');
        </script>
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">
                    Copyright INKSPIRED BOOKS 2023, always reserved.
                </p>
            </div>
        </footer>
    </body>
</html>
