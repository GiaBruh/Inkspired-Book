<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>User Information</title>

    <!-- Meta -->
    <meta name="user" content="Vinh" />
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
                    <span>Admin</span> / <span class="menu-text">List of user</span> / <span class="menu-text">User id ${user.getUserId()}</span>
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
                                        <table id="user-table" class="table table-striped table-bordered" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Order Total</th>
                                                <th>Order Status</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${orders}" var="orders">
                                                <tr>
                                                    <td><a href="<%= request.getContextPath() %>/admin/order-info?order_id=${orders.order_id}">${orders.order_id}</a></td>
                                                    <td>${orders.order_total}</td>
                                                    <td>${orders.order_status}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <p class="fs-4">User ID: ${user.getUserId()}</p>
                                    <p class="fs-4">Email address: ${user.email_address}</p>
                                    <p class="fs-4">User name: ${user.username}</p>
                                    <p class="fs-4">Full name: ${user.full_name}</p>
                                    <p class="fs-4">Gender: ${user.gender}</p>
                                    <p class="fs-4">Birthday: ${user.birthdate}</p>
                                    <p class="fs-4">Phone number: ${user.phone_number}</p>
                                    <p class="fs-4">Image:</p>
                                     <img src="<%= request.getContextPath() %>/${user.user_image}" style="width: 50px; height: auto;" />

                                    <p class="fs-4" style="color: ${user.user_status ? 'green' : 'red'}">
                                        Status: ${user.user_status ? 'Active' : 'Inactive'}
                                    </p>



                                </div>
                            </div>
                        </div>

                        <div class="card-footer">
                            <div class="d-flex gap-2 justify-content-end">
                                <form action="<%= request.getContextPath() %>/admin/user-info" method="post">
                                    <a class="btn btn-outline-primary" href="<%= request.getContextPath() %>/admin/table-author">Go Back</a>
                                    <input type="hidden" name="user_id" value="${user.getUserId()}">
                                    <c:choose>
                                        <c:when test="${user.user_status}">
                                            <input type="submit" class="btn btn-danger" name="authorizeUserSubmit" value="Block">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="submit" class="btn btn-success" name="authorizeUserSubmit" value="Allow">
                                        </c:otherwise>
                                    </c:choose>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- App body ends -->

            <!-- App footer start -->
            <div class="app-footer">
                <span>Copyright INKSPIRED BOOKS 2023, always reserved.</span>
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