<%@page import="com.hk.trip.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>
<div id="container" class="container" style="width:900px;">
<h1>fAQ</h1>
<table class="table table-hover">
		<col width="70%">
		<col width="30%">
		<tr>

		<td class="w3-center">${dto.faq_num}</td>
		<td class="w3-center">${dto.faq_title}</td>
	</tr>
	
	<tr>
		
		<td colspan="3">${dto.faq_content}
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





