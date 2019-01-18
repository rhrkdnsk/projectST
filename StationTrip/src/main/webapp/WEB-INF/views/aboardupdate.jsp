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

// 	$("form").on("submit", function() {
// 	       var title = $("#title").val();
// 	       alert("submit");
// 	       if(title.length < 5) {
// 	    	   alert("5자리 이상 작성하여 주십시오");
// 	       }
	       
// 	    });

	
$(function(){
	$("#update_submit").click(function(){
		var title = $("#title").val();
		var content = CKEDITOR.instances['areaboard_content'].getData();
		var select = $("#opvaluea option:selected").val();
		var area = $("#areavalue option:selected").val();
		if(title.length < 3 || title.length > 20){
			event.preventDefault();
			alert("제목은 3글자 이상, 20글자 이하로 입력하여 주십시오.")
			document.getElementById("title").focus();
			return false;
		} else if(content.length < 5 ){
			event.preventDefault();
			alert("내용은 5글자 이상 입력하여야 합니다.")
			document.getElementById("areaboard_content").focus();
			return false;
		} if(select == "분류") {
			event.preventDefault();
			alert("글 분류를 설정하여 주십시오.");
			document.getElementById("opvaluea").focus();
			return false;
		} if(area == "지역") {
			event.preventDefault();
			alert("지역을 설정하여 주십시오.");
			document.getElementById("areavalue").focus();
			return false;		
		}
	})
})


function goList() {
	location.href="aboarddetail.do?areaboard_num=${fdto.areaboard_num}&areaboard_code=${sareaboard_code}"
}



</script>

<style type="text/css">
#areavalue:focus, #opvaluea:focus, #title:focus {
	border-color:red;
}
</style>
<title></title>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="container" class="container" style="width:900px;">
<h1>글 수정하기</h1>

<form action="aboardup.do" method="post" name="frm">
<div>
<table>
<tr>
<td><input type="hidden" name="areaboard_num" value="${fdto.areaboard_num}" /></td>
<td><input type="hidden" name="areaboard_code" value="${fdto.areaboard_code}"/></td>
<td><input type="hidden" id="id" name="user_nickname" value="${login_userId}"/></td>
</tr>

<tr>
<td><input type="text" id="title" name="areaboard_title" value="${fdto.areaboard_title}" class="form-control">
</td>

<td><select id="opvaluea" name="areaboard_category" class="form-control">
<option value="분류" <c:if test="${'분류' eq fdto.areaboard_category}">selected</c:if> id="opvalue">분류</option>
<option value="정보" <c:if test="${'정보' eq fdto.areaboard_category}">selected</c:if> id="opvalue">정보</option>
<option value="잡담" <c:if test="${'잡담' eq fdto.areaboard_category}">selected</c:if> id="opvalue">잡담</option>
<option value="팁" <c:if test="${'팁' eq fdto.areaboard_category}">selected</c:if> id="opvalue">팁</option>
</select></td>

<td><select id="areavalue" name="areaboard_code" class="form-control" >
<option value="지역" id="opvalue">지역</option>
<option value="1"  <c:if test="${fdto.areaboard_code == 1}">selected</c:if> id="opvalue">서울</option>
<option value="2" <c:if test="${fdto.areaboard_code == 2}">selected</c:if> id="opvalue">경기</option>
<option value="3" <c:if test="${fdto.areaboard_code == 3}">selected</c:if> id="opvalue">강원</option>
<option value="4" <c:if test="${fdto.areaboard_code == 4}">selected</c:if> id="opvalue">대구</option>
<option value="5" <c:if test="${fdto.areaboard_code == 5}">selected</c:if> id="opvalue">부산</option>
<option value="6" <c:if test="${fdto.areaboard_code == 6}">selected</c:if> id="opvalue">전라</option>
<option value="7" <c:if test="${fdto.areaboard_code == 7}">selected</c:if> id="opvalue">경상</option>
</select>
</td>
</tr>
<tr>
<td colspan="3" style="padding:0px;">
<textarea name="areaboard_content" id="areaboard_content">${fdto.areaboard_content}</textarea>
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

<input type="button" value="취소" id="submit" class="btn btn-danger" style="float:right; margin-left:5px; margin-top:10px" onclick="goList()"/>
<input type="submit" value="글수정" id="update_submit"  style="float:right; margin-top:10px;" class="btn btn-primary" onclick="func2()"/> 
</td>
</tr>
</table>
</div>
</form>
</div>
<h1>${fdto.areaboard_code }</h1>
<jsp:include page="footer.jsp" />

</body>
</html>