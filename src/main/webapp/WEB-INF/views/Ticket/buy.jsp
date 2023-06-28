<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>ticket buy</title>
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
<link href="resources/css/table.css" rel="stylesheet">
<style>
div {
	text-align: center;
}
td{
color: black;
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
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<main id="main" data-aos="fade" data-aos-delay="1500">
		
		<table class="listbox">

		

			<tr class="listbox">
				<th>영화선택</th>


				<th>지역별</th>

				<th>날짜</th>

				<th>상영시간표</th>
			</tr>
			<!-- 영화목록 불러오기 -->
			<tr>
				<td>
				<select id="select_mCode" >
				<option value='' selected>--영화 선택--</option>
						<c:forEach var="mlist" items="${moList}">
							<option value="${mlist.MCode}">${mlist.MName}</option>
						</c:forEach>
				</select>
				</td>
				<td>
				<select id="select_emgCode" >
				<option value='' selected>--영화관 선택--</option>
						<option  value="11">인천터미널</option>
						<option  value="12">인천아시아드</option>
						<option  value="13">부평역사</option>
						<option  value="15">주안</option>
				</select>
				</td>
					<!-- regionBox end --> <!-- dateBox --> <!-- style="float: left;" -->
				<td>
				<select id="select_emsDate" onchange="ChangeValue()">
						<option value='' selected>--날짜 선택--</option>
						
						<option value="2023-06-28">2023-06-28</option>
					
				</select>
				</td>

				<td id="timeTableBox" class="listbox">


				</td>
			</tr>
			
			<tr>
				<th colspan="4"><input type="button" value="예약하기" id="reserve" class="listbox15">
				</th>
			</tr>
			
		</table>
		
		<div >
			<table id="reserveTableBox"  class="listbox">
			
			</table>
		</div>

		<!-- End #main -->
	</main>
	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>이게모조시네마</span></strong>. All Rights
				Reserved
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

<script>



function ChangeValue(){
	// alert('함수 실행');
	var value_movie = document.getElementById('select_mCode').value;
	var value_theater = document.getElementById('select_emgCode').value;
	var value_date = document.getElementById('select_emsDate').value;
	console.log(value_movie);
	console.log(value_theater);
	console.log(value_date);

	$.ajax({
		type :"GET",
		url : "timesearch",
		data : {
			"mCode" : value_movie,
			"emgCode" : value_theater,
			"emsDate" : value_date
		},
		dataType : "json",
		success : function(tList){	
			alert('함수실행');
			timeList(tList);		
		},
		error : function(){
			alert('타임 리스트 통신 실패');
		}
	});	
	
}

function timeList(tList) {
	let output = "";
	output += "<select id=\"select_emsTime\">";

	for ( let i in tList) {
		output += "<option value=\"" + tList[i] +"\">" + tList[i] + "</option>";
	}
	output += "</select>";
	$('#timeTableBox').html(output);

}


$("#reserve").click(function(){
	
	var value_movie = document.getElementById('select_mCode').value;
	var value_theater = document.getElementById('select_emgCode').value;
	var value_date = document.getElementById('select_emsDate').value;
	var value_emsTime = document.getElementById('select_emsTime').value;
	var euId = "${loginId}"; 
	console.log(value_movie);
	console.log(value_theater);
	console.log(value_date);
	console.log(value_emsTime);
	console.log(euId);

	$.ajax({
		type :"GET",
		url : "reserve",
		async:"false",
		data : {
			"mCode" : value_movie,
			"emgCode" : value_theater,
			"emsDate" : value_date,
			"emsTime" : value_emsTime,
			"euId" : euId
		},
		dataType : "json",
		success : function(rsvList){
			console.log(rsvList);
			rsvCheck(rsvList);		
		},
		error : function(){
			alert('예약 확인 통신 실패');
		}
	});	
});


function rsvCheck(rsvList) {
	let output = "";
	output +="<tr>";
	output += "<td>예약번호</td>";
	output += "<td>영화관</td>";
	output +="<td>영화</td>";
	output +="<td>상영날짜</td>";
	output +="<td>상영시간</td>";
	output +=" <td>가격</td>";
	output +="</tr>";

	for(let i in rsvList){
		output +="<tr>"
		output += "<td>"+rsvList[i].reserveId+"</td>";
		output += "<td>"+rsvList[i].emgName+"</td>";
		output += "<td>"+rsvList[i].mname+"</td>";
		output += "<td>"+rsvList[i].emsDate+"</td>";
		output += "<td>"+rsvList[i].emsTime+"</td>";
		output += "<td>"+rsvList[i].emCost+"</td>";
		output +="</tr>"
	}
	
	$('#reserveTableBox').html(output);
}	

</script>
</html>