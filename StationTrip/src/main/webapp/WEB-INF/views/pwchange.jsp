<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/trip/resources/css/mypage.css">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#pwchange").click(function(){
		console.log("클릭")
		var email = $("#pch_email").val();
		var nowpw = $("#nowpw").val();
		console.log("nowpw =" +nowpw)
		var newpw = $("#newpw").val();
		console.log("newpw = "+ newpw)
		var data = {"nowpw" : nowpw, "newpw" : newpw, "user_email" : email}
		
		$.ajax({
			url:"changepw.do",
			type:'GET',
			data: data,
			success:function(data){
				console.log(data)
				if(data === "true"){
					alert("변경성공")
					location.href='mypage.do'
				} else {
					alert("변경 실패"); 
				}
			},
			error:function(){
				alert("변경 실패ㅜㅜ") ;
			}
		}); 
	});
});
</script>
<title>My page</title>
</head>
<body>

<div style="text-align:center;	">
<div id="amazingtext">
<h1 style="margin-bottom: 30px;">My Page</h1>
</div>
<a href="mypage.do" class="mp_menu" >내정보 관리</a>
<a href="pwchange.do" class="mp_menu" style="color:blue;">비밀번호 변경</a>
<a href="myinquiry_sdel.do" class="mp_menu" >나의 문의글</a>
<!-- <a href="itinerary.do" class="mp_menu" >여행 일정</a> -->
<a href="withdrawalgo.do" class="mp_menu" >회원 탈퇴</a>
<hr style="border-color:black;">
</div>
<div style="width: 800px;margin:auto;">
<h3>주기적인  <span style="color:red;">비밀번호 변경</span>을 통해 개인정보를 안전하게 보호하세요</h3>
<br>
</div>
<div style="width: 800px;height: 420px; margin:auto; font-size: initial;">
		<input id="pch_email" type="hidden" value="${dto.user_email }">
		<p>
		<label class="labeltagpw">현재 비밀번호</label>
		<input type="password" id="nowpw" placeholder="현재 비밀번호를 입력" />
		</p>
		<p>
		<label class="labeltagpw">새 비밀번호</label>
		<input type="password" id="newpw" placeholder="새 비밀번호를 입력"   onkeydown = "if (event.keyCode == 13)
                       				document.getElementById('pwchange').click()"/>
		</p>
		<hr >
		<button id="pwchange" style="background-color:white;">저장</button>
	
</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>