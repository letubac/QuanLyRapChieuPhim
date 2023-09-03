<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quảng cáo</title>
<link rel="stylesheet"
	href="<c:url value='/resources/assets/dist/css/bootstrap.min.css'/>" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/style_film.css'/>" />
<link rel="stylesheet"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap-5.1.3-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap/dist/css/bootstrap.min.css">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/imgs/theme/logo.svg" />

<link rel="stylesheet"
	href="http://localhost:8080/QuanLyRapChieuPhim/resources/fontawesome-pro-6.1.1-web/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
	integrity="sha512-rqQltXRuHxtPWhktpAZxLHUVJ3Eombn3hvk9PHjV/N5DMUYnzKPC1i3ub0mEXgFzsaZNeJcoE0YHq0j/GFsdGg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}

text--content {
    padding-top: 5px;
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    line-height: 26px;
    color: #060606;
    width: 100%;
}
</style>
</head>

<body>

	<div class="main-container">
		<%@include file="/WEB-INF/views/include/header.jsp"%>

		<!-- Phim Sap Chieu -->
		<div class="link-container">
			<h2 class="movie-title">Quảng cáo</h2>

		</div>
		<hr>

		<div class="container-movie-1" style="background-color: black;">
				<p>Thông tin về dịch vụ quảng cáo</p>
				<p>
					<strong>BHD Star Cineplex</strong> đang trở thành điểm đến mới mẻ
					và cực kỳ tiện lợi cho những khách hàng có nhu cầu quảng cáo sản
					phẩm và tổ chức sự kiện. Với lượng khán giả thường xuyên rất đông
					đảo, đặc biệt là các ngày lễ và cuối tuần, việc quảng cáo sản phẩm
					qua các TVC trước giờ chiếu phim hay tại các LCD sảnh đã trở nên
					một công cụ không thể thiếu trong media mix của nhiều công ty trong
					nhiều lĩnh vực. Ngoài TVC, các sảnh rạp cũng là một không gian lý
					tưởng cho việc phát sampling, đặt các booth hoặc tủ trưng bày, để
					khán giả quan tâm và tìm hiểu trực tiếp, thậm chí tương tác với sản
					phẩm của mình.
				</p>
				<p>Các phòng chiếu được thiết kế rộng rãi, màn hình và âm thanh
					chuẩn, các hàng ghế sắp xếp từ thấp đến cao, hoàn toàn phù hợp cho
					việc tổ chức các hội nghị, hội thảo hay họp mặt cho đông người.
					Việc tổ chức này có thể được thực hiện qua cách thuê phòng chiếu
					trực tiếp hoặc mua vé số lượng lớn, và đều được áp dụng mức chiếu
					khấu cực kỳ hấp dẫn.</p>
				<ul>
					<li>Quảng cáo: TVC, POSM, Booth…</li>
					<li>Thẻ quà tặng, phiếu quà tặng</li>
					<li>Thuê phòng chiếu làm sự kiện / xem phim</li>
					<li>Vé số lượng lớn</li>
				</ul>
				<p>Hãy liên hệ ngay với chúng tôi hôm nay:</p>
				<ul>
					<li><strong>Địa chỉ</strong>: Tầng 5, Vincom Megamall, 159 Xa
						lộ Hà Nội, P.Thảo Điền, Q.2, TPHCM</li>
					<li><strong>Điện thoại</strong>: 08 62 670670</li>
					<li><strong>E-Mail:</strong> sales@bhdstar.vn</li>
				</ul>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>

</html>