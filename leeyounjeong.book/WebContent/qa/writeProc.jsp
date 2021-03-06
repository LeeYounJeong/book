<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.qa.service.QaService' %>
<%@ page import='leeyounjeong.book.qa.service.QaServiceImpl' %>
<%@ page import='leeyounjeong.book.qa.domain.Qa' %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%	
	request.setCharacterEncoding("utf-8");
	QaService qaService = new QaServiceImpl();
	
	String userId = (String)session.getAttribute("LoginId");
	
	String qaTitle = request.getParameter("qaTitle");
	String qaContent = request.getParameter("qaContent");
		
	List<Qa> qas = qaService.listQas(); 
	
	Qa qa = new Qa();
	
	
	qa.setQaTitle(qaTitle);
	qa.setQaContent(qaContent);
	qa.setUserId(userId);
	
	qaService.join(qa);
%>

<c:redirect url='list.jsp'/>
