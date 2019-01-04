<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/trip/resources/js/areadetail.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	<h1>관광지 상세보기</h1>
	<div id='area-detail'>
		<div id='area-detail-img'>
		<!-- 이미지 -->
		</div>
		<div id='area-detail-title'>
		<!-- 타이틀 -->
		</div>
		<div id='area-detail-content'>
		<!-- 설명 -->
		</div>
	</div>
</form>
<%@include file="footer.jsp"%>
</body>
</html>