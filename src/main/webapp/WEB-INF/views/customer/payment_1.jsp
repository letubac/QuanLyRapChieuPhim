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
  <title>Thanh Toán</title>
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
      <div class="tab-item active" id="tab-item-2">
        <span class="selected-ticket">2. Thanh Toán</span>
      </div>
      <div class="tab-item" id="tab-item-3">
        <span class="selected-ticket">3. Xác nhận</span>
      </div>
      <div class="line"></div>
    </div>

    <!-- Tab content -->
    <div class="tab-content">
      

      <div class="tab-pane-show " id="tab-pane-1">
        <div class="row" style="border-radius: 5px ;">
          <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
              <span class="text-muted">Vé Của Bạn</span>
              
            </h4>
            <ul class="list-group mb-3">
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Phim</h6>
                  <small class="text-muted">${lc.dsPhim.tenPhim }</small>
                </div>
                
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Phòng</h6>
                  <small class="text-muted">${lc.dsPhong.maPhong }</small>
                </div>
          
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Số Ghế</h6>
                  <small class="text-muted">${soGhe }</small>
                </div>
      
              </li>
              <li class="list-group-item d-flex justify-content-between bg-light">
                <div class="text-success">
                  <h6 class="my-0">Lịch Chiếu</h6>
                  <small>${lc.gioChieu }:00 (${lc.ngayChieu })</small>
                </div>

              </li>
              <li class="list-group-item d-flex justify-content-between">
                <span>Giá</span>
                <strong>${lv.gia }</strong>
              </li>
            </ul>


          </div>
          <div class="col-md-8 order-md-1">
            <h4 class="mb-3" style="color: 
            #eeede9">Thanh Toán</h4>
            <form class="needs-validation" novalidate id="form-payment">
              <div class="row">

                <div class="col-md-6 mb-3">
                </div>
              </div>

              <div class="mb-3">
                <label for="username" style="color: 
                #eeede9">Tên</label>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">@</span>
                  </div>
                  <input type="text" class="form-control" id="username" placeholder="Tên" value="${user.tenKH}" readonly>
                  <div class="invalid-feedback" style="width: 100%;" value="">
                    Your username is required.
                  </div>
                </div>
              </div>

              <div class="mb-3">
                <label for="email" style="color: 
                #eeede9">Email <span class="text-muted"></span></label>
                <input type="email" class="form-control" id="email" placeholder="...@gmail.com" value="${user.dstaikhoan.email }" readonly>
                <div class="invalid-feedback">
                  Please enter a valid email address for shipping updates.
                </div>
              </div>



              <div class="mb-3">
                <label for="address2" style="color: 
                #eeede9">Số Điện Thoại<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control" id="address2" placeholder="Apartment or suite" value="${user.soDT }" readonly>
              </div>
              <div class="mb-3">
                <label for="address2" style="color: 
                #eeede9">Địa Chỉ<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control" id="address2" placeholder="Apartment or suite" value="${user.diaChi }" readonly>
              </div>




              <h4 class="mb-3" style="color: #fff;">Thanh Toán</h4>

              <div class="d-block my-3">
                <div class="custom-control custom-radio" style="padding-left: 20px;">
                  <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                  <label class="custom-control-label" for="credit" style="color: #fff;">MoMo</label>
                </div>
                <!--<div class="custom-control custom-radio" style="padding-left: 20px;">
                  <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="debit" style="color: #fff;">Tiền Mặt</label>
                </div>-->
                <div class="custom-control custom-radio" style="padding-left: 20px;">
                  <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="paypal" style="color: #fff;">ZaLoPay</label>
                </div>
              </div>
              
              <!-- <hr class="mb-4"> -->
             

            </form>
             <div class="btn-trangthai" style="margin-left:190px; display: flex;">
              <form action="/QuanLyRapChieuPhim/customer/payment/${lc.dsPhim.maPhim}/${lc.maSC}.htm">
              	<button class="btn btn-primary btn-lg btn-block" type="submit"
                  style="background:#e01027 ; color: #fff; border: none; cursor: pointer">Hủy Đặt Vé</button>
              </form>
                
               <form action="/QuanLyRapChieuPhim/customer/payment_2/${lc.maSC}/${soGhe}.htm">
               		<button type="submit" class="btn btn-primary btn-lg btn-block" id="btn-continue1"
                  style="background:#5eb742 ;  color: #fff; border: none; margin-left: 5px; cursor: pointer">Thanh
                  Toán</button>
               </form>
                
              </div>
            <!-- <button class="btn-continue" id="btn-continue1">Tiep tuc</button> -->
          </div>

        </div>
      </div>

    </div>
</div>




  <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
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