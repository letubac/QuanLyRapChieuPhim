<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
<meta name="description"
	content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
<meta name="robots" content="noindex,nofollow">
<title>Thống Kê</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/ample-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/imgs/favicon.png">
<!-- Custom CSS -->
<link
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/chartist/dist/chartist.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Custom CSS -->
<link
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/style.min.css"
	rel="stylesheet">
<link
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/employee.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/detail-test.css">
<link rel="stylesheet"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/fix-test.css">
<!-- <link href="../css/add-employee.css" rel="stylesheet"> -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
<script
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet"
	href="<c:url value='/resources/css/alertify.min.css'/>" />
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5"
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->

		<%@include file="/WEB-INF/views/include/header_admin.jsp"%>

		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->

		<%@include file="/WEB-INF/views/include/aside.jsp"%>

		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb bg-white">
				<div class="row align-items-center">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">Quản Lý Cụm Rạp</h4>
					</div>

				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-lg-6 col-md-12">
							<h3 class="box-title">Hiện tại hệ thống chưa quản lý cụm rạp😊</h3>
							<h3 class="box-title">Updating for the future... 😊</h3>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- Three charts -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- PRODUCTS YEARLY SALES -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- RECENT SALES -->
				<!-- ======

				<!-- ============================================================== -->
				<!-- End Container fluid  -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- footer -->
				<!-- ============================================================== -->
				<footer class="footer text-center"> 2023 © by Lê Tú Bắc </footer>
				<!-- ============================================================== -->
				<!-- End footer -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Page wrapper  -->
			<!-- ============================================================== -->
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script>
		$('#sortTable').DataTable();
	</script>
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/app-style-switcher.js"></script>
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
	<!--Wave Effects -->
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/waves.js"></script>
	<!--Menu sidebar -->
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/custom.js"></script>
	<!--This page JavaScript -->
	<!--chartis chart-->
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/chartist/dist/chartist.min.js"></script>
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script
		src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/pages/dashboards/dashboard1.js"></script>
</body>

</html>