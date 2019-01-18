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
<script type="text/javascript" src="/trip/resources/js/train_info.js"></script>
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!-- jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
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
<style type="text/css">
#startcitycode, #starttowncode, #endcitycode, #endtowncode{
	width: 140px;
	height:30px;
	border:none;
    color: #153d73;
}
#startcitycode:hover, #starttowncode:hover, #endcitycode:hover, #endtowncode:hover{
	width: 140px;
	height:30px;
	border:none;
    background-color:#34495e;
	border:none;
	color: #fff;	
}
#train_btn{
	width:140px;
	background-color:white;
	border:none;
	color: #153d73;	
}
#train_btn:hover{
	width:140px;
	height:30px;
	background-color:#34495e;
	border:none;
	color: #fff;	
}

.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; }
.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: blue; } 

#Datepicker{
	padding-left:10px;
	width:130px;
	height:29px;
	border:none;
	color: #153d73;	
}
#Datepicker:hover{
	padding-left:10px;
	width:130px;
	height:29px;
	background-color:#34495e;
	border:none;
	color: #fff;	
}
#hr_train{
	border-color:#153d73;
}
#trainframe{
	width:900px;
	height:700px;
	display:none;
	border:none;
}
table#infoTable {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
}
table#infoTable th {
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-left: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table#infoTable td {
	color: #153d73;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-top: 3px solid #369;
    border-left: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}

</style>
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
			<%-- 	<col width="20%"> --%>
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
			<!-- 				<th>
					<p>열차 선택</p>
				</th> -->
		</tr>
		<tr>
			<!-- 출발역 지정 시작지점 -->

			<td><select id="startcitycode">
					<c:choose>
						<c:when test="${empty citylist }">
							<option class="cityname" value="없음">--없음--</option>
						</c:when>
						<c:otherwise>
							<option class="cityname" value="scity">도시 선택</option>
							<c:forEach items="${citylist }" var="citylist">
								<option class="cityname"
									value="${fn:substringBefore(citylist, '.') }">${fn:substringAfter(citylist, '.') }</option>
								<!-- option id="citycode" style="display:none" value="${fn:substringAfter(list, '&') }">${fn:substringAfter(list, '&') }</option -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
			</select></td>
			<td><select id="starttowncode">
					<option value="starttowncode">역 선택</option>
			</select></td>


			<!-- 도착역 지정 시작지점 -->
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
								<!-- option id="citycode" style="display:none" value="${fn:substringAfter(list, '&') }">${fn:substringAfter(list, '&') }</option -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
			</select></td>
			<td><select id="endtowncode">
					<option value="endtowncode">역 선택</option>
			</select></td>

			<%-- 				<!-- 열차종류 선택 -->
				<td>
					<select id="traincode" >
							<c:choose>
								<c:when test="${empty traincode }">
									<option class="trainname" value="없음">--없음--</option>
								</c:when>
								<c:otherwise>
									<option class="trainname" value="train">열차 선택</option>
									<c:forEach items="${traincode }" var="traincode">
										<option class="traincode" value="${fn:substringBefore(traincode, '.') }">${fn:substringAfter(traincode, '.') }</option>
										<!-- option id="citycode" style="display:none" value="${fn:substringAfter(list, '&') }">${fn:substringAfter(list, '&') }</option -->
									</c:forEach>
								</c:otherwise>
							</c:choose>
					</select>
				</td> --%>
		
			<!-- 날짜 선택 -->
			<td><input type="text" id="Datepicker" class="traindate"
				autocomplete=off></td>
			<%-- <td><select id="highnoon">
					<option class="traintime" value="오전">오전</option>
					<option class="traintime" value="오후">오후</option>
			</select> <select id="traintime">
					<%
						for (int i = 1; i <= 12; i++) {
					%>
					<option class="traintime" value="<%=i%>"><%=i%>시
					</option>
					<%
						}
					%>
			</select></td> --%>
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