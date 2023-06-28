<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Services</title>
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
				<a href="relist?euId=${loginId}">예약정보</a>
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

	<main id="main" data-aos="fade" data-aos-delay="1500">

		<!-- ======= End Page Header ======= -->
		<div class="page-header d-flex align-items-center">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2>고객서비스센터</h2>
						<p>무엇을 도와드릴까요?</p>

						

					</div>
				</div>
			</div>
		</div>
		<!-- End Page Header -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container">

				<div class="row gy-4">

					<div class="col-xl-3 col-md-6 d-flex">
						<div class="service-item position-relative">
							<i class="bi bi-activity"></i>
							<h4>티켓예매</h4>


							<div>
								<p style="color:#161718 ">
									ㆍ 홈페이지, 모바일 앱/웹 예매는 영화시작시간 10분 후까지 예매 가능합니다.<br /> ㆍ 영화관 현장
									예매는 영화시작시간 직전까지 예매 가능합니다.
								</p>

							</div>
						</div>

					</div>

					<!-- End Service Item -->

					<div class="col-xl-3 col-md-6 d-flex">
						<div class="service-item position-relative">
							<i class="bi bi-bounding-box-circles"></i>
							<h4>티켓취소</h4>

							<div>
								<p style="color:#161718 ">
									ㆍ 홈페이지, 모바일 앱/웹 예매는 영화시작시간 10분 후까지 예매 가능합니다.<br /> ㆍ 영화관 현장
									예매는 영화시작시간 직전까지 예매 가능합니다.<br /> ※ 현장에서 티켓으로 출력을 진행한 경우 온라인 취소가
									불가능하며, 영화관 매표소 / 스위트샵을 통해 상영시간 전까지 취소 가능합니다. ※ 스페셜 상영회 및 무대인사가
									포함된 영화의 경우 행사의 원활한 진행을 위해 상영전일 23시 59분 전까지만 취소 가능합니다.
								</p>

							</div>

						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-xl-3 col-md-6 d-flex">
						<div class="service-item position-relative">
							<i class="bi bi-calendar4-week"></i>
							<h4>분실물</h4>

							<div>
								<p style="color:#161718 ">영화관을 이용하시다가 소지물품을 분실하신 경우에는 롯데시네마 통합콜센터 1544-8855로 연락하시어
									확인 하시거나, 롯데시네마 홈페이지 고객센터 - 분실물안내에서 분실물 접수 혹은 확인을 하실 수 있습니다.</p>

							</div>

						</div>
					</div>
					<!-- End Service Item -->

					<div class="col-xl-3 col-md-6 d-flex" >
						<div class="service-item position-relative">
							<i class="bi bi-broadcast"></i>
							<h4>등급기준</h4>

							<div>
								<p style="color:#161718 ">
									ㆍ 전체 관람가 : 모든 연령의 관람객이 관람할 수 있는 영화<br /> ㆍ 12세 관람가 : 만 12세 미만의
									관람객은 관람할 수 없는 영화(보호자 동반 시 12세 미만 관람가)<br /> ㆍ 15세 관람가 : 만 15세
									미만의 관람객은 관람할 수 없는 영화(보호자 동반 시 15세 미만 관람가)<br />ㆍ 청소년 관람불가 : 만
									18세 미만의 관람객은 관람할 수 없는 영화<br />영비법 29조에 따르면 [만 12세 이상 관람가/ 만
									15세 이상 관람가]의 등급이라도 부모 등 보호자를 동반하는 경우 어린이(유아) 동반이 가능합니다. 반드시
									보호자의 동반이 필요함을 양지하여 주시기 바랍니다.<br />단, 청소년 관람불가 영화는 보호자 동반과 관계없이
									만 18세 미만이거나 연령 조건을 만족하여도 초중고 재학 중인 청소년 및 영유아 관람이 절대 불가합니다.<br />영화관
									현장에서 연령확인 불가 시 입장이 제한될 수 있습니다.<br />또한 상영등급에 맞지 않는 영화를 관람하거나
									무단입장을 하는 경우 형사처벌 및 손해 배상의 대상이 될 수 있습니다.

								</p>

							</div>
						</div>
					</div>
					<!-- End Service Item -->

				</div>

			</div>
		</section>
		<!-- End Services Section -->



		<!-- End Pricing Section -->

		<!-- ======= Testimonials Section ======= -->
		<section id="testimonials" class="testimonials">
			<div class="container">

				<div class="section-header">
					<h2>리뷰</h2>
					<p>별점</p>
				</div>

				<div class="slides-3 swiper">
					<div class="swiper-wrapper">

						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="stars">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i>
								</div>
								<p>충분하게 설명해주시고 친절하였습니다</p>
								<div class="profile mt-auto">
									<img src="resources/img/testimonials/testimonials-1.jpg"
										class="testimonial-img" alt="">
									<h3>시네마의 광기</h3>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="stars">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i>
								</div>
								<p >결제오류를 깔끔하게 해결해주셨습니다.</p>
								<div class="profile mt-auto">
									<img src="resources/img/testimonials/testimonials-2.jpg"
										class="testimonial-img" alt="">
									<h3>영화덕후</h3>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="stars">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i>
								</div>
								<p>환불요청을 하는 방법을 친절하게 알려주셨습니다.</p>
								<div class="profile mt-auto">
									<img src="resources/img/testimonials/testimonials-3.jpg"
										class="testimonial-img" alt="">
									<h3>영화감상덕후</h3>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<div class="stars">
									<i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
										class="bi bi-star-fill"></i>
								</div>
								<p>전화상담을 친절하게 해주셨습니다.</p>
								<div class="profile mt-auto">
									<img src="resources/img/testimonials/testimonials-4.jpg"
										class="testimonial-img" alt="">
									<h3>영화가 좋았다</h3>
								</div>
							</div>
						</div>
						<!-- End testimonial item -->
					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Testimonials Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>PhotoFolio</span></strong>. All
				Rights Reserved
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
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$('.js-click-modal').click(function() {
		$('.container').addClass('modal-open');
	});

	$('.js-close-modal').click(function() {
		$('.container').removeClass('modal-open');
	});
</script>

</html>