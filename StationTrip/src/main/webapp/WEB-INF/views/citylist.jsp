<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<script type="text/javascript" src="/trip/resources/js/train.js"></script>
<title></title>
</head>
<body>
	<h1>도시리스트</h1>
		<table border="1">
			<tr>
				<td>
					<p>출발역</p>
				</td>
				<td>
					<select id="startcitycode" >
							<c:choose>
								<c:when test="${empty citylist }">
									<option class="cityname" value="없음">--없음--</option>
								</c:when>
								<c:otherwise>
									<option class="cityname" value="scity">도시 선택</option>
									<c:forEach items="${citylist }" var="citylist">
										<option class="cityname" value="${fn:substringBefore(citylist, '.') }">${fn:substringAfter(citylist, '.') }</option>
										<!-- option id="citycode" style="display:none" value="${fn:substringAfter(list, '&') }">${fn:substringAfter(list, '&') }</option -->
									</c:forEach>
								</c:otherwise>
							</c:choose>
					</select>
				</td>
				<td>
					 <select id="starttowncode">
						<option value="starttowncode">역 선택</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<p>도착역</p>
				</td>
				<td>
					<select id="endcitycode" >
							<c:choose>
								<c:when test="${empty citylist }">
									<option class="cityname" value="없음">--없음--</option>
								</c:when>
								<c:otherwise>
									<option class="cityname" value="ecity">도시 선택</option>
									<c:forEach items="${citylist }" var="citylist">
										<option class="cityname" value="${fn:substringBefore(citylist, '.') }">${fn:substringAfter(citylist, '.') }</option>
										<!-- option id="citycode" style="display:none" value="${fn:substringAfter(list, '&') }">${fn:substringAfter(list, '&') }</option -->
									</c:forEach>
								</c:otherwise>
							</c:choose>
					</select>
				</td>
				<td>
					 <select id="endtowncode">
						<option value="endtowncode">역 선택</option>
					</select>
				</td>
			</tr>
			<tr>
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
				</td>
			</tr>
		</table>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>