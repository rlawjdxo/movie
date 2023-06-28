<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>EMGlist</title>
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
					<li><a href="about.html">영화상영관</a></li>
					<li class="dropdown"><a href="#"><span>장르 카테고리</span> <i
							class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<li><a href="gallery.html">로맨스</a></li>
							<li><a href="gallery.html">코믹</a></li>
							<li><a href="gallery.html">공포</a></li>
							<li><a href="gallery.html">액션</a></li>
							<li><a href="gallery.html">판타지</a></li>
							<li><a href="gallery.html">애니메이션</a></li>

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




	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
	<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<form action="modify" method="POST" enctype="multipart/form-data">
								
								<input type="hidden" name="euProfileName" value="${modify.euProfileName}" /> 
								<input type="hidden" name="euId" value="${modify.euId}" />

								<table>
									<caption>회원수정 페이지</caption>


									<tr>
										<th>항목</th>
										<th>내용</th>
									</tr>

									<tr>
										<th>아이디</th>
										<td><input type="text" name="euId" value="${modify.euId}"
											readonly /></td>
										<!-- readonly >> 무조건 읽기만 한다!! -->
									</tr>

									<tr>
										<th>비밀번호</th>
										<td><input type="password" name="euPw" /></td>
									</tr>

									<tr>
										<th>이름</th>
										<td><input type="text" name="euName"
											placeholder="${modify.euName}" /></td>
									</tr>

									<tr>
										<th>성별</th>
										<td>
											<%-- <p>기존 성별 : ${modify.memberGender} </p> --%> <c:choose>
												<c:when test="${modify.euGender == '남자'}">
					남자 <input type="radio" name="euGender" value="남자" checked />
					여자 <input type="radio" name="euGender" value="여자" />
												</c:when>

												<c:otherwise>
					남자 <input type="radio" name="euGender" value="남자" />
					여자 <input type="radio" name="euGender" value="여자" checked />
												</c:otherwise>

											</c:choose>
										</td>
									</tr>

									<tr>
										<th>생년월일</th>
										<td><input type="date" name="euBirth" /></td>
									</tr>

									<tr>
										<th>이메일</th>
										<td><input type="email" name="euEmail"
											placeholder="${modify.euEmail}" /></td>
										<!-- placeholder흐린하게 보이게 -->
									</tr>

									<tr>
										<th>연락처</th>
										<td><input type="text" name="euPhone"
											placeholder="${modify.euPhone}" /></td>
									</tr>

									<tr>
										<th>주소</th>
										<td><input type="text" name="addr1" id="sample6_postcode"
											placeholder="우편번호"> <input type="button"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
											<input type="text" name="addr2" id="sample6_address"
											placeholder="주소"><br> <input type="text"
											name="addr3" id="sample6_detailAddress" placeholder="상세주소">
										</td>
									</tr>

									<tr>
										<th>프로필 사진</th>
										<td><input type="file" name="euProfile" /></td>
									</tr>
									<tr>
										<th colspan="2"><input type="submit" value="수정" /> <input
											type="reset" value="다시작성" /></th>
									</tr>


								</table>
							</form>
							<!-- End Table with hoverable rows -->

						</div>
					</div>

				</div>
			</div>
		</section>
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
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous">
	
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

</html>