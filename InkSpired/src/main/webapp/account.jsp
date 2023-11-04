<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.inkspired.dao.ShoppingCartDAO" %>
<%@ page import="com.example.inkspired.model.ShoppingCart" %>
<%@ page import="java.util.Optional" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--    <head>--%>
<%--        <title>Homepage</title>--%>
<%--        <link rel="stylesheet" href="css/dropdown.css">--%>
<%--        <link rel="stylesheet" href="css/background.css">--%>
<%--        <link rel="stylesheet" href="css/events.css">--%>
<%--    </head>--%>
<%--    <%@include file="interface.jsp" %>--%>
<%--    <body>--%>

<%--        <nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--            <div class="container px-4 px-lg-5">--%>
<%--                <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired Books</a>--%>
<%--                <div class="col-lg-6 col-6 offset-md-1 text-left"></div>--%>

<%--                <div class="navbar justify-content-end" id="navbarSupportedContent">--%>

<%--                    <form class="d-flex pe-lg-3 cart-form">--%>
<%--                        <button class="btn btn-outline-dark"--%>
<%--                                type="button"--%>
<%--                                onclick="location.href--%>
<%--                                        = 'http://localhost:8080' +--%>
<%--                                        '<%= request.getServletContext().getContextPath()%>/cart?cartid=${sessionScope.userCookie.getValue()}'; ">--%>
<%--                            <i class="bi-cart-fill me-1"></i>--%>
<%--                            &lt;%&ndash;                            <a href="<%= request.getServletContext().getContextPath()%>/cart?cartid=${sessionScope.userCookie.getValue()}">Cart</a>&ndash;%&gt;--%>
<%--                            <span>Cart</span>--%>
<%--                            <span class="badge bg-dark text-white ms-1 rounded-pill">--%>
<%--                                                <%--%>
<%--                                                    ShoppingCartDAO scDao = new ShoppingCartDAO();--%>
<%--                                                    int cartid = Integer.parseInt(((Cookie) session.getAttribute("userCookie")).getValue());--%>
<%--                                                    Optional<ShoppingCart> cart = scDao.get(cartid);--%>
<%--                                                    String quantity = String.valueOf(cart.get().getQuantity());--%>
<%--                                                    out.print(quantity);--%>
<%--                                                %>--%>
<%--                                            </span>--%>
<%--                        </button>--%>
<%--                    </form>--%>

<%--                    <div class="dropdown account-dropdown">--%>
<%--                        <button class="btn btn-outline-dark dropdown-toggle" type="button"--%>
<%--                                id="dropdownMenuButton" data-mdb-toggle="dropdown" aria-expanded="false">--%>

<%--                            <i class="bi-person-fill"></i>--%>
<%--                            <span>Account</span>--%>
<%--                        </button>--%>
<%--                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">--%>
<%--                            <li><a class="item-dropdown"--%>
<%--                                   href="<%= request.getServletContext().getContextPath()%>/user">User--%>
<%--                                Information</a></li>--%>
<%--                            <li><a class="item-dropdown"--%>
<%--                                   href="<%= request.getServletContext().getContextPath()%>/order">Order History</a>--%>
<%--                            </li>--%>
<%--                            <li><a class="item-dropdown" href="#">Review History</a></li>--%>
<%--                            <li>--%>
<%--                                <div class="dropdown-divider"></div>--%>
<%--                            </li>--%>
<%--                            <li><a class="item-dropdown"--%>
<%--                                   href="<%= request.getServletContext().getContextPath()%>/logout">Logout</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--        <!-- Header-->--%>
<%--        <header class="bg-dark py-5">--%>
<%--            <div class="container px-4 px-lg-5 my-5">--%>
<%--                <div class="text-center text-white">--%>
<%--                    <h1 class="display-4 fw-bolder">Account page</h1>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </header>--%>
<%--        <!-- User info section-->--%>
<%--        <section class="gradient-custom">--%>
<%--            <div class="container py-4 h-100">--%>
<%--                <div class="row d-flex align-items-center pt-3 pb-3 justify-content-center align-items-center h-100">--%>
<%--                    <div class="col-12 col-lg-11 col-xl-9">--%>
<%--                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">--%>
<%--                            <div class="card-body p-4 p-md-5">--%>
<%--                                <h3 class="mb-4 pb-1 pb-md-0 mb-md-5">Account information</h3>--%>
<%--                                <form method="POST" action="<%=request.getServletContext().getContextPath()%>/user"--%>
<%--                                      enctype="multipart/form-data">--%>
<%--                                    <div class="row d-flex align-items-center pt-3 pb-3 d-flex align-items-center pb-2"--%>
<%--                                         id="infoItem_Picture">--%>
<%--                                        <div class="mb-0 title col-md-3 h6 h6">Profile picture</div>--%>
<%--                                        <div class="mb-0 col-md-6 px-0 text-muted" id="info_image">--%>
<%--                                            A profile picture helps personalise your account--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-1">--%>
<%--                                            &nbsp;--%>
<%--                                        </div>--%>
<%--                                        <input type="file" id="img" name="upload" hidden disabled>--%>
<%--                                        <label for="img" class="col-md-2 h100">--%>
<%--                                            <img id="profileImage" width="100" height="100" class="rounded-circle"--%>
<%--                                                 style="object-fit: cover"--%>
<%--                                            &lt;%&ndash;                                                 src="https://dummyimage.com/100x100/000/fff" alt="profileImage">&ndash;%&gt;--%>
<%--                                                 src="${sessionScope.userInfo.getUser_image()}"--%>
<%--                                                 alt="${sessionScope.userInfo.getUsername()} photo">--%>
<%--                                            <input name="image" value="${sessionScope.userInfo.getUser_image()}"--%>
<%--                                                   hidden/>--%>
<%--                                        </label>--%>
<%--                                        <c:choose>--%>
<%--                                            <c:when test="${sessionScope.FILESIZEEXCEEDED == true}">--%>
<%--                                                <span id="errorimage" class="text-danger">The photo uploaded must be less than 5MB.</span>--%>
<%--                                            </c:when>--%>
<%--                                            <c:otherwise>--%>
<%--                                                <span id="errorimage" class="text-danger"></span>--%>
<%--                                            </c:otherwise>--%>
<%--                                        </c:choose>--%>
<%--                                    </div>--%>
<%--                                    <hr class="my-0">--%>
<%--                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Username">--%>
<%--                                        <label for="info_username" class="mb-0 title col-md-3 h6">Username</label>--%>
<%--                                        <input class="mb-0 description col-md-6" type="text" id="info_username"--%>
<%--                                               name="username" value="${sessionScope.userInfo.getUsername()}"--%>
<%--                                               placeholder="Username" disabled readonly/>--%>
<%--                                        <div class="col-md-3">--%>
<%--                                            &nbsp;--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <hr class="my-0">--%>
<%--                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Email">--%>
<%--                                        <label for="info_email" class="mb-0 title col-md-3 h6">Email</label>--%>
<%--                                        <input class="mb-0 description col-md-6" type="text" id="info_email"--%>
<%--                                               name="email" value="${sessionScope.userInfo.getEmail_address()}"--%>
<%--                                               placeholder="Email" disabled readonly/>--%>
<%--                                        <div class="col-md-3">--%>
<%--                                            &nbsp;--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <hr class="my-0">--%>
<%--                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Name">--%>
<%--                                        <label for="info_fullName" class="mb-0 title col-md-3 h6">Full Name</label>--%>
<%--                                        <input class="mb-0 description col-md-6" type="text" id="info_fullName"--%>
<%--                                               name="fullname" value="${sessionScope.userInfo.getFull_name()}"--%>
<%--                                               placeholder="Full name" disabled/>--%>
<%--                                        <div class="col-md-3">--%>
<%--                                            &nbsp;--%>
<%--                                        </div>--%>
<%--                                        <span id="errorfullname" class="text-danger"></span>--%>
<%--                                    </div>--%>
<%--                                    <hr class="my-0">--%>
<%--                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Gender">--%>
<%--                                        <div class="mb-0 title col-md-3 h6">--%>
<%--                                            Gender--%>
<%--                                        </div>--%>
<%--                                        <div class="mb-0 px-0 col-md-6">--%>
<%--                                            <input type="radio" name="gender" id="info_Gender_Male"--%>
<%--                                                   value="male"--%>
<%--                                            ${sessionScope.userInfo.getGender() == 'male' ? 'checked' : ''}--%>
<%--                                                   disabled>--%>
<%--                                            <label for="info_Gender_Male" class="radio-inline pl-0">Male</label>--%>
<%--                                            <input type="radio" name="gender" id="info_Gender_Female"--%>
<%--                                                   value="female"--%>
<%--                                            ${sessionScope.userInfo.getGender() == 'female' ? 'checked' : ''}--%>
<%--                                                   disabled>--%>
<%--                                            <label for="info_Gender_Female" class="radio-inline">Female</label>--%>
<%--                                            <input type="radio" name="gender" id="info_Gender_Other"--%>
<%--                                                   value="other"--%>
<%--                                            ${sessionScope.userInfo.getGender() == 'other' ? 'checked' : ''}--%>
<%--                                                   disabled>--%>
<%--                                            <label for="info_Gender_Other" class="radio-inline">Other</label>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-3">--%>
<%--                                            &nbsp;--%>
<%--                                        </div>--%>
<%--                                        <span id="errorgender" class="text-danger"></span>--%>
<%--                                    </div>--%>
<%--                                    <hr class="my-0">--%>
<%--                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Birthdate">--%>
<%--                                        <label for="info_birthdate" class="mb-0 title col-md-3 h6">Birthdate</label>--%>
<%--                                        <input class="mb-0 description col-md-6" type="date" id="info_birthdate"--%>
<%--                                               name="birthdate"--%>
<%--                                               value="${sessionScope.userInfo.getBirthdate()}"--%>
<%--                                               disabled/>--%>
<%--                                        <div class="col-md-3">--%>
<%--                                            &nbsp;--%>
<%--                                        </div>--%>
<%--                                        <span id="errorbirthdate" class="text-danger"></span>--%>
<%--                                    </div>--%>

<%--                                    <hr class="my-0">--%>
<%--                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Phone">--%>
<%--                                        <label for="info_phone" class="mb-0 title col-md-3 h6">Phone number</label>--%>
<%--                                        <input class="mb-0 description col-md-6" type="text" id="info_phone"--%>
<%--                                               name="phone" value="${sessionScope.userInfo.getPhone_number()}"--%>
<%--                                               placeholder="Phone number" disabled/>--%>
<%--                                        <div class="col-md-3">--%>
<%--                                            &nbsp;--%>
<%--                                        </div>--%>
<%--                                        <span id="errorphone" class="text-danger"></span>--%>
<%--                                    </div>--%>

<%--                                    <div class="row d-flex">--%>
<%--                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 pe-0 me-md-0">--%>
<%--                                            <input class="submit btn btn-outline-dark btn-lg" type="submit"--%>
<%--                                                   value="Submit" disabled/>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 px-0">--%>
<%--                                            <button type="button" class="edit btn btn-outline-dark btn-lg"--%>
<%--                                                    onclick="toggleEditing()">Edit--%>
<%--                                            </button>--%>
<%--                                        </div>--%>
<%--                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 px-0">--%>
<%--                                            <button type="reset" class="cancel btn btn-outline-dark btn-lg"--%>
<%--                                                    id="cancel"--%>
<%--                                                    onclick="cancelEditing()"--%>
<%--                                                    style="display: none"--%>
<%--                                            >Cancel--%>
<%--                                            </button>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <!-- Footer-->--%>
<%--        <%@include file="footer.jsp" %>--%>
<%--        <script src="js/Validation/AccountValidate.js"></script>--%>
<%--        <script src="js/toggle-edit.js"></script>--%>
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

        <%@include file="footer.jsp" %>

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
        <script src="js/Validation/AccountValidate.js"></script>
        <script src="js/toggle-edit.js"></script>
    </body>

</html>
