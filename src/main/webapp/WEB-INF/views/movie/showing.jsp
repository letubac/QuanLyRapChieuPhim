<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sắp Chiếu</title>
    <link rel="stylesheet" href="<c:url value='/resources/assets/dist/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <link rel="stylesheet" href="<c:url value='/resources/css/style_film.css'/>" />
    <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap-5.1.3-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap/dist/css/bootstrap.min.css">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="http://localhost:8080/QuanLyRapChieuPhim/resources/imgs/theme/logo.svg" />

    <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/fontawesome-pro-6.1.1-web/css/all.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" integrity="sha512-rqQltXRuHxtPWhktpAZxLHUVJ3Eombn3hvk9PHjV/N5DMUYnzKPC1i3ub0mEXgFzsaZNeJcoE0YHq0j/GFsdGg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Template CSS -->
    
<style>
.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}
</style>
    
</head>

<body>
	
	
    <div class="main-container">
    	<%@include file="/WEB-INF/views/include/header.jsp"%>

        <div class="link-container">
            <h2 class="movie-title">Phim Đang Chiếu</h2>
            <a class="link" href="http://localhost:8080/QuanLyRapChieuPhim/film/coming_soon.htm"">Phim Sắp Chiếu</a>

        </div>
        <hr>
        <div class="container-movie">
        	<c:forEach var="s" items="${phim}">
            <div class="list-movie-item">
                <a href="/QuanLyRapChieuPhim/film/detail/ma=${s.maPhim }.htm">
                    <img class="movie-poster"
                        src="${s.link}"
                        alt="">
                </a>
                <a href="/QuanLyRapChieuPhim/film/detail/ma=${s.maPhim }.htm">
                    <h4 class="movie-name">${s.tenPhim}</h4>
                </a>
                <div style="margin-bottom: 50px">
	                <div class="movie-info-wrap">
	                    <p class="movie-info">Thể loại: </p><span class="movie-info-detail"><c:forEach var="tl" items="${s.theLoaiS}">${tl.chiTietTL.tenTL},</c:forEach></span>
	                </div>
	                <div class="movie-info-wrap">
	                    <p class="movie-info">Thời lượng: </p><span class="movie-info-detail">${s.thoiLuong } phút</span>
	                </div>
	                <div class="movie-info-wrap">
	                    <p class="movie-info">Khởi chiếu: </p><span class="movie-info-detail">${s.ngayKC}</span>
	                </div>
                </div>
                
                <div class="btn-wrap">
                    <i class="fa-solid fa-ticket"></i>
                    <a href="/QuanLyRapChieuPhim/film/detail/ma=${s.maPhim}/${day}.htm"><button class="btn-buy-ticket">Mua vé</button></a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>

</html>