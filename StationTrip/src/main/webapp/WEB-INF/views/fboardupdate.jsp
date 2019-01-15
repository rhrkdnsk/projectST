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
<script type="text/javascript" src="/trip/resources/js/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
function goList() {
	location.href="fboarddetail.do?freeboard_num=${fdto.freeboard_num}"
}

</script>
<title></title>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container" class="container" style="width:900px">
<h1>자유게시판 글 수정하기</h1>
<br />

<form action="fboardup.do" method="post">
<div>
<table>

<col width="200px">
<col width="80px">

<tr>
<td><input type="hidden" name="freeboard_num" value="${fdto.freeboard_num}" />

<input type="text" size="30" name="freeboard_title" value="${fdto.freeboard_title}" class="form-control"></td>

<%-- <input type="text" value="${fdto.user_nickname}" readonly> --%>
 
 <td><select id="opvalue" name="freeboard_category" class="form-control">
<option value="분류" id="opvalue">분류</option>
<option value="정보" id="opvalue">정보</option>
<option value="잡담" id="opvalue">잡담</option>
<option value="팁" id="opvalue">팁</option>
</select>
</td>
</tr>

<tr>
<td colspan="2" style="padding:0px;">
<textarea name="freeboard_content" id="freeboard_content">${fdto.freeboard_content}</textarea>
<script type="text/javascript">
  CKEDITOR.replace('freeboard_content',
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
<td colspan="2">
<input type="button" value="취소" id="submit" class="btn btn-danger" style="float:right; margin-left:5px;  margin-top:10px" onclick="goList()"/>
<input type="submit" value="글쓰기" id="submit" style="float:right; margin-top:10px;" class="btn btn-primary"/> 
</td>
</tr>
</table>
</div>
</form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>