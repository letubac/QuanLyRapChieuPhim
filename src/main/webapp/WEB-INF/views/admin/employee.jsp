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
<title>Nhân Viên</title>
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
</head>

<body>
	<div class="alert-flag" aType='${message.type}'
		aMessage="${message.message }"></div>
	
	<!-- <div class="container" style="width:100%";>
<h2> Bootstrap Sort Table </h2> -->
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
						<h4 class="page-title">Nhân Viên</h4>
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
									<h3 class="box-title">Danh Sách Nhân Viên</h3>
								</div>
								<div class="btn-add-e">
									<button class="button-header1-e" data-bs-toggle="modal"
										data-bs-target="#add-employee">
										<i class="fa-solid fa-circle-exclamation"
											data-bs-toggle="modal" data-bs-target="#add-employee"></i>
										Thêm Mới
									</button>
								</div>
							</div>

							<div class="table-responsive">

								<table class="table table-striped table-hover" id="sortTable">
									<thead>
										<tr>
											<th class="border-top-0">STT</th>

											<th class="border-top-0">Họ Và Tên</th>
											<th class="border-top-0">SĐT</th>
											<th class="border-top-0">Email</th>
											<th class="border-top-0">Địa Chỉ</th>
											<th class="border-top-0">Trạng Thái</th>
											<th class="border-top-0">Hành Động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="s" items="${nv}">
											<tr>
												<td>${s.maNV }</td>

												<td>${s.tenNV }</td>
												<td>${s.soDT }</td>
												<td>${s.dstaikhoan.email }</td>
												<td>${s.diaChi }</td>
												<c:choose>
													<c:when test="${s.trangThai == false}">
														<td>Nghỉ việc</td>
													</c:when>
													<c:when test="${s.trangThai == true}">
														<td>Hoạt động</td>
													</c:when>
												</c:choose>
												<td><a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#show${s.maNV }">
															<i class="fa-solid fa-circle-exclamation"></i>
														</button>
												</a> <a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#e-${s.maNV}">
															<i class="fa-solid fa-pen-to-square"></i>
														</button>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- Popup model add employee  -->
							<div class="modal fade" id="add-employee" tabindex="-1"
								role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-lg modal-dialog-centered">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="myCenterModalLabel">Thêm Mới
												Nhân Viên</h4>

											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
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
														<div
															style="color: #ff3366; font-size: 12px; margin-top: 5px; margin-bottom: 0px;"></div>
														<form class="contener1-fix" method="POST"
															action="/QuanLyRapChieuPhim/admin/employee/add.htm"
															modelAttribute="taikhoan">
															<div class="body-full-fix">

																<div class="body-fix">
																	<div class="body-right-fix">
																		<div class="photo-fix">
																			<img src="../resources/imgs/user-icon.jpg" alt="user"
																				style="width: 370px;" />

																		</div>

																		<div class="btn-fix">
																			<button class="button-ma-fix">Ảnh</button>
																		</div>
																		<div class="body-right-detail-info-fix">
																			<p class="detail-info-top-left-fix">Trạng Thái:</p>
																			<div id="buttons-fix">
																				<a href="" class="btn-f btn-solid-f">Hoạt Động</a>
																			</div>

																		</div>
																	</div>
																	<div class="body-left-fix">

																		<div class="detail-info-fix">
																			<p class="detail-info-top-fix">Email Tài Khoản</p>
																			<input name="email" type="email"
																				class="detail-info-buton-fix" maxLength="50" required />
																			<form:errors path="email"></form:errors>
																		</div>

																		<div class="detail-info-fix">
																			<p class="detail-info-top-fix">Tên Nhân Viên</p>
																			<input name="tenNV" class="detail-info-buton-fix"  maxLength="30"
																				required />
																			<form:errors path="tenNV"></form:errors>
																		</div>
																		<div class="detail-info-fix">
																			<p class="detail-info-top-fix">CMND</p>
																			<input name="cmnd" class="detail-info-buton-fix"  maxLength="20"
																				required />
																			<form:errors path="cmnd"></form:errors>
																		</div>
																		<div class="detail-info-fix">
																			<p class="detail-info-top-fix">SĐT</p>
																			<input name="soDT" class="detail-info-buton-fix"  maxLength="15"
																				required />
																			<form:errors path="soDT"></form:errors>

																		</div>
																		<div class="detail-info-fix">
																			<p class="detail-info-top-fix">Địa Chỉ</p>
																			<input name="diaChi" class="detail-info-buton-fix"  maxLength="50"
																				required />
																			<form:errors path="diaChi"></form:errors>
																		</div>
																		<div class="same-fix">
																			<div class="detail-info-fix-left">
																				<p class="detail-info-top-fix">Ngày Sinh</p>

																				<input type="date" name="ngaySinh"
																					class="input-name-fix" required />


																			</div>
																			<div class="detail-info-fix-right">
																				<p class="detail-info-top-fix">Giới Tính</p>
																				<div class="input-fix">
																					<select name="gioiTinh">
																						<option value="false">Nữ</option>
																						<option value="true">Nam</option>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="body-botton-fix">
																	<button class="button-fix-f" type="submit">Thêm
																		Mới</button>
																</div>
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

				<!-- Popup info employee -->
				<c:forEach var="s" items="${nv}">
					<div class="modal fade" id="show${s.maNV }" tabindex="-1"
						role="dialog" aria-hidden="true">


						<div class="modal-dialog modal-lg modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myCenterModalLabel">Thông Tin
										Nhân Viên</h4>
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
																<img src="../resources/imgs/user-icon.jpg" alt="user"
																	style="width: 370px;" />
															</div>

															<div class="">
																<button class="button-ma">NV ${s.maNV}</button>
															</div>
															<div class="body-right-detail-info">
																<p class="detail-info-top-left">Trạng Thái:</p>
																<p class="detail-info-top-right">${s.trangThai?"Hoạt động":"Không hoạt động"}</p>
															</div>
														</div>
														<div class="body-left">
															<div class="detail-info">
																<p class="detail-info-top ">Tên Nhân Viên</p>
																<h6 class="detail-info-buton">${s.tenNV}</h6>
															</div>
															<div class="detail-info">
																<p class="detail-info-top">CMND</p>
																<h6 class="detail-info-buton">${s.cmnd}</h6>
															</div>
															<div class="detail-info">
																<p class="detail-info-top">SĐT</p>
																<h6 class="detail-info-buton">${s.soDT}</h6>
															</div>
															<div class="same">
																<div class="detail-info">
																	<p class="detail-info-top">Ngày Sinh</p>
																	<h6 class="detail-info-buton">${s.ngaySinh}</h6>
																</div>
																<div class="detail-info">
																	<p class="detail-info-top">Giới Tính</p>
																	<h6 class="detail-info-buton">${s.gioiTinh?"Nam":"Nữ"}</h6>
																</div>
															</div>

															<div class="detail-info">
																<p class="detail-info-top">Địa Chỉ</p>
																<h6 class="detail-info-buton">${s.diaChi}</h6>
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
	<!-- Popup fix employee -->

	<c:forEach var="s" items="${nv}">
		<div class="modal fade" id="e-${s.maNV}" tabindex="-1" role="dialog"
			aria-hidden="true">
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

						<p
							style="font-family: unset; font-style: unset; font-weight: 500;">Nhấn
							lưu để thay đổi trạng thái nhân viên</p>

					</div>
					<form method="post" modelAttribute="nhanVien"
						action="/QuanLyRapChieuPhim/admin/employee/update/${s.maNV}.htm">
						<div class="modal-footer">

							<button type="submit" class="btn-green btn btn-primary">Lưu</button>


						</div>
					</form>
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