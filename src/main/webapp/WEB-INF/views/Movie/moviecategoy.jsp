<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>movie장르페이지</title>
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
					<li><a href="movieForm" class="active">영화등록</a></li>
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

			
			<i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i> <i
				class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

		</div>
	</header>
	<!-- End Header -->

	

	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<main id="main" data-aos="fade" data-aos-delay="1500">
		<form action="Movie" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="bWriter" value="${loginId}"/>
	<table>
	<caption>영화 등록</caption>
	<!-- 
		<tr>
			<th>작성자</th>
			<td><input type="text" name="bWriter" size="40"/></td>		
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="bPw" size="40"/></td>		
		</tr>
	 -->	
		<tr>
			<th>영화 이름</th>
			<td><input type="text" name="mName" size="40"/></td>		
		</tr>
		<tr>
			<th>영화 장르</th>
			<td><select name="mCategory" id="Mcategory">
			<option value="로맨스">로맨스</option>
			<option value="코믹">코믹</option>
			<option value="공포">공포</option>
			<option value="액션">액션</option>
			<option value="SF">SF</option>
			<option value="판타지">판타지</option>
			<option value="다큐멘터리">다큐멘터리</option>
			<option value="애니메이션">애니메이션</option>
			</select> 
			</td>
		</tr>
			<tr>
			<th>감독</th>
			<td><input type="text" name="mDirector" size="40"/></td>		
		</tr>
		<tr>
			<th>배우</th>
			<td><input type="text" name="mActors" size="40"/></td>	
		</tr>
		<tr>
			<th>줄거리</th>
			<td><textarea rows="20" cols="40" name="mStory" placeholder="100글자 이내"></textarea></td>		
		</tr>
		
		<tr>
			<th>관람연령</th>
			<td><select name="mAge" id="Mage">
			<option value="전체이용가">전체이용가</option>
			<option value="12세 이상 관람가">12세 이상 관람가</option>
			<option value="15세 이상 관람가">15세 이상 관람가</option>
			<option value="청소년관람불가">청소년관람불가</option>
			</select></td>	
		</tr>
		
		<tr>
				<th>개봉일</th>
				<th><input type="date" name="mDate" size=33 /> <br /></th>
			</tr>
			<tr>
			<th>상영시간</th>
			<td><input type="text" name="mRtime" size="40"/></td>		
		</tr>
			<tr>
			<th>메인포스터</th>
			<td><input type="file" name="mMainFile"/> </td>		
		</tr>
			<tr>
			<th>스틸컷1</th>
			<td><input type="file" name="mStillcut1"/> </td>		
		</tr>
		
			<tr>
			<th>스틸컷2</th>
			<td><input type="file" name="mStillcut2"/> </td>		
		</tr>
		
			<tr>
			<th>스틸컷3</th>
			<td><input type="file" name="mStillcut3"/> </td>		
		</tr>
		
			<tr>
			<th>스틸컷4</th>
			<td><input type="file" name="mStillcut4"/> </td>		
		</tr>
		
		
		<tr>
			<th colspan="2">
				<input type="submit" value="등록"/>
			</th>		
		</tr>
		
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
</html>