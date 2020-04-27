<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ page import="java.util.List" %>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<!-- 
<script>
function alert_remove() {
	swal({
		title : "삭제하시겠습니까?",
		type : "success",
		showCancelButton : true,
		cancelButtonText : "아니오",
		confirmButtonText : "예",
		closeOnConfirm : false
	}, function() {
		swal("삭제 완료", "삭제되었습니다", 'success');
	});
}
</script>
 -->
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
	
	.pagination{
		display:block;
		text-align: center; 
	}
	
	.pagination > li> a{
		float: none;
	}
</style>

</head>
<body>
<br>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<a href='../main.jsp'>메인으로</a>
		</div>
	</div>
	<br><br>
	
	<div class='logo'>
		<a href='../main.jsp'>로고 이미지</a>
	</div>
	<hr style='border:1px solid silver;' width='100%'>
	
	<ul class='nav nav-tabs'>
		<li><a href='../main.jsp'>도서 관리</a></li>
		<li class='active'><a href='../admin/user/ad_userManage.jsp'>회원 관리</a></li>
		<li><a href='#'>문의 관리</a></li>
	</ul>

<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	
	List<User> users = userService.listUsers();
	
	if(users != null && users.size()>0){
		request.setAttribute("users", users);
%>	
	<form action="ad_userDelProc.jsp">	
	<table class='table table-striped'>
		<thead>
			<tr>
				<th></th>
				<th>회원아이디</th>
				<th>회원이름</th>
				<th>비밀번호</th>
				<th>핸드폰 번호</th>
				<th>배송지</th>
				<th>가입일</th>
			</tr>
		</thead>
		
		<tbody id = "userList">
<%		
		for(User user : users){
%>			
				<tr>
					<td>
						<input type="radio" name="userIdSel" value="<%= user.getUserId() %>"/>
					</td>
					<td><%= user.getUserId() %></td>
					<td><%= user.getUserName() %></td>
					<td><%= user.getUserPwd() %></td>
					<td><%= user.getPhoneNum() %></td>
					<td><%= user.getAddress() %></td>
					<td><%= user.getRegDate() %></td>
				</tr>
				
<%			
		}
%>
		</tbody>	
	</table>
	<hr>

		<span style='float:right'><button type='submit' 
			class='btn btn-danger' >회원삭제</button></span>
	</form>
	<br><br>
<%
	}
%>	
	
		<div class="container center-block">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
				</ul>
			</nav>
		</div>
</div>
</body>
</html>