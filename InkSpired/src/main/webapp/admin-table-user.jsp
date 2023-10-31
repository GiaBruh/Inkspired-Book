<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>List of User</title>

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
                    <span>Admin</span> / <span class="menu-text">List of user</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">
                <!-- table name Order -->


                <div class="col-xxl-12">
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h4 class="section-title fw-light">List of user</h4>
                                </div>

                                <table id="user-table" class="table table-bordered m-0">
                                    <thead>
                                    <tr>
                                        <th>User ID</th>
                                        <th>Email Address</th>
                                        <th>Username</th>
                                        <th>Full name</th>
                                        <th>Gender</th>
                                        <th>Birthdate</th>
                                        <th>Phone number</th>
                                        <th>User image</th>
                                        <th>Is Authorize</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="users" items="${requestScope.users}">
                                        <tr>
                                            <td>${users.getUserId()}</td>
                                            <td>${users.email_address}</td>
                                            <td>
                                                <a href="<%= request.getContextPath() %>/admin/user-info?user_id=${users.getUserId()}">${users.username}</a>
                                            </td>
                                            <td>${users.full_name}</td>
                                            <td>${users.gender}</td>
                                            <td>${users.birthdate}</td>
                                            <td>${users.phone_number}</td>
                                            <td>
                                                <img src="${users.username}" alt="" width="50px" height="50px">
                                            </td>
                                            <td>
                                                <span class="badge ${users.user_status ? 'badge-success' : 'badge-failed'}">
                                                        ${users.user_status ? 'Yes' : 'No'}
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>


                            </div>
                        </div>
                    </div>








                    <!-- Your table goes here -->

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