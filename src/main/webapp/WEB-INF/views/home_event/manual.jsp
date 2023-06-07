<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hướng Dẫn Đặt Vé</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="<c:url value='/resources/assets/dist/css/bootstrap.min.css'/>" />
		

<style>
.about--us-title {
	text-align: center;
	font-family: inherit;
	font-weight: bold;
	text-transform: uppercase;
}

.main{
	margin-top: 20px;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/header.jsp"%>
	<div class="main container">
		<h1 class="about--us-title">Hướng dẫn đặt vé trực tuyến</h1>
		<div class="about--us-content">
			<div class="text--content">
				<p>Đừng bỏ lỡ quyền lợi thành viên với điểm thưởng và visit khi
					đặt vé trên website và ứng dụng BHD Star nhé. Chỉ cần làm theo
					những bước hướng dẫn sau:</p>
				<p>
					<img class="alignnone size-full wp-image-9917"
						src="https://www.bhdstar.vn/wp-content/uploads/2019/08/BHD-Star-Info-MuaVe-1920x1080.jpg"
						alt="" width="960" height="540"
						srcset="https://www.bhdstar.vn/wp-content/uploads/2019/08/BHD-Star-Info-MuaVe-1920x1080.jpg 1920w, https://www.bhdstar.vn/wp-content/uploads/2019/08/BHD-Star-Info-MuaVe-1920x1080-245x138.jpg 245w, https://www.bhdstar.vn/wp-content/uploads/2019/08/BHD-Star-Info-MuaVe-1920x1080-210x118.jpg 210w, https://www.bhdstar.vn/wp-content/uploads/2019/08/BHD-Star-Info-MuaVe-1920x1080-470x264.jpg 470w, https://www.bhdstar.vn/wp-content/uploads/2019/08/BHD-Star-Info-MuaVe-1920x1080-103x58.jpg 103w, https://www.bhdstar.vn/wp-content/uploads/2019/08/BHD-Star-Info-MuaVe-1920x1080-268x151.jpg 268w, https://www.bhdstar.vn/wp-content/uploads/2019/08/BHD-Star-Info-MuaVe-1920x1080-270x152.jpg 270w"
						sizes="(max-width: 1920px) 100vw, 1920px">
				</p>
				<p>
					<strong>BƯỚC 1: Đăng nhập tài khoản thành viên</strong>
				</p>
				<p>
					(Nếu chưa có tài khoản, vui lòng đăng ký <a
						href="https://www.bhdstar.vn/dang-ky"><span
						style="color: #0000ff;"><strong>tại đây</strong></span></a>)
				</p>
				<p>
					<em>Lưu ý: Nếu khách hàng đăng nhập thành viên sau những thao
						tác khác, giao dịch sẽ không được tích điểm.</em>
				</p>
				<p>
					<strong>BƯỚC 2: Chọn phim và rạp muốn xem, chọn suất chiếu
						và ghế</strong>
				</p>
				<p>
					<em>Lưu ý: Mỗi giao dịch được mua tối đa 4 ghế. Hiện tại, BHD
						Star chưa hỗ trợ đặt ghế đôi trên website. Để đặt ghế đôi, vui
						lòng đặt vé qua ứng dụng BHD Star Cineplex.</em>
				</p>
				<p>
					<img class="alignnone wp-image-9369"
						src="https://www.bhdstar.vn/wp-content/uploads/2019/03/smallqr.png"
						sizes="(max-width: 400px) 100vw, 400px"
						srcset="https://www.bhdstar.vn/wp-content/uploads/2019/03/smallqr.png 400w, https://www.bhdstar.vn/wp-content/uploads/2019/03/smallqr-60x60.png 60w, https://www.bhdstar.vn/wp-content/uploads/2019/03/smallqr-245x245.png 245w, https://www.bhdstar.vn/wp-content/uploads/2019/03/smallqr-210x210.png 210w, https://www.bhdstar.vn/wp-content/uploads/2019/03/smallqr-103x103.png 103w, https://www.bhdstar.vn/wp-content/uploads/2019/03/smallqr-268x268.png 268w, https://www.bhdstar.vn/wp-content/uploads/2019/03/smallqr-270x270.png 270w"
						alt="" width="175" height="175">
				</p>
				<p>
					<strong>BƯỚC 3: Kiểm tra kỹ thông tin đơn hàng</strong>
				</p>
				<ul>
					<li>Vị trí rạp muốn xem</li>
					<li>Thời gian suất chiếu</li>
					<li>Vị trí ghế ngồi</li>
					<li>Thông tin nhận mã đặt vé (Email &amp; số điện thoại)</li>
				</ul>
				<p>
					<em>Lưu ý: Vé đã thanh toán thành công không thể đổi, trả. Vì
						vậy, khách hàng vui lòng kiểm tra kỹ thông tin trước khi xác nhận
						thanh toán.</em>
				</p>
				<p>
					<strong>BƯỚC 4: Xác nhận thanh toán</strong>
				</p>
				<p>Website www.bhdstar.vn đang áp dụng các phương thức thanh
					toán qua cổng thanh toán Napas và các loại ví điện tử bao gồm
					ZaloPay, Momo, AirPay…</p>
				<p>Ứng dụng BHD Star hiện tại chỉ có duy nhất phương thức thanh
					toán qua cổng Napas (thẻ thanh toán quốc tế và nội địa)</p>
				<p>Tất cả các phương thức thanh toán này được vận hành theo cách
					thức do các cổng thanh toán và ví điện tử quy định, bao gồm các
					loại thẻ nội địa và quốc tế, liên kết với ngân hàng, số dư tối
					thiểu trong tài khoản, phương thức xác nhận giao dịch, thời gian
					giao dịch cho phép…</p>
				<p>BHD Star không thể can thiệp vào các cách thức này nhưng có
					trách nhiệm hướng dẫn khách hàng làm đúng quy định để giao dịch
					thành công.</p>
				<p>
					<strong>BƯỚC 5: Nhận thông tin đặt vé qua Email đã đăng ký</strong>
				</p>
				<p>
					<em>Lưu ý: Vui lòng không tắt trình duyệt khi chưa nhận được
						email mã vé</em>
				</p>
				<p>Đối với khách hàng mua vé trên ứng dụng BHD Star, vui lòng
					kiểm tra mã vé trong lịch sử giao dịch.</p>
				<p>—</p>
				<p>
					Nếu gặp bất cứ vấn đề nào liên quan đến quá trình đặt vé trực
					tuyến, xin khách hàng liên hệ <a href="http://m.me/bhdstar">Fanpage
						BHD Star Cineplex</a> hoặc email cskh@bhdstar.vn để được hỗ trợ nhanh
					nhất.
				</p>
				<p style="text-align: right;">
					<strong>BHD Star Cineplex</strong>
				</p>
			</div>
		</div>
	</div>
	
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>