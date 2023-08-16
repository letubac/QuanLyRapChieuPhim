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
<title>Phim</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/ample-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="/resources/imgs/favicon.png">
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
<link rel="stylesheet"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/add-test.css">
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
						<h4 class="page-title">Phim</h4>
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
									<h3 class="box-title">Danh Sách Phim</h3>
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

								<table class="table table-striped table-hover" id="sortTable">
									<thead>
										<tr>
											<th class="border-top-0">Mã Phim</th>
											<th class="border-top-0">Mã Khuyến Mãi</th>
											<th class="border-top-0">Tên Phim</th>
											<th class="border-top-0">Ngày Chiếu</th>
											<th class="border-top-0">Thời Lượng</th>
											<th class="border-top-0">Đạo Diễn</th>
											<th class="border-top-0">Trạng Thái</th>
											<th class="border-top-0">Hành Động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="p" items="${phim}">
											<tr>
												<td>${p.maPhim }</td>
												<td>${p.maKM }</td>
												<td>${p.tenPhim }</td>
												<td>${p.ngayKC }</td>
												<td>${p.thoiLuong }Phút</td>
												<td>${p.daoDien }</td>
												<td>${p.maTT==1?"Đang chiếu":p.maTT==0?"Sắp chiếu":"Ngừng chiếu" }</td>
												<td><a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#show${p.maPhim }">
															<i class="fa-solid fa-circle-exclamation"></i>
														</button>
												</a> <a href="#">
														<button class="button" data="${p.maPhim}"
															data-bs-toggle="modal" data-bs-target="#f-${p.maPhim}">
															<i class="fa-solid fa-pen-to-square"></i>
														</button>
												</a> <a href="#">
														<button class="button" data-bs-toggle="modal"
															data-bs-target="#e-${p.maPhim}">
															<i class="fa-solid fa-trash"></i>
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
												Phim</h4>

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
														<form class="contener1-add"
															action="/QuanLyRapChieuPhim/admin/movie/add.htm"
															method="post" modelAttribute="movie">
															<div class="body-full-add">

																<div class="body-add">
																	<div class="body-right-add">
																		<div class="photo-add"></div>

																		<div class="btn-add">
																			<button class="button-ma-add">Thêm Ảnh</button>
																		</div>
																		<div class="body-right-detail-info-add">
																			<p class="detail-info-top-left-add">Trạng Thái:</p>
																			<select name="maTT"
																				style="height: 30px; width: 240px; margin-top: 38px; margin-left: 10px;">
																				<option value="0">Sắp chiếu</option>
																				<option value="1">Đang chiếu</option>

																			</select>

																		</div>
																	</div>
																	<div class="body-left-add">

																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Tên Phim</p>
																			<input class="detail-info-buton-add" name="tenPhim"
																				maxLength="99" required />
																		</div>
																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Mã Khuyến Mãi</p>
																			<select class="detail-info-buton-fix" name="maPhim">
																				<option value=''>---No---</option>
																				<c:forEach var="km" items="${km}">
																					<option value=${km.maKM }>${km.maKM }</option>

																				</c:forEach>
																			</select>
																		</div>
																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Mô Tả</p>
																			<input class="detail-info-buton-add" name="moTa"
																				maxLength="999" />
																		</div>
																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Mã Thể Loại:</p>
																			<div
																				style="display: grid; grid-template-columns: 1fr 1fr;">
																				<c:forEach var="t" items="${dsCTTL}">
																					<div>
																						<input type="checkbox" name="TL" id="${t.maTL}"
																							value="${t.maTL}"> <label for="${t.maTL}">${t.tenTL}</label>
																					</div>

																				</c:forEach>
																			</div>
																		</div>
																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Nước Sản Xuất</p>
																			<input class="detail-info-buton-add" name="nuocSX"
																				maxLength="49" />
																		</div>
																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Năm Sản Xuất</p>
																			<input class="detail-info-buton-add" name="namSX"
																				maxLength="4" required />
																		</div>
																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Link ảnh</p>
																			<input class="detail-info-buton-add" name="link"
																				maxLength="500" required />
																		</div>
																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Link Trailer</p>
																			<input class="detail-info-buton-add"
																				name="linkTrailer" maxLength="500" required />
																		</div>
																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Đạo diễn</p>
																			<input class="detail-info-buton-add" name="daoDien"
																				maxLength="30" />
																		</div>
																		<div class="detail-info-add">
																			<p class="detail-info-top-add">Thời lượng</p>
																			<input class="detail-info-buton-add" name="thoiLuong"
																				maxLength="10" />
																		</div>
																		<div class="detail-info-fix">
																			<p class="detail-info-top-fix">Giá Vé</p>

																			<select class="detail-info-buton-fix" name="giaVe">
																				<c:forEach var="lv" items="${lv}">
																					<option value=${lv.gia }>${lv.gia }</option>

																				</c:forEach>
																			</select>
																		</div>
																		<div class="same-add">
																			<div class="detail-info-left">
																				<p class="detail-info-top-add">Ngày Chiếu</p>
																				<form class="input-date">
																					<input type="date" name="ngayKC" id=""
																						class="input-name-add" required />
																				</form>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="body-botton">
																	<button class="button-add">Thêm Mới</button>
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
			</div>

			<!-- Popup info employee -->
			<c:forEach var="p" items="${phim }">
				<div class="modal fade" id="show${p.maPhim }" tabindex="-1"
					role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myCenterModalLabel">Thông Tin
									Phim</h4>
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
											<form class="container-info" style="height: 100%;">
												<div class="body">
													<div class="body-right">
														<div class="photo">
															<img src="${p.link }" style="height: 240px;" />
														</div>

														<div class="">
															<button class="button-ma">MP ${p.maPhim }</button>
														</div>
														<div class="body-right-detail-info">
															<p class="detail-info-top-left">Trạng Thái:</p>
															<p class="detail-info-top-right">${p.maTT==1?"Đang chiếu":p.maTT==0?"Sắp chiếu":"Ngừng chiếu" }</p>
														</div>
													</div>
													<div class="body-left">
														<div class="detail-info">
															<p class="detail-info-top">Tên Phim</p>
															<h6 class="detail-info-buton">${p.tenPhim }</h6>
														</div>
														<div class="detail-info">
															<p class="detail-info-top">Mã Khuyến Mãi</p>
															<h6 class="detail-info-buton">${p.maKM }</h6>
														</div>
														<div class="detail-info">
															<p class="detail-info-top">Thể Loại</p>
															<h6 class="detail-info-buton">
																<c:forEach var="ptl" items="${p.theLoaiS }">
																	<span>${ptl.chiTietTL.tenTL },</span>
																</c:forEach>
															</h6>
														</div>
														<div class="detail-info">
															<p class="detail-info-top">Mô Tả</p>
															<h6 class="detail-info-buton">${p.moTa }</h6>
														</div>
														<div class="same">
															<div class="detail-info">
																<p class="detail-info-top">Ngày Khởi Chiếu</p>
																<h6 class="detail-info-buton">${p.ngayKC }</h6>
															</div>
															<div class="detail-info">
																<p class="detail-info-top">Năm Sản Xuất</p>
																<h6 class="detail-info-buton ">${p.namSX }</h6>
															</div>
														</div>

														<div class="detail-info">
															<p class="detail-info-top">Đạo Diễn</p>
															<h6 class="detail-info-buton">${p.daoDien }</h6>
														</div>


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
			</c:forEach>
		</div>
	</div>

	<c:forEach var="s" items="${phim}">
		<div class="modal fade" id="e-${s.maPhim}" tabindex="-1" role="dialog"
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

						<p>Nhấn xóa để xóa phim</p>

					</div>
					<form method="post" modelAttribute="nhanVien"
						action="/QuanLyRapChieuPhim/admin/movie/delete/${s.maPhim}.htm">
						<div class="modal-footer">

							<button type="submit" class="btn-green btn btn-primary">Xóa</button>


						</div>
					</form>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- Popup fix employee -->
	<c:forEach var="p" items="${phim }">
		<div class="modal fade" id="f-${p.maPhim}" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myCenterModalLabel">Chỉnh Sửa
							Phim</h4>
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
									<form class="contener1-add"
										action="/QuanLyRapChieuPhim/admin/movie/update/${p.maPhim}.htm"
										method="post" modelAttribute="movieUpdate">
										<div class="body-full-add">

											<div class="body-add">
												<div class="body-right-add">
													<div class="photo-add">
														<img src="${p.link }" style="height: 240px;" />
													</div>

													<div class="btn-add">
														<button class="button-ma-add">Thêm Ảnh</button>
													</div>
													<div class="body-right-detail-info-add">
														<p class="detail-info-top-left-add">Trạng Thái:</p>
														<select name="maTT"
															style="height: 30px; width: 240px; margin-top: 38px; margin-left: 10px;">
															<option value="0">Sắp chiếu</option>
															<option value="1">Đang chiếu</option>
															<option value="2">Ngừng chiếu</option>

														</select>

													</div>
												</div>
												<div class="body-left-add">

													<div class="detail-info-add">
														<p class="detail-info-top-add">Tên Phim</p>
														<input class="detail-info-buton-add" name="tenPhim"
															value="${p.tenPhim }" required /> <input type="hidden"
															value="${p.maPhim }" name="maPhimN" maxLength="50" />
													</div>

													<div class="detail-info-add">
														<p class="detail-info-top-add">Mã Khuyến Mãi</p>
														<select class="detail-info-buton-fix" name="maKM">
															<option value=''>---No---</option>
															<c:forEach var="km" items="${km}">
																<option value=${km.maKM }>${km.maKM }</option>

															</c:forEach>
														</select>
													</div>
													<div class="detail-info-add">
														<p class="detail-info-top-add">Mô Tả</p>
														<input class="detail-info-buton-add" name="moTa"
															maxLength="999" value="${p.moTa }" required />
													</div>
													<div class="detail-info-add">
														<p class="detail-info-top-add">Mã Thể Loại</p>

														<c:forEach var="tl" items="${p.theLoaiS}">
															<input type="hidden" class="tlc-${p.maPhim}"
																value="${tl.chiTietTL.maTL}">
														</c:forEach>
														<%-- <c:forEach var="t" items="${dsCTTL}">
														
															<input type="checkbox" name="TL" class="${p.maPhim}" id="tlm-${p.maPhim}-${t.maTL}"
																value="${t.maTL}">
															<label for="${t.maTL}">${t.tenTL}</label>
														</c:forEach> --%>
														<div
															style="display: grid; grid-template-columns: 1fr 1fr;">
															<c:forEach var="t" items="${dsCTTL}">
																<div>
																	<input type="checkbox" name="TL" class="${p.maPhim}"
																		id="tlm-${p.maPhim}-${t.maTL}" value="${t.maTL}">
																	<label for="${t.maTL}">${t.tenTL}</label>
																</div>

															</c:forEach>
														</div>
													</div>
													<div class="detail-info-add">
														<p class="detail-info-top-add">Nước Sản Xuất</p>
														<input class="detail-info-buton-add" name="nuocSX"
															maxLength="30" value="${p.nuocSX }" required />
													</div>
													<div class="detail-info-add">
														<p class="detail-info-top-add">Năm Sản Xuất</p>
														<input class="detail-info-buton-add" name="namSX"
															maxLength="4" value="${p.namSX }" required />
													</div>
													<div class="detail-info-add">
														<p class="detail-info-top-add">Link Phim</p>
														<input class="detail-info-buton-add" name="link"
															maxLength="1000" value="${p.link }" required />
													</div>
													<div class="detail-info-add">
														<p class="detail-info-top-add">Link Trailer</p>
														<input class="detail-info-buton-add" name="linkTrailer"
															maxLength="1000" value="${p.linkTrailer }" required />
													</div>
													<div class="detail-info-add">
														<p class="detail-info-top-add">Đạo diễn</p>
														<input class="detail-info-buton-add" name="daoDien"
															maxLength="49" value="${p.daoDien }" required />
													</div>
													<div class="detail-info-add">
														<p class="detail-info-top-add">Thời lượng</p>
														<input class="detail-info-buton-add" name="thoiLuong"
															maxLength="30" value="${p.thoiLuong }" required />
													</div>
													<div class="detail-info-fix">
														<p class="detail-info-top-fix">Giá vé</p>
														<select class="detail-info-buton-fix" name="giaVe">
															<c:forEach var="lv" items="${lv}">
																<option value=${lv.gia }>${lv.gia }</option>
															</c:forEach>
														</select>
													</div>
													<div class="same-add">
														<div class="detail-info-left">
															<p class="detail-info-top-add">Ngày Chiếu</p>
															<form class="input-date">
																<input type="date" name="ngayKC" id=""
																	class="input-name-add" value="${p.ngayKC }" required />
															</form>
														</div>
													</div>
												</div>
											</div>
											<div class="body-botton">
												<button class="button-add">Chỉnh sửa</button>
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
	</c:forEach>
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
	<footer class="footer text-center"> 2023 © by Lê Tú Bắc </footer>
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- End Page wrapper  -->
	<!-- ============================================================== -->
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

		$(".button").click(function() {
			const maPhim = this.getAttribute("data");

			$(".tlc-" + maPhim).each(function() {
				$("#tlm-" + maPhim + "-" + this.value).prop("checked", true)
			})

		})

		$(".inputTL").each(function() {
			console.log(this.value)
		})
	</script>
</body>
</html>
