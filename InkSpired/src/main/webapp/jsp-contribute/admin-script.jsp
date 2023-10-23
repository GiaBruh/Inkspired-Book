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
    $(document).ready( function () {
        $('#book-table').DataTable();

        $('#order-detail-table').DataTable();

        $('#order-table').DataTable();

    } );
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

