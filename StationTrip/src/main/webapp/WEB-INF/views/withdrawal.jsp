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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#delemail").click(function(){
		console.log("클릭")
		var user_email = $("#d_email").text();
		console.log("user_email =" +user_email)
		var user_password = $("#user_password").val();
		console.log("user_password = "+ user_password)
		var data = {"user_email" : user_email, "user_password" : user_password}
		
		$.ajax({
			url:"withdrawal.do",
			type:'GET',
			data: data,
			success:function(data){
				console.log(data)
				if(data === "true"){
					alert("탈퇴성공")
					location.href='index.jsp'
				} else {
					alert("비밀번호가 다릅니다"); 
				}
			},
			error:function(){
				alert("탈퇴 실패ㅜㅜ") ;
			}
		}); 
	});
});
</script>
<title>My page</title>
</head>
<body>

<div style="text-align:center;	">
<h1>My Page</h1>
<a href="mypage.do">내정보 관리</a>
<a href="pwchange.do">비밀번호 변경</a>
<a href="withdrawalgo.do">회원 탈퇴</a>
<hr style="border-color:black;">
</div>
<div style="width: 800px;margin:auto;">
<h3 style="color:red; font-weight: bold;">회원탈퇴를 해도 후회하지 않으시겠습니까?</h3>
<br>
</div>
<div style="width: 800px;height: 400px; margin:auto; font-size: initial;">
	
		<p><label class="labeltag">이메일</label><span id="d_email">${dto.user_email }</span></p>
		<p>
		<label class="labeltag">비밀번호</label>
		<input type="password" id="user_password" placeholder="비밀번호를 입력" onkeydown = "if (event.keyCode == 13)
                       				document.getElementById('delemail').click()" />
		</p>
		<hr >
		<button id="delemail">삭제</button>
	
</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>