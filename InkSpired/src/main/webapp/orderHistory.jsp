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

        <style>
            .modal-backdrop {
                background-color: rgba(0, 0, 0, .4) !important;
            }
        </style>
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

        <script>
            new DataTable('#example');
        </script>
        <%@include file="footer.jsp" %>
        <script src="js/order.js"></script>
    </body>
</html>
