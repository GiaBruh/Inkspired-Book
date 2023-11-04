<%--
  Created by IntelliJ IDEA.
  User: giabuu
  Date: 03/11/2023
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>InkSpired</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <!-- Favicon -->
        <%--    <link href="img/favicon.ico" rel="icon">--%>

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>


        <%--        <section class="gradient-custom">--%>
        <%--            <div class="container py-4 h-100">--%>
        <%--                <div class="row d-flex align-items-center pt-3 pb-3 justify-content-center align-items-center h-100">--%>
        <%--                    <div class="col-12 col-lg-11 col-xl-9">--%>
        <%--                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">--%>
        <%--                            <div class="card-body p-4 p-md-5"--%>
        <%--                                 style="box-shadow: 5px 5px 10px 2px rgba(40, 97, 255, 0.3)">--%>
        <%--                                <h3 class="mb-4 pb-1 pb-md-0 mb-md-5">Admin information</h3>--%>
        <%--                                <form method="POST" action="<%=request.getServletContext().getContextPath()%>/admin"--%>
        <%--                                      enctype="multipart/form-data">--%>
        <%--                                    <div class="row d-flex align-items-center pt-3 pb-3 d-flex align-items-center pb-2"--%>
        <%--                                         id="infoItem_Picture">--%>
        <%--                                        <div class="mb-0 title col-md-3 h6 h6">Profile picture</div>--%>
        <%--                                        <div class="mb-0 col-md-6 px-0 text-muted" id="info_image">--%>
        <%--                                            A profile picture helps personalise your account--%>
        <%--                                        </div>--%>
        <%--                                        <div class="col-md-1">--%>
        <%--                                            &nbsp;--%>
        <%--                                        </div>--%>
        <%--                                        <input type="file" id="img" name="upload" hidden disabled>--%>
        <%--                                        <label for="img" class="col-md-2 h100">--%>
        <%--                                            <img id="profileImage" width="100" height="100" class="rounded-circle"--%>
        <%--                                                 style="object-fit: cover"--%>
        <%--                                            &lt;%&ndash;                                                 src="https://dummyimage.com/100x100/000/fff" alt="profileImage">&ndash;%&gt;--%>
        <%--                                                 src=""--%>
        <%--                                                 alt="${requestScope.ADMININFO.getUsername()} photo">--%>
        <%--                                            &lt;%&ndash;                                            <input name="image" value="${sessionScope.userInfo.getUser_image()}"&ndash;%&gt;--%>
        <%--                                            &lt;%&ndash;                                                   hidden/>&ndash;%&gt;--%>
        <%--                                        </label>--%>
        <%--                                        &lt;%&ndash;                                        <c:choose>&ndash;%&gt;--%>
        <%--                                        &lt;%&ndash;                                            <c:when test="${sessionScope.FILESIZEEXCEEDED == true}">&ndash;%&gt;--%>
        <%--                                        &lt;%&ndash;                                                <span id="errorimage" class="text-danger">The photo uploaded must be less than 5MB.</span>&ndash;%&gt;--%>
        <%--                                        &lt;%&ndash;                                            </c:when>&ndash;%&gt;--%>
        <%--                                        &lt;%&ndash;                                            <c:otherwise>&ndash;%&gt;--%>
        <%--                                        &lt;%&ndash;                                                <span id="errorimage" class="text-danger"></span>&ndash;%&gt;--%>
        <%--                                        &lt;%&ndash;                                            </c:otherwise>&ndash;%&gt;--%>
        <%--                                        &lt;%&ndash;                                        </c:choose>&ndash;%&gt;--%>
        <%--                                    </div>--%>
        <%--                                    <hr class="my-0">--%>
        <%--                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Username">--%>
        <%--                                        <label for="info_username" class="mb-0 title col-md-3 h6">Username</label>--%>
        <%--                                        <input class="mb-0 description col-md-6" type="text" id="info_username"--%>
        <%--                                               name="username" value="${requestScope.ADMININFO.getUsername()}"--%>
        <%--                                               placeholder="Username" disabled readonly/>--%>
        <%--                                        <div class="col-md-3">--%>
        <%--                                            &nbsp;--%>
        <%--                                        </div>--%>
        <%--                                    </div>--%>
        <%--                                    <hr class="my-0">--%>
        <%--                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Email">--%>
        <%--                                        <label for="info_email" class="mb-0 title col-md-3 h6">Email</label>--%>
        <%--                                        <input class="mb-0 description col-md-6" type="text" id="info_email"--%>
        <%--                                               name="email" value="${requestScope.ADMININFO.getEmailAddress()}"--%>
        <%--                                               placeholder="Email" disabled readonly/>--%>
        <%--                                        <div class="col-md-3">--%>
        <%--                                            &nbsp;--%>
        <%--                                        </div>--%>
        <%--                                    </div>--%>
        <%--                                    <hr class="my-0">--%>
        <%--                                    <div class="row d-flex align-items-center pt-3 pb-3" id="infoItem_Name">--%>
        <%--                                        <label for="info_fullName" class="mb-0 title col-md-3 h6">Full Name</label>--%>
        <%--                                        <input class="mb-0 description col-md-6" type="text" id="info_fullName"--%>
        <%--                                               name="fullname" value="${requestScope.ADMININFO.getFullName()}"--%>
        <%--                                               placeholder="Full name" disabled/>--%>
        <%--                                        <div class="col-md-3">--%>
        <%--                                            &nbsp;--%>
        <%--                                        </div>--%>
        <%--                                        <span id="errorfullname" class="text-danger"></span>--%>
        <%--                                    </div>--%>


        <%--                                    <div class="row d-flex">--%>
        <%--                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 pe-0 me-md-0">--%>
        <%--                                            <input class="submit btn btn-primary btn-outline-dark btn-lg" type="submit"--%>
        <%--                                                   value="Submit" disabled/>--%>
        <%--                                        </div>--%>
        <%--                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 px-0">--%>
        <%--                                            <button type="button" class="edit btn btn-primary btn-outline-dark btn-lg"--%>
        <%--                                                    onclick="toggleEditing()">Edit--%>
        <%--                                            </button>--%>
        <%--                                        </div>--%>
        <%--                                        <div class="col-md-2 col-sm-6 mt-4 pt-2 px-0">--%>
        <%--                                            <button type="reset" class="cancel btn btn-primary btn-outline-dark btn-lg"--%>
        <%--                                                    id="cancel"--%>
        <%--                                                    onclick="cancelEditing()"--%>
        <%--                                                    style="display: none"--%>
        <%--                                            >Cancel--%>
        <%--                                            </button>--%>
        <%--                                        </div>--%>
        <%--                                    </div>--%>
        <%--                                </form>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </section>--%>

        <%--        <%@include file="footer.jsp" %>--%>

        <%--        <script src="js/Validation/AccountValidate.js"></script>--%>
        <%--        <script src="js/toggle-edit.js"></script>--%>

        <%--        <!-- Back to Top -->--%>
        <%--        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>--%>


        <%--        <!-- JavaScript Libraries -->--%>
        <%--        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>--%>
        <%--        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>--%>
        <%--        <script src="lib/easing/easing.min.js"></script>--%>
        <%--        <script src="lib/owlcarousel/owl.carousel.min.js"></script>--%>

        <%--        <!-- Contact Javascript File -->--%>
        <%--        <script src="mail/jqBootstrapValidation.min.js"></script>--%>
        <%--        <script src="mail/contact.js"></script>--%>

        <%--        <!-- Template Javascript -->--%>
        <%--        <script src="js/main.js"></script>--%>

        <div class="container">
            <h1>Admin Form</h1>

            <form action="/admin/save" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="Username"
                           value="${requestScope.ADMININFO.getUsername()}" disabled readonly>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email"
                           value="${requestScope.ADMININFO.getEmailAddress()}" disabled readonly>
                </div>

                <div class="form-group">
                    <label for="password">Full name:</label>
                    <input type="text" name="password" id="password" class="form-control" placeholder="Password"
                           value="${requestScope.ADMININFO.getFullName()}">
                </div>
                <div class="form-group">
                    <a  href="<%=request.getServletContext().getContextPath()%>/admin/reset">Change password</a>
                </div>
                <div class="form-group">
                    <label>Role: Admin</label>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <button type="reset" class="btn btn-secondary">Cancel</button>
                </div>
            </form>
        </div>
    </body>

</html>
