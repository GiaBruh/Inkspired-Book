<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Forgot password</title>--%>
<%--    <link rel="stylesheet" href="css/button.css">--%>
<%--</head>--%>
<%--<style>--%>
<%--    .gradient-custom {--%>
<%--        background: #f093fb;--%>

<%--        background: -webkit-linear-gradient(--%>
<%--                to bottom right,--%>
<%--                rgba(240, 147, 251, 1),--%>
<%--                rgba(245, 87, 108, 1)--%>
<%--        );--%>

<%--        background: linear-gradient(--%>
<%--                to bottom right,--%>
<%--                rgba(240, 147, 251, 1),--%>
<%--                rgba(245, 87, 108, 1)--%>
<%--        );--%>
<%--    }--%>

<%--    .card-registration .select-input.form-control[readonly]:not([disabled]) {--%>
<%--        font-size: 1rem;--%>
<%--        line-height: 2.15;--%>
<%--        padding-left: 0.75em;--%>
<%--        padding-right: 0.75em;--%>
<%--    }--%>

<%--    .card-registration .select-arrow {--%>
<%--        top: 13px;--%>
<%--    }--%>
<%--</style>--%>
<%--<%@include file="interface.jsp" %>--%>
<%--<body>--%>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
<%--    <div class="container px-4 px-lg-5">--%>
<%--        <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired Books</a>--%>
<%--        <button--%>
<%--                class="navbar-toggler"--%>
<%--                type="button"--%>
<%--                data-bs-toggle="collapse"--%>
<%--                data-bs-target="#navbarSupportedContent"--%>
<%--                aria-controls="navbarSupportedContent"--%>
<%--                aria-expanded="false"--%>
<%--                aria-label="Toggle navigation"--%>
<%--        >--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div--%>
<%--                class="collapse navbar-collapse justify-content-end"--%>
<%--                id="navbarSupportedContent"--%>
<%--        >--%>
<%--            <form class="d-flex" method="POST"--%>
<%--                  action="<%= request.getServletContext().getContextPath()%>/login">--%>
<%--                <button class="btn btn-outline-dark" type="submit"--%>
<%--                        name="btnLogin"--%>
<%--                        value="Login"--%>
<%--                >--%>
<%--                    <i class="bi-person-fill"></i>--%>
<%--                    Login--%>
<%--                </button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>
<%--<section class="vh-100 gradient-custom">--%>
<%--    <div class="container py-5 h-100">--%>
<%--        <div class="row justify-content-center align-items-center h-100">--%>
<%--            <div class="col-12 col-lg-9 col-xl-7">--%>
<%--                <div--%>
<%--                        class="card shadow-2-strong card-registration"--%>
<%--                        style=""--%>
<%--                >--%>
<%--                    <div class="card-body p-4 p-md-5">--%>
<%--                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Reset password</h3>--%>
<%--                        <form--%>
<%--                                method="POST"--%>
<%--                                action="<%= request.getServletContext().getContextPath()%>/reset"--%>
<%--                        >--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-md-12 mb-4">--%>
<%--                                    <div class="form-outline">--%>
<%--                                        <div class="input-group-lg">--%>
<%--                                            <input type="password" id="newPassword"--%>
<%--                                                   placeholder="New password goes here"--%>
<%--                                                   class="form-control form-control-lg"--%>
<%--                                                   name="newPassword"--%>
<%--                                                   required--%>
<%--                                                   oninput="validatePasswords()"/>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div id="newPasswordMismatch" class="text-danger" style="display: none;">Passwords do not match.</div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-12 mb-4 mt-4">--%>
<%--                                    <div class="form-outline">--%>
<%--                                        <div class="input-group-lg">--%>
<%--                                            <input type="password" id="newPasswordRepeat"--%>
<%--                                                   placeholder="Repeat new password"--%>
<%--                                                   class="form-control form-control-lg"--%>
<%--                                                   required--%>
<%--                                                   oninput="validatePasswords()"/>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div id="newPasswordRepeatMismatch" class="text-danger" style="display: none;">Passwords do not match.</div>--%>
<%--                                </div>--%>
<%--                                <div class="mt-4">--%>
<%--                                    <input--%>
<%--                                            class="btn btn-outline-dark btn-lg"--%>
<%--                                            type="submit"--%>
<%--&lt;%&ndash;                                            type="button"&ndash;%&gt;--%>
<%--                                            name="btnSubmit"--%>
<%--                                            value="Reset password"--%>
<%--&lt;%&ndash;                                            onclick="redirectToResetController()"&ndash;%&gt;--%>
<%--                                    />--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<!-- Footer-->--%>
<%--<%@include file="footer.jsp"%>--%>
<%--<script src="js/password-validate.js"></script>--%>
<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset password</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300, 400, 500" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="css/login.css">
    <link href="css/style.css" rel="stylesheet">
    <%@include file="interface.jsp" %>

</head>
<body>

<%--<%@include file="header-no.jsp"%>--%>

<section class="user">
    <div class="user_options-container">
        <div class="user_options-text">
            <div class="user_options-unregistered">
                <h2 class="user_unregistered-title fw-bold text-white">Reset password</h2>
                <h3 class="text-white-50">Unfortunate of you for forgetting your password.</h3>
                <%--                <button class="user_unregistered-signup" id="signup-button">Sign up</button>--%>
<%--                <button class="forms_buttons-action mt-2">Back to login page.</button>--%>
                <form class="d-flex login-form" method="POST"
                      action="<%= request.getServletContext().getContextPath()%>/login">
                    <button class="user_unregistered-signup" type="submit" name="btnLogin"
                            value="Login">
                        <span>Back to login page</span>
                    </button>
                </form>
            </div>

            <%--            <div class="user_options-registered">--%>
            <%--                <h2 class="user_registered-title">Have an account?</h2>--%>
            <%--                <p class="user_registered-text">Banjo tote bag bicycle rights, High Life sartorial cray craft beer whatever street art fap.</p>--%>
            <%--                <button class="user_registered-login" id="login-button">Login</button>--%>
            <%--            </div>--%>
        </div>

        <div class="user_options-forms" id="user_options-forms">
            <div class="user_forms-login">
                <h2 class="forms_title">Reset password</h2>
                <form class="forms_form"
                      method="POST"
                      action="<%= request.getServletContext().getContextPath()%>/reset">
                    <fieldset class="forms_fieldset">
                        <div class="forms_field">
                            <%--                            <input type="email" placeholder="Email" class="forms_field-input" required autofocus />--%>
                            <input type="password" id="newPassword"
                                   placeholder="New password goes here"
                                   class="forms_field-input"
                                   name="newPassword"
                                   required
                                   autofocus
                                   oninput="validatePasswords()"/>
                        </div>
                        <div id="newPasswordMismatch" class="text-danger" style="display: none;">Passwords do not
                            match.
                        </div>
                        <div class="forms_field">
                            <%--                            <input type="password" placeholder="Password" class="forms_field-input" required/>--%>
                            <input type="password" id="newPasswordRepeat"
                                   placeholder="Repeat new password"
                                   class="forms_field-input"
                                   required
                                   oninput="validatePasswords()"/>
                        </div>
                        <div id="newPasswordRepeatMismatch" class="text-danger" style="display: none;">Passwords do not match.</div>
                    </fieldset>
                    <div class="forms_buttons justify-content-center">
                        <input
                                class="forms_buttons-action"
                                type="submit"
                                name="btnSubmit"
                                value="Reset password"
                        />
                    </div>
                </form>
            </div>
            <%--            <div class="user_forms-signup">--%>
            <%--                <h2 class="forms_title">Sign Up</h2>--%>
            <%--                <form class="forms_form">--%>
            <%--                    <fieldset class="forms_fieldset">--%>
            <%--                        <div class="forms_field">--%>
            <%--                            <input type="text" placeholder="Full Name" class="forms_field-input" required />--%>
            <%--                        </div>--%>
            <%--                        <div class="forms_field">--%>
            <%--                            <input type="email" placeholder="Email" class="forms_field-input" required />--%>
            <%--                        </div>--%>
            <%--                        <div class="forms_field">--%>
            <%--                            <input type="password" placeholder="Password" class="forms_field-input" required />--%>
            <%--                        </div>--%>
            <%--                    </fieldset>--%>
            <%--                    <div class="forms_buttons">--%>
            <%--                        <input type="submit" value="Sign up" class="forms_buttons-action">--%>
            <%--                    </div>--%>
            <%--                </form>--%>
            <%--            </div>--%>
        </div>
    </div>
</section>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/login.js"></script>
<script src="js/password-validate.js"></script>
</body>
</html>

