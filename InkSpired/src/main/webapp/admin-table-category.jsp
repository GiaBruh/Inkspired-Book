<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>List of book</title>

    <!-- Meta -->
    <meta name="category" content="Vinh" />
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
                    <span>Admin</span> / <span class="menu-text">List of category</span>
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
                                    <h4 class="section-title fw-light">List of category</h4>
                                    <a href="<%= request.getContextPath() %>/admin/add-category" class="btn btn-primary mb-2">Add New category</a>
                                </div>

                                <table id="category-table" class="table table-bordered m-0">
                                    <thead>
                                    <tr>
                                        <th>Category ID</th>
                                        <th>Category name</th>
                                        <th>Number of usage</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="categories" items="${categories}">
                                        <tr>
                                            <td>${categories.category_id}</td>
                                            <td>
                                                <a href="<%= request.getContextPath() %>/admin/category-info?category_id=${categories.category_id}">${categories.category_name}</a>
                                            </td>
                                            <td>${categories.number_of_usage}</td>


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