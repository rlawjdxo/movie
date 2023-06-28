<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>영화 예매</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/img/favicon.png" rel="icon">
<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Cardo:ital,wght@0,400;0,700;1,400&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<link href="resources/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="resources/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/css/main.css" rel="stylesheet">


<!-- =======================================================
  * Template Name: PhotoFolio
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/photofolio-bootstrap-photography-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<div
			class="container-fluid d-flex align-items-center justify-content-between">

			<a href="index.html"
				class="logo d-flex align-items-center  me-auto me-lg-0"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<!-- <img src="resources/img/logo.png" alt=""> -->

				<h1>
					<img alt="" src="resources/img/logo/logo.png" class="logo"
						width="380px" height="300px"></img>
				</h1>
			</a>

			<nav id="navbar" class="navbar">
				<ul>
					<li><a href="home" class="active">홈</a></li>
					<c:if test="${loginId=='admin'}">
						<li><a href="movieForm" class="active">영화등록</a></li>
					</c:if>
					<li><a href="movielist" class="active">영화목록</a></li>
					<li class="dropdown"><a href="#"><span>장르 카테고리</span> <i
							class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<li><a href="gallery.html">로맨스</a></li>
							<li><a href="gallery.html">코믹</a></li>
							<li><a href="gallery.html">공포</a></li>
							<li><a href="gallery.html">액션</a></li>
							<li><a href="gallery.html">판타지</a></li>
							<li><a href="gallery.html">드라마</a></li>
							<li><a href="gallery.html">다큐멘터리</a></li>
							<li><a href="gallery.html">애니메이션</a></li>


						</ul>
					<li class="dropdown"><a href="#"><span>영화관</span> <i
							class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<li><a href="gallery.html">부평</a></li>
							<li><a href="gallery.html">송도</a></li>
							<li><a href="gallery.html">주안</a></li>
							<li><a href="gallery.html">연수</a></li>

						</ul>
					<li><a href="eService">고객센터</a></li>


				</ul>

			</nav>
			<!-- .navbar -->

			<div class="header-social-links">
				<c:choose>
					<c:when test="${sessionScope.loginId == null }">
						<a href="loginForm">로그인</a>
						<a href="joinForm">회원가입</a>
					</c:when>
					<c:otherwise>
						<a href="logout">로그아웃</a>
						<a href="euView?euId=${loginId}">내정보</a>
						<c:if test="${loginId=='admin'}">
							<a href="euList">회원목록</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			<i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i> <i
				class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

		</div>
	</header>
	<!-- End Header -->
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<main id="main" data-aos="fade" data-aos-delay="1500">
		<form action="kkView" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="bWriter" value="${loginId}" />

			<main id="main" data-aos="fade" data-aos-delay="1500">
				<table>
					<caption>영화 예매</caption>

					<tr>
						<th>상영정보코드</th>
						<td>${ticket.EmsCode}</td>
					</tr>

					<tr>
						<th>영화코드</th>
						<td>${ticket.MCode}</td>
					</tr>

					<tr>
						<th>상영관</th>
						<td>${ticket.EmgCode}</td>
					</tr>
					<tr>
						<th>영화상영날짜</th>
						<td>${ticket.EmsDate}</td>
					</tr>

					<tr>
						<th>영화상영시간</th>
						<td>${ticket.EmsTime}</td>
					</tr>

					<tr>
						<th colspan="2">
							<button id="delete">취소</button>
						</th>
				</table>
		</form>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="container">
			<div class="copyright">
				<strong><span>이게뭐조시네마</span></strong>. All Rights Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/photofolio-bootstrap-photography-website-template/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<div id="preloader">
		<div class="line"></div>
	</div>

	<!-- Vendor JS Files -->
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="resources/vendor/aos/aos.js"></script>
	<script src="resources/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/js/main.js"></script>

</body>

<script>
$('#delete').click(function(){
	
	
	location.href="buyForm";
	
	
});
</script>
</html>