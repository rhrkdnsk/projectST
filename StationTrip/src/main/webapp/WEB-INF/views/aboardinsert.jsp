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
	location.href="aboardPage.do?apageNum=${anowPage}&areaboard_code=${sareaboard_code}"
}

</script>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container" class="container" style="width:900px;">
<h1>지역게시판 게시글 작성</h1>
<br />
<form action="aboardinsert.do" method="post">
<div>
<!-- <input type="hidden" name="command" value="boardinsert" /> -->
<table>
<col width="150px">
<col width="80px">
<col width="80px">
<tr>
 <td><input type="hidden" id="id" name="user_nickname" value="${login_userId}"/>
 <input type="text" placeholder="제목을 작성하십시오" size="20" name="areaboard_title" class="form-control"/></td>

  <td><select id="opvalue" name="areaboard_category" class="form-control">
<option value="분류" id="opvalue">분류</option>
<option value="정보" id="opvalue">정보</option>
<option value="잡담" id="opvalue">잡담</option>
<option value="팁" id="opvalue">팁</option>
</select></td>

<td><select id="areavalue" name="areaboard_code" class="form-control" >
<option value="지역" id="opvalue">지역</option>
<option value="1" id="opvalue">서울</option>
<option value="2" id="opvalue">경기</option>
<option value="3" id="opvalue">강원</option>
<option value="4" id="opvalue">대구</option>
<option value="5" id="opvalue">부산</option>
<option value="6" id="opvalue">전라</option>
<option value="7" id="opvalue">경상</option>
</select>
</td>
</tr>
<tr>
<td colspan="3" style="padding:0px;">
<textarea name="areaboard_content" id="areaboard_content"></textarea>
<script type="text/javascript">
  CKEDITOR.replace('areaboard_content',
    {
      width : '870px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
      height : '500px',  // 입력창의 높이
      startupFocus : false,
      uiColor : '#fafafa'
    }
  );
</script>
</td>
</tr>

<tr>
<td colspan="3">
<input type="button" value="취소" id="submit" class="btn btn-danger" style="float:right; margin-left:5px; margin-top:10px" onclick="getlist()"/>
<input type="submit" value="글쓰기" id="submit" style="float:right; margin-top:10px;" class="btn btn-primary"/> 
</td></tr>
</table>
</div>
</form>
</div>
<jsp:include page="footer.jsp" />

</body>
</html>