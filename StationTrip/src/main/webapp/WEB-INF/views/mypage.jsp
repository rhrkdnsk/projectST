<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>My page</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="text-align:center;	">
<h1>My Page</h1>
<a href="mypage.do">내정보 관리</a>
<a href="pwchange.do">비밀번호 변경</a>
<a href="withdrawal.do">회원 탈퇴</a>
<hr style="border-color:black;">
</div>
<div style="width: 800px;margin:auto;">
<h2>내 정보를 <span style="color:red;">최신정보</span>로 관리해주세요</h2>
<br>
</div>
<div style="width: 800px;height: 400px; margin:auto; font-size: initial;">
	<div>
		<p><label class="labeltag">이메일</label> ${dto.user_email }</p>
		<p><label class="labeltag">이름 </label>  ${dto.user_name }</p>
		<hr>
	</div>
	<div>
		<p>
			<label class="labeltag">닉네임</label>   
			<input type="text" id="nickput" value="${dto.user_nickname }" style="border:none;" readonly="readonly"/>
			<span>
				<button id="btnnick" style="margin-left:15px;background-color: white;" >수정</button>
			</span>
		</p>
		<p>
			<label class="labeltag">연락처</label>   
			<input type="text" id="phoneput" value="${dto.user_phone }" style="border:none;" readonly="readonly"/>
			<span>
				<button id="btnph" style="margin-left:15px;background-color: white;" >수정</button>
			</span>
		</p>
		<hr>
	</div>
	<div>
		<p><label class="labeltag">포인트</label>   ${dto.user_point }</p>
		<p><label class="labeltag">등급</label>   ${dto.tier }</p>
		<hr>
	</div>
</div>
<script type="text/javascript">
$("#btnnick").click(function(){
	$("#nickput").css("border","1px solid gray");
	$("#nickput").removeAttr("readonly");
});
$("#btnph").click(function(){
	$("#phoneput").css("border","1px solid gray");
	$("#phoneput").removeAttr("readonly");
});
</script>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>