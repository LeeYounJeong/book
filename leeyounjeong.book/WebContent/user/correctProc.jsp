<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	User user = new User();
	
	String pwd1 = request.getParameter("pwd1");
	String pwd2 = request.getParameter("pwd2");
	
	if(pwd1.equals(pwd2)){
		user.setUserPwd(pwd1);	
%>
	<c:redirect url="correctUser.jsp"/>
<%	
	}else
%>
<!-- 해야될것: 비밀번호가 맞을 때 수정완료를 알리고 수정이 되는것 -->	