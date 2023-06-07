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
  <title>Đặt Ghế</title>
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
      <div class="tab-item active" id="tab-item-1">
        <span class="selected-ticket" id="tab-item-1">1. Chọn Vé</span>
      </div>
      <div class="tab-item" id="tab-item-2">
        <span class="selected-ticket">2. Thanh Toán</span>
      </div>
      <div class="tab-item" id="tab-item-3">
        <span class="selected-ticket">3. Xác nhận</span>
      </div>
      <div class="line"></div>
    </div>

    <!-- Tab content -->
    <div class="tab-content">
      <div class="tab-pane active" id="tab-pane-1">
        <div class="info-film">
          <div class="info-film-right">
            <img style="width: 200px;" class="movie-poster"
              src="${phim.link }"
              alt="">
            <div class="detail-movie-poster">
              <h4 style="color: 
                #6ac441;" class="movie-name">${phim.tenPhim }</h4>
              <h5 style="color: #fff;">Lịch Chiếu</h5>
              <h6 style="color: #fff;">${lc.gioChieu}:00 (${lc.ngayChieu}) </h6>
            </div>
          </div>
          <br>
          <br>
          <h3 style="color: #6ac441; font-weight: 300;">CHỌN GHẾ</h3>
          <br>
          <br>
          <p class="p-notify">
            Vui lòng chọn ghế trong sơ đồ ghế phía dưới. Nếu bạn muốn chọn loại ghế khác hoặc thay đổi
            số lượng vé <br> muốn mua vui lòng nhấp vào <b style="color: #6ac441; font-weight:200;">Bước 1
              "Chọn Vé"</b> ở thanh công cụ bên trên để quay trở lại màn hình chọn.

          </p>

          <!--<button class="btn-continue" id="btn-continue">Tiếp tục</button>-->

        </div>
        <div class="movie-container">

          <ul class="showcase">
            <li>
              <div class="seat"></div>
              <small style="color: #fff;">Ghế Trống</small>
            </li>
            <li>
              <div class="seat selected"></div>
              <small style="color: #fff;">Ghế Bạn Chọn</small>
            </li>
            <li>
              <div class="seat occupied"></div>
              <small style="color: #fff;">Ghế Đã Chọn</small>
            </li>
          </ul>
          <select id="movie">
            <option value="${lv.gia }">Giá Vé (Rs. ${lv.gia } VND)</option>
            <!-- <option value="200">Kabir Singh (Rs. 200)</option>
            <option value="150">Duniyadari (Rs. 150)</option>
            <option value="100">Natsamrat (Rs. 100)</option> -->
          </select>



          <div class="container1">
          
				<c:forEach var="s" items="${sl}">
					
						<c:choose>
							<c:when test="${s.stt == 'Trong' }">
								<a href="/QuanLyRapChieuPhim/customer/payment_1/${lc.maSC}/${s.num}.htm">
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
							<c:when test="${s.stt == 'Cua ban' }">
								<div class="seat selected">
                					<span class="name-seat">${s.num }</span>
              					</div>	
							</c:when>
						</c:choose>
					
				</c:forEach>
				</div>	

            <p class="text" style="color: #fff;">
              Tổng ghế chọn <span id="count">0</span> - Tổng tiền <span id="total">0</span>
            </p>
          </div>
        </div>
      

      <!--<div class="tab-pane " id="tab-pane-2">
        <div class="row" style="border-radius: 5px ;">
          <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
              <span class="text-muted">Vé Của Bạn</span>
              <span class="badge badge-secondary badge-pill" id="countSeat">0</span>
            </h4>
            <ul class="list-group mb-3">
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Product name</h6>
                  <small class="text-muted">Brief description</small>
                </div>
                <span class="text-muted">$12</span>
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Second product</h6>
                  <small class="text-muted">Brief description</small>
                </div>
                <span class="text-muted">$8</span>
              </li>
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">Third item</h6>
                  <small class="text-muted">Brief description</small>
                </div>
                <span class="text-muted">$5</span>
              </li>
              <li class="list-group-item d-flex justify-content-between bg-light">
                <div class="text-success">
                  <h6 class="my-0">Promo code</h6>
                  <small>EXAMPLECODE</small>
                </div>
                <span class="text-success">-$5</span>
              </li>
              <li class="list-group-item d-flex justify-content-between">
                <span>Total (USD)</span>
                <strong>$20</strong>
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
                  <input type="text" class="form-control" id="username" placeholder="Tên" required>
                  <div class="invalid-feedback" style="width: 100%;">
                    Your username is required.
                  </div>
                </div>
              </div>

              <div class="mb-3">
                <label for="email" style="color: 
                #eeede9">Email <span class="text-muted"></span></label>
                <input type="email" class="form-control" id="email" placeholder="...@gmail.com" value="${user.dstaikhoan.email }">
                <div class="invalid-feedback">
                  Please enter a valid email address for shipping updates.
                </div>
              </div>



              <div class="mb-3">
                <label for="address2" style="color: 
                #eeede9">Số Điện Thoại<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
              </div>
              <div class="mb-3">
                <label for="address2" style="color: 
                #eeede9">Địa Chỉ<span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
              </div>




              <h4 class="mb-3" style="color: #fff;">Thanh Toán</h4>

              <div class="d-block my-3">
                <div class="custom-control custom-radio" style="padding-left: 20px;">
                  <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                  <label class="custom-control-label" for="credit" style="color: #fff;">MoMo</label>
                </div>
                <div class="custom-control custom-radio" style="padding-left: 20px;">
                  <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="debit" style="color: #fff;">Tiền Mặt</label>
                </div>
                <div class="custom-control custom-radio" style="padding-left: 20px;">
                  <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="paypal" style="color: #fff;">ZaLoPay</label>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="cc-name" style="color: #fff;">Tên Chủ Thẻ</label>
                  <input type="text" class="form-control" id="cc-name" placeholder="" required>

                  <div class="invalid-feedback" style="color: #fff;">
                    Name on card is required
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="cc-number" style="color: #fff;">Số Thẻ</label>
                  <input type="text" class="form-control" id="cc-number" placeholder="" required>
                  <div class="invalid-feedback">
                    Credit card number is required
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-3 mb-3">
                  <label for="cc-expiration" style="color: #fff;">Hết Hạn</label>
                  <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                  <div class="invalid-feedback">
                    Expiration date required
                  </div>
                </div>
                <div class="col-md-3 mb-3">
                  <label for="cc-cvv" style="color: #fff;">CVV</label>
                  <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                  <div class="invalid-feedback">
                    Security code required
                  </div>
                </div>
              </div>
              <!-- <hr class="mb-4">
              <div class="btn-trangthai" style="margin-left:190px; display: flex;">
                <button class="btn btn-primary btn-lg btn-block" type="submit"
                  style="background:#e01027 ; color: #fff; border: none; cursor: pointer">Hủy Đặt Vé</button>
                <button class="btn btn-primary btn-lg btn-block" id="btn-continue1"
                  style="background:#5eb742 ;  color: #fff; border: none; margin-left: 5px; cursor: pointer">Thanh
                  Toán</button>
              </div>

            </form>
            <!-- <button class="btn-continue" id="btn-continue1">Tiep tuc</button>
          </div>

        </div>
      </div>

      <div class="tab-pane" id="tab-pane-3">
        <div class="confirm-panel">
          <div class="confirm-panel-header">
            <h3 class="panel-title">Chuc mung ban !</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi nemo maiores, laudantium nam quidem
              doloremque voluptate alias distinctio odit. In nesciunt vero beatae optio velit ?</p>
          </div>
          <div class="confirm-panel-content">
            <div class="panel-qrcode">
              <span>Ma vao khan phong: </span>
              <div class="qr-image">
                <img src="https://www.qrcode-gen.com/images/qrcode-default.png" alt="">
                <b>WQWREWE</b>
              </div>

            </div>
            <div class="panel-info">
              <div>Ma dat ve: <span class="panel-info-span">188209</span></div>
              <div>Rap: <span class="panel-info-span">PTIT DEU Q9</span></div>
              <div>Thong tin phim: <span class="panel-info-span">Doremon va nhung nguoi ban</span></div>
              <div>Suat chieu: <span class="panel-info-span">Thu 7, 21/5/2022</span></div>
              <div>Thong tin ve: <span class="panel-info-span">1 x ve 2D U22 (45,000 VND - F7)</span></div>
              <div>Do an va thuc uong: <span class="panel-info-span"></span></div>
              <div>Tong cong: <span class="panel-info-span">45,000 VND</span></div>
            </div>
          </div>
        </div>
      </div>-->
    </div>
</div>




  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
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