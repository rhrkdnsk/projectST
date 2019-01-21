<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/trip/resources/js/area.js"></script>
<link rel="stylesheet" href="/trip/resources/css/area.css">

<title>My page</title>
</head>
<body>
	<div style="width: 60%; min-height: 100vh; margin: auto; border: 1px solid black;">
		<div style="width: 100%; height: 10vh; float: left;">
	
		</div>
		<div style="width: 35%; height: 80vh; float: left;">
			<div style="width: 100%; height: 30vh; float: left; border: 1px solid black;">

			</div>
			<form id="areaBoard">
			<div style="width: 100%; height: 5vh; float: left; border: 1px solid black;">
			<ul id="case3" class="area-options">
				<li value="12">관광지</li>
				<li value="14">문화시설</li>
				<li value="28">레포츠</li>
				<li value="32">숙박</li>
				<li value="38">쇼핑</li>
				<li value="39">음식점</li>
			</ul>
			</div>
			
			<div style="width: 50%; height: 45vh; float: left; border: 1px solid black;">
		
		
			<ul id="case1" class="area-options">
				<!-- 시 단위 options -->
			</ul>

		
			

		

			</div>
			<div style="width: 50%; height: 45vh; float: left; border: 1px solid black;">
			<ul id="case2" class="area-options">
				<!-- 구,군 단위 options -->
			</ul>

			</div>
				</form>
		</div>
		<div style="width: 5%; height: 80vh; float: left; border: 1px solid black;">

		</div>
		<div style="width: 60%; height: 5vh; float: left; border: 1px solid black;">

		</div>
		<div style="width: 60%; height: 75vh; float: left; border: 1px solid black;">
<ul id="titles" class="area-content">
				<!-- 컨텐츠 별 검색 내용 -->
			</ul>
		</div>
		<div style="width: 100%; height: 10vh; float: left;"></div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>