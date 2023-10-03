<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign in</title>
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
        <a class="navbar-brand" href="index.jsp">Inkspired Books</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <form class="d-flex pe-lg-3">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
            </form>
            <form class="d-flex">
                <button class="btn btn-outline-dark" type="submit">
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
                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Sign in</h3>
                        <form>

                            <div class="row">
                                <div class="col-md-12 mb-4">

                                    <div class="form-outline">
                                        <input type="text" id="userName" class="form-control form-control-lg"/>
                                        <label class="form-label" for="userName">User Name</label>
                                    </div>
                                </div>

                                <div class="col-md-12 mb-4">

                                    <div class="form-outline">
                                        <input type="password" class="form-control form-control-lg" id="password"/>
                                        <label for="password" class="form-label">Password</label>
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
    <div class="container"><p class="m-0 text-center text-white">Copyright INKSPIRED BOOKS 2023, always reserved.</p>
    </div>
</footer>
</body>
</html>