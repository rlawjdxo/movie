<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>movie view</title>
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

<style>

button{

  
  background-color:silver;
  color: #fff;
  border:none;
  
  
    
    box-sizing: border-box;
    box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
    border-radius: 10px;
    
  
    height: 40px;
    padding: 0 10px;
   
    border: 1px solid #dddddd;
}

.div{
	
	margin-right : 65px;
	width:900px;
}


  th, td {
  
    border-bottom: 1px solid white;
    border-left: 1px solid white;
    padding: 10px;
  }
  th:first-child, td:first-child {
    border-left: none;
  }
  th{
  background-color: gray;
  }
  td{
  color: black;
  }
  
  select::-ms-expand {
   display: none;
}
table {
	width:60%;
	border-top: 1px solid white;
    border-collapse: collapse;
	
    list-style: none;
    background: #FFFFFF;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
    border-radius: 10px;
    margin-top: 9px;
}
.listbox{

    
    list-style: none;
    background: #FFFFFF;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
    border-radius: 10px;
    margin-top: 9px;
}
.listbox1{
	margin-left :300px;
    width:60%;
    list-style: none;
    background: #FFFFFF;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
    border-radius: 10px;
    margin-top: 9px;
}
.listbox2{

    width: 10%;
    list-style: none;
    background: #FFFFFF;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
    border-radius: 10px;
    margin-top: 9px;
}

</style>

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
	<main id="main" data-aos="fade" data-aos-delay="1500" class="main">
		<div><img src="./resources/movie/${view.MPicture}"  class="div"/></div>
		<table class="listbox" id="listbox">
			<caption>게시글 상세보기</caption>
			<!-- 관리자만 출력 -->
			<c:if test="${loginId=='admin'}">
			<tr>
				<th>영화코드</th>
				<td>${view.MCode}</td>
			</tr>
			</c:if>
			<tr>
				<th>영화재생시간</th>
				<td>${view.MRtime}</td>
			</tr>
			<tr>
				<th>관람연령</th>
				<td>${view.MAge}</td>
			</tr>
			<tr>
				<th>장르</th>
				<td>${view.MCategory}</td>
			</tr>

			<tr>
				<th>개봉일</th>
				<td>${view.MDate}</td>
			</tr>

			

			<tr>
				<th>영화이름</th>
				<td>${view.MName}</td>
			</tr>
			<tr>
				<th>감독</th>
				<td>${view.MDirector}</td>
			</tr>
			<tr>
				<th>배우</th>
				<td>${view.MActors}</td>
			</tr>

			<tr>
				<th>줄거리</th>
				<td>${view.MStory}</td>
			</tr>






			<tr>
				<th>스틸컷</th>
				<td><img src="./resources/movie/${view.msPicture1}"
					width="200px" /><img src="./resources/movie/${view.msPicture2}"
					width="200px" /><img src="./resources/movie/${view.msPicture3}"
					width="200px" /><img src="./resources/movie/${view.msPicture4}"
					width="200px" /></td>
			</tr>
		<!-- 관리자만 출력 -->
		<c:if test="${loginId=='admin'}">
			<tr>
				<th colspan="2">
					<button  id="modify">수정</button>
					<button  id="delete">삭제</button>
				</th>
			</tr>
		</c:if>	
		</table>
		<br/>
		<br/>
			<c:if test="${loginId != null}">
			<div   class="listbox1">
			<input type="hidden" value="${view.MCode}" id="mCode" />
			<input type="hidden" value="${loginId}" id="euId" />
			<textarea rows="3" cols="30" id="mcContent" ></textarea>
			<button id="writeBtn">댓글 입력</button>
			
			</div>
			</c:if>
		<div id="cmtArea"></div>	
		
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
	crossorigin="anonymous"></script>
<script>
	$('#modify').click(function() {

		location.href = "mModifyForm?mCode=${view.MCode}";

	});
	$('#delete').click(function() {

		location.href = "mDelete?mCode=${view.MCode}";

	});
	$.ajax({
		type : "POST",
		url : "cList",
		data : {
			"mCode" : ${view.MCode}
		},
		dataType : "json",
		success : function(list){
			cmtList(list);
		},
		error : function(){
			alert('댓글 불러오기 통신 실패');
		}
	});
	
	

	
	
	$('#writeBtn').click(function(){
		let euId = $('#euId').val(); 
		let mcContent = $('#mcContent').val();
		let mCode = ${view.MCode};
		
	
		$.ajax({
			type : "POST",
			url : "cWrite",
			data : {
				"mCode" : mCode,
				"mcContent" : mcContent,
				"euId" : euId
			},
			dataType : "json",
			success : function(list){
				console.log(list);
				cmtList(list);
				$('#mcContent').val("");
			}, 
			error : function(){
				alert('댓글 작성 통신 실패!');
			}			
		});		
	});
	
	
	function cmtList(list){
		let output="";
		output += "<table>";
		output += "<tr>";
		output += "<th>작성자</th>";
		output += "<th>내용</th>";
		output += "<th>작성일</th>";
		output += "<th>수정</th>";
		output += "<th>삭제</th>";
		output += "</tr>";
		
		for(let i in list){
			output += "<tr>";
			
			output += "<td>" + list[i].euId + "</td>";
			output += "<td>" + list[i].mcContent + "</td>";
			output += "<td>" + list[i].mcDate + "</td>";
			
			if('${loginId}' == list[i].euId || '${loginId}' == 'admin'){
				output += "<td><button onclick='cModify("+ list[i].mnum + ")'>수정</button></td>";
				output += "<td><button onclick='cDelete("+ list[i].mnum + ")'>삭제</button></td>";
			} else{
				output += "<td></td>";
				output += "<td></td>";
			}
			output += "</tr>";
		}
		
		output += "</table>";
		$('#cmtArea').html(output);	
		
	}
	
	
	function cModify(mNum){
		// alert(mNum);
		let mcContent = $('#mcContent').val();
		let mCode = ${view.MCode};
		
		$.ajax({
			type : "POST",
			url : "cModify",
			data : {
				"mNum" : mNum,
				"mcContent" : mcContent,
				"mCode" : mCode
			},
			dataType : "json",
			success : function(list){				
				console.log(list);
				$('#mcContent').val("");
				cmtList(list);	            			
			}, 
			error : function(){
				alert('댓글 수정 통신 실패!');
			}			
		});		
	}
	

	function cDelete(mNum){
		let conf = confirm('삭제하시겠습니까?');
		let mCode = ${view.MCode};
		
		if(conf){
			$.ajax({
				type : "POST",
				url : "cDelete",
				data : {
					"mNum" : mNum,
					"mCode" : mCode					
				},
				dataType : "json",
				success : function(list){
					cmtList(list);
				},
				error : function(){
					alert('댓글 삭제 통신 실패!')
				}				
			});
			
		} else {
			alert('취소했습니다.');
		}		
	}
	
	

	
</script>
</html>