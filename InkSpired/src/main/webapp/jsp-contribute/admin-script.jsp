<!-- *************
************ JavaScript Files *************
************* -->
<!-- Required jQuery first, then Bootstrap Bundle JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.js"></script>
<link href="https://cdn.datatables.net/v/bs5/dt-1.13.6/datatables.min.css" rel="stylesheet">
<script src="https://cdn.datatables.net/v/bs5/dt-1.13.6/datatables.min.js"></script>
<script>
    var loadFile = function(event) {
        var output = document.getElementById('output');
        var filenameP = document.getElementById('filename');
        output.src = URL.createObjectURL(event.target.files[0]);
        filenameP.textContent = event.target.files[0].name;
        output.onload = function() {
            URL.revokeObjectURL(output.src) // free memory
        }
    };
</script>

<script>
    $(document).ready( function () {
        $('#book-table').DataTable();

        $('#order-detail-table').DataTable();

        $('#order-table').DataTable();

        $('#publisher-table').DataTable();

        $('#author-table').DataTable();

        $('#category-table').DataTable();

        $('#user-table').DataTable();

    } );
</script>
<%--Book page--%>
<script>
    $(document).ready(function(){
        $("#authorSearch").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $(".checkbox-container label").each(function() {
                if ($(this).text().toLowerCase().indexOf(value) > -1) {
                    this.scrollIntoView({behavior: "smooth"}); // Scroll into view
                }
            });
        });
    });

</script>
<script>
    $(document).ready(function(){
        $("#categorySearch").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $(".checkbox-container-cate label").each(function() {
                if ($(this).text().toLowerCase().indexOf(value) > -1) {
                    this.scrollIntoView({behavior: "smooth"}); // Scroll into view
                }
            });
        });
    });

</script>

<script>
    function editBook() {
        document.getElementById('bookInfoForm').style.display = 'none'; // hide book info form
        document.getElementById('updateForm').style.display = 'block'; // show update form
    }

    function cancelEdit() {
        document.getElementById('updateForm').style.display = 'none'; // hide update form
        document.getElementById('bookInfoForm').style.display = 'block'; // show book info form
    }
    function editPublisher() {
        document.getElementById('publisherInfoForm').style.display = 'none'; // hide book info form
        document.getElementById('updateForm').style.display = 'block'; // show update form
    }

    function cancelEditPublisher() {
        document.getElementById('updateForm').style.display = 'none'; // hide update form
        document.getElementById('publisherInfoForm').style.display = 'block'; // show book info form
    }
    function editAuthor() {
        document.getElementById('authorInfoForm').style.display = 'none'; // hide book info form
        document.getElementById('updateForm').style.display = 'block'; // show update form
    }
    function cancelEditAuthor() {
        document.getElementById('updateForm').style.display = 'none'; // hide update form
        document.getElementById('authorInfoForm').style.display = 'block'; // show book info form
    }
    function editCategory() {
        document.getElementById('categoryInfoForm').style.display = 'none'; // hide book info form
        document.getElementById('updateForm').style.display = 'block'; // show update form
    }
    function cancelEditCategory() {
        document.getElementById('updateForm').style.display = 'none'; // hide update form
        document.getElementById('categoryInfoForm').style.display = 'block'; // show book info form
    }


</script>
<script>
    $("#yourForm").submit(function(e) {
        var bookId = $("input[name='book_id']").val();
        $.ajax({
            url: "/checkBookId", // replace with your URL
            type: "post",
            data: {book_id: bookId},
            success: function(response) {
                if(response == "exists") {
                    alert("Book ID already exists.");
                    e.preventDefault();
                }
            }
        });
    });

</script>
<script>
    var numberOfBooks = ${fn:length(books)};
    if (numberOfBooks > 0) {
        document.getElementById("deleteButton").disabled = true;
    }
</script>

<!-- *************
************ Vendor Js Files *************
************* -->

<!-- Overlay Scroll JS -->
<script src="${pageContext.request.contextPath}/assets/vendor/overlay-scroll/jquery.overlayScrollbars.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/overlay-scroll/custom-scrollbar.js"></script>

<!-- Apex Charts -->
<script src="${pageContext.request.contextPath}/assets/vendor/apex/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/apex/custom/dash1/sparkline.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/apex/custom/dash1/customers.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/apex/custom/dash1/channel.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/apex/custom/dash1/deals.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/apex/custom/dash1/demography.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/apex/custom/dash1/device.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/apex/custom/dash1/weekly-sales.js"></script>

<!-- Vector Maps -->
<script src="${pageContext.request.contextPath}/assets/vendor/jvectormap/jquery-jvectormap-2.0.5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jvectormap/world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jvectormap/gdp-data.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jvectormap/continents-mill.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jvectormap/custom/world-map-markers2.js"></script>

<!-- Custom JS files -->
<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>

