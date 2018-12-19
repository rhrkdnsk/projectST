<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@include file="header.jsp"%>
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
				<option value="1">서울</option>
				<option value="2">인천</option>
				<option value="3">대전</option>
				<option value="4">대구</option>
				<option value="5">광주</option>
				<option value="6">부산</option>
				<option value="7">울산</option>
				<option value="8">세종시</option>
				<option value="31">강원도</option>
				<option value="32">경기도</option>
				<option value="33">충청북도</option>
				<option value="34">충청남도</option>
				<option value="35">경상북도</option>
				<option value="36">경상남도</option>
				<option value="37">전라북도</option>
				<option value="38">전라남도</option>
				<option value="39">제주도</option>
			</select> <select id="case2">
				<option value="">구 선택</option>
			</select>
		</div>
		
		<!-- 	지역 별 컨텐츠 목록 조회	 -->
		
		<!-- 	컨텐츠 선택 시 해당 리스트 조회	 -->
	
	</form>
	<%@include file="footer.jsp"%>
</body>
</html>