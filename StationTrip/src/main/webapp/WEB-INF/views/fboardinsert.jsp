<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>글쓰기</title>

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
<script type="text/javascript">
function getlist() {
	location.href="fboardPage.do?pageNum=${nowPage}"
}

</script>
</head>
<body>
<jsp:include page="header.jsp" />

<div id="container" class="container" style="width:900px;">
<h1>자유게시판 글 작성</h1>
 <form action="fboardinsert.do" method="post">
<table border="1" class="table table-hover">
<!-- <input type="hidden" name="command" value="boardinsert" /> -->
<col width="200px">
<col width="80px">
		

<tr>
<td>작성자 : ${login_userId}
<input type="hidden" id="id" name="user_nickname" value="${login_userId}">
</td>
 <td> 분류  <select id="opvalue" name="freeboard_category">
<option value="분류" id="opvalue">분류</option>
<option value="정보" id="opvalue">정보</option>
<option value="잡담" id="opvalue">잡담</option>
<option value="팁" id="opvalue">팁</option>
</select>
</td>
</tr>

<tr>
<td colspan="2">제목 : <input type="text" placeholder="제목을 작성하십시오" size="30" name="freeboard_title"/> </td>
</tr>
<tr>
<td colspan="2" style="padding:0px;"> <textarea name="freeboard_content" id="freeboard_content"></textarea>
<script type="text/javascript">
  CKEDITOR.replace('freeboard_content',
    {
      width : '870px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
      height : '500px',  // 입력창의 높이
      startupFocus : false,
      uiColor : ﻿'#9ab8f3'
    }
  );
</script>
</td>
</tr>
<!-- <tr> -->
<!-- <td colspan="2">이미지 업로드 <input type="file" /></td> -->
<!-- </tr> -->
<tr>
<td colspan="2"><input type="submit" value="글쓰기" id="submit" style=align:center class="btn btn-primary"/> <input type="button" value="취소" id="submit" class="btn btn-danger" style=align:center onclick="getlist()"/>
</td>
</tr>
</table>
</form>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>