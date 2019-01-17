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

<title>My page</title>
</head>
<body>
	<div style="width: 60%; min-height: 100vh; margin: auto; border: 1px solid black;">
		<div style="width: 100%; height: 10vh; float: left;">
		
		</div>
		<div style="width: 35%; height: 80vh; float: left;">
			<div style="width: 100%; height: 30vh; float: left; border: 1px solid black;">

			</div>
			<div style="width: 100%; height: 5vh; float: left; border: 1px solid black;">

			</div>
			<div style="width: 50%; height: 45vh; float: left; border: 1px solid black;">

			</div>
			<div style="width: 50%; height: 45vh; float: left; border: 1px solid black;">

			</div>
		</div>
		<div style="width: 5%; height: 80vh; float: left; border: 1px solid black;">

		</div>
		<div style="width: 60%; height: 5vh; float: left; border: 1px solid black;">

		</div>
		<div style="width: 60%; height: 75vh; float: left; border: 1px solid black;">

		</div>
		<div style="width: 100%; height: 10vh; float: left;"></div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>