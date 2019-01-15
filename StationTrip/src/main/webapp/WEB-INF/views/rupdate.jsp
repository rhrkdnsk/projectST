<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title></title>
<script type="text/javascript" src="/trip/resources/js/ckeditor/ckeditor.js"></script>
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
	#submit {
	text-align: center;

}

select {
	width:150px;
}

h6 {
	text-align:center;
	
</style>
</head>
<body>
<div id="container" class="container" style="width:900px;">
<h1>공지사항 수정</h1>
<form action="rupdateBoard.do" method="post">
<input type="hidden" name="seq" value="${dto.seq}"/>
<div>
<table>
<col width="200px">
	<col width="80px">
<!-- 	<tr> -->
<!-- 		<th>번호</th> -->
<%-- 		<td>${dto.seq}</td> --%>
<!-- 	</tr> -->
	<tr>
<!-- 		<th>제목</th> -->
		<td><input type="text" size="40" name="title" class="form-control" value="${dto.title}"/></td>
		<td class="form-control"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.regdate}"/></td>
	</tr>
	<tr>
<!-- 		<th>내용</th> -->
		<td colspan="2" style="padding:0px;"> <textarea name="content" id="content">${dto.content}</textarea>
<script type="text/javascript">
  		CKEDITOR.replace('content',
   		 {
     	 width : '870px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
     	 height : '500px',  // 입력창의 높이
     	 startupFocus : false,
     	 uiColor : ﻿'#fafafa'
   		 }
		  );
</script>
</td>
	</tr>
	<tr>
<!-- 		<th>아이디</th> -->
		<td><input type="hidden" class="form-control" id="id" name="id" value="${dto_id}"></td>
	</tr>	
<!-- 	<tr> -->
<!-- 		<th>시간</th> -->
<%-- 		<td>${dto.regdate}</td> --%>
<!-- 	</tr> -->
	<tr>
		<td colspan="2">
			<input type="submit" value="수정완료"/>
			<button type="button" onclick="location.href='rlist.do?pageNum=1'">글목록</button>
		</td>
	</tr>
</table>
</div>
</form>
</div>
<%@include file="footer.jsp" %>
</body>
</html>








