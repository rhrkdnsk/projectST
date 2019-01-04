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
<h1>My Page</h1>
<a href="mypage.do">내정보 관리</a>
<a href="pwchange.do">비밀번호 변경</a>
<a href="withdrawalgo.do">회원 탈퇴</a>
<a href="itinerary.do">여행 일정</a>
<hr style="border-color:black;">
</div>
<div style="width: 800px;margin:auto;">
<h3>주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요</h3>
<br>
</div>
<div style="width: 800px;height: 400px; margin:auto; font-size: initial;">
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
		<button id="pwchange">저장</button>
	
</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>