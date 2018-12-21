<%@page import="com.hk.trip.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#lookreply {
	display:none;
	
}

</style>

<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js">

function toggle_visibility(id) {
    var e = document.getElementById(id);
    if(e.style.display == 'block')
       e.style.display = 'none';
    else
       e.style.display = 'block';
 }
</script>
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
<div style="width:800px; border:1px solid black; height:357px;">
<input type="hidden" name="freeboard_num" value="${fdto.freeboard_num}">
<input type="text" name="user_nickname" value="${login_user.user_nickname}" readonly>
<textarea rows="10" cols="85" name="comment_content"></textarea>
<hr>
<input type="submit" value="댓글작성" style="float:right">

</div>
<%-- <input type="hidden" name="freeboard_num" value="${fdto.freeboard_num}"> --%>
<%-- <input type="text" name="user_nickname" value="${login_user.user_nickname}" readonly> --%>
<!-- <input type="text" name="comment_content" size="50"> -->
<!-- <input type="submit" value="댓글작성"> -->
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
  
  
 	<div>
   	댓글번호 : ${cdto.comment_num} 게시판번호 : ${cdto.freeboard_num} 아이디 :${cdto.user_nickname}
   	내용 : <input type="text" value="${cdto.comment_content}" style="border:none" readonly>
   	시간 : ${cdto.comment_time}
   	좋아요 : ${cdto.comment_like} 
   	싫어요 : ${cdto.comment_hate} 
   	리퍼 : ${cdto.comment_refer}
   	스텝 : ${cdto.comment_step} <!-- 답글버튼을 눌렀을때 답글이 나오고 다시 눌렀을때 접을수 있게 처리해야함 -->
   	</div>
   	
<c:if test="${cdto.comment_step == 0}">

<div id="lookreply" >
   	<form action="fboardrepre.do" method="post">
<input type="hidden" name="freeboard_num" value="${cdto.freeboard_num}">
<input type="text" name="user_nickname" value="${login_user.user_nickname}"  readonly>
<input type="hidden" name="comment_refer" value="${cdto.comment_refer}">
<textarea rows="10" cols="15" name="comment_content" ></textarea>
<hr>
<input type="submit" value="댓글작성" style="float:right">
</form>
</div>
</c:if>


  	<c:if test="${cdto.user_nickname == login_user.user_nickname}">
<button value="수정" onclick="goUpdate()">수정</button>

<a href="fdelcomment.do?freeboard_num=${cdto.freeboard_num}&comment_num=${cdto.comment_num}"><button>삭제</button></a>
<!--  <button onclick="goCdelete()">삭제</button> cdto.comment, fdto.freeboard_num hidden으로 값 전달  -->
<button value="답글" id="lookbt" onclick="toggle_visibility('#lookreply')">답글</button>
</c:if>
<br />
  	
  	
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