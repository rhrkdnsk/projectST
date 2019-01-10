<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">

/* 	입력범위가 벗어나는 경우 텍스트 처리 (내용이....) */
	.titleval{
		display: inline-block;
		width: 200px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space:nowrap;
	}
	.panel, .flip {
  padding: 5px;
  text-align: center;
  background-color: #e5eecc;
  border: solid 1px #c3c3c3;
}
.panel {
  padding: 50px;
  display: none;
}
</style>
<script> 
$(document).ready(function(){
	$(".panel").eq(0).show();
	  $(".flip").click(function(){
		  $(this).next().slideToggle("slow");
	    $(this).parent().parent().siblings().find(".panel").slideUp()
	  });
	});	
	
	
	
	
</script>
</head>
<body>
<div id="container" class="container w3-center" >
<div class="w3-panel w3-border w3-round-xxlarge w3-border-black"><h1>FAQ</h1></div>
<a href="qlist.do"></a>
<div style="height: 300px;">
<table class="table table-hover">
	

	<c:choose>
		<c:when test="${empty list}">
			<tr class="w3-center"><td colspan="10">---작성된 글이 없습니다.---</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				
			<tr>			
			<%
  		if(session.getAttribute("login_admin") == null) {
  			%>
	  			<td class="w3-center"><div class="flip">${dto.faq_title}</div>
				<div class="panel">${dto.faq_content}</div></td>
	
		<%
  		} else {
  			%>
		<td class="w3-center">${dto.faq_num}</td>
		<td class="w3-center">${dto.faq_title}</td>
		<td class="w3-center"><a  class="titleval"href="qdetail.do?faq_num=${dto.faq_num}">${dto.faq_content}</a></td>
	 			<%
  		}
  	
  	%>
			</tr>
			
			</c:forEach>
		</c:otherwise>
	</c:choose>
<%
  		if(session.getAttribute("login_admin") == null) {
  			%>
	  			
	
	<%
  		} else {
  			%>
<tr>
		<td colspan="10">
			<a class="btn btn-primary" href="qinsertform.do">글쓰기</a>
			<input class="btn btn-primary" type="submit" value="삭제"/>
		</td>
	</tr>  			<%
  		}
  	
  	%>
	
</table>
</div>
</div>


<%@include file="footer.jsp" %>
</body>
</html>