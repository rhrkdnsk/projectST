<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<h1>회원 정보 수정</h1>
<form action="qupdateBoard.do" method="post">
<input type="hidden" name="faq_num" value="${dto.faq_num}"/>
<div>
<table>
	<tr>
		
		<td>${dto.faq_num}</td>
	</tr>
	<tr>
	
		<td><input type="text" size="40" name="title" class="form-control" value="${dto.faq_title}"/></td>
	</tr>
	<tr>

		<td colspan="2" style="padding:0px;"> <textarea name="faq_content" id="faq_content">${dto.faq_content}</textarea>
<script type="text/javascript">
  		CKEDITOR.replace('faq_content',
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
		<td colspan="2">
			<input  type="submit" value="수정완료" class="btn btn-danger" style="float:right; margin-left:5px;  margin-top:10px"/>
			<button type="button" onclick="location.href='qlist.do'"  style="float:right; margin-top:10px;" class="btn btn-primary">글목록</button>
		</td>
	</tr>
</table>
</div>
</form>
</div>
<%@include file="footer.jsp" %>
</body>
</html>








