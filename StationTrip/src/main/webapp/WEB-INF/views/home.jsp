<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<jsp:include page="header.jsp" />
	<title>Home</title>
</head>
<body>

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<%-- <jsp:include page="footer.jsp" /> --%>
</body>
</html>
