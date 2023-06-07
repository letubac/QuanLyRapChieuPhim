<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quy Định Và Chính Sách Chung</title>

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
		<h1 class="about--us-title">Quy định và chính sách chung</h1>
		<div class="about--us-content">
			<div class="text--content">
				<p>
					<strong>Điều kiện giao dịch chung đối với hàng hóa hoặc
						dịch vụ:</strong>
				</p>
				<ol>
					<li>BHD Star không thể cung cấp hàng hoá, dịch vụ trong trường
						hợp khách hàng mua vé xem phim ở rạp này nhưng tới rạp khác để lấy
						hoặc sử dụng vé xem phim trễ hơn thời gian quy định của giao dịch</li>
					<li>Vé xem phim đã hoàn tất thanh toán qua bhdstar.vn sẽ không
						được hoàn trả trong đa số trường hợp. Trong các trường hợp bất khả
						kháng, khách hàng cần liên hệ với ban quản lý tại rạp mình đã chọn
						mua vé xem phim thông qua địa chỉ thư điện tử cskh@bhdstar.vn hoặc
						hotline 19002099 để thông báo về trường hợp của mình để ban quản
						lý rạp tư vấn và giải quyết. Trong trường hợp ban quản lý rạp
						không đáp ứng được việc chiếu phim vì lý do kỹ thuật hay lý do bất
						khả kháng khác thì ban quản lý rạp có trách nhiệm liên hệ, thông
						báo, giải thích và hoàn trả vé xem phim của khách hàng đã mua.</li>
					<li>Các chính sách giá hàng hoá, dịch vụ được niêm yết trên
						bhdstar.vn và tại mỗi rạp. Khi khách hàng chọn lựa một hàng hoá,
						dịch vụ bất kỳ thì nhân viên rạp có trách nhiệm giải thích về các
						điều kiện và hạn chế nếu có. Trong bất kỳ trường hợp nào, khách
						hàng có thể gửi thắc mắc đến cskh@bhdstar.vn hoặc gọi số hotline
						19002099 để được giải đáp</li>
					<li>Nhân viên của BHD Star có trách nhiệm giải thích rõ ràng
						về điều kiện sử dụng của mỗi loại hàng hoá, dịch vụ cho khách
						hàng. Khách hàng có trách nhiệm tìm hiểu kỹ về điều kiện sử dụng
						hàng hoá, dịch vụ trước khi giao dịch.</li>
				</ol>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>