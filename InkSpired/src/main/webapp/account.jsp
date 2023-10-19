<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Homepage</title>
    <link rel="stylesheet" href="css/dropdown.css">
    <link rel="stylesheet" href="css/background.css">
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

        a {
            text-decoration: none;
        }

        [id^=infoItem] {
            padding-top: 15px;
            padding-bottom: 16px;
            display: flex;
            align-items: center;
        }

        [id^=infoItem]:hover {
            background-color: #F6F6F6;
        }

        [id^=infoItem]:hover>input:disabled {
            background-color: #F6F6F6;
        }

        [id^=infoItem]:active {
            background-color: #E6E6E6;
        }

        [id^=infoItem]> :first-child {
            font-size: 12px;
            font-weight: 500;
            color: #444746;
        }

        [id^=infoItem]> :nth-child(2) {
            font-size: 16px;
            font-weight: 500;
        }

        [id^=infoItem]:not(:first-child)> :nth-child(3) {
            float: left;
        }

        img {
            border-radius: 50%;
            width: 50%;
        }
    </style>
</head>
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
            <div class="dropdown">
                <button
                        class="btn btn-outline-dark dropdown-toggle"
                        type="button"
                        id="dropdownMenuButton"
                        data-mdb-toggle="dropdown"
                        aria-expanded="false"
                >
                    Account
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="item-dropdown" href="#">User Information</a></li>
                    <li><a class="item-dropdown" href="#">Order History</a></li>
                    <li><a class="item-dropdown" href="#">Review History</a></li>
                    <li>
                        <div class="dropdown-divider"></div>
                    </li>
                    <li><a class="item-dropdown" href="#">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Account page</h1>
        </div>
    </div>
</header>
<!-- Product section-->
<section class="gradient-custom">
    <div class="container py-4 h-100">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-12 col-lg-9 col-xl-7">
                <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                    <div class="card-body p-4 p-md-5">
                        <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Account information</h3>
                        <form>
                            <div class="row" id="infoItem_Picture">
                                <p class="mb-0 title col-md-3">Profile picture</p>
                                <input class="mb-0 description col-md-6" type="text" id="info" class="form-control"
                                       name="picture" placeholder="You're looking cute today (˵ •̀ ᴗ - ˵ ) ✧"
                                       disabled />
                                <div class="col-md-1">
                                    &nbsp;
                                </div>
                                <img class="col-md-2" src="https://dummyimage.com/60x60/000/fff" alt="profileImage">
                            </div>
                            <hr class="my-0">
                            <div class="row" id="infoItem_Name">
                                <p class="mb-0 title col-md-3">Name</p>
                                <input class="mb-0 description col-md-6" type="text" id="info_fullname"
                                       class="form-control" name="fullname" placeholder="Beauti" disabled />
                                <div class="col-md-2">
                                    &nbsp;
                                </div>
                                <i class="bi bi-chevron-right col-md-1"></i>
                            </div>
                            <hr class="my-0">
                            <div class="row" id="infoItem_Gender">
                                <p class="mb-0 title col-md-3">Gender</p>
                                <input class="mb-0 description col-md-6" type="text" id="info_gender"
                                       class="form-control" name="gender" placeholder="No worries (⁄ ⁄•⁄ω⁄•⁄ ⁄)"
                                       disabled />
                                <div class="col-md-2">
                                    &nbsp;
                                </div>
                                <i class="bi bi-chevron-right col-md-1"></i>
                            </div>
                            <hr class="my-0">
                            <div class="row" id="infoItem_Birthday">
                                <p class="mb-0 title col-md-3">Birthday</p>
                                <input class="mb-0 description col-md-6" type="text" id="info_birthday"
                                       class="form-control" name="birthday" placeholder="You meant our date?"
                                       disabled />
                                <div class="col-md-2">
                                    &nbsp;
                                </div>
                                <i class="bi bi-chevron-right col-md-1"></i>
                            </div>
                            <hr class="my-0">
                            <div class="row" id="infoItem_Email">
                                <p class="mb-0 title col-md-3">Email</p>
                                <input class="mb-0 description col-md-6" type="text" id="info_email"
                                       class="form-control" name="email" placeholder="beauti@gmail.com" disabled />
                                <div class="col-md-2">
                                    &nbsp;
                                </div>
                                <i class="bi bi-chevron-right col-md-1"></i>
                            </div>
                            <hr class="my-0">
                            <div class="row" id="infoItem_Phone">
                                <p class="mb-0 title col-md-3">Phone number</p>
                                <input class="mb-0 description col-md-6" type="text" id="info_phone"
                                       class="form-control" name="phone" placeholder="This is a number" disabled />
                                <div class="col-md-2">
                                    &nbsp;
                                </div>
                                <i class="bi bi-chevron-right col-md-1"></i>
                            </div>
                            <hr class="my-0">
                            <div class="row" id="infoItem_Address">
                                <p class="mb-0 title col-md-3">Address ID</p>
                                <input class="mb-0 description col-md-6" type="text" id="info_address"
                                       class="form-control" name="address" placeholder="My place <( ⸝⸝•̀ v •́⸝⸝)>"
                                       disabled />
                                <div class="col-md-2">
                                    &nbsp;
                                </div>
                                <i class="bi bi-chevron-right col-md-1"></i>
                            </div>
                            <hr class="my-0">
                            <div class="row" id="infoItem_Username">
                                <p class="mb-0 title col-md-3">Username</p>
                                <input class="mb-0 description col-md-6" type="text" id="info_username"
                                       class="form-control" name="username" placeholder="ItsBeauti" disabled />
                                <div class="col-md-2">
                                    &nbsp;
                                </div>
                                <i class="bi bi-chevron-right col-md-1"></i>
                            </div>
                            <hr class="my-0">
                            <div class="row" id="infoItem_Password">
                                <p class="mb-0 title col-md-3">Password</p>
                                <input class="mb-0 description col-md-6" type="text" id="info_password"
                                       class="form-control" name="password"
                                       placeholder="This is a secret between us <( ⸝⸝•̀ - •́⸝⸝)>" disabled />
                                <div class="col-md-2">
                                    &nbsp;
                                </div>
                                <i class="bi bi-chevron-right col-md-1"></i>
                            </div>
                            <div class="d-flex">
                                <div class="mt-4 me-3 pt-2">
                                    <input class="btn btn-outline-dark btn-lg" type="submit" value="Submit" />
                                </div>
                            </div>
                        </form>
                        <div class="mt-4 pt-2">
                            <button class="btn btn-outline-dark btn-lg" onclick="toggleEditing()">Edit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark" id="footer">
    <div class="container"><p class="m-0 text-center text-white">Copyright INKSPIRED BOOKS 2023, always reserved.</p>
    </div>
</footer>
<script src="js/edit.js"></script>
</body>
</html>