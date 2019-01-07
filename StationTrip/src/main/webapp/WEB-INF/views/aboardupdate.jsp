<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/trip/resources/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function goList() {
	location.href="aboarddetail.do?areaboard_num=${fdto.areaboard_num}"
}

</script>
<title></title>
</head>
<body>
<jsp:include page="header.jsp" />

<h1>글 수정하기</h1>
<form action="aboardup.do" method="post">
<input type="hidden" name="areaboard_num" value="${fdto.areaboard_num}" />
<input type="hidden" name="areaboard_code" value="${fdto.areaboard_code}"/>
제목 : <input type="text" name="areaboard_title" value="${fdto.areaboard_title}">
<p>
작성자 : <input type="text" value="${fdto.user_nickname}" readonly>

<textarea name="areaboard_content" id="areaboard_content">${fdto.areaboard_content}</textarea>
<script type="text/javascript">
  CKEDITOR.replace('areaboard_content',
    {
      width : '720px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
      height : '300px',  // 입력창의 높이
      startupFocus : false
    }
  );
</script>
이미지 업로드 <input type="file" />
<p />

<input type="submit" value="글수정" id="submit" style=align:center/> <input type="button" value="취소" id="submit" style=align:center onclick="goList()"/>
</form>
<jsp:include page="footer.jsp" />

</body>
</html>