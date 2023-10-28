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

            <form action="<%=request.getContextPath()%>/admin" method="post" class="my-5">
                <!-- modify border white  -->
                <div class="">
                    <div class="login-form">
                        <a href="index.html" class="mb-4 d-flex">
<%--                            <img src="${pageContext.request.contextPath}/assets/images/logo.svg" class="img-fluid login-logo" alt="Admin" />--%>
                        </a>
                        <h5 class="fw-light mb-5">Sign in to access dashboard.</h5>
                        <div class="mb-3">
                            <label class="form-label">Your Username</label>
                            <input type="text" class="form-control" name="username" placeholder="Enter your username" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Your Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Enter password" />
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="form-check m-0">
                                <a href="forgot-password.html"
                                   class="text-blue text-decoration-underline">Forget my password?</a>
                            </div>

                        </div>
                        <div class="d-grid py-3 mt-4">
                            <button type="submit" class="btn btn-lg btn-primary" name="loginSubmit" value="Submit">
                            <!-- <button type="submit" name="action" value="login" class="btn btn-lg btn-primary"> -->
                                Login
                            </button>

                        </div>
                        <div class="text-center py-3">or Login with</div>
                        <div class="d-flex gap-2 justify-content-center">
                            <button type="submit" class="btn btn-outline-danger">
                                <i class="bi bi-google me-2"></i>Gmail
                            </button>
                            <button type="submit" class="btn btn-outline-info">
                                <i class="bi bi-facebook me-2"></i>Facebook
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

</html>