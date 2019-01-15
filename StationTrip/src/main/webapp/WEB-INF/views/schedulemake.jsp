<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>My page</title>
</head>
<body>
	<div id="resetModalLayer">
		<div class="resetModalContent">
			<fieldset class="login_fieldl">
				<legend>비밀번호 재설정</legend>
				<br />
				<ul class="login_ul">
					<li><input type="password" id="remail" class="login_inputbox"
						placeholder="일정명을 입력하세요" /></li>
					<li><input type="password" id="remailchk"
						class="login_inputbox" placeholder="Password 확인" /></li>
					<li><a href="#loginModalLayer" class="loginModalLink2"><button
								id="signBtn" class="login_button2">변경 완료</button></a></li>
				</ul>
			</fieldset>
		</div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>