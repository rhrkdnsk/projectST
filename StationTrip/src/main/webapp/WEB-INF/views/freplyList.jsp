<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/trip/resources/css/reply.css">

<style type="text/css">
.mar5 {
margin-bottom:5px;
width:888px;
}
.step1p {
	background-color: #a5a9d3a1;
	border-bottom: 4px dotted white;
	height: 40px;
	width: 888px;
}

hr {
background-color:#fafafa;
}
.fbdel{
	float:right;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:#fafafa;font-family:Verdana,sans-serif;width:880px;">
	<c:if test="${empty relist}">
		<p style="color:gray;text-align:center;">등록된 댓글이 없습니다</p>
	</c:if>
	<c:if test="${!empty relist}">
		<c:forEach items="${relist}" var="rdto">
			<div class="step1p">
				 <strong style="font-family:gulim;">ㄴ  ${rdto.user_nickname} <span style="font-weight:normal; font-size:11px; margin-left:20px;">${rdto.comment_time}</span></strong>
				<c:if test="${login_userId == rdto.user_nickname}">
			<a href="fdelreplyList.do?freeboard_num=${rdto.freeboard_num}&comment_num=${rdto.comment_num}
			&comment_refer=${oriRefer}"><button class="fbdel btn btn-default btn-xs">삭제</button></a>
				</c:if>
				  	  <hr class="mar5"/>
				  	  
			</div>
			<p style="margin-left:20px; margin-top:10px; margin-bottom:30px;">${rdto.comment_content}</p>
			<hr class="mar5" />
		</c:forEach>
	</c:if>

</body>
</html>