<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--    <head>--%>
<%--        <title>Sign in</title>--%>
<%--        <link rel="stylesheet" href="css/button.css">--%>
<%--    </head>--%>
<%--    <%@include file="interface.jsp" %>--%>
<%--    <body>--%>
<%--        <nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--            <div class="container px-4 px-lg-5">--%>
<%--                <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired Books</a>--%>
<%--                <button--%>
<%--                        class="navbar-toggler"--%>
<%--                        type="button"--%>
<%--                        data-bs-toggle="collapse"--%>
<%--                        data-bs-target="#navbarSupportedContent"--%>
<%--                        aria-controls="navbarSupportedContent"--%>
<%--                        aria-expanded="false"--%>
<%--                        aria-label="Toggle navigation"--%>
<%--                >--%>
<%--                    <span class="navbar-toggler-icon"></span>--%>
<%--                </button>--%>
<%--                <div--%>
<%--                        class="collapse navbar-collapse justify-content-end"--%>
<%--                        id="navbarSupportedContent"--%>
<%--                >--%>
<%--                    <form class="d-flex pe-3" method="POST"--%>
<%--                          action="<%= request.getServletContext().getContextPath()%>/register">--%>
<%--                        <button class="btn btn-outline-dark"--%>
<%--                                type="submit"--%>
<%--                                name="btnRegister"--%>
<%--                                value="Register"--%>
<%--                        >--%>
<%--                            <i class="bi-person-fill"></i>--%>
<%--                            Register--%>
<%--                        </button>--%>
<%--                    </form>--%>

<%--                    <form class="d-flex" method="POST"--%>
<%--                          action="<%= request.getServletContext().getContextPath()%>/admin">--%>
<%--                        <button class="btn btn-outline-dark"--%>
<%--                                type="submit"--%>
<%--                                name="btnAdmin"--%>
<%--                                value="Admin"--%>
<%--                        >--%>
<%--                            <i class="bi-person-fill"></i>--%>
<%--                            Admin--%>
<%--                        </button>--%>
<%--                    </form>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--        <section class="vh-100 gradient-custom">--%>
<%--            <div class="container py-5 h-100">--%>
<%--                <div class="row justify-content-center align-items-center h-100">--%>
<%--                    <div class="col-12 col-lg-9 col-xl-7">--%>
<%--                        <div--%>
<%--                                class="card shadow-2-strong card-registration"--%>
<%--                                style="border-radius: 15px"--%>
<%--                        >--%>
<%--                            <div class="card-body p-4 p-md-5">--%>
<%--                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Login</h3>--%>
<%--                                <form--%>
<%--                                        method="POST"--%>
<%--                                        action="<%= request.getServletContext().getContextPath()%>/login"--%>
<%--                                >--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-md-12 mb-4">--%>
<%--                                            <div class="form-outline">--%>
<%--                                                <input--%>
<%--                                                        type="text"--%>
<%--                                                        id="userName"--%>
<%--                                                        class="form-control form-control-lg"--%>
<%--                                                        name="username"--%>
<%--                                                />--%>
<%--                                                <label class="form-label" for="userName"--%>
<%--                                                >User Name</label--%>
<%--                                                >--%>
<%--                                            </div>--%>
<%--                                            <span id="errorusername" class="text-danger"></span>--%>
<%--                                        </div>--%>

<%--                                        <div class="col-md-12 mb-4">--%>
<%--                                            <div class="form-outline">--%>
<%--                                                <input--%>
<%--                                                        type="password"--%>
<%--                                                        id="password"--%>
<%--                                                        class="form-control form-control-lg"--%>
<%--                                                        name="password"--%>
<%--                                                />--%>
<%--                                                <label class="form-label" for="password"--%>
<%--                                                >Password</label--%>
<%--                                                >--%>
<%--                                            </div>--%>
<%--                                            <span id="errorpassword" class="text-danger"></span>--%>
<%--                                        </div>--%>
<%--                                        <div class="row">--%>
<%--                                            <div class="col-md-6 mb-8">--%>
<%--                                                <div class="form-check-inline">--%>
<%--                                                    <input type="checkbox" class="btn-check" id="rememberMe"--%>
<%--                                                           autocomplete="off"--%>
<%--                                                           name="remembermecheckbox">--%>
<%--                                                    <label class="btn btn-outline-dark btn-circle me-1"--%>
<%--                                                           for="rememberMe"></label>--%>
<%--                                                    <label class="form-check-label fw-bolder" for="rememberMe">--%>
<%--                                                        Remember me--%>
<%--                                                    </label>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-md-6 mb-8">--%>
<%--                                                <div class="d-flex justify-content-end">--%>
<%--                                                    <label class="form-check-label fw-bolder">--%>
<%--                                                        <button type="button" class="btn btn-outline-dark"--%>
<%--                                                                data-bs-toggle="modal"--%>
<%--                                                                data-bs-target="#emailVerification">--%>
<%--                                                            Forgot password?--%>
<%--                                                        </button>--%>
<%--                                                    </label>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="mt-4">--%>
<%--                                            <input--%>
<%--                                                    class="btn btn-outline-dark btn-lg"--%>
<%--                                                    type="submit"--%>
<%--                                                    name="btnSubmit"--%>
<%--                                                    value="Submit"--%>
<%--                                                    disabled--%>
<%--                                            />--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <!-- Modal -->--%>
<%--        <div class="modal fade" id="emailVerification" tabindex="-1" aria-labelledby="exampleModalLabel"--%>
<%--             data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header gradient-custom">--%>
<%--                        <h5 class="modal-title" id="exampleModalLabel">--%>
<%--                            <a href="reset.jsp">--%>
<%--                                Forgot password?--%>
<%--                            </a>--%>
<%--                        </h5>--%>
<%--                        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal"--%>
<%--                                aria-label="Close"></button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--                        <div class="mb-4">--%>
<%--                            <p>--%>
<%--                                Please enter your email address and we will send you a verification code.--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-12 mb-4">--%>
<%--                            <div class="form-outline">--%>
<%--                                <div>--%>
<%--                                    <input type="email" id="emailAddress" class="form-control form-control-lg"--%>
<%--                                           placeholder="Your email goes here!" required/>--%>
<%--                                    <div class="invalid-feedback">--%>
<%--                                        Invalid email, please enter a valid email address.--%>
<%--                                    </div>--%>
<%--                                    <div class="valid-feedback">--%>
<%--                                        Correct email, a verification code has been sent. Please check your email.--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="mt-3">--%>
<%--                                    <input type="text" id="verificationCode" class="form-control form-control-lg"--%>
<%--                                           placeholder="Verification code goes here!" required style="display: none"/>--%>
<%--                                    <div class="invalid-feedback">--%>
<%--                                        Wrong verification code, please enter it again.--%>
<%--                                    </div>--%>
<%--                                    <div class="valid-feedback">--%>
<%--                                        Correct verification code.--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer justify-content-between">--%>
<%--                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>--%>
<%--                        <button type="button" id="sendVerificationCode" class="btn btn-outline-dark"--%>
<%--                                onclick="sendVerificationCode()">Send verification code--%>
<%--                        </button>--%>
<%--                        <div class="btn-group" style="display: none" id="buttonGroup">--%>
<%--                            <button type="button" id="resendVerificationCode" class="btn btn-outline-dark"--%>
<%--                                    onclick="resendVerificationCode()" style="display: none">Resend code--%>
<%--                            </button>--%>
<%--                            <button type="button" id="verifyVerificationCode" class="btn btn-outline-dark"--%>
<%--                                    onclick="verifyVerificationCode()" style="display: none">Verify code--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                        <form action="<%= request.getServletContext().getContextPath() %>/reset"--%>
<%--                              id="redirectButtonGroup" style="display: none">--%>
<%--                            <button type="submit" id="redirectButton" class="btn btn-outline-dark"--%>
<%--                                    style="display: none">Reset password--%>
<%--                            </button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--        <!-- Footer-->--%>
<%--        <%@include file="footer.jsp" %>--%>
<%--    </body>--%>
<%--    <script src="js/password-forgot.js"></script>--%>
<%--    <script src="js/Validation/LoginValidation.js"></script>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login and Register</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300, 400, 500" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="css/login.css">
    <link href="css/style.css" rel="stylesheet">
    <%@include file="interface.jsp"%>
</head>
<body>
    <a href="<%= request.getServletContext().getContextPath()%>/" class="text-decoration-none">
        <h1 class="m-0 display-5 font-weight-semi-bold"><span
                class="font-weight-bold px-3 mr-0" style="color: rgb(0, 109, 255);">INK</span>Spired</h1>
    </a>
<%--<%@include file="header-no.jsp" %>--%>
<!-- partial:index.partial.html -->
<!--
  This was created based on the Dribble shot by Deepak Yadav that you can find at https://goo.gl/XRALsw
  I'm @hk95 on GitHub. Feel free to message me anytime.
-->

<section class="user">
    <div class="user_options-container">
        <div class="user_options-text">
            <div class="user_options-unregistered">
                <h2 class="user_unregistered-title fw-bold text-white">Don't have an account?</h2>
<%--                <p class="user_unregistered-text">Banjo tote bag bicycle rights, High Life sartorial cray craft--%>
<%--                    beer whatever street art fap.</p>--%>
                <h3 class="text-white-50">Create one right here!</h3>
                <button class="user_unregistered-signup" id="signup-button">Register</button>
            </div>

            <div class="user_options-registered">
                <h2 class="user_registered-title fw-bold text-white">Have an account?</h2>
<%--                <p class="user_registered-text">Banjo tote bag bicycle rights, High Life sartorial cray craft--%>
<%--                    beer whatever street art fap.</p>--%>
                <h3 class="text-white-50">Login here!</h3>
                <button class="user_registered-login" id="login-button">Login</button>
            </div>
        </div>

        <div class="user_options-forms" id="user_options-forms">
            <div class="user_forms-login">
                <h2 class="forms_title fw-bold">Login</h2>
                <form class="forms_form" method="POST"
                      action="<%= request.getServletContext().getContextPath()%>/login">
                    <fieldset class="forms_fieldset">
                        <div class="forms_field">
                            <input placeholder="Username" class="forms_field-input" name="username" required
                                   autofocus/>
                            <span id="errorusernameLogin" class="text-danger"></span>

                        </div>
                        <div class="forms_field">
                            <input type="password" placeholder="Password" class="forms_field-input"
                                   name="password" required/>
                            <span id="errorpasswordLogin" class="text-danger"></span>

                        </div>
                    </fieldset>
                    <div class="forms_buttons">
                        <%--                                <button type="button" class="forms_buttons-forgot">Forgot password?</button>--%>
                            <label class="form-check-label fw-bolder">
                                <button type="button" class="forms_buttons-forgot" data-bs-toggle="modal" data-bs-target="#emailVerification">
                                    Forgot password?
                                </button>
                            </label>
                        <input type="submit" name="btnSubmit" value="Submit" class="forms_buttons-action">
                    </div>
                    <br>
                     <span class="text-danger">${sessionScope.errorMessage}</span>
                </form>
            </div>
            <div class="user_forms-signup">
                <h2 class="forms_title">Register</h2>
                <form class="forms_form" method="POST"
                      action="<%= request.getServletContext().getContextPath()%>/register">
                    <div class="row col-lg-12">
                        <fieldset class="forms_fieldset col-lg-6 col-md-12">
                            <div class="forms_field">
                                <input type="text" id="username" class="forms_field-input"
                                       name="registerusername" placeholder="Username" required/>
                                <span id="errorusername" class="text-danger"></span>
                            </div>
                            <div class="forms_field">
                                <input type="password" id="password"
                                       class="forms_field-input"
                                       name="registerpassword" placeholder="Password" required/>
                                <span id="errorpassword" class="text-danger"></span>
                            </div>
                            <div class="forms_field">
                                <input type="text" id="fullname"
                                       class="forms_field-input"
                                       name="fullname" placeholder="Full Name" required/>
                                <span id="errorfullname" class="text-danger"></span>
                            </div>
                            <div class="forms_field">
                                <input type="date" class="forms_field-input"
                                       id="birthdayDate"
                                       name="birthdate" placeholder="Birthdate" required/>
                                <span id="errorbirthdate" class="text-danger"></span>
                            </div>
                        </fieldset>
                        <fieldset class="forms_fieldset col-lg-6 col-md-12">
                            <div class="forms_field">
                                <label class="forms_field-input">Gender</label>
                                <div class="pt-4 text-center">
                                    <label><input type="radio" name="genders" value="male" checked> Male</label>
                                    <label><input type="radio" name="genders" value="female"> Female</label>
                                    <label><input type="radio" name="genders" value="other"> Other</label>
                                </div>
                            </div>
                            <div class="forms_field">
                                <input type="text" id=""
                                       class="forms_field-input"
                                       name="email"
                                       placeholder="Email Address" required
                                />
                                <c:choose>
                                    <c:when test="${sessionScope.EMAILEXISTED == null}">
                                        <span id="erroremail" class="text-danger"></span>
                                    </c:when>
                                </c:choose>
                            </div>
                            <div class="forms_field">
                                <input type="tel" id="phoneNumber"
                                       class="forms_field-input"
                                       name="phone"
                                       placeholder="Phone Number" required
                                />
                                <span id="errorphone" class="text-danger"></span>
                            </div>
                        </fieldset>
                        <c:choose>
                            <c:when test="${sessionScope.EMAILEXISTED == true}">
                                <span id="erroremail" class="text-danger">Either username or email has already been registered</span>
                            </c:when>
                        </c:choose>
                    </div>
                    <div class="forms_buttons justify-content-center pb-md-5">
                        <input type="submit" value="Submit" name="btnsubmitRegister" class="forms_buttons-action" disabled>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="emailVerification" tabindex="-1" aria-labelledby="exampleModalLabel" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header gradient-custom">
                <h5 class="modal-title" id="exampleModalLabel">
                    <a href="reset.jsp">
                        Forgot password?
                    </a>
                </h5>
                <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-4">
                    <p>
                        Please enter your email address and we will send you a verification code.
                    </p>
                </div>
                <div class="col-md-12 mb-4">
                    <div class="form-outline">
                        <div>
                            <input type="email" name="changePassEmail" id="emailAddress" class="form-control form-control-lg" placeholder="Your email goes here!" required />
                            <div id="errorFeed" class="invalid-feedback">
                                Invalid email, please enter a valid email address.
                            </div>
                            <div class="valid-feedback">
                                Correct email, a verification code has been sent. Please check your email.
                            </div>
                        </div>
                        <div class="mt-3">
                            <input type="text" id="verificationCode" class="form-control form-control-lg" placeholder="Verification code goes here!" required style="display: none"/>
                            <div class="invalid-feedback">
                                Wrong verification code, please enter it again.
                            </div>
                            <div class="valid-feedback">
                                Correct verification code.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <div class="alert alert-success text-center col-12" id="success" style="display:none;">
                    <strong>Success!</strong> Verification code has been sent to your email.
                </div>
                <div class="alert alert-danger text-center col-12" id="fail" style="display:none;">
                    <strong>Fail!</strong> Verification code has not been sent to your email.
                </div>
                <button type="button" disabled class="btn btn-outline-dark" id="timer">Time left:</button>
                <button type="button" id="sendVerificationCode" class="btn btn-outline-dark" onclick="sendVerificationCode()">Send verification code</button>
                <div class="btn-group" style="display: none" id="buttonGroup">
                    <button type="button" id="resendVerificationCode" class="btn btn-outline-dark" onclick="resendVerificationCode()" style="display: none">Resend code</button>
                    <button type="button" id="verifyVerificationCode" class="btn btn-outline-dark" onclick="verifyVerificationCode()" style="display: none">Verify code</button>
                </div>
                <form action="<%= request.getServletContext().getContextPath() %>/reset" id="redirectButtonGroup" style="display: none">
                    <button type="submit" id="redirectButton" class="btn btn-outline-dark" style="display: none">Reset password</button>
                </form>
            </div>
        </div>

    </div>
</div>
<!-- partial -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/password-forgot.js"></script>
<script src="js/Validation/RegisterValidation.js"></script>
<script src="js/Validation/LoginValidation.js"></script>
</body>
</html>
