<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
function getlist() {
	location.href="aboardPage.do?apageNum=${anowPage}"
}

</script>
</head>
<body>
<jsp:include page="header.jsp" />

<h1>게시글 작성</h1>
<div>
 <form action="aboardinsert.do" method="post">

<!-- <input type="hidden" name="command" value="boardinsert" /> -->

  분류  <select id="opvalue" name="areaboard_category">
<option value="분류" id="opvalue">분류</option>
<option value="정보" id="opvalue">정보</option>
<option value="잡담" id="opvalue">잡담</option>
<option value="팁" id="opvalue">팁</option>
</select>

지역 <select id="areavalue" name="areaboard_code" >
<option value="지역" id="opvalue">분류</option>
<option value="1" id="opvalue">서울</option>
<option value="2" id="opvalue">경기</option>
<option value="3" id="opvalue">강원</option>
<option value="4" id="opvalue">대구</option>
<option value="5" id="opvalue">부산</option>
<option value="6" id="opvalue">전라</option>
<option value="7" id="opvalue">경상</option>

</select>
<p>
작성자 : <input type="text" id="id" name="user_nickname" value="${login_userId}" readonly />
<p>
제목 : <input type="text" placeholder="제목을 작성하십시오" size="30" name="areaboard_title"/>
<p>
<h6 style=text-align:center>내용</h6> <textarea name="areaboard_content" id="areaboard_content"></textarea>
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

<input type="submit" value="글쓰기" id="submit" style=align:center/> <input type="button" value="취소" id="submit" style=align:center onclick="getlist()"/>

</form>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>