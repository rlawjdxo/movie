<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>EGMCINEMA</title>
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
<style>




table, tr{
	border: solid 1px;
	height: 200%;
	width: 70%;
	color: white;
	font-size: 30px;
	font-weight: bold;
}

h1{
	
	font-weight: bold;
}

th{
	text-align:center;
}

td{
	text-align:center;
}

header{
 text-align:center;
}

h2{
	background-color:pink;
	text-align:center;
}
main{
text-align: center;
}
logo{
width''
  object-fit: cover;
}
</style>

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

			<a href="home"
				class="logo d-flex align-items-center  me-auto me-lg-0"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<!-- <img src="resources/img/logo.png" alt=""> -->

				<h1>
					<i class="bi bi-caret-right-square-fill"></i>
					EMGCINEMA
				</h1>
			</a>

			<nav id="navbar" class="navbar">
				<ul>
					<li><a href="home" class="active">홈</a></li>
					<c:if test="${loginId=='admin'}">
					<li><a href="movieForm" class="active">영화등록</a></li>
					<li><a href="theater_input" class="active">영화관등록</a></li>
					<li><a href="movietiem" class="active">상영날짜시간등록</a></li>
					<li><a href="moivietimelist" class="active">상영정보목록</a></li>
					<li><a href="relist" class="active">예약목록</a></li>
					
					</c:if>
					<li><a href="movielist" class="active">영화목록</a></li>
					
					
					
					<li class="dropdown"><a href="#"><span>장르 카테고리</span> <i
							class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
					
							<li><a href="http://localhost:9090/movie/movieSearch?category=mCategory&keyword=%EC%BD%94%EB%AF%B9">코믹</a></li>
							<li><a href="http://localhost:9090/movie/movieSearch?category=mCategory&keyword=%EA%B3%B5%ED%8F%AC">공포</a></li>
							<li><a href="http://localhost:9090/movie/movieSearch?category=mCategory&keyword=%EC%95%A1%EC%85%98">액션</a></li>
							<li><a href="http://localhost:9090/movie/movieSearch?category=mCategory&keyword=%ED%8C%90%ED%83%80%EC%A7%80">판타지</a></li>
							<li><a href="http://localhost:9090/movie/movieSearch?category=mCategory&keyword=%EB%93%9C%EB%9D%BC%EB%A7%88">드라마</a></li>
							<li><a href="http://localhost:9090/movie/movieSearch?category=mCategory&keyword=%EB%8B%A4%ED%81%90">다큐멘터리</a></li>
							<li><a href="http://localhost:9090/movie/movieSearch?category=mCategory&keyword=%EC%95%A0%EB%8B%88">애니메이션</a></li>
							
						   
					</ul>
					<li class="dropdown"><a href="#"><span>영화관</span> <i
							class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<li><a href="theaterView?emgCode=13">부평역사</a></li>
							<li><a href="theaterView?emgCode=12">인천아시아드</a></li>
							<li><a href="theaterView?emgCode=11">인천터미널</a></li>
							<li><a href="theaterView?emgCode=15">주안</a></li>
							
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
				<a href="review?euId=${loginId}">예약정보</a>
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

	<!-- ======= Hero Section ======= -->
	<section id="hero"
		class="hero d-flex flex-column justify-content-center align-items-center"
		data-aos="fade" data-aos-delay="1500">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
				

					<img class="mySlides w3-animate-fading" src="resources/img/gallery/범죄도시3.jpg"  height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/플래시.jpg"  height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/엔리멘탈.jpg"  height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/귀공자.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/트랜스포머비스트의서막.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/스파이더맨 어크로스 더 유니버스.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/제인홉 인더 박스.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/가디언즈 오브 갤럭시Volume3.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/포켓몬스터DP 아르세우스 초극의 시공으로.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/인어공주.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/분노의질주 라이드 오어 다이.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/제인홉 인 더 박스 로드 투 디데이.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/스즈메의 문단속.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/나의 사소한 슬픔.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/너의 눈을 들여다 보면.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/북 클럽 넥스트 챕터.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/극장판 짱구는 못말려 동물소환 닌자 배꼽수비대.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/부기맨.jpg" height="400px" >
						<img class="mySlides w3-animate-fading" src="resources/img/gallery/말없는소녀.jpg" height="400px" >
					<br/>
					<br/>
					<c:if test="${loginId != null}">
					<a href="buyForm" class="btn-get-started">영화 예매하기</a>
					</c:if>
					
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero Section -->

	<main id="main" data-aos="fade" data-aos-delay="1500">

		<!-- ======= 영화 포스터 ======= -->
		<section id="gallery" class="gallery">
			<div class="container-fluid">

				<div class="row gy-4 justify-content-center">
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/범죄도시3.jpg" class="img-fluid"
								alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202305/19803_301_3.mp4"
									title="범죄도시3 예고편" class="glightbox preview-link"><i
									class="bi bi-film"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=27" class="details-link"><i
									class="bi bi-chat-left-text "></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/플래시.jpg" class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19907_301_3.mp4"
									title="플래시 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=28" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/엔리멘탈.jpg" class="img-fluid"
								alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19438_301_2.mp4"
									title="엘리멘탈 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=29" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/귀공자.jpg" class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19864_301_3.mp4"
									title="귀공자 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=31" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/트랜스포머비스트의서막.jpg"
								class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19850_301_1.mp4"
									title="트랜스포머비스트의서막 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=30" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/스파이더맨 어크로스 더 유니버스.jpg"
								class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19775_301_1.mp4"
									title="스파이더맨 어크로스 더 유니버스 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=47" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/제인홉 인더 박스.jpg" class="img-fluid"
								alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19952_301_1.mp4"
									title="제인홉 인더 박스 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=32" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/가디언즈 오브 갤럭시Volume3.jpg"
								class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202305/19776_301_2.mp4"
									title="가디언즈 오브 갤럭시 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=48" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/포켓몬스터DP 아르세우스 초극의 시공으로.jpg"
								class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202305/19764_301_3.mp4"
									title="포켓몬스터DP 아르세우스 초극의 시공으로 예고편"
									class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=49" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/인어공주.jpg" class="img-fluid"
								alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202305/19874_301_1.mp4"
									title="인어공주 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=50" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/분노의질주 라이드 오어 다이.jpg"
								class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202305/19786_301_1.mp4"
									title="분노의질주 라이드 오어 다이 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=51" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/제인홉 인 더 박스 로드 투 디데이.jpg"
								class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a href="resources/img/gallery/제인홉 인 더 박스 로드 투 디데이.jpg"
									title="제인홉 인 더 박스 로드 투 디데이 포스터" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=52" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/스즈메의 문단속.jpg" class="img-fluid"
								alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202303/19481_301_1.mp4"
									title="스즈메의 문단속 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=34" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/나의 사소한 슬픔.jpg" class="img-fluid"
								alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19840_301_1.mp4"
									title="나의 사소한 슬픔 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=37" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/너의 눈을 들여다 보면.jpg"
								class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19831_301_2.mp4"
									title="너의 눈을 들여다 보면 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=41" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/북 클럽 넥스트 챕터.jpg"
								class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19857_301_1.mp4"
									title="북 클럽 넥스트 챕터 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=33" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>

						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/극장판 짱구는 못말려 동물소환 닌자 배꼽수비대.jpg"
								class="img-fluid" alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202305/19753_301_2.mp4"
									title="극장판 짱구는 못말려 동물소환 닌자 배꼽수비대 예고편"
									class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=36" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/블랙워터 어비스.jpg" class="img-fluid"
								alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19781_301_1.mp4"
									title="블랙워터 어비스 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=40" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/부기맨.jpg" class="img-fluid"
								alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202306/19898_301_1.mp4"
									title="부기맨 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=38" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->
					<div class="col-xl-3 col-lg-4 col-md-6">
						<div class="gallery-item h-100">
							<img src="resources/img/gallery/말없는소녀.jpg" class="img-fluid"
								alt="">
							<div
								class="gallery-links d-flex align-items-center justify-content-center">
								<a
									href="https://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/202305/19798_301_2.mp4"
									title="말없는소녀 예고편" class="glightbox preview-link"><i
									class="bi bi-caret-right-square"></i></a> <a
									href="http://localhost:9090/movie/mView?mCode=42" class="details-link"><i
									class="bi bi-chat-left-text"></i></a>
							</div>
						</div>
					</div>
					<!-- End Gallery Item -->

				</div>

			</div>
		</section>
		<!-- End Gallery Section -->

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
	<script>
	var myIndex = 0;
	carousel();

	function carousel() {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  myIndex++;
	  if (myIndex > x.length) {myIndex = 1}    
	  x[myIndex-1].style.display = "block";  
	  setTimeout(carousel, 9000);    
	}
	</script>

</body>

</html>