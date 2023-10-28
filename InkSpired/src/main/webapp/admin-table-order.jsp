<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>List of order and order detail</title>

    <!-- Meta -->
    <meta name="author" content="Vinh" />
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
    <link rel="stylesheet" href="assets/vendor/overlay-scroll/OverlayScrollbars.min.css" />
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
                    <span>Admin</span> / <span class="menu-text">List of order, order detail</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">
                <!-- table name Order -->

                <!-- Row start -->
                <div class="row">

                    <div class="col-xxl-12">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h4 class="section-title fw-light">Order</h4>
<%--                                        <div class="dropdown mb-2">--%>
<%--                                            <button class="btn btn-primary dropdown-toggle" type="button" id="columnDropdown" data-toggle="dropdown" aria-expanded="false">--%>
<%--                                                Hide Columns--%>
<%--                                            </button>--%>
<%--                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="columnDropdown">--%>
<%--                                                <li><label class="dropdown-item"><input type="checkbox" class="toggle-column" data-target=".user-id-col"> User ID</label></li>--%>
<%--                                                <li><label class="dropdown-item"><input type="checkbox" class="toggle-column" data-target=".shipping-address-id-col"> Shipping Address ID</label></li>--%>
<%--                                            </ul>--%>
<%--                                        </div>--%>
                                    </div>
                                    <table id="order-table" class="table table-bordered m-0">
                                        <thead>
                                        <tr>
                                            <th scope="col" data-toggle="true" class="col-md-1">Order ID</th>
<%--                                            <th scope="col" data-toggle="true" class="col-md-1 user-id-col">User ID</th>--%>
                                            <th scope="col" data-toggle="true" class="col-md-2">Full Name</th>
                                            <th scope="col" data-toggle="true" class="col-md-1">Order Date</th>
                                            <th scope="col" data-toggle="true" class="col-md-5">Address</th>
                                            <th scope="col" data-toggle="true" class="col-md-1">Order Total</th>
                                            <th scope="col" data-toggle="true" class="col-md-1">Order Status</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <!-- Sample data -->
                                        <c:forEach items="${orders}" var="orders">
                                            <tr>
                                                <td>${orders.order_id}</td>
<%--                                                <td class="user-id-col">${orders.user_id}</td>--%>
                                                <td>
                                                    <a href="<%= request.getContextPath() %>/admin/order-info?order_id=${orders.order_id}">${orders.full_name}</a>
                                                </td>
                                                <td>${orders.order_date}</td>
                                                <td>${orders.delivery_address}</td>
                                                <td>${orders.order_total}</td>

                                                <td>${orders.order_status_name}</td>

                                            </tr>
                                        </c:forEach>
                                        <!-- Add more rows with data -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script>
                        $(document).ready(function () {
                            // Function to toggle column visibility
                            function toggleColumn(columnClass, show) {
                                $('#order-table').find('td.' + columnClass + ', th.' + columnClass).toggle(show);
                            }

                            // Event listener for checkbox change
                            $('.toggle-column').change(function () {
                                const columnClass = $(this).data('target').replace('.', '');
                                const show = $(this).is(':checked');
                                toggleColumn(columnClass, show);
                            });
                        });
                    </script>



                    <div class="col-xxl-12">
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h4 class="section-title fw-light">Order detail</h4>
<%--                                        <div class="dropdown mb-2">--%>
<%--                                            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                                                Hide column--%>
<%--                                            </button>--%>
<%--                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">--%>
<%--                                                <li><label class="dropdown-item"><input type="checkbox" onclick="toggleColumn(1)"> Book id</label></li>--%>
<%--                                                <li><label class="dropdown-item"><input type="checkbox" onclick="toggleColumn(3)"> User id</label></li>--%>
<%--                                                <li><label class="dropdown-item"><input type="checkbox" onclick="toggleColumn(6)"> Price</label></li>--%>
<%--                                                <li><label class="dropdown-item"><input type="checkbox" onclick="toggleColumn(8)"> Order id</label></li>--%>
<%--                                            </ul>--%>
<%--                                        </div>--%>
                                    </div>

                                    <table id="order-detail-table" class="table table-bordered m-0">
                                        <thead>
                                        <tr>
                                            <th scope="col" data-toggle="true">Order detail id</th>
                                            <th scope="col" data-toggle="true">Book name</th>
                                            <th scope="col" data-toggle="true">Full name</th>
                                            <th scope="col" data-toggle="true">Quantity</th>
                                            <th scope="col" data-toggle="true">Price</th>
                                            <th scope="col" data-toggle="true">Total</th>
                                            <th scope="col" data-toggle="true">Order date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${orderDetail}" var="orderDetail">
                                            <tr>
                                                <td>${orderDetail.order_detail_id}</td>
                                                <td>${orderDetail.book_title}</td>
                                                <td>${orderDetail.user_id}</td>
                                                <td>${orderDetail.full_name}</td>
                                                <td>${orderDetail.quantity}</td>
                                                <td>${orderDetail.price}</td>
                                                <td>${orderDetail.total_price}</td>
                                                <td>${orderDetail.order_id}</td>
                                                <td>${orderDetail.order_date}</td>
                                            </tr>
                                        </c:forEach>
                                        <!-- Add more rows with dummy data -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        function toggleColumn(index) {
                            $('#order-detail-table td:nth-child(' + (parseInt(index) + 1) + '), #order-detail-table th:nth-child(' + (parseInt(index) + 1) + ')').toggle();
                        }
                    </script>





                </div>
                <!-- Row end -->

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