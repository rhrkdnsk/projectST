<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<%
//pgDtos dto = (pgDtos)request.getAttribute("dto");
//pgrepDtos dto1 = (pgrepDtos)request.getAttribute("dto1");
//List<pgrepDtos> list /* = (List<pgrepDtos>)request.getAttribute("dto1"); */
%>

  <body>  
  <jsp:include page="header.jsp" />
  
<h1>게시판 상세보기</h1> 
 제목 : ${fdto.freeboard_title} 날짜 : ${fdto.freeboard_time} 조회수 : ${fdto.freeboard_view}
 <p>아이디 : ${fdto.user_nickname}

 <p><textarea rows="10" cols="60" readonly> ${fdto.freeboard_content}  좋아요 : ${fdto.freeboard_like} 싫어요 : ${fdto.freeboard_hate} 
</textarea>

<p>

<button value="수정" onclick="">수정</button> <button>삭제</button>

<p>
<p>

   --------------------------------댓글 보기--------------------------------------------------------------------- 
<form action="writereply.do" method="post">
<input type="text" name="comment_content" size="50">
<input type="submit" value="댓글작성">
</form>

<c:choose>
	<c:when test="${empty list}">
	<dl>	
		<dd>-------작성된 글이 없습니다.----</dd>
	</dl>
  </c:when>
  <c:otherwise>
  <c:forEach items="${list}" var="cdto">
  <dl>
  	<dd class="num">${cdto.comment_num}</dd>
  	<dd class="sub">${cdto.freeboard_num}</dd>
  	<dd class="name">${cdto.user_nickname}</dd>
<%--   	<dd class="data">${fdto.freeboard_time}</dd> --%>
<%--   	<dd class="count">${fdto.freeboard_view}</dd> --%>
<%--   	<dd class="count">${fdto.freeboard_like}</dd> --%>
  	
  	</dl>
  	
  	</c:forEach>
  	</c:otherwise>
  	</c:choose>
</body>
</html>