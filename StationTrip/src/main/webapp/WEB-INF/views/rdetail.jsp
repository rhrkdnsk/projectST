<%@page import="com.hk.trip.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
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
#submit {
	text-align: center;

}

select {
	width:150px;
}

h6 {
	text-align:center;
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="/trip/resources/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="/trip/resources/js/ckeditor/ckeditor.js"></script>


</head>
<body>
<div id="container" class="container" style="width:900px;">
<h1>공지사항</h1>
<table class="table table-hover">
        <caption>게시글 상세</caption>
		<col width="70%">
		<col width="30%">
		<tr>
		<td>${dto.title}</td>
		<td class="w3-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.regdate}"/></td>
	</tr>
	
	<tr>
		<td colspan="3">${dto.content}
		<div class="col-md-4" id="likeArea" style="width:870px;padding:0;margin-top:100px;"></div></td>
	</tr>
	<tr> 
		<td colspan="2">
		<%
  		if(session.getAttribute("login_admin") == null) {
  			%>
  						
	
	<%
  		} else {
  			%>
 		<button onclick="rupdateForm('${dto.seq}')">수정</button>
			<button onclick="rdelDelete('${dto.seq}')">삭제</button>
 					<%
  		}
  	
  	%>
			
			<button onclick="location.href='rlist.do?pageNum=1'" style="float:right;">돌아가기</button>
		</td>
	</tr>
</table>
</div>
<script type="text/javascript">
	//수정폼으로 이동
	function rupdateForm(seq){
		location.href="rupdate.do?seq="+seq;
	}
	//게시글 삭제로 이동
	function rdelDelete(seq){
		location.href="rdelBoard.do?seq="+seq;
	}
	 
</script>
<%@include file="footer.jsp" %>
</body>
</html>





