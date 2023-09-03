<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Khuyến mãi</title>
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

h2 {
	text-align: center;
}

p {
	text-align: center;
}

div {
	text-align: center;
}
</style>
</head>

<body>

	<div class="main-container">
		<%@include file="/WEB-INF/views/include/header.jsp"%>

		<!-- Phim Sap Chieu -->
		<div class="link-container">
			<h2 class="movie-title">Khuyến mãi | sự kiện</h2>

		</div>
		<hr>

		<div class="container-movie" style="background-color: black;">
			<div class="list-movie-item">
				<li class="col-md-3 col-sm-6 col-xs-12 js__isotope_item"
					style="position: absolute; left: 0px; top: 50px;">
					<div class="news--item">
						<a href="https://www.bhdstar.vn/deals/combo-paw-patrol/"> <img
							width="270" height="152"
							src="https://www.bhdstar.vn/wp-content/uploads/2018/03/1920x1080-MUACBLONTANGCBNHO-270x152.png"
							class="attachment-news-thumb size-news-thumb wp-post-image"
							alt=""
							srcset="https://www.bhdstar.vn/wp-content/uploads/2018/03/1920x1080-MUACBLONTANGCBNHO-270x152.png 270w, https://www.bhdstar.vn/wp-content/uploads/2018/03/1920x1080-MUACBLONTANGCBNHO-245x138.png 245w, https://www.bhdstar.vn/wp-content/uploads/2018/03/1920x1080-MUACBLONTANGCBNHO-210x118.png 210w, https://www.bhdstar.vn/wp-content/uploads/2018/03/1920x1080-MUACBLONTANGCBNHO-470x264.png 470w, https://www.bhdstar.vn/wp-content/uploads/2018/03/1920x1080-MUACBLONTANGCBNHO-103x58.png 103w, https://www.bhdstar.vn/wp-content/uploads/2018/03/1920x1080-MUACBLONTANGCBNHO-268x151.png 268w"
							sizes="(max-width: 270px) 100vw, 270px"></a>
					</div>
				</li>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>

</html>