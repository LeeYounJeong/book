<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>BoB</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	.logo{
		text-align: center;
		border: 1px solid black;
		padding-top: 50px;
		height: 120px;
		width: 200px;
		margin: 0 auto;
		background: skyblue;
		border-radius: 20px;
	}
	
	.area{
		display: inline;
		text-align: right;
	}
	
	.carousel-inner{
		width: 150px;
		height: 200px;
	}
	
	.carousel-indicators {
   		 background-color: skyblue;
	}
	
	.recommand{
		text-align: center;
		padding-top: 9px;
		border: 1px solid black;
		height: 50px;
		width: 400px;
		margin: 0 auto;
		background: skyblue;
		border-radius: 20px;
	}
	
	.image{
		display: inline-block;
		padding-top: 100px;
		border: 1px solid black;
		width: 200px;
		height: 220px;
		margin: 20px;
		text-align: center;
		background-color:#ccc
	}
	
	.recommandBook{
		margin: 0 auto;
		text-align: center;
	}

	.footerlogo{
		background-color:#ccc;
		padding-top: 60px;
		border: 1px solid black;
		width: 120px;
		height: 130px;
		text-align: center;
	}
	
	table{
		width:60%;
		margin: auto;
		text-align: center;
	}
	
	ul{
		list-style-type: none;
		margin:0;
		padding: 0;
		overflow: hidden;
		text-align: center;
		background-color: #0B2161;
	}
	
	li{
		display:inline-block;
		width: 570px;
		font-size: 15px;
	}
	
	li a{
		display: block;
		color: #FFFFFF;
		border-width: 50px;
		padding: 14px 16px;
		text-decoration: none;
	}
	
	li a:hover{
		color: #FFFFFF;
		background-color: #084B8A;
	}
</style>
</head>
<body>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<!-- <h5>session.getAttribute("LoginId") %>님, 환영합니다 !</h5> -->
			<h5>${LoginId}님, 환영합니다 !</h5>
			<a href='../user/logoutProc.jsp'>로그아웃</a> <span>|</span>
			<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
			<a href='#'>장바구니</a> <span>|</span>
			<a href='#'>고객센터</a> 
		</div>
	</div>
	<br><br>
	
	<div class='logo'>
		<a href='../main.jsp'>로고 이미지</a>
	</div>
	<br>
	
	<ul id='nav'>
		<li><a href='../book/01.html'>국내도서</a>
		<li><a href='../book/01.html'>해외도서</a>
	</ul>
	
	<div id='carousel' class='carousel slide' data-ride='carousel'>
		<ol class='carousel-indicators'>
			<li data-target='#carousel' data-slide-to='0' class='active'></li>
			<li data-target='#carousel' data-slide-to='1'></li>
			<li data-target='#carousel' data-slide-to='2'></li>
		</ol>
		
		<div class='carousel-inner'>
			<div class='item active'>
				<img>
			</div>
			<div class='item'>
				<img>
			</div>
			<div class='item'>
				<img>
			</div>
		</div>
		
		<a class='left carousel-control' href='#carousel' data-slide='prev'>
			<span class='glyphicon glyphicon-chevron-left'></span>
			<span class='sr-only'>Previous</span>
		</a>
		<a class='right carousel-control' href='#carousel' data-slide='next'>
			<span class='glyphicon glyphicon-chevron-right'></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<br><br>
	
	<div>
		<h3 style='text-align:center;'><strong>이 달의 추천도서</strong></h3>
	</div>
	<br>
	
	<div class="container center-block text-center">
	  	<div class="row">
	     	<div class="col-sm-3 col-md-3">
	        	<div class="thumbnail">
           			<a href="loginComplete.jsp" class="thumbnail" style="height: 150px;"> </a>
	       			<div class="caption">
	          			<h5>JSP 2.3웹프로그래밍 기초부터 중급까지</h5>
	          			<h6>27,000원</h6>
	          			<p>쌍용 출판사</p>
	       			</div>
	 			</div>
	 		</div>
	 		<div class="col-sm-3 col-md-3">
	        	<div class="thumbnail">
           			<a href="loginComplete.jsp" class="thumbnail" style="height: 150px;"> </a>
	       			<div class="caption">
	          			<h5>JSP 2.3웹프로그래밍 기초부터 중급까지</h5>
	          			<h6>27,000원</h6>
	          			<p>쌍용 출판사</p>
	       			</div>
	 			</div>
	 		</div>
		 	<div class="col-sm-3 col-md-3">
	        	<div class="thumbnail">
           			<a href="loginComplete.jsp" class="thumbnail" style="height: 150px;"> </a>
	       			<div class="caption">
	          			<h5>JSP 2.3웹프로그래밍 기초부터 중급까지</h5>
	          			<h6>27,000원</h6>
	          			<p>쌍용 출판사</p>
	       			</div>
	 			</div>
	 		</div>
	 		<div class="col-sm-3 col-md-3">
	        	<div class="thumbnail">
           			<a href="loginComplete.jsp" class="thumbnail" style="height: 150px;"> </a>
	       			<div class="caption">
	          			<h5>JSP 2.3웹프로그래밍 기초부터 중급까지</h5>
	          			<h6>27,000원</h6>
	          			<p>쌍용 출판사</p>
	       			</div>
	 			</div>
	 		</div>
	 	</div>
	</div>
	<br><br><br><hr>
	
	<footer class='footer'>
		<hr style='border:1px solid silver;' width='90%'>
		<table>
			<tr>
				<th><div class='footerlogo'>로고 이미지</div></th>
				<th>
					|대표이사 : 이윤정 <br>
					|사업자 등록 번호: 224-11-33000<br>
					|주소 : 서울 마포구 월드컵북로 21 풍성빌딩 2층 <br>
					|TEL: 02)1544-3000<br><br>
					Copyright 2020 BOOK Corp. All Rights Reserved	
				</th>
			</tr>		
		</table>
	</footer>
</div>
</body>
</html>
