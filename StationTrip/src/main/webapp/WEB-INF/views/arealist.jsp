<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/trip/resources/js/area.js"></script>


</head>
<body>
	<h1>지역정보</h1>
	<form>
		<div>
			<select id="case1">
				<option value="">시 선택</option>
				<option value="1">서울특별시</option>
				<option value="2">인천광역시</option>
				<option value="3">대전광역시</option>
				<option value="4">대구광역시</option>
				<option value="5">광주광역시</option>
				<option value="6">부산광역시</option>
				<option value="7">울산광역시</option>
				<option value="8">세종특별시</option>
			</select> <select id="case2">
				<option value="">구 선택</option>
			</select>
		</div>
	</form>
</body>
</html>