<!DOCTYPE html>
<html lang="en">

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>List of book</title>

    <!-- Meta -->
    <meta name="author" content="Vinh" />
    <link rel="canonical" href="https://www.bootstrap.gallery/">
    <meta property="og:url" content="https://www.bootstrap.gallery">
    <link rel="shortcut icon" href="assets/images/favicon.svg" />

    <!-- *************
        ************ CSS Files *************
    ************* -->
    <%@include file="jsp-contribute/admin-interface.jsp" %>

    <!-- *************
        ************ Vendor Css Files *************
    ************ -->

    <!-- Scrollbar CSS -->

</head>

<body>
<!-- Page wrapper start -->
<div class="page-wrapper">

    <!-- Main container start -->
    <div class="main-container">

        <%@include file="jsp-contribute/admin-menuscroll.jsp"%>

        <!-- App container starts -->
        <div class="app-container">

            <%@include file="jsp-contribute/admin-appheader.jsp"%>

            <!-- App hero header starts -->
            <div class="app-hero-header">
                <h3 class="fw-light mb-5">
                    <span>Admin</span> / <span class="menu-text">Insert New Publisher</span>
                </h3>
            </div>
            <!-- App Hero header ends -->

            <!-- App body starts -->
            <div class="app-body">

                <!-- table name Order -->
                <div class="col-xxl-12">
                    <div class="card shadow mb-4" id="addForm">
                        <div class="card-header">
                            <h5 class="card-title">Insert New Publisher</h5>
                        </div>

                        <form action="<%=request.getContextPath()%>/admin/add-publisher" method="post">
                            <div class="card-body">
                                <c:if test="${not empty sessionScope.errorMessage}">
                                    <div class="alert border border-danger alert-dismissible fade show text-danger"
                                         role="alert">
                                        <b>Error!</b> ${sessionScope.errorMessage}
                                    </div>
                                    <%--                                        <% session.removeAttribute("errorMessage"); %>--%>
                                </c:if>
                                <!-- Row start -->
                                <div class="row">

                                    <div class="col-lg-3 col-sm-4 col-12">
                                        <div class="mb-3">
                                            <label class="form-label">Publisher Name</label>
                                            <input class="form-control" type="text" id="title" name="publisher_name" required>
                                            <span id="errorfullname" class="text-danger"></span>
                                        </div>
                                    </div>


                                </div>
                                <!-- Row end -->

                            </div>
                            <div class="card-footer">
                                <div class="d-flex gap-2 justify-content-end">
                                    <button type="submit" class="btn btn-primary" name="addPublisherSubmit" id="submitButton">Submit</button>
                                    <button type="reset" class="btn btn-danger" name="addAuthorReset">Reset</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>


            </div>
            <!-- App body ends -->

            <!-- App footer start -->
            <div class="app-footer">
                <span>© Bootstrap Gallery 2023</span>
            </div>
            <!-- App footer end -->

        </div>
        <!-- App container ends -->

    </div>
    <!-- Main container end -->

</div>
<!-- Page wrapper end -->

<!-- *************
    ************ JavaScript Files *************
************* -->
<%@include file="jsp-contribute/admin-script.jsp" %>

</body>
<script>
    let fullname = '';

    let validfullname = false;

    $(document).ready(function () {
        const fullnameregex = /[0-9!@#\$%\^\&*\)\(+=._-]+/;
        $("input[name='publisher_name']").on({
            'keyup change': function () {
                fullname = $("input[name='publisher_name']").val();

                if (fullname.length < 1 || fullname.length > 100) {
                    validfullname = false;
                    $("#errorfullname").html("The publisher name can only be from 1 to 100 characters.");
                } else if (fullnameregex.test(fullname)) {
                    validfullname = false;
                    $("#errorfullname").html("The publisher name cannot contains special characters.");
                } else {
                    validfullname = true;
                    $("#errorfullname").html("");
                }
                valid();
            }
        });

        function valid() {
            // console.log(validfullname, validImage);
            if (
                validfullname === true
            ) {
                $("button[name='addPublisherSubmit']").removeAttr('disabled');

            } else {
                $("button[name='addPublisherSubmit']").attr('disabled', '');
            }
        }

        $("button[name='addAuthorReset']").on({
            click: function () {
                validfullname = false;
                valid();
                $("#errorfullname").html("");
            }
        });
    });
</script>
</html>