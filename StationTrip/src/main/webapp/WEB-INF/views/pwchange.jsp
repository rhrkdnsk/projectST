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
<h3>주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요</h3>
<br>
</div>
<div style="width: 800px;height: 400px; margin:auto; font-size: initial;">
	<form action="changepw.do">
		<p>
		<label class="labeltagpw">현재 비밀번호</label>
		<input type="password" name="nowpw" placeholder="현재 비밀번호를 입력" />
		</p>
		<p>
		<label class="labeltagpw">새 비밀번호</label>
		<input type="password" name="newpw" placeholder="새 비밀번호를 입력"  />
		</p>
		<hr >
		<button type="submit">저장</button>
	</form>
</div>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>