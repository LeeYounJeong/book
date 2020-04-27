<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>Main</title>
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
	
	th,table{
		text-align: center;
	}
	
</style>
<script>
	function alert4(){  
		swal({
			title: '삭제하시겠습니까?',
			text: '삭제된 파일은 복구되지 않습니다',
			type: 'warning',
			showCancelButton: true,
			cancelButtonText: '아니오',
			confirmButtonText: '예',
			closeOnConfirm: false
		},
		function(){
			swal('성공','파일이 삭제 되었습니다','success');
		});
	}
</script>
</head>
<body>
<br>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<a href='../main.jsp'>로그아웃</a>
		</div>
	</div>
	<br><br>      
	
	<div class='logo'>
		<a href='main.html'>로고 이미지</a>
	</div>
	<hr style='border:1px solid silver;' width='100%'>
	
	<ul class='nav nav-tabs'>
		<li class='active'><a href='#'>도서 관리</a></li>
		<li><a href='../admin/user/ad_userManage.jsp'>회원 관리</a></li>
		<li><a href='#'>문의 관리</a></li>
	</ul>
	
	
	<table class='table table-striped'>
		<thead>
			<tr>
				<th></th>
				<th>ISBN</th>
				<th>제목</th>
				<th>장르</th>
				<th>가격</th>
				<th>저자명</th>
				<th>출판사명</th>
				<th>출판일</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type='checkbox'>
				<td>1</td>
				<td>JSP 2.3웹프로그래밍 초급부터 중급까지</td>
				<td>국내</td>
				<td>27,000원</td>
				<td>최한석</td>
				<td>쌍용</td>
				<td>2020-04-01</td>
				<td><a href='#'>보기</a></td>
			</tr>
			<tr>
				<td><input type='checkbox'>
				<td>2</td>
				<td>HTML5+CC3웹 표준의 정석</td>
				<td>국내</td>
				<td>25,000원</td>
				<td>한아름</td>
				<td>서교</td>
				<td>2020-04-03</td>
				<td><a href='#'>보기</a></td>
			</tr>
		</tbody>
	</table>
	<hr>
	
	<form>
		<span style='float:right'><button type='button' 
			class='btn btn-info' onClick='alert4()'>도서 추가</button></span>
	</form>
</div>
</body>
</html>