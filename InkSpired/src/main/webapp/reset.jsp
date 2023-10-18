<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot password</title>
    <link rel="stylesheet" href="css/button.css">
</head>
<style>
    .gradient-custom {
        background: #f093fb;

        background: -webkit-linear-gradient(
                to bottom right,
                rgba(240, 147, 251, 1),
                rgba(245, 87, 108, 1)
        );

        background: linear-gradient(
                to bottom right,
                rgba(240, 147, 251, 1),
                rgba(245, 87, 108, 1)
        );
    }

    .card-registration .select-input.form-control[readonly]:not([disabled]) {
        font-size: 1rem;
        line-height: 2.15;
        padding-left: 0.75em;
        padding-right: 0.75em;
    }

    .card-registration .select-arrow {
        top: 13px;
    }
</style>
<%@include file="interface.jsp" %>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="<%= request.getServletContext().getContextPath()%>/">Inkspired Books</a>
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div
                class="collapse navbar-collapse justify-content-end"
                id="navbarSupportedContent"
        >
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
                <div
                        class="card shadow-2-strong card-registration"
                        style=""
                >
                    <div class="card-body p-4 p-md-5">
                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Reset password</h3>
                        <form
                                method="POST"
                                action="<%= request.getServletContext().getContextPath()%>/reset"
                        >
                            <div class="row">
                                <div class="col-md-12 mb-4">
                                    <div class="form-outline">
                                        <div class="input-group-lg">
                                            <input type="password" id="newPassword"
                                                   placeholder="New password goes here"
                                                   class="form-control form-control-lg"
                                                   name="newPassword"
                                                   required
                                                   oninput="validatePasswords()"/>
                                        </div>
                                    </div>
                                    <div id="newPasswordMismatch" class="text-danger" style="display: none;">Passwords do not match.</div>
                                </div>
                                <div class="col-md-12 mb-4 mt-4">
                                    <div class="form-outline">
                                        <div class="input-group-lg">
                                            <input type="password" id="newPasswordRepeat"
                                                   placeholder="Repeat new password"
                                                   class="form-control form-control-lg"
                                                   required
                                                   oninput="validatePasswords()"/>
                                        </div>
                                    </div>
                                    <div id="newPasswordRepeatMismatch" class="text-danger" style="display: none;">Passwords do not match.</div>
                                </div>
                                <div class="mt-4">
                                    <input
                                            class="btn btn-outline-dark btn-lg"
                                            type="submit"
<%--                                            type="button"--%>
                                            name="btnSubmit"
                                            value="Reset password"
<%--                                            onclick="redirectToResetController()"--%>
                                    />
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
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">
            Copyright INKSPIRED BOOKS 2023, always reserved.
        </p>
    </div>
</footer>
<script src="js/password-validate.js"></script>
</body>
</html>
