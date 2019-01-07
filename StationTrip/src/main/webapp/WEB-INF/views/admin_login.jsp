<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function admin_login(){
	var admin_id = $("#admin_loginId").val();
	console.log(admin_id)
 	var admin_password = $("#admin_loginPw").val();
	console.log(admin_password)
	var data = { "admin_id": admin_id, "admin_password": admin_password };
     
	$.ajax({
		url:"admin_login.do",
		type:'GET',
		data: data,
		success:function(data){
			console.log(data)
			if(data != "fail"){
				alert("관리자님이 로그인함");
				location.href="home.do"
			} else {
				alert("로그인 실패"); 
			}
		},
		error:function(){
			alert("로그인 실패ㅜㅜ") ;
		}
	}); 
};
</script>
<title>Insert title here</title>
</head>
<body>
<h1>관리자로그인</h1>

<label class="labeltag">아이디</label><span>
<input type="text" id="admin_loginId"></span>
<br />
<label class="labeltag">비밀번호</label><span>
<input type="password" id="admin_loginPw" onkeydown = "if (event.keyCode == 13)
                       				document.getElementById('admin_loginBtn').click()"></span>
<br />
<button id="admin_loginBtn" onclick="admin_login()">로그인</button>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>