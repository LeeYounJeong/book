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
<title>BoB</title>
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
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';
                
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();      
    }
</script>
<!-- 
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
</script>-->
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
	
	#userid, #sample4_postcode {
		width: 50%;
		display:inline-block; 
		margin-right:15px;	
	}
	
	.form-control{
		width: 50%;
	}
	
	th{
		padding-right: 15px;
		padding: 10px 7px;
	}
	
	h3{
		margin-left: 100px;
	}
	
	.btn-sm{
		margin-bottom: 8px;
	}
	
	.sign{
		display:inline-block;
		margin: 0px 0px 0px 150px;
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
			<a href=loginComplete.jsp'>로고 이미지</a>
		</div>
		<br>

 <!-- header -->
   <div class='title'>
      <a href='myPage.html' style="text-decoration:none">
	      <h1>회원수정
	      <span>Update</span>
	      </h1>
	  </a>
   </div>
   
   <!-- nav -->
	<nav class='navbar navbar-default'>
	<div class='container-fluid'>
		<ul class='nav navbar-nav'>
			<li><a href='#'>전체 주문 내역</a></li>
			<li><a href='#'>내가 쓴 글</a></li>
			<li  class="active"><a href='userManage.jsp'>회원 정보 관리</a></li>
		</ul>			
	</div>
	</nav>
	 
	<br>
	
<%
	User user = new User();
	String userId = (String)session.getAttribute("LoginId");
	//System.out.println(userId);
	user = userService.findUser(userId);
%>	
	<div class='sign'>
		<form action="correctProc.jsp">
			<table class='sign'>
				<tr class='text'>
					<th>아이디</th>
					<td><input type='text' class="form-control" name="userId" value="<%= user.getUserId() %>" readonly/></td>
				</tr>
				
				<tr class='text'>
					<th>이름</th>
					<td><input type='text'  name="newUserName" value="<%= user.getUserName() %>"/></td>
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
										<li class="list-group-item">▶새 비밀번호&nbsp;<input type='password' class="form-control" name="newPwd1"/></li>
										<li class="list-group-item">▶새 비밀번호 확인&nbsp;<input type='password' class="form-control" name="newPwd2"/></li>
									</ul>
								</div>
							</div>
						</div>		
					</td>
				</tr>
				
				<tr class='number'>
					<th>휴대폰 번호</th>
					<td><input type='text' name="newPhoneNum"  value="<%= user.getPhoneNum() %>"/></td>
				</tr>
				
				<tr class="text">
					<th>주소<span>(*)</span></th>
					<td><input type="text" id="sample4_postcode" placeholder="우편번호" name="newAddress1" required>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="newAddress2" required>
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="newAddress3">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="newAddress4" required>
					</td>
				</tr>
			</table>
			<br>
			
			<div class='signbutton'>
				<button type='submit' class='btn btn-success btn-lg'>수정하기</button>
			</div>
		<!-- 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();      
    }
</script>	
		</form>
	</div>
</div>
</body>
</html>