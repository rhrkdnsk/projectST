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
<h1>My Page</h1>
<a href="mypage.do">내정보 관리</a>
<a href="pwchange.do">비밀번호 변경</a>
<a href="withdrawal.do">회원 탈퇴</a>
<hr style="border-color:black;">
<div>
<fieldset>
<legend>내정보 관리</legend>
<p>닉네임 : ${dto.user_nickname } <button>변경</button></p>
<p>이메일 : ${dto.user_email }</p>
<p>이름 : ${dto.user_name }</p>
<p>전화번호 : ${dto.user_phone } <button>변경</button></p>
<p>포인트 : ${dto.user_point }</p>
<p>등급 : ${dto.tier }</p>
</fieldset>
</div>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>