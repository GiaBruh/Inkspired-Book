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
    $(document).ready(function() {
        $(".alert").click(function() {
            $(this).fadeOut();
        });
    });

</script>
<script>
    $('#copyButton').click(function() {
        var bookData = {
            title: $('#title').val(),
            date: $('#date').val(),
            publisherId: $('#publisherSelect').val(),
            upload: $('#upload').val(),
            description: $('#description').val(),
            quantity: $('#quantity').val(),
            originalPrice: $('#original_price').val(),
            price: $('#price').val(),
            addingDate: $('#adding_date').val(),
            available: $('input[name="available"]:checked').val(),

        };

        var authorIds = [];
        $('input[name="authorIds"]:checked').each(function() {
            authorIds.push($(this).val());
        });
        bookData.authorIds = authorIds;

        var categoryIds = [];
        $('input[name="categoryIds"]:checked').each(function() {
            categoryIds.push($(this).val());
        });
        bookData.categoryIds = categoryIds;

        localStorage.setItem('bookData', JSON.stringify(bookData));
        $('.alert').text('Copied successfully!').addClass('border-success').show();
        setTimeout(function() {
            $('.alert').fadeOut();
        }, 1000);
    });

    $('#pasteButton').click(function() {
        var bookData = JSON.parse(localStorage.getItem('bookData'));
        if (bookData) {
            $('#title').val(bookData.title);
            $('#date').val(bookData.date);
            $('#publisherId').val(bookData.publisherId);
            $('#upload').val(bookData.upload);
            $('#description').val(bookData.description);
            $('#quantity').val(bookData.quantity);
            $('#storage_original_price').val(bookData.originalPrice);
            $('#price').val(bookData.price);
            $('#adding_date').val(bookData.addingDate);
            $('input[name="available"][value="' + bookData.available + '"]').prop('checked', true);
            $('input[name="authorIds"]').each(function() {
                if (bookData.authorIds.includes($(this).val())) {
                    $(this).prop('checked', true);
                } else {
                    $(this).prop('checked', false);
                }
            });
            $('input[name="categoryIds"]').each(function() {
                if (bookData.categoryIds.includes($(this).val())) {
                    $(this).prop('checked', true);
                } else {
                    $(this).prop('checked', false);
                }
            });
            $('.alert').text('Pasted successfully!').addClass('border-success alert-dismissible fade show text-success').show();
            setTimeout(function() {
                $('.alert').fadeOut();
            }, 1000);
        } else {
            $('.alert').text('No data to paste!').addClass('border-danger alert-dismissible fade show text-danger').show();
            setTimeout(function() {
                $('.alert').fadeOut();
            }, 1000);
        }
    });

</script>
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
    var updateForm = document.getElementById('updateForm');
    var bookInfoForm = document.getElementById('bookInfoForm');
    var publisherInfoForm = document.getElementById('publisherInfoForm');
    var authorInfoForm = document.getElementById('authorInfoForm');
    var categoryInfoForm = document.getElementById('categoryInfoForm');

    function cancelEdit() {
        updateForm.style.display = 'none'; // hide update form
        bookInfoForm.style.display = 'block'; // show book info form
        bookInfoForm.scrollIntoView({behavior: 'smooth'}); // Scroll to the top of the form

    }
    function editBook() {
        // Show the form
        updateForm.style.display = 'block';
        bookInfoForm.style.display = 'none';
        // Scroll to the top of the form
        updateForm.scrollIntoView({behavior: 'smooth'});
    }
    //need to edit the rest of form
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

