<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Homepage</title>
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/background.css">
        <link rel="stylesheet" href="css/events.css">
    </head>
    <%@include file="interface.jsp" %>
    <body>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand text-decoration-none"
                   href="<%= request.getServletContext().getContextPath()%>/home">Inkspired Books</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <form class="d-flex pe-lg-3">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                    <div class="dropdown">
                        <button
                                class="btn btn-outline-dark dropdown-toggle"
                                type="button"
                                id="dropdownMenuButton"
                                data-mdb-toggle="dropdown"
                                aria-expanded="false"
                        >
                            Account
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <li><a class="item-dropdown" href="<%=request.getServletContext().getContextPath()%>/user">User
                                Information</a></li>
                            <li><a class="item-dropdown" href="orderHistory.jsp">Order History</a></li>
                            <li><a class="item-dropdown" href="reviewHistory.jsp">Review History</a></li>
                            <li>
                                <div class="dropdown-divider"></div>
                            </li>
                            <li><a class="item-dropdown"
                                   href="<%=request.getServletContext().getContextPath()%>/logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Account page</h1>
                </div>
            </div>
        </header>
        <!-- User info section-->
        <section class="gradient-custom">
            <div class="container py-4 h-100">
                <div class="row d-flex align-items-center pt-3 pb-3 justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-11 col-xl-9">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-1 pb-md-0 mb-md-5">Account information</h3>
                                <form method="POST" action="<%=request.getServletContext().getContextPath()%>/user" enctype="multipart/form-data">
                                    <div class="row d-flex align-items-center pt-3 pb-3 d-flex align-items-center pb-2"
                                         id="infoItem_Picture">
                                        <div class="mb-0 title col-md-3 h6 h6">Profile picture</div>
                                        <div class="mb-0 col-md-6 px-0 text-muted" id="info_image">
                                            A profile picture helps personalise your account
                                        </div>
                                        <div class="col-md-1">
                                            &nbsp;
                                        </div>
                                        <input type="file" id="img" name="upload" hidden disabled>
                                        <label for="img" class="col-md-2 h100">
                                            <img id="profileImage" width="100" height="100" class="rounded-circle" style="object-fit: cover"
<%--                                                 src="https://dummyimage.com/100x100/000/fff" alt="profileImage">--%>
                                                 src="${sessionScope.userInfo.getUser_image()}"
                                                 alt="${sessionScope.userInfo.getUsername()} photo">
                                            <input name="image" value="${sessionScope.userInfo.getUser_image()}" hidden/>
                                        </label>

                                    </div>
                                    <hr class="my-0">
                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Username">
                                        <label for="info_username" class="mb-0 title col-md-3 h6">Username</label>
                                        <input class="mb-0 description col-md-6" type="text" id="info_username"
                                               name="username" value="${sessionScope.userInfo.getUsername()}"
                                               placeholder="Username" readonly/>
                                        <div class="col-md-3">
                                            &nbsp;
                                        </div>
                                    </div>
                                    <hr class="my-0">
                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Email">
                                        <label for="info_email" class="mb-0 title col-md-3 h6">Email</label>
                                        <input class="mb-0 description col-md-6" type="text" id="info_email"
                                               name="email" value="${sessionScope.userInfo.getEmail_address()}"
                                               placeholder="Email" readonly/>
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
                                    </div>

                                    <div class="row d-flex">
                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 pe-0 me-md-0">
                                            <input class="btn btn-outline-dark btn-lg" type="submit" value="Submit"/>
                                        </div>
                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 px-0">
                                            <button type="button" class="btn btn-outline-dark btn-lg"
                                                    onclick="toggleEditing()">Edit
                                            </button>
                                        </div>
                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 px-0">
                                            <button type="button" class="btn btn-outline-dark btn-lg"
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
        <!-- Footer-->
        <%@include file="footer.jsp"%>
        <script src="js/toggle-edit.js"></script>
    </body>
</html>