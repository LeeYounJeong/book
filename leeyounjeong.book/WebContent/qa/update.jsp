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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<head>
<title>게시판</title>
</head>
<!-- 상단바 -->
<%
	request.setCharacterEncoding("utf-8");
	QaService qaService = new QaServiceImpl();
	
	Object objQaNum = session.getAttribute("qaNum");
	String strQaNum = objQaNum.toString();
	int qaNum = Integer.parseInt(strQaNum);
	
	Qa qa = new Qa();
	
	if(qaNum > 0 ){
	   qa = qaService.findQa(qaNum);
	   }	
%>

<!-- 게시판 -->
<body>
<div class='container'>
<h2>고객센터</h2>
<br>
	<div class='row'>
		<form method='post' action='updateProc.jsp'>
			<table class='table table-striped'
				style='text-align: center; border:1px solid #dddddd'>
				<thead>
					<tr>
						<th colspan='2'
							style='background-color: #EFF2FB; text-align: center;'>게시판
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="table-active">제목</th>
						<td><input type='text' class='form-control' placeholder="제목" name='updateTitle'
						value='<%= qa.getQaTitle()%>' maxlength="50"/></td>
					</tr>
					<tr>
						<th class="table-active">내용</th>
						<td><textarea class="form-control" placeholder="내용을 작성하세요" 
							maxlength="2048" name="updateContent" style="height: 350px;"><%= qa.getQaContent()%></textarea></td>
					</tr>		
				</tbody>
			</table>
			<a href='list.jsp' class='btn btn-info pull-left'>목록</a>
			<button type='submit' class='btn btn-default pull-right'>수정</button>
			<button type='submit' formaction='deleteProc.jsp' class='btn btn-danger pull-right' style='margin-right:10px'>삭제</button>
		</form>
	</div>
</div>
</body>
</html>
