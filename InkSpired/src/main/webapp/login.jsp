<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign in</title>
        <link rel="stylesheet" href="css/button.css">
    </head>
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
                    <form class="d-flex pe-3" method="POST"
                          action="<%= request.getServletContext().getContextPath()%>/register">
                        <button class="btn btn-outline-dark"
                                type="submit"
                                name="btnRegister"
                                value="Register"
                        >
                            <i class="bi-person-fill"></i>
                            Register
                        </button>
                    </form>

                    <form class="d-flex" method="POST"
                          action="<%= request.getServletContext().getContextPath()%>/admin">
                        <button class="btn btn-outline-dark"
                                type="submit"
                                name="btnAdmin"
                                value="Admin"
                        >
                            <i class="bi-person-fill"></i>
                            Admin
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
                                style="border-radius: 15px"
                        >
                            <div class="card-body p-4 p-md-5">
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Login</h3>
                                <form
                                        method="POST"
                                        action="<%= request.getServletContext().getContextPath()%>/login"
                                >
                                    <div class="row">
                                        <div class="col-md-12 mb-4">
                                            <div class="form-outline">
                                                <input
                                                        type="text"
                                                        id="userName"
                                                        class="form-control form-control-lg"
                                                        name="username"
                                                />
                                                <label class="form-label" for="userName"
                                                >User Name</label
                                                >
                                            </div>
                                            <span id="errorusername" class="text-danger"></span>
                                        </div>

                                        <div class="col-md-12 mb-4">
                                            <div class="form-outline">
                                                <input
                                                        type="password"
                                                        id="password"
                                                        class="form-control form-control-lg"
                                                        name="password"
                                                />
                                                <label class="form-label" for="password"
                                                >Password</label
                                                >
                                            </div>
                                            <span id="errorpassword" class="text-danger"></span>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-8">
                                                <div class="form-check-inline">
                                                    <input type="checkbox" class="btn-check" id="rememberMe"
                                                           autocomplete="off"
                                                           name="remembermecheckbox">
                                                    <label class="btn btn-outline-dark btn-circle me-1"
                                                           for="rememberMe"></label>
                                                    <label class="form-check-label fw-bolder" for="rememberMe">
                                                        Remember me
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-8">
                                                <div class="d-flex justify-content-end">
                                                    <label class="form-check-label fw-bolder">
                                                        <button type="button" class="btn btn-outline-dark"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#emailVerification">
                                                            Forgot password?
                                                        </button>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-4">
                                            <input
                                                    class="btn btn-outline-dark btn-lg"
                                                    type="submit"
                                                    name="btnSubmit"
                                                    value="Submit"
                                                    disabled
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
        <!-- Modal -->
        <div class="modal fade" id="emailVerification" tabindex="-1" aria-labelledby="exampleModalLabel"
             data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header gradient-custom">
                        <h5 class="modal-title" id="exampleModalLabel">
                            <a href="reset.jsp">
                                Forgot password?
                            </a>
                        </h5>
                        <button type="button" class="btn-close btn-outline-light" data-bs-dismiss="modal"
                                aria-label="Close"></button>
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
                                    <input type="email" id="emailAddress" class="form-control form-control-lg"
                                           placeholder="Your email goes here!" required/>
                                    <div class="invalid-feedback">
                                        Invalid email, please enter a valid email address.
                                    </div>
                                    <div class="valid-feedback">
                                        Correct email, a verification code has been sent. Please check your email.
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <input type="text" id="verificationCode" class="form-control form-control-lg"
                                           placeholder="Verification code goes here!" required style="display: none"/>
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
                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" id="sendVerificationCode" class="btn btn-outline-dark"
                                onclick="sendVerificationCode()">Send verification code
                        </button>
                        <div class="btn-group" style="display: none" id="buttonGroup">
                            <button type="button" id="resendVerificationCode" class="btn btn-outline-dark"
                                    onclick="resendVerificationCode()" style="display: none">Resend code
                            </button>
                            <button type="button" id="verifyVerificationCode" class="btn btn-outline-dark"
                                    onclick="verifyVerificationCode()" style="display: none">Verify code
                            </button>
                        </div>
                        <form action="<%= request.getServletContext().getContextPath() %>/reset"
                              id="redirectButtonGroup" style="display: none">
                            <button type="submit" id="redirectButton" class="btn btn-outline-dark"
                                    style="display: none">Reset password
                            </button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <!-- Footer-->
        <%@include file="footer.jsp" %>
    </body>
    <script src="js/password-forgot.js"></script>
    <script src="js/Validation/LoginValidation.js"></script>
</html>
