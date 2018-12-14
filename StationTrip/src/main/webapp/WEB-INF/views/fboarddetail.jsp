<%@page import="com.hk.trip.dto.LoginDto"%>
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
  <h1>${login_user.user_nickname}님 환영합니다</h1>

<h1>게시판 상세보기</h1> 
 제목 : ${fdto.freeboard_title} 날짜 : ${fdto.freeboard_time} 조회수 : ${fdto.freeboard_view}
 <p>아이디 : ${fdto.user_nickname}

 <p> ${fdto.freeboard_content}  좋아요 : ${fdto.freeboard_like} 싫어요 : ${fdto.freeboard_hate} 


<p>
<c:if test="${fdto.user_nickname == login_user.user_nickname}">

<button value="수정" onclick="goUpdate()">수정</button> <button onclick="goDelete()">삭제</button>

</c:if>
<p>
<p>

   --------------------------------댓글 보기--------------------------------------------------------------------- 
<form action="writereply.do" method="post">
<input type="hidden" name="freeboard_num" value="${fdto.freeboard_num}">
<input type="text" name="user_nickname" value="${login_user.user_nickname}" readonly>
<input type="text" name="comment_content" size="50">
<input type="submit" value="댓글작성">
</form>
<!-- list는 따로 아래처럼 뽑아줘야 한다. -->
<c:choose>
	<c:when test="${empty list}">
	<dl>	
		<dd>-------작성된 댓글이 없습니다.----</dd>
	</dl>
  </c:when>
  <c:otherwise>
  <c:forEach items="${list}" var="cdto">
  <dl>
  	<dd class="num">${cdto.comment_num}</dd>
  	<dd class="sub">${cdto.freeboard_num}</dd>
  	<dd class="name">${cdto.user_nickname}</dd>
   	<dd class="data">${cdto.comment_content}</dd>
   	<dd class="time">${cdto.comment_time}</dd>
   	<dd class="count">${cdto.comment_like}</dd> 
   	<dd class="count">${cdto.comment_hate}</dd> 
  	
  	</dl>
  	
  	</c:forEach>
  	</c:otherwise>
  	</c:choose>
  	      	
  	      	
       	▲ 이전글 보기<a class="title" href="fboarddetail.do?freeboard_num=${bdto.freeboard_num}">${bdto.freeboard_title}</a>
  	<p>
     	▼ 다음글 보기<a class="title" href="fboarddetail.do?freeboard_num=${ndto.freeboard_num}">${ndto.freeboard_title }</a>

  <script type="text/javascript">
  function goUpdate() {
	  location.href="fboardupdate.do?freeboard_num=" + ${fdto.freeboard_num};
  }
  function goDelete() {
	  location.href="fboarddelete.do?freeboard_num=" + ${fdto.freeboard_num};
  }
  function goNext() {
	  location.href="fboarddetail.do?freeboard_num=" + ${fdto.freeboard_num}+1;
  }
  function goBack()	{
	  location.href="fboarddetail.do?freeboard_num=" + ${fdto.freeboard_num}-1;
  }
  </script>
  <jsp:include page="footer.jsp" />
  
</body>
</html>