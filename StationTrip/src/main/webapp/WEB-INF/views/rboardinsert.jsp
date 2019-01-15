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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="/trip/resources/js/ckeditor/ckeditor.js"></script>
<style>
#submit {
	text-align: center;

}

select {
	width:150px;
}

h6 {
	text-align:center;

}
</style>
</head>
<body>
<div id="container" class="container" style="width:900px;">
<h1>FQA작성</h1>
<form action="rinsertboard.do" method="post">
<div>
<table>
	<col width="200px">
	<col width="80px">
	<tr>
	<td><input type="text" placeholder="제목을 작성하십시오" size="40" name="title" class="form-control"/>
	</td>
	<td><input type="text" class="form-control" id="id" name="id" value="${login_userId}"></td>
	</tr>
	<tr>
		<td colspan="2" style="padding:0px;"> <textarea name="content" id="content"></textarea>
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
		<td colspan="2"> <input type="button" value="취소" id="submit" class="btn btn-danger" style="float:right; margin-left:5px;  margin-top:10px" onclick="getlist()"/>
<input type="submit" value="글쓰기" id="submit" style="float:right; margin-top:10px;" class="btn btn-primary"/>
</td>
			
	</tr>
</table>
</div>
</form>
</div>
<%@include file="footer.jsp" %>
</body>
</html>