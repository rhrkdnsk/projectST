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

<div style="text-align:center;	">
<div id="amazingtext">
<h1 style="margin-bottom: 30px;">My Page</h1>
</div>
<a href="mypage.do" class="mp_menu" >내정보 관리</a>
<a href="pwchange.do" class="mp_menu" >비밀번호 변경</a>
<a href="myinquiry.do" class="mp_menu" style="color:blue;">나의 문의글</a>
<a href="itinerary.do" class="mp_menu" >여행 일정</a>
<a href="withdrawalgo.do" class="mp_menu" >회원 탈퇴</a>
<hr style="border-color:black;">
</div>
<div style="width: 800px;margin:auto;">
<h3>나의 <span style="color:red;">문의글</span></h3>
<br>
</div>

<div style="width: 800px;height: 500px; margin:auto; font-size: initial;">
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
				<c:when test="${empty inquiry_list}">
					<tr>
						<td>-------작성된 글이 없습니다.----</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${inquiry_list}" var="list">
	
						<tr>
							<c:if test="${empty list.admin_id}">
								<td><a href='inquiry_detail.do?inquiry_num=${list.inquiry_num }'>${list.inquiry_title}</a></td>
								<td>${list.user_nickname}</td>
						 	</c:if>
						 	<c:if test="${!empty list.admin_id}">
								<td>&nbsp;&nbsp;&nbsp;<img alt="화살표" src="/trip/resources/images/Arrow3.png"><a href='inquiry_detail.do?inquiry_num=${list.inquiry_num }'>${list.inquiry_title}</a></td>
								<td>${list.admin_id}</td>
						 	</c:if>
													
							<td>
								<fmt:formatDate value="${list.inquiry_time}" pattern="yyyy년 MM월 dd일" />
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
</div>
	<jsp:include page="footer.jsp" />

</body>
</html>