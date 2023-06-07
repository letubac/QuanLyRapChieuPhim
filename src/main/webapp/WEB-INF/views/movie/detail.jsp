<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết</title>
    <link rel="stylesheet" href="<c:url value='/resources/assets/dist/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<c:url value='/resources/css/detail_film.css'/>" />
    <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap-5.1.3-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/bootstrap/dist/css/bootstrap.min.css">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="http://localhost:8080/QuanLyRapChieuPhim/resources/imgs/theme/logo.svg" />

    <link rel="stylesheet" href="http://localhost:8080/QuanLyRapChieuPhim/resources/fontawesome-pro-6.1.1-web/css/all.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" integrity="sha512-rqQltXRuHxtPWhktpAZxLHUVJ3Eombn3hvk9PHjV/N5DMUYnzKPC1i3ub0mEXgFzsaZNeJcoE0YHq0j/GFsdGg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
<style>
.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}
</style>
    
	<script>
   		 var curDate = new Date()
      
   	</script>
</head>

<body>
    <div class="main-container">
       <%@include file="/WEB-INF/views/include/header.jsp"%>
       <!--<div class="detail-title-header">
            <h3 class="detail-title-name ">Phim Đang Chiếu |</h3>
            <h3 class="detail-title-name detail-title-vs1">ABC</h3>-->

        </div>
        <div class="detail-movie-container" style=" color: #fff; margin-top: 12rem;">
            <img class="movie-poster"
                src="${phim.link }"
                alt="">
            <div class="movie-content">
                <div class="product--name">
                    <h3 style="color: #fff;" class="">${phim.tenPhim}</h3>
                </div>
                <div class="movie-detail">
                    ${phim.moTa}
                </div>
                <ul class="movie-info">
                    <li class="movie-info-item">
                        <span class="col-left">Đạo Diễn: </span>
                        <span class="col-right ">${phim.daoDien}<span>
                    </li>
                    <li class="movie-info-item">
                        <span class="col-left">Thể Loại: </span>
                        <span class="col-right">
                        	<c:forEach var="tl" items="${phim.theLoaiS}">
                        		${tl.chiTietTL.tenTL},
                        	</c:forEach>
                        </span>
                    </li>
                    <li class="movie-info-item">
                        <span class="col-left">Khởi Chiếu: </span>
                        <span class="col-right">${phim.ngayKC}</span>
                    </li>
                    <li class="movie-info-item">
                        <span class="col-left">Thời Lượng: </span>
                        <span class="col-right">${phim.thoiLuong} phút</span>
                    </li>
                    <li class="movie-info-item">
                        <span class="col-left">Ngôn Ngữ: </span>
                        <span class="col-right">${phim.nuocSX}</span>
                    </li>
                    <div class="btn-row">
                        <a class="btn-wrap">
                            Trailer
                        </a>
                        <a class="btn-wrap" href="/QuanLyRapChieuPhim/film/detail/ma=${phim.maPhim}/${day}.htm">
                            <i class="fa-solid fa-ticket"></i>
                            Mua Vé
                        </a>
                    </div>

                </ul>
            </div>
        </div>
        <div class="showtimes">
            <h3 style="color: #fff;">Vui lòng chọn thông tin vé</h3>
            <div class="list-time">
                <div class="showtimes-container">
                    <ul id="showtimes-list" class="showtimes-list">
                        <!-- <li class="showtimes-list-item ">
                            <a class="show-date" href="#">
                                <span class="week">Thu 4</span>
                                <span class="day">20-4</span>
                            </a>
                        </li> -->
                    </ul>
                </div>
            </div>
            <div class="list--showtimes-cinema">
                <div class="list-col-left">
                    <span class="type">
                        2D
                        <br>
                        SUB
                    </span>
                    <span class="movive-rating">C13</span>
                </div>
                <ul class="list-times">
                	<c:forEach var="l" items="${lc}" varStatus="status">
                    <li class="list-time-item">
                        <a href="/QuanLyRapChieuPhim/customer/payment/${phim.maPhim}/${l.maSC }.htm" class="list-time-link"> ${l.gioChieu}:00 </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>



    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="http://localhost:8080/QuanLyRapChieuPhim/resources/js/script.js"></script>
</body>

</html>