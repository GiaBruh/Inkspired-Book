<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign up</title>
    </head>
    <style>
        .gradient-custom {
            background: #f093fb;

            background: -webkit-linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1));

            background: linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1))
        }

        .card-registration .select-input.form-control[readonly]:not([disabled]) {
            font-size: 1rem;
            line-height: 2.15;
            padding-left: .75em;
            padding-right: .75em;
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
                                <form>

                                    <div class="row">
                                        <div class="col-md-12 mb-4">

                                            <div class="form-outline">
                                                <input type="text" id="username" class="form-control form-control-lg"
                                                       name="username"/>
                                                <label class="form-label" for="username">User Name</label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-4">

                                            <div class="form-outline">
                                                <input type="password" id="password"
                                                       class="form-control form-control-lg"
                                                       name="password"/>
                                                <label class="form-label" for="password">Password</label>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-4">

                                            <div class="form-outline">
                                                <input type="text" id="fullName" class="form-control form-control-lg"/>
                                                <label class="form-label" for="fullName">Full Name</label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4 d-flex align-items-center">

                                                <div class="form-outline datepicker w-100">
                                                    <input type="text" class="form-control form-control-lg"
                                                           id="birthdayDate"/>
                                                    <label for="birthdayDate" class="form-label">Birthdate</label>
                                                </div>

                                            </div>
                                            <div class="col-md-6 mb-4">

                                                <h6 class="mb-2 pb-1">Gender: </h6>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           name="inlineRadioOptions" id="femaleGender"
                                                           value="option1" checked/>
                                                    <label class="form-check-label" for="femaleGender">Female</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           name="inlineRadioOptions" id="maleGender"
                                                           value="option2"/>
                                                    <label class="form-check-label" for="maleGender">Male</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                           name="inlineRadioOptions" id="otherGender"
                                                           value="option3"/>
                                                    <label class="form-check-label" for="otherGender">Other</label>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4 pb-2">

                                                <div class="form-outline">
                                                    <input type="email" id="emailAddress"
                                                           class="form-control form-control-lg"/>
                                                    <label class="form-label" for="emailAddress">Email</label>
                                                </div>

                                            </div>
                                            <div class="col-md-6 mb-4 pb-2">

                                                <div class="form-outline">
                                                    <input type="tel" id="phoneNumber"
                                                           class="form-control form-control-lg"/>
                                                    <label class="form-label" for="phoneNumber">Phone Number</label>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="mt-4 pt-2">
                                            <input class="btn btn-outline-dark btn-lg" type="submit" value="Submit"/>
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
            <div class="container"><p class="m-0 text-center text-white">Copyright INKSPIRED BOOKS 2023, always
                reserved.</p></div>
        </footer>
    </body>
</html>