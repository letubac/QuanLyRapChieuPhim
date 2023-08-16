<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Đặt Vé</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    
    
    <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/style_order.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"
      integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w=="
      crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    
    
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/QuanLyRapChieuPhim/resources/imgs/favicon.png">
    <!-- Custom CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Custom CSS -->
    <link href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/style.min.css" rel="stylesheet">
    <link href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/employee.css" rel="stylesheet">
    <!-- <link href="../css/add-employee.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

    <style>
  		.container1
  		{
  			width: 100%;
  			display: grid;
  			grid-template-columns: auto auto auto auto auto auto auto auto;
  			grid-gap: 10px 10px;
  		}
  		
  		.body
  		{
  			background-color: #fff;
  		}
  		
  		.name-seat{
  			color: #007bff;
  		}
  	</style>
</head>

<body>
	<!-- <div class="container" style="width:100%";>
<h2> Bootstrap Sort Table </h2> -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/include/header_admin.jsp"%>

	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5"
		
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		
		
		
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
	
		<%@include file="/WEB-INF/views/include/aside_staff.jsp"%> 
	
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="min-height: 250px;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb bg-white">
				<div class="row align-items-center">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">Đặt Vé</h4>
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
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->

							<!-- Popup info employee -->
							<!-- Popup model add employee  -->
							
							<div class="show-seat" id="edit-food" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-lg modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myCenterModalLabel"></h4>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<div
												class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center">
												<div class="row">
													<div class="col-12">
														<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
															<div class="row tm-edit-product-row">
												<div class="col-12" style="color: #fff;">
													<div class="header-add-e">
														<h3 class="header-name-add-e">Đặt Chỗ</h3>
													</div>
													<div class="tieude-add-e">
														<span class="chitiet-left-add-e">Mã Nhân Viên:</span> <span
															class="chitiet-add-e" >${user.maNV }</span>
													</div>
													<div class="tieude-add-e">
														<span class="chitiet-left-add-e">Phim:</span> <span
															class="chitiet-add-e" >${lc.dsPhim.tenPhim}</span>
													</div>
													<div class="tieude-add-e">
														<span class="chitiet-left-add-e">Phòng:</span> <span
															class="chitiet-add-e" >${lc.dsPhong.maPhong}</span>
													</div>
													<form class="container-add-e tm-edit-product-form">
															<ul class="showcase">
																<li>
																	<div class="seat"></div> <small style="color: #fff;">Ghế
																		Trống</small>
																</li>
																<li>
																	<div class="seat selected"></div> <small
																	style="color: #fff;">Ghế Bạn Chọn</small>
																</li>
																<li>
																	<div class="seat occupied"></div> <small
																	style="color: #fff;">Ghế Đã Chọn</small>
																</li>
															</ul>
															<select id="movie">						
																<option value="${lv.gia }">Giá Vé (Rs. ${lv.gia }
																	VND)</option>
																<!-- <option value="200">Kabir Singh (Rs. 200)</option>
            													<option value="150">Duniyadari (Rs. 150)</option>
            													<option value="100">Natsamrat (Rs. 100)</option> -->
															</select>

															<div class="container1">

																<c:forEach var="s" items="${sl}">

																	<c:choose>
																		<c:when test="${s.stt == 'Trong' }">
																			<a
																				href="/QuanLyRapChieuPhim/staff/confirm/${lc.maSC}/${s.num}.htm">
																				<div class="seat">
																					<span class="name-seat">${s.num }</span>
																				</div>
																			</a>
																		</c:when>
																		<c:when test="${s.stt == 'Da dat' }">
																			<div class="seat occupied">
																				<span class="name-seat">${s.num }</span>
																			</div>
																		</c:when>
																	</c:choose>

																</c:forEach>
															</div>

																			<div class="tieude-btn-add-e">
																				<button class="button-add-add-e">Đặt Vé</button>
																				<!--<button class="button-dong-add-e">Đóng</button>-->
																			</div>
																		
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						
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
					<!-- ============================================================== -->
					<!-- End Wrapper -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- All Jquery -->
					<!-- ============================================================== -->
					<script>
						$('#sortTable').DataTable();
					</script>
					<script src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/jquery/dist/jquery.min.js"></script>
					<!-- Bootstrap tether Core JavaScript -->
					<script src="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
					<script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/app-style-switcher.js"></script>
					<script
						src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
					<!--Wave Effects -->
					<script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/waves.js"></script>
					<!--Menu sidebar -->
					<script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/sidebarmenu.js"></script>
					<!--Custom JavaScript -->
					<script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/custom.js"></script>
					<!--This page JavaScript -->
					<!--chartis chart-->
					<script
						src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/chartist/dist/chartist.min.js"></script>
					<script
						src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
					<script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/pages/dashboards/dashboard1.js"></script>
					<script src="/QuanLyRapChieuPhim/resources/js/order.js"></script>
</body>

</html>