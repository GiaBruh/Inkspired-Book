<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin-login</title>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id"
          content="723594818439-neblhecb3ecjjms5fc5h0np8pj1kbr1k.apps.googleusercontent.com">
    <!-- Meta name -->
    <meta name="description" content="Admin Dashboards Login" />
    <meta name="author" content="Admin" />

    <!-- Meta property-->
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <meta property="og:title" content="Admin Login">
    <meta property="og:description" content="Login for Admin Dashboards">
    <meta property="og:type" content="Website">
    <meta property="og:site_name" content="Admin Login">



    <!-- *************
            ************ CSS Files *************
                                     ************* -->


    <!-- using include file admin-interface -->
    <%@include file="jsp-contribute/admin-interface.jsp" %>

    <!-- style background color to sit behind the form -->
    <style>
        body {
            background-color: #4070d9;
        }
    </style>
    <!-- style set my form is white include border-->
    <style>
        .login-form {
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 0.5rem;
            padding: 2rem;
        }
    </style>


</head>

<body>
<!-- Container start -->
<div class="container">
    <div class="row justify-content-center">
        <div class="col-xl-4 col-lg-5 col-sm-6 col-12">

            <form action="<%=request.getContextPath()%>/admin/reset" method="post" class="my-5">
                <!-- modify border white  -->
                <div class="">
                    <div class="login-form">

                        <img src="${pageContext.request.contextPath}/assets/images/inspired_admin_round.jpg" class="img-fluid login-logo mx-auto d-block" alt="Admin" />
                        <h2 class="text-center fw-light mb-1">Reset Password</h2>
                        <div class="mb-3">
                            <label class="form-label">Your new password</label>
                            <input type="password" id="newPassword"
                                   placeholder="New password goes here"
                                   class="form-control form-control-lg"
                                   name="newPassword"
                                   required
                                   oninput="validatePasswords()"/>
                            <div id="newPasswordMismatch" class="text-danger" style="display: none;">Passwords do not match.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Please repeat your password</label>
                            <input type="password" id="newPasswordRepeat"
                                   placeholder="Repeat new password"
                                   class="form-control form-control-lg"
                                   required
                                   oninput="validatePasswords()"/>
                            <div id="newPasswordRepeatMismatch" class="text-danger" style="display: none;">Passwords do not match.</div>
                        </div>
                        <div class="d-grid py-3 mt-4">
                            <button type="submit" class="btn btn-lg btn-primary" name="btnSubmit" value="Submit">
                                Login
                            </button>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<!-- Container end -->
</body>
<script src="js/admin-password-validate.js"></script>
</html>