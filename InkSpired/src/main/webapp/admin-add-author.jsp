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
          <span>Admin</span> / <span class="menu-text">Insert New Author</span>
        </h3>
      </div>
      <!-- App Hero header ends -->

      <!-- App body starts -->
      <div class="app-body">

        <!-- table name Order -->
        <div class="col-xxl-12">
          <div class="card shadow mb-4" id="addForm">
            <div class="card-header">
              <h5 class="card-title">Insert New Author</h5>
            </div>

            <form action="<%=request.getContextPath()%>/admin/add-author" method="post" enctype="multipart/form-data">
              <div class="card-body">
                <c:if test="${not empty sessionScope.errorMessage}">
                  <div class="alert border border-danger alert-dismissible fade show text-danger"
                       role="alert">
                    <b>Error!</b> ${sessionScope.errorMessage}
                  </div>
                  <% session.removeAttribute("errorMessage"); %>
                </c:if>
                <!-- Row start -->
                <div class="row">

                  <div class="col-lg-3 col-sm-4 col-12">
                    <div class="mb-3">
                      <label class="form-label">Author Full Name</label>
                      <input class="form-control" type="text"  name="author_fullname" required>
                    </div>
                  </div>
                  <div class="col-lg-3 col-sm-4 col-12">
                    <div class="mb-3">
                       <label class="form-label">Author Image</label>
                          <input class="form-control" type="file" onchange="loadFile(event)" name="upload" id="upload" required>
                    </div>
                  </div>
                  <div class="col-lg-3 col-sm-4 col-12">
                    <div class="dropdown">
                      <div class="mb-3">
                        <label class="form-label">Image Preview</label>
                        <button class="form-control btn btn-outline-primary" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                          Image Dropdown
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                          <img id="output" src="${book.book_image}" style="width: 200px; height: auto;" />
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-3 col-sm-4 col-12">
                    <div class="mb-3">
                      <label class="form-label" >Status</label>
                      <div class="mt-2">
                        <div class="form-check form-check-inline">
                          <input class="form-check-input"  type="radio"  name="author_status" value="true">
                          <label class="form-check-label" >Active</label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input"  type="radio"  name="author_status" value="false">
                          <label class="form-check-label" >Inactive</label>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="col-sm-6 col-12">
                    <div class="mb-3">
                      <label class="form-label">Author Description</label>
                      <textarea class="form-control" name="author_description" required></textarea>
                    </div>
                  </div>



                </div>
                <!-- Row end -->

              </div>
              <div class="card-footer">
                <div class="d-flex gap-2 justify-content-end">
                  <button type="submit" class="btn btn-primary" name="addAuthorSubmit" id="submitButton">Submit</button>
                  <button type="reset" class="btn btn-danger">Reset</button>
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

</html>