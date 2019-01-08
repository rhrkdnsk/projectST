<%@page import="com.hk.trip.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
<style type="text/css">
	/* 	링크에 밑줄 제거 */
	table a{text-decoration: none;}
	img{width:10px; height: 10px;}
	.titleval{
		display: inline-block;
		width: 200px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space:nowrap;
	}
	textarea[name=testAjax]{
		position: fixed;
		left: 100px;
		top:150px;
	}
</style>	
</head>
<body>
<div id="container">
<h1>fAQ</h1>
<table class="table table-hover">
		<tr>
		<th>번호</th>
		<td>${dto.faq_num}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.faq_title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${dto.faq_content}</td>
	</tr>
	<tr>
		<td colspan="2">
		<%
  		if(session.getAttribute("login_admin") == null) {
  			%>
  						
	
	<%
  		} else {
  			%>
 			<button onclick="qupdateForm('${dto.faq_num}')">수정</button>
			<button onclick="qdelDelete('${dto.faq_num}')">삭제</button>
 					<%
  		}
  	
  	%>
			
			<button onclick="location.href='qlist.do'">돌아가기</button>
		</td>
	</tr>
</table>
</div>
<script type="text/javascript">
	//수정폼으로 이동
	function qupdateForm(faq_num){
		location.href="qupdate.do?faq_num="+faq_num;
	}
	//게시글 삭제로 이동
	function qdelDelete(faq_num){
		location.href="qdelBoard.do?faq_num="+faq_num;
	}
	 
</script>
<%@include file="footer.jsp" %>
</body>
</html>





