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
table.type04 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  	margin : 20px 10px;
}
table.type04 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.type04 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>

<div style="width: 900px;margin:auto;">
<h3>1:1 <span style="color:red;">문의글</span></h3>
<br>
</div>
<div style="width: 900px;min-height: 500px; margin:auto; font-size: initial;">
	<div class="list">
		<table class="type04">
			<colgroup>
				<col width="50%">
				<col width="20%">
				<col width="30%">
			</colgroup>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${empty admin_inquiry_list}">
					<tr>
						<td colspan="3" >  작성된 글이 없습니다. </td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${admin_inquiry_list}" var="list">
	
						<tr>
							<c:if test="${empty list.admin_id}">
								<td><a href='admin_inquiry_detail.do?inquiry_num=${list.inquiry_num }'>${list.inquiry_title}</a></td>
								<td>${list.user_nickname}</td>
						 	</c:if>
						 	<c:if test="${!empty list.admin_id}">
								<td>&nbsp;&nbsp;&nbsp;<img alt="화살표" src="/trip/resources/images/Arrow3.png"><a href='admin_inquiry_detail.do?inquiry_num=${list.inquiry_num }'>${list.inquiry_title}</a></td>
								<td>${list.admin_id}</td>
						 	</c:if>
													
							<td>
								<fmt:formatDate value="${list.inquiry_time}" pattern="yyyy년 MM월 dd일" />
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="3" style="text-align:center;">
					<c:if test="${page-1 != 0 }">
						<a href="admin_inquiry.do?pageNum=${page-1}">이전</a>						
					</c:if>
					<%
						int totalPage = ((Integer)request.getAttribute("totalPage")).intValue(); // 목록뽑을 개수 나누기 총개수
						int startPage = ((Integer)request.getAttribute("startPage")).intValue();
						int endPage = ((Integer)request.getAttribute("endPage")).intValue();
						for(int i=startPage; i<=endPage; i++) {
							%>			
								<a href="admin_inquiry.do?pageNum=<%=i%>"><%=i%></a>						
							<%			
						}
					%>
					<c:if test="${page+1 <= totalPage}">
						<a href="admin_inquiry.do?pageNum=${page+1}">다음</a>						
					</c:if>
				</td>
			<tr>
		</table>
	</div>
	
</div>

	<jsp:include page="footer.jsp" />

</body>
</html>