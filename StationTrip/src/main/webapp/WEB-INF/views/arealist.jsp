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
	<form>
		<h1>지역정보</h1>
		<div>
			<select id="case1">
				<!-- 시 단위 options -->
			</select> <select id="case2">
				<!-- 구,군 단위 options -->
			</select>
		</div>

		<h1>관광목적</h1>
		<div>
			<select id="case3">
				<!-- 지역 별 컨텐츠 목록 조회  -->
				<option value="12">관광지</option>
				<option value="14">문화시설</option>
				<option value="15">행사/공연</option>
				<option value="25">여행코스</option>
				<option value="28">레포츠</option>
				<option value="32">숙박</option>
				<option value="38">쇼핑</option>
				<option value="39">음식점</option>
			</select> <select id="titles">
				<option value="">관광지</option>
			</select>

		</div>


		<!-- 	컨텐츠 선택 시 해당 리스트 조회	 -->

	</form>
	<%@include file="footer.jsp"%>
</body>
</html>