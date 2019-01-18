<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
$(function(){
	$("#update_submit").click(function(){
		var title = $("#title").val();
		var content = CKEDITOR.instances['freeboard_content'].getData();
		var select = $("#opvaluea option:selected").val();
		if(title.length < 3 || title.length > 20){
			event.preventDefault();
			alert("제목은 3글자 이상, 20글자 이하로 입력하여 주십시오.")
			document.getElementById("title").focus();
			return false;
		} else if(content.length < 5 ){
			event.preventDefault();
			alert("내용은 5글자 이상 입력하여야 합니다.")
			document.getElementById("freeboard_content").focus();
			return false;
		} if(select == "분류") {
			event.preventDefault();
			alert("글 분류를 설정하여 주십시오.");
			document.getElementById("opvaluea").focus();
			return false;
		}
		});
	
});
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

<input type="text" size="30" id="title" name="freeboard_title" value="${fdto.freeboard_title}" class="form-control"></td>

<%-- <input type="text" value="${fdto.user_nickname}" readonly> --%>
 
 <td><select id="opvaluea" name="freeboard_category" class="form-control">
<option value="분류" <c:if test="${'분류' eq fdto.freeboard_category}">selected</c:if> id="opvalue">분류</option>
<option value="정보" <c:if test="${'정보' eq fdto.freeboard_category}">selected</c:if> id="opvalue">정보</option>
<option value="잡담" <c:if test="${'잡담' eq fdto.freeboard_category}">selected</c:if> id="opvalue">잡담</option>
<option value="팁" <c:if test="${'팁' eq fdto.freeboard_category} ">selected</c:if> id="opvalue">팁</option>
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
<input type="submit" value="글쓰기" id="update_submit" style="float:right; margin-top:10px;" class="btn btn-primary"/> 
</td>
</tr>
</table>
</div>
</form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>