<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/trip/resources/js/ckeditor/ckeditor.js"></script>

<title></title>
</head>
<body>
<h1>글 수정하기</h1>
<form action="fboardup.do" method="post">
<input type="hidden" name="freeboard_num" value="${fdto.freeboard_num}" />
제목 : <input type="text" name="freeboard_title" value="${fdto.freeboard_title}">
<p>
작성자 : <input type="text" value="${fdto.user_nickname}">

<textarea name="freeboard_content" id="freeboard_content">${fdto.freeboard_content}</textarea>
<script type="text/javascript">
  CKEDITOR.replace('freeboard_content',
    {
      width : '720px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
      height : '300px',  // 입력창의 높이
      startupFocus : false
    }
  );
</script>
이미지 업로드 <input type="file" />
<p />

<input type="submit" value="글수정" id="submit" style=align:center/> <input type="button" value="취소" id="submit" style=align:center/>
</form>
</body>
</html>