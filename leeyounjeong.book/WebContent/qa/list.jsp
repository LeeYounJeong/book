<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.qa.service.QaService' %>
<%@ page import='leeyounjeong.book.qa.service.QaServiceImpl' %>
<%@ page import='leeyounjeong.book.qa.domain.Qa'%>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7
	/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<title>게시판</title>
</head>
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
	
	.pagination{
		display:block;
		text-align: center;
	}
	
	.pagination > li> a{
		float: none;
	}
	
	.title{
	   padding: 10 0 0 10px;
	   border-bottom: 1.5px solid #0B2161;
	   letter-spacing: -0.07em
	}
	
	h1{
	   font-size: 32px;
	   padding-left: 20px;
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
</style>

<%
	QaService qaService = new QaServiceImpl();
	UserService userService = new UserServiceImpl();
	List<Qa> qas = qaService.listQas();
	
	String b = request.getParameter("msg2");
	if(b == null) b = "";
	
	if(qas != null && qas.size()>0){
		request.setAttribute("qas", qas);
		
	List<User> users = userService.listUsers();

%>

<body>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<h5><%= session.getAttribute("LoginId") %>님, 환영합니다 !</h5>
			<a href='../main.jsp'>로그아웃</a> <span>|</span>
			<a href='../mypage/01.html'>마이페이지</a> <span>|</span>
			<a href='../cart/01.html'>장바구니</a> <span>|</span>
			<a href='../qa/02.html'>고객센터</a> 
		</div>
	</div>
	<br><br>

	<div class='logo'>
		<a href='../user/02.html'>로고 이미지</a>
	</div>

   <!-- header -->
	<div class='title'>
		<a href='#' style="text-decoration:none">
			<h1>고객센터
			<span>Q&A</span>
			</h1>
		</a>
	</div> <br><br>
	
	<p align='center'>코로나로 인하여 배송이 늦어질 수 있는 점 양해부탁드립니다.^-^</p>
	
	<!-- 게시판 -->
<%	
	if(users != null && users.size()>0){
			request.setAttribute("users", users);
%>			
	<form action='writeProc.jsp'> 
		<table class='table table-hover'>
			<thead>
				<tr height='5'><td width='5'></td></tr>
				<tr style='background-color: #0B2161; color:#FFFFFF; text-align:center;'>
					<th></th>
					<th width='73'>No</th>
					<th width='379'>Subject</th>
					<th width='73'>Writer</th>
					<th width='164'>Date</th>
				</tr>
			</thead>
			
			<tbody id = "userList">
<%		
		for(Qa qa : qas){
%>			
				<tr>
					<td>
						<input type="radio" name="qaNumSel" value="<%= qa.getQaNum() %>"/>
					</td>
					<td><%= qa.getQaNum() %></td>
					<td><%= qa.getQaTitle() %></td>
					<td><%= qa.getUserId() %></td>
					<td><%= qa.getQaDate() %></td>
				</tr>				
<%			
		}
%>
		</tbody>	
			
			<tr height='1'><td colspan='6'></td></tr>
			<tr height='0'><td colspan='6' width='752'></td></tr>
		</table>
		
		<a href='write.jsp' class='btn btn-success pull-right'>글쓰기</a>
		<button type='button' class='btn btn-default pull-right' 
			data-target='#ok2' data-toggle='modal' style='margin-right:10px'>수정 및 삭제</button>
	
<%
	}
%>
<!-- update -->	
	<div class='modal fade' id='ok2'>
	   <div class='modal-dialog modal-md'>
	      <div class='modal-content'>
	         <div class='modal-header'>
	            <button class='close' data-dismiss='modal'>&times;</button>
	            <h5>비밀번호를 입력해주세요.</h5>
	         </div>
	         
	            <div class='modal-body'>
	               <input type='password' class="form-control" name='password'
	                placeholder='비밀번호' required/><%= b %>   
	            </div>
	            <div class='modal-footer'>
	               <button type='submit' formaction='pwdFindProc.jsp' class='btn btn-primary'>확인</button>	           
	               <button class='btn btn-default' data-dismiss='modal'>취소</button>
	            </div>	         
	      </div>
	   </div>   
	</div>
	</form>
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