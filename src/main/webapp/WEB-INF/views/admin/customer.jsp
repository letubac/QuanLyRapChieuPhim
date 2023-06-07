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
    <title>Khách Hàng</title>
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
    <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/detail-test.css">
    <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/fix-test.css">
    <!-- <link href="../css/add-employee.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
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
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
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
                        <h4 class="page-title">Khách Hàng</h4>
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
                                    <h3 class="box-title">Danh Sách Khách Hàng</h3>
                                </div>
                                <!-- <div class="btn-add-e">
									<button class="button-header1-e" data-bs-toggle="modal"
										data-bs-target="#add-employee">
										<i class="fa-solid fa-circle-exclamation"
											data-bs-toggle="modal" data-bs-target="#add-employee"></i>
										Disable Khách Hàng
									</button>
								</div> -->
                                <!-- <div class="btn-add-e">
                                    <a href="#">
                                    <button class="button-header1-e" data-bs-toggle="modal"
                                        data-bs-target="#disable-customer">
                                        <i class="fa-solid fa-circle-exclamation" data-bs-toggle="modal"
                                            data-bs-target="#disable-customer"></i>
                                        Disable
                                    </button> 
                                    </a>

                                </div> -->
                            </div>


                            <div class="table-responsive">

                                <table class="table table-striped table-hover" id="sortTable">
                                    <thead>
                                        <tr>
                                            <th class="border-top-0">STT</th>
                                            <th class="border-top-0">Mã Khách Hàng</th>
                                            <th class="border-top-0">Họ Và Tên</th>
                                            <th class="border-top-0">SĐT</th>
                                            <th class="border-top-0">Giới Tính</th>
                                            <th class="border-top-0">Số Lượng Vé Đã Mua</th>
											<th class="border-top-0">Trạng Thái</th>
                                            <th class="border-top-0">Hành Động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="s" items="${kh}">
                                        <tr>
                                            <td>${s.maKH}</td>
                                            <td>${s.maKH }</td>
                                            <td>${s.tenKH }</td>
                                            <td>${s.soDT }</td>
                                            <c:choose>
                                            	<c:when test="${s.gioiTinh == false}">
                                            		<td>Nữ</td>
                                            	</c:when>
                                            	<c:when test="${s.gioiTinh == true}">
                                            		<td>Nam</td>
                                            	</c:when>
                                            </c:choose>
                                            <td>${countVeMap[s.maKH]}</td>
												<c:choose>
													<c:when test="${s.trangThai == false}">
														<td>Không hoạt động</td>
													</c:when>
													<c:when test="${s.trangThai == true}">
														<td>Hoạt động</td>
													</c:when>
												</c:choose>
                                            <td>

                                                <a href="#">
                                                    <button class="button" data-bs-toggle="modal"
                                                        data-bs-target="#show${s.maKH }">
                                                        <i class="fa-solid fa-circle-exclamation"></i>
                                                    </button>
                                                </a> 
                                                <a href="#">
												    <c:if test="${countVeMap[s.maKH] == 0}">
												        <button class="button" data-bs-toggle="modal" data-bs-target="#e-${s.maKH}">
												            <i class="fa-solid fa-pen-to-square"></i>
												        </button>
												    </c:if>
												</a>
                                            </td>
                                        </tr>                            
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- Popup model add employee  -->
                            <div class="modal fade" id="add-employee" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="myCenterModalLabel">Thêm Mới Khách Hàng</h4>
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
                                                        <form class="contener1-fix">
                                                            <div class="body-full-fix">

                                                                <div class="body-fix">
                                                                    <div class="body-right-fix">
                                                                        <div class="photo-fix">
                                                                            <img src="../resources/imgs/user-icon.jpg" alt="user" style="width: 370px;"/>
                                                                        </div>

                                                                        <div class="btn-fix">
                                                                            <button class="button-ma-fix">Sửa
                                                                                Ảnh</button>
                                                                        </div>
                                                                        <div class="body-right-detail-info-fix">
                                                                            <p class="detail-info-top-left-fix">Trạng
                                                                                Thái:</p>
                                                                            <div id="buttons-fix">
                                                                                <a href="#"
                                                                                    class="btn-f btn-solid-f">Hoạt
                                                                                    Động</a>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <div class="body-left-fix">
                                                                        <li class="tieude-fix">
                                                                            <span class="chitiet-left-fix">Mã Khách
                                                                                Hàng:</span>
                                                                            <span class="chitiet-fix">1001</span>

                                                                        </li>
                                                                        <div class="detail-info-fix">
                                                                            <p class="detail-info-top-fix">THọ Và Tên
                                                                            </p>
                                                                            <input
                                                                                class="detail-info-buton-fix"></input>
                                                                        </div>
                                                                        <div class="detail-info-fix">
                                                                            <p class="detail-info-top-fix">CMND</p>
                                                                            <input
                                                                                class="detail-info-buton-fix"></input>
                                                                        </div>
                                                                        <div class="detail-info-fix">
                                                                            <p class="detail-info-top-fix">SĐT</p>
                                                                            <input
                                                                                class="detail-info-buton-fix"></input>
                                                                        </div>
                                                                        <div class="detail-info-fix">
                                                                            <p class="detail-info-top-fix">Địa Chỉ</p>
                                                                            <input
                                                                                class="detail-info-buton-fix"></input>
                                                                        </div>
                                                                        <div class="same-fix">
                                                                            <div class="detail-info-fix-left">
                                                                                <p class="detail-info-top-fix">Ngày Sinh
                                                                                </p>
                                                                                <form class="input-date">
                                                                                    <input type="date" name="" id=""
                                                                                        class="input-name-fix">
                                                                                </form>
                                                                            </div>
                                                                            <div class="detail-info-fix-right">
                                                                                <p class="detail-info-top-fix">Giới Tính
                                                                                </p>
                                                                                <div class="input-fix">
                                                                                    <input type="radio" name="" id="">Nữ
                                                                                    <input type="radio" name=""
                                                                                        id="">Nam
                                                                                </div>
                                                                            </div>
                                                                        </div>




                                                                    </div>


                                                                </div>
                                                                <div class="body-botton-fix">
                                                                    <button class="button-fix-f">Thêm Mới</button>
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
                <c:forEach var="s" items="${kh}">
                <div class="modal fade" id="show${s.maKH }" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myCenterModalLabel">Thông Tin Khách Hàng</h4>
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
                                                            <img src="../resources/imgs/user-icon.jpg" alt="user" style="width: 370px;"/>
                                                        </div>

                                                        <div class="">
                                                            <button class="button-ma">KH ${s.maKH }</button>
                                                        </div>
                                                        <div class="body-right-detail-info">
																<p class="detail-info-top-left">Trạng Thái:</p>
																<p class="detail-info-top-right">${s.trangThai?"Hoạt động":"Không hoạt động"}</p>
															</div>
                                                    </div>
                                                    <div class="body-left">
                                                        <div class="detail-info">
                                                            <p class="detail-info-top">Tên Khách Hàng</p>
                                                            <h6 class="detail-info-buton">${s.tenKH}</h6>
                                                        </div>
                                                        
                                                        <div class="detail-info">
                                                            <p class="detail-info-top">SĐT</p>
                                                            <h6 class="detail-info-buton">${s.soDT}</h6>
                                                        </div>
                                                        <div class="same">
                                                            <div class="detail-info">
                                                                <p class="detail-info-top">Ngày Sinh</p>																
																<h6 class="detail-info-buton">${s.ngaySinh }</h6>
                                                            </div>
                                                            <div class="detail-info">
                                                                <p class="detail-info-top">Giới Tính</p>
                                                                <c:choose>
																	<c:when test="${s.gioiTinh == false}">
																		<h6 class="detail-info-buton">Nữ</h6>
																	</c:when>
																	<c:when test="${s.gioiTinh == true}">
																		<h6 class="detail-info-buton">Nam</h6>
																	</c:when>
																</c:choose>
                                                                
                                                            </div>
                                                        </div>

                                                        <div class="detail-info">
                                                            <p class="detail-info-top">Địa Chỉ</p>
                                                            <h6 class="detail-info-buton">${s.diaChi }</h6>
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
    </div>
    <!-- Popup fix employee -->
    <div class="modal fade" id="fix-employee" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myCenterModalLabel">Chỉnh Sửa Nhân Viên</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                                <form class="contener1-fix">
                                    <div class="body-full-fix">

                                        <div class="body-fix">
                                            <div class="body-right-fix">
                                                <div class="photo-fix">
                                                    <i class="fa-solid fa-file-image"
                                                        onclick="document.getElementById('fileIput').click();"></i>
                                                </div>

                                                <div class="btn-fix">
                                                    <button class="button-ma-fix">Sửa Ảnh</button>
                                                </div>
                                                <div class="body-right-detail-info-fix">
                                                    <p class="detail-info-top-left-fix">Trạng Thái:</p>
                                                    <div id="buttons-fix">
                                                        <a href="#" class="btn-f btn-solid-f">Hoạt Động</a>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="body-left-fix">
                                                <li class="tieude-fix">
                                                    <span class="chitiet-left-fix">Mã Nhân Viên:</span>
                                                    <span class="chitiet-fix">1001</span>

                                                </li>
                                                <div class="detail-info-fix">
                                                    <p class="detail-info-top-fix">Tên Nhân Viên</p>
                                                    <input class="detail-info-buton-fix"></input>
                                                </div>
                                                <div class="detail-info-fix">
                                                    <p class="detail-info-top-fix">CMND</p>
                                                    <input class="detail-info-buton-fix"></input>
                                                </div>
                                                <div class="detail-info-fix">
                                                    <p class="detail-info-top-fix">SĐT</p>
                                                    <input class="detail-info-buton-fix"></input>
                                                </div>
                                                <div class="detail-info-fix">
                                                    <p class="detail-info-top-fix">Địa Chỉ</p>
                                                    <input class="detail-info-buton-fix"></input>
                                                </div>
                                                <div class="same-fix">
                                                    <div class="detail-info-fix-left">
                                                        <p class="detail-info-top-fix">Ngày Sinh</p>
                                                        <form class="input-date">
                                                            <input type="date" name="" id="" class="input-name-fix">
                                                        </form>
                                                    </div>
                                                    <div class="detail-info-fix-right">
                                                        <p class="detail-info-top-fix">Giới Tính</p>
                                                        <div class="input-fix">
                                                            <input type="radio" name="" id="">Nữ
                                                            <input type="radio" name="" id="">Nam
                                                        </div>
                                                    </div>
                                                </div>




                                            </div>


                                        </div>
                                        <div class="body-botton-fix">
                                            <button class="button-fix-f">Thêm Mới</button>
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
    <!-- Popup fix employee -->

	<c:forEach var="s" items="${kh}">
		<div class="modal fade" id="e-${s.maKH}" tabindex="-1" role="dialog"
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
							lưu để thay đổi trạng thái khách hàng</p>

					</div>
					<form method="post" modelAttribute="khachHang"
						action="/QuanLyRapChieuPhim/admin/customer/update/${s.maKH}.htm">
						<div class="modal-footer">

							<button type="submit" class="btn-green btn btn-primary">Lưu</button>


						</div>
					</form>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<!-- Disable 1 list -->
	<%-- <c:forEach var="maKH" items="${kh}">
    <div class="modal fade" id="disable-customer" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm v-modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="font-family: unset; font-style: unset; font-weight: 500;">Nhấn lưu để thay đổi trạng thái khách hàng</p>
                </div>
                <form method="post" modelAttribute="khachHang" action="/QuanLyRapChieuPhim/admin/customer/update/${maKH}.htm">
                    <div class="modal-footer">
                    <button type="submit" class="btn-green btn btn-primary">Lưu</button>
                        <c:if test="${countVeMap[maKH] == 0}">
                            <button type="submit" class="btn-green btn btn-primary">Lưu</button>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
    </div>
</c:forEach> --%>
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <footer class="footer text-center"> 2023 © by B.L.T.T
    </footer>
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
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/app-style-switcher.js"></script>
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/custom.js"></script>
    <!--This page JavaScript -->
    <!--chartis chart-->
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/plugins/bower_components/chartist/dist/chartist.min.js"></script>
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/pages/dashboards/dashboard1.js"></script>
</body>

</html>