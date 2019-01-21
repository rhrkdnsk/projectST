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
<script type="text/javascript" src="/trip/resources/js/train_info.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="/trip/resources/css/train.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() {
    $( "#Datepicker" ).datepicker({
    	changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        dateFormat: "yymmdd",
        dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    });
});

</script>
<title></title>
</head>
<body>
	<div id="amazingtext">
	<h1>열차 조회</h1>
	</div>
	<hr id="hr_train">
	<div id="trainbody" style="width: 900px;margin: auto;height:800px;">
	<table id="infoTable">
		<colgroup>
			<col width="16%">
			<col width="16%">
			<col width="16%">
			<col width="16%">
			<col width="16%">
			<col width="16%">
		</colgroup>
		<tr>
			<th colspan="2">
				<p>출발역</p>
			</th>
			<th colspan="2">
				<p>도착역</p>
			</th>
			<th colspan="2">
				<p>출발일</p>
			</th>
		</tr>
		<tr>
			<td><select id="startcitycode">
					<c:choose>
						<c:when test="${empty citylist }">
							<option class="cityname" value="없음">도시 선택</option>
						</c:when>
						<c:otherwise>
							<option class="cityname" value="scity">도시 선택</option>
							<c:forEach items="${citylist }" var="citylist">
								<option class="cityname"
									value="${fn:substringBefore(citylist, '.') }">${fn:substringAfter(citylist, '.') }</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
			</select></td>
			<td><select id="starttowncode">
					<option value="starttowncode">역 선택</option>
			</select></td>


			<td><select id="endcitycode">
					<c:choose>
						<c:when test="${empty citylist }">
							<option class="cityname" value="없음">--없음--</option>
						</c:when>
						<c:otherwise>
							<option class="cityname" value="ecity">도시 선택</option>
							<c:forEach items="${citylist }" var="citylist">
								<option class="cityname"
									value="${fn:substringBefore(citylist, '.') }">${fn:substringAfter(citylist, '.') }</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
			</select></td>
			<td><select id="endtowncode">
					<option value="endtowncode">역 선택</option>
			</select></td>
			<!-- 날짜 선택 -->
			<td><input type="text" id="Datepicker" class="traindate"
				autocomplete=off></td>

			<td>
				<button onclick="traingoti(1)" id="train_btn">선택</button>
			</td>
		</tr>
	</table>
	<iframe id="trainframe" src="trainmove.do"></iframe>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>