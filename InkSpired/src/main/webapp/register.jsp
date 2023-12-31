<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign up</title>
    </head>
    <%@include file="interface.jsp" %>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired Books</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <form class="d-flex" method="POST"
                          action="<%= request.getServletContext().getContextPath()%>/login">
                        <button class="btn btn-outline-dark" type="submit"
                                name="btnLogin"
                                value="Login"
                        >
                            <i class="bi-person-fill"></i>
                            Login
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center align-items-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
                                <form method="POST"
                                      action="<%= request.getServletContext().getContextPath()%>/register">

                                    <div class="row">
                                        <div class="col-md-12 mb-4">

                                            <div class="form-outline">
                                                <input type="text" id="username" class="form-control form-control-lg"
                                                       name="username"/>
                                                <label class="form-label" for="username">User Name</label>
                                            </div>
                                            <span id="errorusername" class="text-danger"></span>
                                        </div>

                                        <div class="col-md-12 mb-4">

                                            <div class="form-outline">
                                                <input type="password" id="password"
                                                       class="form-control form-control-lg"
                                                       name="password"/>
                                                <label class="form-label" for="password">Password</label>
                                            </div>
                                            <span id="errorpassword" class="text-danger"></span>
                                        </div>
                                        <div class="col-md-12 mb-4">

                                            <div class="form-outline">
                                                <input type="text" id="fullname"
                                                       class="form-control form-control-lg"
                                                       name="fullname"
                                                />
                                                <label class="form-label" for="fullname">Full Name</label>
                                            </div>
                                            <span id="errorfullname" class="text-danger"></span>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 d-flex align-items-center">

                                                <div class="form-outline datepicker w-100">
                                                    <input type="date" class="form-control form-control-lg"
                                                           id="birthdayDate"
                                                           name="birthdate"
                                                    />
                                                    <label for="birthdayDate" class="form-label">Birthdate</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">

                                                <h6 class="mb-2 pb-1">Gender: </h6>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           name="genders" id="femaleGender"
                                                           value="female" checked/>
                                                    <label class="form-check-label" for="femaleGender">Female</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           name="genders" id="maleGender"
                                                           value="male"/>
                                                    <label class="form-check-label" for="maleGender">Male</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           name="genders" id="otherGender"
                                                           value="other"/>
                                                    <label class="form-check-label" for="otherGender">Other</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4 d-flex align-items-center">
                                                <span id="errorbirthdate" class="text-danger"></span>
                                            </div>
                                            <div class="col-md-6 mb-4">
                                                <span id="errorgenders" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4 pb-2">

                                                <div class="form-outline">
                                                    <input type="text" id="emailAddress"
                                                           class="form-control form-control-lg"
                                                           name="email"
                                                    />
                                                    <label class="form-label" for="emailAddress">Email</label>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${sessionScope.EMAILEXISTED == true}">
                                                        <span id="erroremail" class="text-danger">Either username or email has already been registered</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span id="erroremail" class="text-danger"></span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="col-md-6 mb-4 pb-2">

                                                <div class="form-outline">
                                                    <input type="tel" id="phoneNumber"
                                                           class="form-control form-control-lg"
                                                           name="phone"
                                                    />
                                                    <label class="form-label" for="phoneNumber">Phone Number</label>
                                                </div>
                                                <span id="errorphone" class="text-danger"></span>
                                            </div>
                                        </div>
                                        <div class="mt-4 pt-2">
                                            <input class="btn btn-outline-dark btn-lg" type="submit" name="btnsubmit"
                                                   value="Submit" disabled/>
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
        <script src="js/Validation/RegisterValidation.js"></script>
    </body>
</html>