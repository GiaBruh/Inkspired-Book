<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Order Information</title>

    <!-- Meta -->
    <meta name="order" content="Vinh" />
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <link rel="shortcut icon" href="assets/images/favicon.svg" />

    <!-- *************
        ************ CSS Files *************
    ************* -->
    <%@include file="jsp-contribute/admin-interface.jsp" %>

    <!-- *************
        ************ Vendor Css Files *************
    ************ -->

    <!-- Scrollbar CSS -->

</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <%@include file="jsp-contribute/admin-menuscroll.jsp"%>

        <!-- App container starts -->
        <div class="app-container">

            <%@include file="jsp-contribute/admin-appheader.jsp"%>

            <!-- App hero header starts -->
            <div class="app-hero-header">
                <h3 class="fw-light mb-5">
                    <span>Admin</span> / <span class="menu-text">List of order</span> / <span class="menu-text">Order id ${order.order_id}</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- table name Order -->
                <div class="col-xxl-12">
                    <div class="card shadow mb-4" id="userInfoForm" >
                        <div class="card-header">
                            <h5 class="card-title">User Info</h5>
                        </div>
                        <div class="p-5">
                            <div class="row flex-lg-row-reverse align-items-center">
                                <div class="col-10 col-sm-8 col-lg-6">
                                    <div class="mt-4">
                                        <table id="order-detail-table" class="table table-bordered m-0">
                                            <thead>
                                            <tr>
                                                <th>Order detail id</th>
                                                <%--                                                <th>From order</th>--%>
                                                <th>Book name</th>
                                                <th>Price</th>
                                                <th>Quantity</th>


                                                <th>Total</th>
                                                <%--                                                <th>Order by</th>--%>
                                                <%--                                                <th>Order date</th>--%>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${requestScope.orderDetail}" var="orderDetail">
                                                <c:if test="${orderDetail.order_id == order.order_id}">
                                                    <tr>
                                                        <td>${orderDetail.order_detail_id}</td>
                                                        <td>${orderDetail.book_title}</td>
                                                        <td>${orderDetail.price}</td>
                                                        <td>${orderDetail.quantity}</td>
                                                        <td>${orderDetail.total_price}</td>

                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            <!-- Add more rows with dummy data -->
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <p class="fs-4">Order ID: ${order.order_id}</p>
                                    <p class="fs-4">Full name: ${order.full_name}</p>
                                    <p class="fs-4">Date order: ${order.order_date}</p>
                                    <p class="fs-4">Address: ${order.delivery_address}</p>
                                    <p class="fs-4">Status: ${order.order_status_name}</p>
                                    <p class="fs-3">Total: ${order.order_total}</p>





                                </div>
                            </div>
                        </div>
                        <form action="<%= request.getContextPath() %>/admin/order-info" method="post">
                        <div class="card-footer">
                            <div class="d-flex gap-2 justify-content-end">
                                <a class="btn btn-outline-primary" href="<%= request.getContextPath() %>/admin/table-order">Go Back</a>


                                    <div class="mb-0">
                                        <div class="input-group">
                                        <select class="form-select" name="order_status">
                                        <c:forEach var="order_status" items="${requestScope.order_status}">
                                            <option value="${order_status.getOrder_status()}"
                                                ${order_status.getOrder_status() == order.order_status ? "selected" : ""}>
                                                    ${order_status.getOrder_status_name()}
                                            </option>
                                        </c:forEach>
                                        </select>
                                            <input type="submit" class="input-group-text btn btn-success" name="authorizeOrderSubmit" value="Update Order Status" />

                                        </div>
                                    </div>
                                    <input type="hidden" name="order_id" value="${order.order_id}" />


                            </div>

                        </div>
                        </form>
                    </div>
                </div>


            </div>
            <!-- App body ends -->

            <!-- App footer start -->
            <div class="app-footer">
                <span>© Bootstrap Gallery 2023</span>
            </div>
            <!-- App footer end -->

        </div>
        <!-- App container ends -->

    </div>
    <!-- Main container end -->

</div>
<!-- Page wrapper end -->

<!-- *************
    ************ JavaScript Files *************
************* -->
<%@include file="jsp-contribute/admin-script.jsp" %>

</body>

</html>