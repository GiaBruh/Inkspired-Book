<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Homepage</title>
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/background.css">
        <style>
            input[name="username"], input[name="email"] {
                pointer-events: none;
            }
        </style>
    </head>
    <%@include file="interface.jsp" %>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">Inkspired Books</a>
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
                            <li><a class="item-dropdown" href="#">Order History</a></li>
                            <li><a class="item-dropdown" href="#">Review History</a></li>
                            <li>
                                <div class="dropdown-divider"></div>
                            </li>
                            <li><a class="item-dropdown"
                                   href="<%= request.getServletContext().getContextPath()%>/logout">Logout</a></li>
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
        <!-- Account info section-->
        <section class="py-5 gradient-custom">
            <div class="container px-4 px-lg-5 my-5">
                <form method="post" action="<%=request.getServletContext().getContextPath()%>/user">
                    <div class="row gx-4 gx-lg-5 align-items-center">
                        <div class="col-md-9">
                            <div class="card">
                                <div class="card-body">
                                    <div id="username-input"
                                         class="d-flex justify-content-center align-items-center mb-4">
                                        <label for="username" class="me-3">Username:</label>
                                        <input
                                                type="text"
                                                id="username"
                                                class="form-control"
                                                name="username"
                                                value="${sessionScope.userInfo.getUsername()}"
                                                disabled
                                        />
                                    </div>
                                    <div id="fullname-input"
                                         class="d-flex justify-content-center align-items-center mb-4">
                                        <label for="fullname" class="me-3">Full Name:</label>
                                        <input
                                                type="text"
                                                id="fullname"
                                                class="form-control"
                                                name="fullname"
                                                value="${sessionScope.userInfo.getFull_name()}"
                                                disabled
                                        />
                                    </div>
                                    <%--                                <div class="col-md-6 d-flex mb-4" id="gender-input">--%>

                                    <%--                                    <h6 class="pe-5">Gender: </h6>--%>

                                    <%--                                    <div class="form-check form-check-inline">--%>
                                    <%--                                        <input class="form-check-input" type="radio"--%>
                                    <%--                                               name="inlineRadioOptions" id="femaleGender"--%>
                                    <%--                                               value="${sessionScope.userInfo.getGender()}"--%>
                                    <%--                                               disabled/>--%>
                                    <%--                                        <label class="form-check-label" for="femaleGender">Female</label>--%>
                                    <%--                                    </div>--%>

                                    <%--                                    <div class="form-check form-check-inline">--%>
                                    <%--                                        <input class="form-check-input" type="radio"--%>
                                    <%--                                               name="inlineRadioOptions" id="maleGender"--%>
                                    <%--                                               value="${sessionScope.userInfo.getGender()}"--%>
                                    <%--                                               disabled/>--%>
                                    <%--                                        <label class="form-check-label" for="maleGender">Male</label>--%>
                                    <%--                                    </div>--%>

                                    <%--                                    <div class="form-check form-check-inline">--%>
                                    <%--                                        <input class="form-check-input" type="radio"--%>
                                    <%--                                               name="inlineRadioOptions" id="otherGender"--%>
                                    <%--                                               value="${sessionScope.userInfo.getGender()}"--%>
                                    <%--                                               disabled/>--%>
                                    <%--                                        <label class="form-check-label" for="otherGender">Other</label>--%>
                                    <%--                                    </div>--%>

                                    <%--                                </div>--%>
                                    <div class="col-md-6 d-flex mb-4" id="gender-input">

                                        <h6 class="pe-5">Gender: </h6>

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio"
                                                   name="inlineRadioOptions" id="femaleGender"
                                                   value="${sessionScope.userInfo.getGender()}"
                                            ${sessionScope.userInfo.getGender() == 'female' ? 'checked' : ''}
                                                   disabled/>
                                            <label class="form-check-label" for="femaleGender">Female</label>
                                        </div>

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio"
                                                   name="inlineRadioOptions" id="maleGender"
                                                   value="${sessionScope.userInfo.getGender()}"
                                            ${sessionScope.userInfo.getGender() == 'male' ? 'checked' : ''}
                                                   disabled/>
                                            <label class="form-check-label" for="maleGender">Male</label>
                                        </div>

                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio"
                                                   name="inlineRadioOptions" id="otherGender"
                                                   value="${sessionScope.userInfo.getGender()}"
                                            ${sessionScope.userInfo.getGender() == 'other' ? 'checked' : ''}
                                                   disabled/>
                                            <label class="form-check-label" for="otherGender">Other</label>
                                        </div>

                                    </div>

                                    <div id="email-input" class="d-flex justify-content-center align-items-center mb-4">
                                        <label for="email" class="me-3">Email:</label>
                                        <input
                                                type="text"
                                                id="email"
                                                class="form-control"
                                                name="email"
                                                value="${sessionScope.userInfo.getEmail_address()}"
                                                disabled
                                        />
                                    </div>
                                    <div id="birthdate-input"
                                         class="d-flex justify-content-center align-items-center mb-4">
                                        <label for="birthdate" class="me-3">Birthdate:</label>
                                        <input
                                                type="date"
                                                id="birthdate"
                                                class="form-control"
                                                name="birthdate"
                                                value="${sessionScope.userInfo.getBirthdate()}"
                                                disabled
                                        />
                                    </div>
                                    <div id="phone-input" class="d-flex justify-content-center align-items-center mb-4">
                                        <label for="phone" class="me-3">Phone Number:</label>
                                        <input
                                                type="text"
                                                id="phone"
                                                class="form-control"
                                                name="phone"
                                                value="${sessionScope.userInfo.getPhone_number()}"
                                                disabled
                                        />
                                    </div>
                                    <div class="d-flex">
                                        <div class="mt-4 me-3 pt-2">
                                            <input class="btn btn-outline-dark btn-lg" type="submit" value="Submit"/>
                                        </div>
                                        <div class="mt-4 pt-2">
                                            <button type="button" class="btn btn-outline-dark btn-lg"
                                                    onclick="toggleEditing()">Edit
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card">
                                <img class="card-img-top"
<%--                                     src="https://dummyimage.com/50x50/dee2e6/DoDucDat.png&text=DoDucDat"--%>
                                        src="${sessionScope.userInfo.getUser_image()}"
                                     alt="Card image cap">
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label for="formFile" class="form-label">Dụng lượng file tối đa 1 MB
                                            Định dạng:.JPEG, .PNG</label>
                                        <input class="form-control" type="file" id="formFile" name="upload"
                                               disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark" id="footer">
            <div class="container"><p class="m-0 text-center text-white">Copyright INKSPIRED BOOKS 2023, always
                reserved.</p>
            </div>
        </footer>
        <script src="js/edit.js"></script>
    </body>
</html>