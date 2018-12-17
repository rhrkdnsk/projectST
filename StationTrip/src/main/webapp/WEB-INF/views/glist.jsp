<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<style type="text/css">
	/* 	링크에 밑줄 제거 */
	table a{text-decoration: none;}
	img{width:10px; height: 10px;}
	
/* 	입력범위가 벗어나는 경우 텍스트 처리 (내용이....) */
	.titleval{
		display: inline-block;
		width: 200px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space:nowrap;
	}
	textarea[name=testAjax]{
		position: fixed;
		left: 100px;
		top:150px;
	}
</style>
</head>
<body>
<div id="container">
<h1>글목록보기</h1>

<form action="ganriController.do" method="post">
<table class="table table-hover">
	<col width="50px">
	<col width="50px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="50px">
	<col width="50px">
	<tr>
		<th><input type="checkbox" name="all" onclick="allSel(this.checked)" /></th>
		<th>닉네임</th>
		<th>이름</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>포인트</th>
		<th>등급</th>
		<th>삭제</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr><td colspan="10">---작성된 글이 없습니다.---</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>
						<input type="checkbox" name="chk" value="${dto.user_nickname}"/>
					</td>
					<td>${dto.user_nickname}</td>
					
<%-- 					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.regdate}"/> </td> --%>
					<td>${dto.user_name}</td>
					<td>${dto.user_email}</td>
					<td>${dto.user_phone}</td>
					<td>${dto.user_point}</td>
					<td>${dto.tier}</td>
					<td>${dto.delflag}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	<tr>
		<td colspan="10">
			<a class="btn btn-primary" href="insertform.do">글쓰기</a>
			<input class="btn btn-primary" type="submit" value="삭제"/>
		</td>
	</tr>
</table>
</form>
</div>
<script>
function locainsert() {
	alert("locainsert");
	location.href = "insertform.do";
	
}

</script>
<%@include file="footer.jsp" %>
</body>
</html>





