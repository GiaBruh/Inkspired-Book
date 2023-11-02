<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--    <head>--%>
<%--        <title>Homepage</title>--%>
<%--        <link rel="stylesheet" href="css/dropdown.css">--%>
<%--        <link rel="stylesheet" href="css/background.css">--%>
<%--        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">--%>
<%--        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>--%>
<%--        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>--%>

<%--        <style>--%>
<%--            .modal-backdrop {--%>
<%--                background-color: rgba(0, 0, 0, .4) !important;--%>
<%--            }--%>
<%--        </style>--%>
<%--    </head>--%>
<%--    <%@include file="interface.jsp" %>--%>
<%--    <body>--%>
<%--        <%@include file="header-yes.jsp" %>--%>
<%--        <header class="bg-dark py-5">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <div class="text-center text-white">--%>
<%--                    <h1 class="display-4 fw-bolder">Order History</h1>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </header>--%>
<%--        <section class="py-5 gradient-custom">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <div class="card">--%>
<%--                    <div class="card-body">--%>
<%--                        <table id="example" class="table table-striped" style="width:100%">--%>
<%--                            <thead>--%>
<%--                                <tr>--%>
<%--                                    <th>Order ID</th>--%>
<%--                                    <th>Total Charge</th>--%>
<%--                                    <th>Order Date</th>--%>
<%--                                    <th>Purchaser</th>--%>
<%--                                    <th>Status</th>--%>
<%--                                    <th>Shipped To</th>--%>
<%--                                </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody>--%>
<%--                                <c:forEach var="order" items="${sessionScope.ORDERHISTORY}">--%>
<%--                                    <tr>--%>
<%--                                        <td>--%>
<%--                                                ${order.getOrder_id()}--%>
<%--                                            <a class="btn btn-block btn-outline-dark my-3 mx-2"--%>
<%--                                               href="<%= request.getServletContext().getContextPath()%>/order?orderid=${order.getOrder_id()}">View--%>
<%--                                                Detail</a>--%>
<%--                                        </td>--%>
<%--                                        <td>--%>
<%--                                            <div class="my-3"><fmt:formatNumber value="${order.getOrder_total()}"--%>
<%--                                                                                minFractionDigits="0"--%>
<%--                                                                                maxFractionDigits="0"/>&#x20AB--%>
<%--                                            </div>--%>
<%--                                        </td>--%>
<%--                                        <td>--%>
<%--                                            <div class="my-3">${order.getOrder_date()}</div>--%>
<%--                                        </td>--%>
<%--                                        <td>--%>
<%--                                            <div class="my-3">${order.getUsername()}</div>--%>
<%--                                        </td>--%>
<%--                                        <td>--%>
<%--                                            <c:choose>--%>
<%--                                                <c:when test="${order.getStatus() == 'Cancelled'}">--%>
<%--                                                    <div class="my-3 text-danger">${order.getStatus()}</div>--%>
<%--                                                </c:when>--%>
<%--                                                <c:when test="${order.getStatus() == 'Delivered'}">--%>
<%--                                                    <div class="my-3 text-success">${order.getStatus()}</div>--%>
<%--                                                </c:when>--%>
<%--                                                <c:otherwise>--%>
<%--                                                    <div class="my-3">${order.getStatus()}</div>--%>
<%--                                                </c:otherwise>--%>
<%--                                            </c:choose>--%>
<%--                                            <c:choose>--%>
<%--                                                <c:when test="${order.getStatus() == 'Pending'}">--%>
<%--                                                    <button type="submit"--%>
<%--                                                            onclick="setOrderId(${order.getOrder_id()}, 'btnconfirmcancel')"--%>
<%--                                                            data-bs-toggle="modal" data-bs-target="#cancelOrder"--%>
<%--                                                            class="btn btn-block btn-danger my-3 mx-2"--%>
<%--                                                            name="btncancel" value="${order.getOrder_id()}"--%>
<%--                                                    >--%>
<%--                                                        Cancel order--%>
<%--                                                    </button>--%>
<%--                                                </c:when>--%>

<%--                                                <c:when test="${order.getStatus() == 'Delivering'}">--%>
<%--                                                    <button type="submit"--%>
<%--                                                            onclick="setOrderId(${order.getOrder_id()}, 'btnconfirmreceived')"--%>
<%--                                                            data-bs-toggle="modal" data-bs-target="#confirmReceived"--%>
<%--                                                            class="btn btn-block btn-success my-3 mx-2"--%>
<%--                                                            name="btnreceived" value="${order.getOrder_id()}"--%>
<%--                                                    >--%>
<%--                                                        Confirm Received--%>
<%--                                                    </button>--%>
<%--                                                </c:when>--%>
<%--                                            </c:choose>--%>
<%--                                        </td>--%>
<%--                                        <td>--%>
<%--                                            <div class="my-3">${order.getDelivery_address()}</div>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>

<%--        <!-- Confirm Received order modal -->--%>
<%--        <div class="modal fade" id="confirmReceived" tabindex="-1" aria-labelledby="ModalLabel"--%>
<%--             aria-hidden="true">--%>
<%--            <div class="modal-dialog modal-dialog-centered">--%>
<%--                <!-- Modal content-->--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-body">--%>
<%--                        <h3 class="text-success">Confirm received this order?</h3>--%>
<%--                        <h5>Only confirm when you have carefully reviewed the order quality with the shipper</h5>--%>
<%--                        <h5>You cannot undo this action...</h5>--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer d-flex justify-content-center">--%>
<%--                        <form method="POST"--%>
<%--                              action="<%= request.getServletContext().getContextPath()%>/order">--%>
<%--                            <button type=submit--%>
<%--                                    class="btn btn-block btn-success my-3 mx-2"--%>
<%--                                    name="btnconfirmreceived" value="0"--%>
<%--                            >--%>
<%--                                Confirm Received--%>
<%--                            </button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- Cancel order modal -->--%>
<%--        <div class="modal fade" id="cancelOrder" tabindex="-1" aria-labelledby="ModalLabel"--%>
<%--             aria-hidden="true">--%>
<%--            <div class="modal-dialog modal-dialog-centered">--%>
<%--                <!-- Modal content-->--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-body">--%>
<%--                        <h3 class="text-danger">Confirm cancel this order?</h3>--%>
<%--                        <h5>The cancel action will be requested to the Admin to confirm</h5>--%>
<%--                        <h5>You cannot undo this action...</h5>--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer d-flex justify-content-center">--%>
<%--                        <form method="POST"--%>
<%--                              action="<%= request.getServletContext().getContextPath()%>/order">--%>
<%--                            <button type=submit--%>
<%--                                    class="btn btn-block btn-danger my-3 mx-2"--%>
<%--                                    name="btnconfirmcancel" value="0"--%>
<%--                            >--%>
<%--                                Confirm Cancel--%>
<%--                            </button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <script>--%>
<%--            new DataTable('#example');--%>
<%--        </script>--%>
<%--        <%@include file="footer.jsp" %>--%>
<%--        <script src="js/order.js"></script>--%>
<%--    </body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>InkSpired</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Favicon -->
    <%--    <link href="img/favicon.ico" rel="icon">--%>

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
<!-- Topbar Start -->
<%@include file="header-no.jsp" %>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">ORDER HISTORY</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="<%= request.getServletContext().getContextPath()%>/">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Order History</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

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
                            <td>
                                    ${order.getOrder_id()}
                                <a class="btn btn-block btn-outline-dark my-3 mx-2"
                                   href="<%= request.getServletContext().getContextPath()%>/order?orderid=${order.getOrder_id()}">View
                                    Detail</a>
                            </td>
                            <td>
                                <div class="my-3"><fmt:formatNumber value="${order.getOrder_total()}"
                                                                    minFractionDigits="0"
                                                                    maxFractionDigits="0"/>&#x20AB
                                </div>
                            </td>
                            <td>
                                <div class="my-3">${order.getOrder_date()}</div>
                            </td>
                            <td>
                                <div class="my-3">${order.getUsername()}</div>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.getStatus() == 'Cancelled'}">
                                        <div class="my-3 text-danger">${order.getStatus()}</div>
                                    </c:when>
                                    <c:when test="${order.getStatus() == 'Delivered'}">
                                        <div class="my-3 text-success">${order.getStatus()}</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="my-3">${order.getStatus()}</div>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${order.getStatus() == 'Pending'}">
                                        <button type="submit"
                                                onclick="setOrderId(${order.getOrder_id()}, 'btnconfirmcancel')"
                                                data-bs-toggle="modal" data-bs-target="#cancelOrder"
                                                class="btn btn-block btn-danger my-3 mx-2"
                                                name="btncancel" value="${order.getOrder_id()}"
                                        >
                                            Cancel order
                                        </button>
                                    </c:when>

                                    <c:when test="${order.getStatus() == 'Delivering'}">
                                        <button type="submit"
                                                onclick="setOrderId(${order.getOrder_id()}, 'btnconfirmreceived')"
                                                data-bs-toggle="modal" data-bs-target="#confirmReceived"
                                                class="btn btn-block btn-success my-3 mx-2"
                                                name="btnreceived" value="${order.getOrder_id()}"
                                        >
                                            Confirm Received
                                        </button>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <div class="my-3">${order.getDelivery_address()}</div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<!-- Confirm Received order modal -->
<div class="modal fade" id="confirmReceived" tabindex="-1" aria-labelledby="ModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body">
                <h3 class="text-success">Confirm received this order?</h3>
                <h5>Only confirm when you have carefully reviewed the order quality with the shipper</h5>
                <h5>You cannot undo this action...</h5>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <form method="POST"
                      action="<%= request.getServletContext().getContextPath()%>/order">
                    <button type=submit
                            class="btn btn-block btn-success my-3 mx-2"
                            name="btnconfirmreceived" value="0"
                    >
                        Confirm Received
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Cancel order modal -->
<div class="modal fade" id="cancelOrder" tabindex="-1" aria-labelledby="ModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body">
                <h3 class="text-danger">Confirm cancel this order?</h3>
                <h5>The cancel action will be requested to the Admin to confirm</h5>
                <h5>You cannot undo this action...</h5>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <form method="POST"
                      action="<%= request.getServletContext().getContextPath()%>/order">
                    <button type=submit
                            class="btn btn-block btn-danger my-3 mx-2"
                            name="btnconfirmcancel" value="0"
                    >
                        Confirm Cancel
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>

<script>
    new DataTable('#example');
</script>
<script src="js/order.js"></script>

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

