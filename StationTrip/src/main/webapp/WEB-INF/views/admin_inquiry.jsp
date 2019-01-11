<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의글 리스트</title>
<style type="text/css">
.inq_title{
float:left;
width:420px;
margin:0;
}
.inq_id{
float:left;
width:150px;
margin:0;
}
.inq_time{
float:left;
width:200px;
margin:0;
}
</style>
</head>
<body>

<div style="width: 900px;margin:auto;">
<h3>1:1 <span style="color:red;">문의글</span></h3>
<br>
</div>
<div style="width: 900px;min-height: 400px; margin:auto; font-size: initial;">
	<div class="list">
		<dl>
			<dd class="inq_title">제목</dd>
			<dd class="inq_id">작성자</dd>
			<dd class="inq_time">작성일</dd>
		</dl>
		<br>
		<c:choose>
			<c:when test="${empty admin_inquiry_list}">
				<dl>
					<dd>-------작성된 글이 없습니다.----</dd>
				</dl>
			</c:when>
			<c:otherwise>
				<c:forEach items="${admin_inquiry_list}" var="list">

					<dl>
						<c:if test="${empty list.admin_id}">
							<dd class="inq_title"><a href='admin_inquiry_detail.do?inquiry_num=${list.inquiry_num }'>${list.inquiry_title}</a></dd>
							<dd class="inq_id">${list.user_nickname}</dd>
					 	</c:if>
					 	<c:if test="${!empty list.admin_id}">
							<dd class="inq_title">&nbsp;&nbsp;&nbsp;<img alt="화살표" src="/trip/resources/images/Arrow3.png"><a href='admin_inquiry_detail.do?inquiry_num=${list.inquiry_num }'>${list.inquiry_title}</a></dd>
							<dd class="inq_id">${list.admin_id}</dd>
					 	</c:if>
						
						<dd class="inq_time">
							<fmt:formatDate value="${list.inquiry_time}" pattern="yyyy년 MM월 dd일" />
						</dd>
					</dl>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>

	<jsp:include page="footer.jsp" />

</body>
</html>