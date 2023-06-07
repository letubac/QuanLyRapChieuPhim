<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đặt Vé Thành Công</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
    integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap-5.1.3-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/css/style_payment.css">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/fontawesome-pro-6.1.1-web/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

  	<style>
  		.container1
  		{
  			width: 100%;
  			display: grid;
  			grid-template-columns: auto auto auto auto auto auto auto auto;
  			grid-gap: 10px 10px;
  		}
  		.dropdown:hover .dropdown-menu {
			display: block;
			margin-top: 0;
		}
		.panel-info-span {
			left: 100px;
		}
  	</style>
</head>

<body>

<!---->
  <%@include file="/WEB-INF/views/include/header.jsp"%>
  <div class="main">

    <!-- Tab items -->
    <div class="tabs">
      <!-- <div class="tab-item active">
        <span class="selected-ticket">1. Chọn Vé</span>
      </div> -->
      <div class="tab-item" id="tab-item-1">
        <span class="selected-ticket" id="tab-item-1">1. Chọn Vé</span>
      </div>
      <div class="tab-item" id="tab-item-2">
        <span class="selected-ticket">2. Thanh Toán</span>
      </div>
      <div class="tab-item active" id="tab-item-3">
        <span class="selected-ticket">3. Xác nhận</span>
      </div>
      <div class="line"></div>
    </div>

    <!-- Tab content -->
    <div class="tab-content">
      <div class="tab-pane active" id="tab-pane-2">
        <div class="confirm-panel">
          <div class="confirm-panel-header">
            <h3 class="panel-title">ĐẶT VÉ THÀNH CÔNG!</h3>
            <!--<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi nemo maiores, laudantium nam quidem
              doloremque voluptate alias distinctio odit. In nesciunt vero beatae optio velit ?</p>-->
          </div>
          <div class="confirm-panel-content">
            <div class="panel-qrcode">
              <span>Mã vào phòng:</span>
              <div class="qr-image">
                <img src="https://www.qrcode-gen.com/images/qrcode-default.png" alt="">
                <
              </div>

            </div>
            <div class="panel-info">
              <div>Mã Vé: <span class="panel-info-span">${v.maVe }</span></div>
              <div>Rạp: <span class="panel-info-span">PTITHCM</span></div>
              <div>Phim: <span class="panel-info-span">${lc.dsPhim.tenPhim}</span></div>
              <div>Suất Chiếu: <span class="panel-info-span">${lc.gioChieu}:00(${lc.ngayChieu })</span></div>
              <div>Giá vé: <span class="panel-info-span">${lv.gia}</span></div>
              <!--<div>Do an va thuc uong: <span class="panel-info-span"></span></div>
              <div>Tong cong: <span class="panel-info-span">45,000 VND</span></div>-->
            </div>
          </div>
          <div class="edit-final" style="display: flex;">
						<form
							action="/QuanLyRapChieuPhim/customer/payment/${lc.dsPhim.maPhim}/${lc.maSC }.htm">
							<button type="submit" class="btn btn-primary btn-lg btn-block"
								id="btn-continue1"
								style="text-align: center; background: #5eb742; color: #fff; border: none; margin-left: 130px; cursor: pointer">Đặt
								Tiếp</button>
						</form>
						<form action="/QuanLyRapChieuPhim/home.htm">
							<button class="btn btn-primary btn-lg btn-block" type="submit"
								style="background: #e01027; color: #fff; border: none; cursor: pointer; margin-left: 10px;">Trang
								Chủ</button>
						</form>
		  </div>
        </div>
      </div>
    </div>
</div>




  <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="https://getbootstrap.com/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
  <script src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
    crossorigin="anonymous"></script>
  <script src="https://getbootstrap.com/docs/4.3/examples/checkout/form-validation.js"></script>
  <!--<script src="/QuanLyRapChieuPhim/resources/js/payment.js"></script>-->
</body>

</html>