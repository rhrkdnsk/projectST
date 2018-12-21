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
<style type="text/css">
ul, li {
 list-style:none;
 }

</style>

</head>
<body>
	<form>
		<h1>지역정보</h1>
		<div>
			<ul id="case1">
				<!-- 시 단위 options -->
			</ul>
			<hr />
			<ul id="case2">
				<!-- 구,군 단위 options -->
			</ul>
		</div>

		<h1>관광목적</h1>
		<div>
			<ul id="case3">
				<!-- 지역 별 컨텐츠 목록 조회  -->
				<li value="12">관광지</li>
				<li value="14">문화시설</li>
				<li value="15">행사/공연</li>
				<li value="25">여행코스</li>
				<li value="28">레포츠</li>
				<li value="32">숙박</li>
				<li value="38">쇼핑</li>
				<li value="39">음식점</li>
			</ul> 
			<hr />
			<ul id="titles">
				<li>관광지</li>
			</ul>

		</div>


		<!-- 	컨텐츠 선택 시 해당 리스트 조회	 -->

	</form>
	<%@include file="footer.jsp"%>
</body>
</html>