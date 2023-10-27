<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>List of book</title>

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
                    <span>Admin</span> / <span class="menu-text">List of author</span>
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
                                    <h4 class="section-title fw-light">List of author</h4>
                                    <a href="<%= request.getContextPath() %>/admin/add-author" class="btn btn-primary mb-2">Add New author</a>
                                </div>

                                <table id="author-table" class="table table-bordered m-0">
                                    <thead>
                                    <tr>
                                        <th>Author ID</th>
                                        <th>Full name</th>

                                        <th>Image</th>
                                        <th>Status</th>
                                        <th>Number of book</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="authors" items="${requestScope.authors}">
                                        <tr>
                                            <td>${authors.author_id}</td>
                                            <td>
                                                <a href="<%= request.getContextPath() %>/admin/author-info?author_id=${authors.author_id}">${authors.author_fullname}</a
                                            </td>

                                            <td>
                                                <img src="<%= request.getContextPath() %>/${authors.author_image}" alt="${authors.author_image}" width="50px" />
                                            </td>
                                            <td>
                                               <span class="badge ${authors.author_status ? 'badge-success' : 'badge-failed'}">
                                                       ${authors.author_status ? 'Active' : 'Inactive'}
                                               </span>
                                            </td>
                                            <td>${authors.number_of_books}</td>

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