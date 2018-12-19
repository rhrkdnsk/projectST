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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<h1>도시리스트</h1>
	<form action="train.do" method="get">
		<table border="1">
			<tr>
				<td><select name="code" >
						<c:choose>
							<c:when test="${empty list }">
								<option id="cityname" value="없음">--없음--</option>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list }" var="list">
									<option id="cityname" value="${list}">${fn:substringAfter(list, ' ') }</option>
									<!-- option id="citycode" style="display:none" value="${fn:substringAfter(list, '&') }">${fn:substringAfter(list, '&') }</option -->
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</select></td>
				<td>
								<td><select name="code" >
						<c:choose>
							<c:when test="${empty list }">
								<option id="trainname" value="없음">--없음--</option>
							</c:when>
							<c:otherwise>
								<c:forEach items="${lists }" var="lists">
									<option id="trainname" value="${lists}">${fn:substringAfter(lists, ' ') }</option>
									<!-- option id="citycode" style="display:none" value="${fn:substringAfter(list, '&') }">${fn:substringAfter(list, '&') }</option -->
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</select></td>
				</td>
				<td><input type="submit" value="선택"></td>
			</tr>
		</table>
	</form>
</body>
</html>