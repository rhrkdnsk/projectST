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

 <p> ${fdto.freeboard_content}  좋아요 : ${fdto.freeboard_like} 싫어요 : ${fdto.freeboard_hate} 


<p>

<button value="수정" onclick="goUpdate()">수정</button> <button>삭제</button>

<p>
<p>

   --------------------------------댓글 보기--------------------------------------------------------------------- 
<form action="writereply.do" method="post">
<input type="text" name="comment_content" size="50">
<input type="submit" value="댓글작성">
</form>
<!-- list는 따로 아래처럼 뽑아줘야 한다. -->
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
    	<a class="title" href="#">이전글 보기</a>
    	<a class="title" href="#">다음글 보기</a>
  	
  <script type="text/javascript">
  function goUpdate() {
	  location.href="fboardupdate.do?freeboard_num=" + ${fdto.freeboard_num};
  }
  
  
  </script>
</body>
</html>