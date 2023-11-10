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

                        <img src="${pageContext.request.contextPath}/assets/images/inspired_admin_round.jpg" class="img-fluid login-logo mx-auto d-block" alt="Admin" />
                        <h2 class="text-center fw-light mb-1">Log In</h2>
                        <div class="mb-3">
                            <label class="form-label">Your Username</label>
                            <input type="text" class="form-control" name="username" placeholder="Enter your username" />
                            <span id="errorusername" class="text-danger"></span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Your Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Enter password" />
                            <span id="errorpassword" class="text-danger"></span>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="form-check m-0">
                                <a
                                   class="text-blue text-decoration-underline"
                                   data-bs-toggle="modal" data-bs-target="#emailVerification">Forgot password?</a>
                            </div>
                        </div>
                        <div class="d-grid pt-2 pb-3 mt-4">
                            <p class="text-center pb-2 text-danger" name="errorLogin">
                                <span>${requestScope.errorMessage}</span>
                            </p>
                            <button type="submit" class="btn btn-lg btn-primary" name="loginSubmit" value="Submit" disabled>
                                Login
                            </button>
                        </div>
<%--                        <div class="text-center py-3">or Login with</div>--%>
<%--                        <div class="d-flex gap-2 justify-content-center">--%>
<%--                            <button type="submit" class="btn btn-outline-danger">--%>
<%--                                <i class="bi bi-google me-2"></i>Gmail--%>
<%--                            </button>--%>
<%--                            <button type="submit" class="btn btn-outline-info">--%>
<%--                                <i class="bi bi-facebook me-2"></i>Facebook--%>
<%--                            </button>--%>
<%--                        </div>--%>

                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<!-- Container end -->
<!-- Modal -->
<div class="modal fade" id="emailVerification" tabindex="-1" aria-labelledby="exampleModalLabel" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header gradient-custom">
                <h5 class="modal-title" id="exampleModalLabel">
                    <a class="text-primary text-decoration-none" href="admin-reset.jsp">
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
                <div class="alert alert-success text-center" id="success" style="display:none;">
                    <strong>Success!</strong> Verification code has been sent to your email.
                </div>
                <div class="alert alert-danger text-center" id="fail" style="display:none;">
                    <strong>Fail!</strong> Verification code has not been sent to your email.
                </div>
                <button type="button" disabled class="btn btn-outline-dark" id="timer">Time left:</button>
                <button type="button" id="sendVerificationCode" class="btn btn-outline-dark" onclick="sendVerificationCode()" disabled>Send verification code</button>
                <div class="btn-group" style="display: none" id="buttonGroup">
                    <button type="button" id="resendVerificationCode" class="btn btn-outline-dark" onclick="resendVerificationCode()" style="display: none">Resend code</button>
                    <button type="button" id="verifyVerificationCode" class="btn btn-outline-dark" onclick="verifyVerificationCode()" style="display: none">Verify code</button>
                </div>
                <form action="<%= request.getServletContext().getContextPath() %>/admin/reset" id="redirectButtonGroup" style="display: none">
                    <button type="submit" id="redirectButton" class="btn btn-outline-dark" style="display: none">Reset password</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    let username = '';
    let password = '';
    let email = '';

    let validusername = false;
    let validpassword = false;

    const usernameregex = /[\s!@#\$%\^\&*\)\(+=._-]+/;
    const passwordregex = /\s+/;
    const emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    $(document).ready(function () {
        $("input[name='username']").on({
            keyup: function () {
                username = $("input[name='username']").val();

                if (username.length < 1 || username.length > 100) {
                    validusername = false;
                    $("#errorusername").html("The username can only be from 1 to 100 characters.");
                } else if (usernameregex.test(username)) {
                    validusername = false;
                    $("#errorusername").html("The username cannot contains special characters.");
                } else {
                    validusername = true;
                    $("#errorusername").html("");
                }
            },
            change: function () {
                username = $("input[name='username']").val();

                if (username.length < 1 || username.length > 100) {
                    validusername = false;
                    $("#errorusername").html("The username can only be from 1 to 100 characters.");
                } else if (usernameregex.test(username)) {
                    validusername = false;
                    $("#errorusername").html("The username cannot contains special characters.");
                } else {
                    validusername = true;
                    $("#errorusername").html("");
                }
            }
        });

        $("input[name='password']").on({
            keyup: function () {
                password = $("input[name='password']").val();

                if (passwordregex.test(password)) {
                    validpassword = false;
                    $("#errorpassword").html("The password cannot contains space characters.");
                } else if (password.length < 3) {
                    validpassword = false;
                    $("#errorpassword").html("The password must be greater than 3 characters.");
                } else {
                    validpassword = true;
                    $("#errorpassword").html("");
                }
            }
        });

        $("input[name='username'], input[name='password']").on("keyup", function() {
            if (validusername && validpassword) {
                $("input[name='btnSubmit']").removeAttr('disabled');
                $("button[name='loginSubmit']").removeAttr('disabled');
                $("p[name='errorLogin']").hide();
            } else {
                $("input[name='btnSubmit']").attr('disabled', '');
                $("button[name='loginSubmit']").attr('disabled', '');
            }
        });

        $("input[name='username'], input[name='fullname']").change(function() {
            if (validusername && validpassword) {
                $("input[name='btnSubmit']").removeAttr('disabled');
            } else {
                $("input[name='btnSubmit']").attr('disabled', '');
            }
        });

        <!--FORGOT PASSWORD-->
        $("input[name='changePassEmail']").on({
            'keyup change': function () {
                email = $("input[name='changePassEmail']").val();
                if (!emailRegex.test(email)) {
                    $("#errorFeed").addClass("d-block");
                    $("button[id='sendVerificationCode']").attr('disabled', '');
                } else {
                    $("#errorFeed").removeClass("d-block");
                    $("button[id='sendVerificationCode']").removeAttr('disabled');
                }
            }
        });


    });
</script>
<script>let lastResendTime = 0;
let resendTimeout = 30000;
let status = null;

function sendVerificationCode() {
    const emailAddress = document.getElementById("emailAddress").value;
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/InkSpired/admin/forgot?email=" + encodeURIComponent(emailAddress), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Handle the response from the controller (if needed)
                disableResendButton(resendTimeout);
                // console.log("Verification code sent successfully", xhr.responseText);
                status = xhr.responseText;
                console.log("Status: ", status);
                if(status !== "Email does not exist."){
                    document.getElementById("success").style.display = "block";
                    let count = 0;
                    // count to 3 then hide the success message
                    const timer = setInterval(function () {
                        if (count < 3) {
                            count++;
                            console.log("Count: ", count);
                        } else {
                            document.getElementById("success").style.display = "none";
                            clearInterval(timer);
                        }
                    }, 1000);
                    console.log("Yes");
                    var annoy = openSubmit();
                } else {
                    document.getElementById("fail").style.display = "block";
                    let count = 0;
                    // count to 3 then hide the success message
                    const timer = setInterval(function () {
                        if (count < 3) {
                            count++;
                            console.log("Count: ", count);
                        } else {
                            document.getElementById("fail").style.display = "none";
                            clearInterval(timer);
                        }
                    }, 1000);
                    console.log("No");
                }
            } else {
                console.error("Error sending verification code");
                document.getElementById("verificationCode").style.display = "none";
                document.getElementById("buttonGroup").style.display = "none";
                document.getElementById("sendVerificationCode").style.display = "block";
            }
        }
    };
    xhr.send();
    if (status === "Email does not exist.") {
        document.getElementById("verificationCode").style.display = "none";
        document.getElementById("buttonGroup").style.display = "none";
        document.getElementById("sendVerificationCode").style.display = "block";
    }
}

function openSubmit(){
    // show the verification code input
    document.getElementById("verificationCode").style.display = "block";
    // hide the send verification code button
    document.getElementById("sendVerificationCode").style.display = "none";
    // show the button group
    document.getElementById("buttonGroup").style.display = "flex";
    // show the resend verification code button
    document.getElementById("resendVerificationCode").style.display = "block";
    // show the verify verification code button
    document.getElementById("verifyVerificationCode").style.display = "block"
    return 1;
}

function resendVerificationCode() {
    const currentTime = Date.now();
    if (currentTime - lastResendTime < resendTimeout) {
        console.log("Resend button is disabled. Please wait before resending.");
        return;
    }
    lastResendTime = currentTime;
    // Call the sendVerificationCode function to resend the verification code
    sendVerificationCode();
}

//verify the verification code
function verifyVerificationCode() {
    const verificationCode = document.getElementById("verificationCode").value;
    const redirectButton = document.getElementById("redirectButton");
    const redirectButtonGroup = document.getElementById("redirectButtonGroup");
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/InkSpired/forgot?code=" + encodeURIComponent(verificationCode), true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Handle the response from the controller (if needed)
                // console.log("Verify starts", xhr.responseText);
            } else {
                console.error("Error verifying verification code");
            }
        }
        if (xhr.responseText === "Correct verification code.") {
            document.getElementById("buttonGroup").style.display = "none";
            redirectButtonGroup.style.display = "block";
            redirectButton.style.display = "block";
        }
    };
    xhr.send();
}

function disableResendButton(timeout) {
    // Disable the resend button for the specified timeout duration
    const resendButton = document.getElementById("resendVerificationCode");
    const sendButton = document.getElementById("sendVerificationCode");
    if (resendButton) {
        sendButton.disabled = true;
        resendButton.disabled = true;
        setTimeout(function () {
            resendButton.disabled = false;
            sendButton.disabled = false;
        }, timeout);

        // Print out the remaining time in the console
        const timer = setInterval(function () {
            if (timeout > 0) {
                console.log("Remaining time:", timeout / 1000, "seconds");
                // update the timer
                // document.getElementById("timer").style.display = "block";
                document.getElementById("timer").innerHTML = "Time left: " + String (timeout / 1000);
                timeout -= 1000;
            } else {
                // document.getElementById("timer").style.display = "none";
                document.getElementById("timer").innerHTML = "Time left: ";
                clearInterval(timer);
            }
        }, 1000);
    }
}</script>
</html>