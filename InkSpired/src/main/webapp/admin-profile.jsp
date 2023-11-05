<<<<<<< Updated upstream
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

=======
<%--
  Created by IntelliJ IDEA.
  User: giabuu
  Date: 03/11/2023
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>

<%--<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>

<%--    <head>--%>
<%--        <meta charset="utf-8">--%>
<%--        <title>InkSpired</title>--%>
<%--        <meta content="width=device-width, initial-scale=1.0" name="viewport">--%>

<%--        <!-- Favicon -->--%>
<%--        &lt;%&ndash;    <link href="img/favicon.ico" rel="icon">&ndash;%&gt;--%>

<%--        <!-- Google Web Fonts -->--%>
<%--        <link rel="preconnect" href="https://fonts.gstatic.com">--%>
<%--        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"--%>
<%--              rel="stylesheet">--%>

<%--        <!-- Font Awesome -->--%>
<%--        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">--%>

<%--        <!-- Libraries Stylesheet -->--%>
<%--        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">--%>

<%--        <!-- Customized Bootstrap Stylesheet -->--%>
<%--        <link href="css/style.css" rel="stylesheet">--%>
<%--    </head>--%>

<%--    <body>--%>
<%--        <!-- Topbar Start -->--%>
<%--&lt;%&ndash;        <%@include file="header-no.jsp" %>&ndash;%&gt;--%>
<%--        <!-- Page Header Start -->--%>
<%--        <div class="container-fluid bg-secondary mb-5">--%>
<%--            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">--%>
<%--                <h1 class="font-weight-semi-bold text-uppercase mb-3">Profile</h1>--%>
<%--                <div class="d-inline-flex">--%>
<%--                    <p class="m-0"><a href="<%= request.getServletContext().getContextPath()%>/admin/dashboard">Home</a></p>--%>
<%--                    <p class="m-0 px-2">-</p>--%>
<%--                    <p class="m-0">Profile</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!-- Page Header End -->--%>
<%--        <div class="container">--%>
<%--            <h1>Admin Form</h1>--%>

<%--            <form action="<%=request.getServletContext().getContextPath()%>/admin" method="post">--%>
<%--                <div class="form-group">--%>
<%--                    <label for="username">Username:</label>--%>
<%--                    <input type="text" name="username" id="username" class="form-control" placeholder="Username"--%>
<%--                           value="${requestScope.ADMININFO.getUsername()}" disabled readonly>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label for="email">Email:</label>--%>
<%--                    <input type="email" name="email" id="email" class="form-control" placeholder="Email"--%>
<%--                           value="${requestScope.ADMININFO.getEmailAddress()}" disabled readonly>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <label for="password">Full name:</label>--%>
<%--                    <input type="text" name="password" id="password" class="form-control" placeholder="Password"--%>
<%--                           value="${requestScope.ADMININFO.getFullName()}">--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <a  href="<%=request.getServletContext().getContextPath()%>/admin/reset">Change password</a>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label>Role: Admin</label>--%>
<%--                </div>--%>

<%--                <div class="form-group">--%>
<%--                    <button type="submit" class="btn btn-primary">Save</button>--%>
<%--                    <button type="reset" class="btn btn-secondary">Cancel</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </body>--%>

<%--</html>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <%@include file="interface.jsp" %>

        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Profile</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="<%= request.getServletContext().getContextPath()%>/">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Profile</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <section class="gradient-custom">
            <div class="container py-4 h-100">
                <div class="row d-flex align-items-center pt-3 pb-3 justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-11 col-xl-9">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5" style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3)">
                                <h3 class="mb-4 pb-1 pb-md-0 mb-md-5">Account information</h3>
                                <form method="POST" action="<%=request.getServletContext().getContextPath()%>/user"
                                      enctype="multipart/form-data">
                                    <div class="row d-flex align-items-center pt-3 pb-3 d-flex align-items-center pb-2"
                                         id="infoItem_Picture">
                                        <div class="mb-0 title col-md-3 h6 h6">Profile picture</div>
                                        <div class="mb-0 col-md-7 px-0 text-muted" id="info_image">
                                            A profile picture helps personalise your account
                                        </div>
                                        <input type="file" id="img" name="upload" hidden disabled>
                                        <label for="img" class="col-md-2 h100">
                                            <img id="profileImage" width="100" height="100" class="rounded-circle"
                                                 style="object-fit: cover"
                                            <%--                                                 src="https://dummyimage.com/100x100/000/fff" alt="profileImage">--%>
                                                 src="${sessionScope.userInfo.getUser_image()}"
                                                 alt="${sessionScope.userInfo.getUsername()} photo">
                                            <input name="image" value="${sessionScope.userInfo.getUser_image()}"
                                                   hidden/>
                                        </label>
                                    </div>
                                    <div class="ps-2 pb-3">
                                        <c:choose>
                                            <c:when test="${sessionScope.FILESIZEEXCEEDED == true}">
                                                <span id="errorimage" class="text-danger">The photo uploaded must be less than 5MB.</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span id="errorimage" class="text-danger"></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <hr class="my-0">
                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Username">
                                        <label for="info_username" class="mb-0 title col-md-3 h6">Username</label>
                                        <input class="mb-0 description col-md-6" type="text" id="info_username"
                                               name="username" value="${sessionScope.userInfo.getUsername()}"
                                               placeholder="Username" disabled readonly/>
                                        <div class="col-md-3">
                                            &nbsp;
                                        </div>
                                    </div>
                                    <hr class="my-0">
                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Email">
                                        <label for="info_email" class="mb-0 title col-md-3 h6">Email</label>
                                        <input class="mb-0 description col-md-6" type="text" id="info_email"
                                               name="email" value="${sessionScope.userInfo.getEmail_address()}"
                                               placeholder="Email" disabled readonly/>
                                        <div class="col-md-3">
                                            &nbsp;
                                        </div>
                                    </div>
                                    <hr class="my-0">
                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Name">
                                        <label for="info_fullName" class="mb-0 title col-md-3 h6">Full Name</label>
                                        <input class="mb-0 description col-md-6" type="text" id="info_fullName"
                                               name="fullname" value="${sessionScope.userInfo.getFull_name()}"
                                               placeholder="Full name" disabled/>
                                        <div class="col-md-3">
                                            &nbsp;
                                        </div>
                                        <span id="errorfullname" class="text-danger"></span>
                                    </div>
                                    <hr class="my-0">
                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Gender">
                                        <div class="mb-0 title col-md-3 h6">
                                            Gender
                                        </div>
                                        <div class="mb-0 px-0 col-md-6">
                                            <input type="radio" name="gender" id="info_Gender_Male"
                                                   value="male"
                                            ${sessionScope.userInfo.getGender() == 'male' ? 'checked' : ''}
                                                   disabled>
                                            <label for="info_Gender_Male" class="radio-inline pl-0">Male</label>
                                            <input type="radio" name="gender" id="info_Gender_Female"
                                                   value="female"
                                            ${sessionScope.userInfo.getGender() == 'female' ? 'checked' : ''}
                                                   disabled>
                                            <label for="info_Gender_Female" class="radio-inline">Female</label>
                                            <input type="radio" name="gender" id="info_Gender_Other"
                                                   value="other"
                                            ${sessionScope.userInfo.getGender() == 'other' ? 'checked' : ''}
                                                   disabled>
                                            <label for="info_Gender_Other" class="radio-inline">Other</label>
                                        </div>
                                        <div class="col-md-3">
                                            &nbsp;
                                        </div>
                                        <span id="errorgender" class="text-danger"></span>
                                    </div>
                                    <hr class="my-0">
                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Birthdate">
                                        <label for="info_birthdate" class="mb-0 title col-md-3 h6">Birthdate</label>
                                        <input class="mb-0 description col-md-6" type="date" id="info_birthdate"
                                               name="birthdate"
                                               value="${sessionScope.userInfo.getBirthdate()}"
                                               disabled/>
                                        <div class="col-md-3">
                                            &nbsp;
                                        </div>
                                        <span id="errorbirthdate" class="text-danger"></span>
                                    </div>

                                    <hr class="my-0">
                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Phone">
                                        <label for="info_phone" class="mb-0 title col-md-3 h6">Phone number</label>
                                        <input class="mb-0 description col-md-6" type="text" id="info_phone"
                                               name="phone" value="${sessionScope.userInfo.getPhone_number()}"
                                               placeholder="Phone number" disabled/>
                                        <div class="col-md-3">
                                            &nbsp;
                                        </div>
                                        <span id="errorphone" class="text-danger"></span>
                                    </div>

                                    <div class="row d-flex">
                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 pe-0 me-md-0">
                                            <input class="submit btn btn-primary btn-outline-dark btn-lg" type="submit"
                                                   value="Submit" disabled/>
                                        </div>
                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 px-0">
                                            <button type="button" class="edit btn btn-primary btn-outline-dark btn-lg"
                                                    onclick="toggleEditing()">Edit
                                            </button>
                                        </div>
                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 px-0">
                                            <button type="reset" class="cancel btn btn-primary btn-outline-dark btn-lg"
                                                    id="cancel"
                                                    onclick="cancelEditing()"
                                                    style="display: none"
                                            >Cancel
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/Validation/AccountValidate.js"></script>
        <script src="js/toggle-edit.js"></script>
    </body>
>>>>>>> Stashed changes
</html>