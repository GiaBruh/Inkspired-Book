<!DOCTYPE html>
<html lang="en">

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin profile</title>

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
                    <span>Admin</span> / <span class="menu-text">Profile</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- table name Order -->
                <div class="col-xxl-12">
                    <div class="card mx-auto" style="max-width: 900px;">
                        <div class="card-header">
                            <h5 class="card-title">Admin Information</h5>
                        </div>

                        <form action="<%=request.getContextPath()%>/admin/update-admin" method="post">
                            <div class="card-body">
<%--                                <c:if test="${not empty sessionScope.errorMessage}">--%>
<%--                                    <div class="alert border border-danger alert-dismissible fade show text-danger" role="alert">--%>
<%--                                        <b>Error!</b> ${sessionScope.errorMessage}--%>
<%--                                    </div>--%>
<%--                                    <% session.removeAttribute("errorMessage"); %>--%>
<%--                                </c:if>--%>
                                <!-- Row start -->

                                <div class="row">
                                    <div class="col-md-6 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">User name</label>
                                            <input class="form-control" type="text" id="username" name="category_name" value="${adminUsername}" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Full name</label>
                                            <input class="form-control" type="text" id="fullname" name="category_name" value="${adminFullname}" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Admin gmail</label>
                                            <input class="form-control" type="text" id="gmail" name="category_name" value="${adminEmail}" required>
                                        </div>
                                    </div>

                                </div>
                                <!-- Row end -->
                            </div>
                            <div class="card-footer">
                                <div class="d-flex gap-2 justify-content-end">
                                    <a type="submit" class="btn btn-secondary" name="cancelSubmit" id="reset">Cancel</a>
                                    <a type="submit" class="btn btn-primary" id="editButton">Edit</a>
                                    <button type="submit" class="btn btn-primary" name="updateAdminSubmit" id="submitButton">Submit</button>

                                </div>
                            </div>
                        </form>
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
<script>
    window.onload = function() {
        // Initially disable the input fields
        document.getElementById('username').disabled = true;
        document.getElementById('fullname').disabled = true;
        document.getElementById('gmail').disabled = true;

        // Hide the Cancel and Submit buttons
        document.getElementById('reset').style.display = 'none';
        document.getElementById('submitButton').style.display = 'none';

        // Add event listener to the Edit button
        document.getElementById('editButton').addEventListener('click', function() {
            // Enable the Full name field
            document.getElementById('fullname').disabled = false;

            // Show the Cancel and Submit buttons
            document.getElementById('reset').style.display = 'inline-block';
            document.getElementById('submitButton').style.display = 'inline-block';

            // Hide the Edit button
            this.style.display = 'none';
        });

        // Add event listeners to the Cancel and Submit buttons
        document.getElementById('reset').addEventListener('click', resetForm);
        document.getElementById('submitButton').addEventListener('click', resetForm);

        function resetForm() {
            // Disable the input fields
            document.getElementById('username').disabled = true;
            document.getElementById('fullname').disabled = true;
            document.getElementById('gmail').disabled = true;

            // Hide the Cancel and Submit buttons
            document.getElementById('reset').style.display = 'none';
            document.getElementById('submitButton').style.display = 'none';

            // Show the Edit button
            document.getElementById('editButton').style.display = 'inline-block';
        }
    };
</script>

</body>

</html>