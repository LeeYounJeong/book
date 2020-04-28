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
<html lang='ko'>
<head>
<title>마이페이지</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
   border-bottom: 1px solid #0B2161;
   border-left: 5px solid #0B2161;
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
</style>
</head>
<body>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<h5><%= session.getAttribute("LoginId") %>님, 환영합니다 !</h5>
			<a href='../main.jsp'>로그아웃</a> <span>|</span>
			<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
			<a href='#'>장바구니</a> <span>|</span>
			<a href='../qa/list.jsp'>고객센터</a> 
		</div>
	</div>
	<br><br>
	
	<div class='logo'>
		<a href='../user/loginComplete.jsp'>로고 이미지</a>
	</div>

   <!-- header -->
   <div class='title'>
      <a href='mypage.jsp' style="text-decoration:none">
	      <h1>마이페이지
	      <span>MyPage</span>
	      </h1>
	  </a>
   </div>
   
   <!-- nav -->
	<nav class='navbar navbar-default' style='background-color:#0B2161'>
	<div class='container-fluid'>
		<ul class='nav navbar-nav'>
			<li><a style='color:#FFFFFF' href='#'>전체 주문 내역</a></li>
			<li><a style='color:#FFFFFF' href='#'>내가 쓴 글</a></li>
			<li><a style='color:#FFFFFF' href='../user/userManage.jsp'>회원 정보 관리</a></li>
		</ul>			
	</div>
	</nav>
   
   <!-- order list -->
   <h3 class='sub_tit'>최근 주문 내역
      <a href='#' id='more'><span>더 보기</span></a>
   </h3>
   
   <table class='table table-hover' id='tb' style='text-align:center'>
      <thead style='background-color :#EFF2FB'>
         <tr>
            <th class="col-md-2">주문 날짜</th>
            <th class="col-md-2">주문 번호</th>
            <th class="col-md-5">상품 정보</th>
            <th class="col-md-3">배송 상태</th>
         </tr>            
      </thead>
      <tbody>
         <tr>
            <td>2020-04-17</td>
            <td>20002</td>
            <td style='text-align:left'>
               <ul class='list-unstyled' id='info'>
                  <li>쌍용 출판사</li>
                  <li><strong style='font-size: 16px'>JSP 2.3 웹프로그래밍 기초부터 중급까지</strong></li>
                  <li><small style='color:#777777'>수량 : 1개</small></li>
                  <li><small style='color:#777777'>가격 : 27,000원</small></li>
               </ul>
            </td>
            <td><span style='color: #5882FA;'>배송 중</span><br>
               <button class='btn btn-sm btn-default' id='deli_btn' data-target='#deli' data-toggle='modal'>배송 조회</button>
            </td>
         </tr>
      </tbody>
   </table>
   <br>
   <h3 class='sub_tit'>최근 문의 내역
      <a href='../qa/01.html' id='more'><span>더 보기</span></a>
   </h3>
   
   <table class='table table-hover' id='tb' style='text-align:center'>
      <thead style='background-color :#EFF2FB'>
         <tr>
            <th class="col-md-2">문의 번호</th>
            <th class="col-md-2">문의 날짜</th>
            <th class="col-md-5">문의 제목</th>
            <th class="col-md-3">문의 상태</th>
         </tr>            
      </thead>
      <tbody>
         <tr style='height:52px;'>
            <td>30001</td>
            <td>2020-04-17</td>
            <td style='text-align:left'>[배송] 언제 배송 출발하나요..?</td>
            <td><span style='color: #FA5882;'>답변대기 중</span></td>
         </tr>
      </tbody>
   </table>
   <div class='modal fade' id='deli'>
		<div class='modal-dialog modal-md'>
			<div class='modal-content'>
				<div class='modal-header'>
					<button class='close' data-dismiss='modal'>&times;</button>
            		<h4 class='modal-title'>배송 조회</h4>
				</div>
				<form action='https://www.cjlogistics.com/ko/tool/parcel/tracking' target='_blank'>
		            <div class='modal-body'>
		                 <p>선택한 주문 상품의 운송장 번호는 <ins>1548214</ins> 입니다.</p>
		                 <p>자세한 배송 조회는 택배사 홈페이지에서 확인 가능합니다</p>
		            </div>
		            <div class='modal-footer'>
		               <button type='submit' class='btn btn-primary'>택배사 이동</button>
		               <button class='btn btn-default' data-dismiss='modal'>확인</button>
		            </div>
		         </form>
			</div>
		</div>
	</div> 
</div>
</body>
</html>