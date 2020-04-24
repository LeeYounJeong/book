<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>UPDATE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script>
function alert_mod1() {
	swal({
		title : "수정하시겠습니까?",
		type : "info",
		showCancelButton : true,
		cancelButtonText : "아니오",
		confirmButtonText : "예",
		closeOnConfirm : false
	}, function() {
		swal("이름 수정", "수정되었습니다", 'success');
	});
}

function alert_mod2() {
	swal({
		title : "수정하시겠습니까?",
		type : "info",
		showCancelButton : true,
		cancelButtonText : "아니오",
		confirmButtonText : "예",
		closeOnConfirm : false
	}, function() {
		swal("비밀번호 수정", "수정되었습니다", 'success');
	});
}

function alert_mod3() {
	swal({
		title : "수정 성공",
		type : "success",
		showCancelButton : false,
		cancelButtonText : "아니오",
		confirmButtonText : "예",
		closeOnConfirm : true
	}, function(isConfirm) {
		if (isConfirm) {
			location.href = '../mypage/01.html';
		}
	});
}
</script>
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
	
	.login{
		margin: 0 auto;
		text-align: center;
		font-size: 13pt;
	}

.title{
   padding: 10 0 0 10px;
   border-bottom: 1.5px solid #424242;
   letter-spacing: -0.07em
}

h1{
   font-size: 32px;
   color: #000;
   line-height: 1;
   font-family: 'Montserrat', 'Noto Sans KR', Verdana, Dotum, AppleGothic, sans-serif;
}

.title span{
   font-size: 21px;
   color: #d2d2d2;
   font-weight: 500;
   letter-spacing: 0em;
   margin-left: 3px;
}

.sub_tit{
   font-size: 18px;
   border-bottom: 1px solid #747474;
   border-left: 5px solid #747474;
   padding-top: 2px;
   padding-bottom: 5px;
   padding-left: 10px;
   letter-spacing: -0.07em;
   line-height: 30px;
}

#more{
   color: #6E6E6E;
   float: right;
   padding: 5px 10px;
   font-size:14px;
}

#tb th{
    height: 48px;
    border-bottom: 1px solid #000000;
    vertical-align: middle;
    text-align: center;
}

#tb td{
   vertical-align: middle;
   text-align: center;
}

#deli_btn{
   font-size: 12px;
   height: 32px;
   line-height: 30px;
   padding-top: 0;
   border: 1px solid #e5e5e5;
   color: #000000;
   width: 80px;
   margin: 4px auto;
}
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

.number input{
	width: 55px;
}
	
table{
	margin: 0 auto;
	border-spacing:10px;
	font-size: 13pt;
}
	
.signbutton{
	width: 200px;
	heigth: 200px;
	margin: 0 auto;
}
	
.text, .number{
	border-bottom: 10px solid #fff;
}
	
.btn-sm{
	margin-bottom: 8px;
}
</style>
</head>
<body>
<div class="container">
	<div class='area'>
			<div class='top_menu'>
				<h5><%= session.getAttribute("LoginId") %>님, 환영합니다 !</h5>
				<a href='../main.jsp'>로그아웃</a> <span>|</span>
				<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
				<a href='../cart/01.html'>장바구니</a> <span>|</span>
				<a href='../qa/02.html'>고객센터</a> 
			</div>
		</div>
		<br><br>
		
		<div class='logo'>
			<a href='../main.html'>로고 이미지</a>
		</div>
		<br>

 <!-- header -->
   <div class='title'>
      <a href='myPage.html' style="text-decoration:none">
	      <h1>마이페이지
	      <span>MyPage</span>
	      </h1>
	  </a>
   </div>
   
   <!-- nav -->
	<nav class='navbar navbar-default'>
	<div class='container-fluid'>
		<ul class='nav navbar-nav'>
			<li><a href='../order/01.html'>전체 주문 내역</a></li>
			<li><a href='../qa/01.html'>내가 쓴 글</a></li>
			<li  class="active"><a href='05.html'>회원 정보 관리</a></li>
		</ul>			
	</div>
	</nav>
	
	 <h3 class='sub_tit'>회원 수정</h3>
	 
	<br>
	
	<div class='sign'>
		<form>
			<table class='sign'>
				<tr class='text'>
					<th>아이디</th>
					<td><input type='text'/></td>
				</tr>
				
				<tr class='text'>
					<th>이름</th>
					<td><input type='text'/>&nbsp;
						<button type='button' class='btn btn-primary'
							onClick='alert_mod1()'>이름변경</button></td>
				</tr>
				
				<tr class='text'>
					<th>비밀번호</th>
					<td>
						<div class="panel-group">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a href="#content2" data-toggle="collapse" style="display: block;">비밀번호 수정</a>
									</h4>
								</div>
								<div id="content2" class="collapse panel-collapse">
									<ul class="list-group">
										<li class="list-group-item">▶새 비밀번호&nbsp;<input type='password' name="pwd1"/></li>
										<li class="list-group-item">▶새 비밀번호 확인&nbsp;<input type='password' name="pwd2"/></li>
									</ul>
									<button type="button" class='btn btn-primary' style="float: right;"
										onClick='alert_mod2()' formaction="correctProc.jsp">수정하기</button>
								</div>
							</div>
						</div>		
					</td>
				</tr>
				
				<tr class='number'>
					<th>휴대폰 번호</th>
					<td><input type='text'/> - <input type='text'/> - <input type='text'/></td>
				</tr>
				
				<tr class='text'>
					<th>주소</th>
					<td>
						<input type='text' style='width:80px;'/>&nbsp;
						<button class='btn btn-default btn-sm'>주소 찾기</button><br>
						<input type='text'/>
					</td>
				</tr>
			</table>
			<br>
			
			<div class='signbutton'>
				<button type='button' class='btn btn-success btn-lg'
					onClick='alert_mod3()'>수정하기</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>