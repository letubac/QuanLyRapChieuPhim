<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
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
<title>Khuyến Mãi</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/ample-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/imgs/favicon.png">
<!-- Custom CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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

<!-- Tệp CSS của jQuery UI -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- Tệp JavaScript của jQuery và jQuery UI -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>



</head>
<body>
	<!-- <div class="container" style="width:100%";>
<h2> Bootstrap Sort Table </h2> -->
	<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
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
		<div class="page-wrapper" style="min-height: 250px;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb bg-white">
				<div class="row align-items-center">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">Khuyến Mãi</h4>
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
				<div class="row">
					<div class="col-sm-12">
						<div class="white-box">
							<div class="box-header">
								<div>
									<h3 class="box-title">Danh Sách Khuyến Mãi</h3>
								</div>
								<div class="btn-add-e">
									<a href="#">
										<button class="button-header1-e" data-bs-toggle="modal"
											data-bs-target="#add-employee">
											<i class="fa-solid fa-circle-exclamation"
												data-bs-toggle="modal" data-bs-target="#add-employee"></i>
											Thêm Mới
										</button>
									</a>

								</div>
							</div>


							<div class="table-responsive">

								<!-- <div class="dataTables_filter">
							   <label for="datepicker1">Tìm kiếm từ ngày:</label>
							   <input type="text" id="datepicker1" class="form-control datepicker" placeholder="Chọn ngày">
							</div>
							
							<div class="dataTables_filter ">
							   <label for="datepicker2">Tìm kiếm đến ngày:</label>
							   <input type="text" id="datepicker2" class="form-control datepicker" placeholder="Chọn ngày">
							</div> -->


								<table class="table table-striped table-hover" id="sortTable">
									<thead>
										<tr>
											<th class="border-top-0">STT</th>
											<th class="border-top-0">Mã Khuyến Mãi</th>
											<th class="border-top-0">Tên Khuyến Mãi</th>
											<th class="border-top-0">Mức Giảm Giá</th>
											<th class="border-top-0">Ngày Bắt Đầu</th>
											<th class="border-top-0">Ngày Kết Thúc</th>
											<th class="border-top-0">Mã Trạng Thái</th>
											<th class="border-top-0">Mô Tả</th>
											<th class="border-top-0">Hành Động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="l" items="${km}" varStatus="status">
											<tr>
												<td>${status.index +1}</td>
												<td>${l.maKM}</td>
												<td>${l.tenKM }</td>
												<td>${l.mucGiamGia }</td>
												<td>${l.ngayBatDau }</td>
												<td>${l.ngayKetThuc }</td>
												<td>${l.maTT==0?"Có hiệu lực":"Hết hiệu lực" }</td>
												<td>${l.moTa }</td>
												<td><a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#show${l.maKM }">
															<i class="fa-solid fa-circle-exclamation"></i>
														</button>
												</a> <a href="#">
														<button class="button" data="${l.maKM}"
															data-bs-toggle="modal" data-bs-target="#f-${l.maKM}">
															<i class="fa-solid fa-pen-to-square"></i>
														</button>
												</a> <a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#e-${l.maKM}">
															<i class="fa-solid fa-trash"></i>
														</button>
												</a>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- Popup model add Khuyến mãi  -->
							<c:forEach var="v" items="${maxKMNew}" varStatus="status">
								<div class="modal fade" id="add-employee" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-lg modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" id="myCenterModalLabel">Thêm
													Khuyến Mãi</h4>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body" style="margin: 0 auto;">
												->
												<div class="row">
													<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
														<div class="row tm-edit-product-row">
															<form class="contener1-fix"
																action="/QuanLyRapChieuPhim/admin/promotion/add.htm"
																method="post" modelAttribute="promotion">
																<div class="body-add-e">

																	<div class="tieude1-add-e">
																		<span class="chitiet-left-add-e">Mã Khuyến Mãi
																			:</span>
																		<div class="input-add-e">
																			<input type="text" name="maKM" value="${v }" id=""
																				class="input-name-add-e"
																				style="background-color: lightgray;" readOnly>
																		</div>
																	</div>
																	<div class="tieude1-add-e">
																		<span class="chitiet-left-add-e">Tên Khuyến Mãi
																			:</span>
																		<div class="input-add-e">
																			<input type="text" name="tenKM" id=""
																				class="input-name-add-e" required>
																		</div>
																	</div>
																	<div class="tieude1-add-e">
																		<!-- <div class="detail-info-fix-left"> -->
																		<span class="chitiet-left-add-e">Ngày Bắt Đầu</span> <input
																			type="date" name="ngayBatDau"
																			class="input-name-add-e" name="" id="" required>

																	</div>
																	<div class="tieude1-add-e">
																		<!-- <div class="detail-info-fix-left"> -->
																		<span class="chitiet-left-add-e">Ngày Kết Thúc</span>

																		<input type="date" name="ngayKetThuc"
																			class="input-name-add-e" name="" id="" required>

																	</div>

																	<div class="tieude1-add-e">
																		<p class="chitiet-left-add-e">Mô Tả</p>
																		<input class="input-name-add-e" name="moTa"
																			maxLength="999" />
																	</div>
																	<div class="tieude1-add-e">
																		<span class="chitiet-left-add-e">Mức Giảm Giá :</span>
																		<div class="input-add-e">
																			<input type="text" name="mucGiamGia" id=""
																				class="input-name-add-e" required>
																		</div>
																	</div>
																	<div class="tieude1-add-e">
																		<p class="chitiet-left-add-e">Trạng Thái:</p>
																		<select name="maTT"
																			style="height: 30px; width: 240px;">
																			<option value="0">Còn hiệu lực</option>
																			<option value="1">Hết hiệu lực</option>

																		</select>

																	</div>
																</div>
																<div class="body-botton-fix">
																	<button class="button-fix-f"
																		style="width: 85%; margin-left: 25px;">Thêm
																		Mới</button>
																</div>

															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>


				<c:forEach var="s" items="${km}">
					<div class="modal fade" id="e-${s.maKM}" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div
							class="modal-dialog modal-dialog-centered modal-sm v-modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">

									<p>Nhấn xóa để xóa khuyến mãi</p>

								</div>
								<form method="post" modelAttribute="nhanVien"
									action="/QuanLyRapChieuPhim/admin/promotion/delete/${s.maKM}.htm">
									<div class="modal-footer">

										<button type="submit" class="btn-green btn btn-primary">Xóa</button>


									</div>
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- Popup info Promotion -->
				<c:forEach var="l" items="${km}">
					<div class="modal fade" id="show${l.maKM }" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog modal-lg modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myCenterModalLabel">Thông Tin
										Khuyến Mãi</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<!-- <div class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center"> -->
									<div class="row">
										<!-- <div class="col-12"> -->
										<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
											<div class="row tm-edit-product-row">
												<!-- <div class="col-12"> -->
												<!-- <div class="header-info">
                                                    <!-- <h3 class="header-name-info">Thông Tin Nhân Viên</h3> 
                                                </div> -->
												<form class="container-info">

													<div class="body">
														<div class="body-right">
															<div class="photo">
																<i class="fa-solid fa-file-image"
																	onclick="document.getElementById('fileIput').click();"
																	style="font-size: 50px"></i>
															</div>

															<div class="">
																<button class="button-ma"></button>
															</div>
															<div class="body-right-detail-info">
																<p class="detail-info-top-left">Trạng Thái:</p>
																<p class="detail-info-top-right">${l.maTT==0?"Có hiệu lực":"Hết hiệu lực" }</p>

															</div>
														</div>
														<div class="body-left">
															<div class="detail-info">
																<p class="detail-info-top">Mã Khuyến Mãi</p>
																<h6 class="detail-info-buton">${l.maKM }</h6>
															</div>
															<div class="detail-info">
																<p class="detail-info-top">Tên Khuyến Mãi</p>
																<h6 class="detail-info-buton">${l.tenKM }</h6>
															</div>
															<div class="detail-info">
																<p class="detail-info-top">Mức Giảm Giá</p>
																<h6 class="detail-info-buton">${l.mucGiamGia }</h6>
															</div>
															<div class="detail-info">
																<p class="detail-info-top">Mô Tả</p>
																<h6 class="detail-info-buton">${l.moTa }</h6>
															</div>
															<div class="same">
																<div class="detail-info">
																	<p class="detail-info-top">Ngày Bắt Đầu</p>
																	<h6 class="detail-info-buton">${l.ngayBatDau}</h6>
																</div>
																<div class="detail-info">
																	<p class="detail-info-top">Ngày Kết thúc</p>
																	<h6 class="detail-info-buton">${l.ngayKetThuc}</h6>
																</div>
															</div>
														</div>




														<!-- <div class="tieude-btn">
                                                            <button class="button-fix">Chỉnh sửa</button>
                                                            <button class="button-dong">Đóng</button>
                                                        </div> -->
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- Popup edit employee -->
	<c:forEach var="l" items="${km}">
		<div class="modal fade" id="f-${l.maKM }" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myCenterModalLabel">Chỉnh Sửa
							Khuyến Mãi</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<!-- <div class="container tm-mt-big tm-mb-big h-100 align-items-center justify-content-center"> -->
						<div class="row">
							<!-- <div class="col-12"> -->
							<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
								<div class="row tm-edit-product-row">
									<!-- <div class="col-12"> -->
									<!-- <div class="header-info">
                                                    <!-- <h3 class="header-name-info">Thông Tin Nhân Viên</h3> 
                                                </div> -->
									<form class="contener1-fix"
										action="/QuanLyRapChieuPhim/admin/promotion/update/${l.maKM}.htm"
										method="post" modelAttribute="updatePromotion">
										<div class="detail-info-fix">
											<p class="detail-info-top-fix">Mã Khuyến Mãi</p>
											<input type="input-name-add-e" name="maKM"
												class="detail-info-buton-fix" value="${l.maKM }"
												style="background-color: lightgray;" readOnly>
										</div>
										<div class="detail-info-fix">
											<p class="detail-info-top-fix">Tên Khuyến Mãi</p>
											<input type="input-name-add-e" name="tenKM"
												class="detail-info-buton-fix" value="${l.tenKM }" required>
										</div>
										<div class="detail-info-fix">
											<p class="detail-info-top-fix">Mức Giảm Giá</p>
											<input type="input-name-add-e" name="mucGiamGia"
												class="detail-info-buton-fix" value="${l.mucGiamGia }"
												required>
										</div>
										<div class="detail-info-fix">
											<p class="detail-info-top-fix">Mô Tả</p>
											<input type="input-name-add-e" name="moTa"
												class="detail-info-buton-fix" value="${l.moTa }">
										</div>
										<div class="detail-info-fix">
											<p class="detail-info-top-fix">Mã Trạng Thái</p>
											<p name="maTT" class="detail-info-buton-fix"
												style="background-color: lightgray;" readOnly>
												${l.maTT==0?"Có hiệu lực":"Hết hiệu lực" }</p>
										</div>
										<div class="detail-info-fix">
											<p class="detail-info-top-fix">Ngày Bắt Đầu</p>

											<input type="date" name="ngayBatDau"
												class="detail-info-buton-fix" value="${l.ngayBatDau }"
												required>

										</div>
										<div class="detail-info-fix">
											<p class="detail-info-top-fix">Ngày Kết Thúc</p>

											<input type="date" name="ngayKetThuc"
												class="detail-info-buton-fix" value="${l.ngayKetThuc }"
												required>

										</div>

										<div class="body-botton-fix">
											<button class="button-fix-f"
												style="width: 85%; margin-left: 25px;">Cập Nhật</button>
										</div>





									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
	<footer class="footer text-center"> 2023 © by B.L.T.T </footer>
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
	<!-- Script để khởi tạo DatePicker -->
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
	<script src=" <c:url value='/resources/js/alertify.min.js'/>"></script>

	<script type="text/javascript">
		if ($(".alert-flag").attr("aType")) {
			console.log(1)
			alertify.notify($(".alert-flag").attr("aMessage"), $(".alert-flag")
					.attr("aType"), 5, function() {
				console.log('dismissed');
			});
			alertify.set('notifier', 'position', 'top-right');
		}
	</script>
</body>
</html>
