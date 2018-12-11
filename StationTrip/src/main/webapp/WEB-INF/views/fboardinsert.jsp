<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

</head>
<body>
<h1>게시글 작성</h1>
 <form action="fboardinsert.do" method="post">

<input type="hidden" name="command" value="boardinsert" />

  분류  <select id="opvalue">
<option value="분류" id="opvalue"><h6>분류</h6></option>
<option value="1" id="opvalue">정보</option>
<option value="2" id="opvalue">잡담</option>
<option value="3" id="opvalue">팁</option>
</select>
<p>
작성자 <input type="text" value="" id="id">
<p>
제목 : <input type="text" placeholder="제목을 작성하십시오" size="30" id="title"/>
<p>
<h6 style=text-align:center>내용</h6> <textarea name="memo" id="content"></textarea>
<script type="text/javascript">
  CKEDITOR.replace('memo',
    {
      width : '720px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
      height : '300px',  // 입력창의 높이
      startupFocus : false
    }
  );
</script>
이미지 업로드 <input type="file" />
<p />

<input type="submit" value="글쓰기" id="submit" style=align:center/> <input type="button" value="취소" id="submit" style=align:center/>

</form>
</body>
</html>