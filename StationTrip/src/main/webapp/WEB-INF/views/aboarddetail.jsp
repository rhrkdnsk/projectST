<%@page import="com.hk.trip.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
 
$(document).ready(function(){

    $('.lookbt').click(function () {  
    	alert("클릭")
        if($(this).next(".lookreply").css("display") == "none"){   
            jQuery(this).next(".lookreply").css("display", "block");   
        } else {  
            jQuery(this).next(".lookreply").css("display", "none");   
        }  
    });   
   
});




$(document).ready(function(){
$('#btnLike').click(function ()  {
    $.ajax({
        url:"aboardLike.do",
        data: {user_nickname: '${login_userId}', board_num: '${fdto.areaboard_num}' },
        type:"post",
        success : function (data) {
            
            var result = JSON.parse(data);
            

            if(result.status == 404){
                $('img#like_img').attr('src', '/trip/resources/images/empty heart.jpg');
            } else {
                $('img#like_img').attr('src', '/trip/resources/images/heart.png');
            }
            $('span#like_count').html(result.like_count);
        }
    })
});

});	
	
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
  <h1>${login_userId}님 환영합니다</h1>

<h1>게시판 상세보기</h1> 
 제목 : ${fdto.areaboard_title} 날짜 : ${fdto.areaboard_time} 조회수 : ${fdto.areaboard_view}
 <p>아이디 : ${fdto.user_nickname}

 <p> ${fdto.areaboard_content}  
 
<div class="col-md-4" id="likeArea">
    <button type="button" id="btnLike">
        <img src="${ isLiked == true ? '/trip/resources/images/heart.png' : '/trip/resources/images/empty heart.jpg' }" 
id="like_img" height="50px" width="50px">
    </button>
    <span id="like_count">${fdto.areaboard_like }</span>    
   
</div>

 좋아요 : ${fdto.areaboard_like} 
<p>
<c:if test="${fdto.user_nickname  == login_userId}">

<button value="수정" onclick="goUpdate()">수정</button> <button onclick="goDelete()">삭제</button>

</c:if>
<p>
<p>

   --------------------------------댓글 보기--------------------------------------------------------------------- 
<form action="awritereply.do" method="post">
<div style="width:800px; border:1px solid black; height:357px;">
<input type="hidden" name="areaboard_code"	value="${fdto.areaboard_code}" />
<input type="hidden" name="areaboard_num" value="${fdto.areaboard_num}">
<input type="text" name="user_nickname" value="${login_userId}" readonly>
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
 	
 	<c:if test="${cdto.comment_step == 0}">
   	<div class="step1p">
   	댓글번호 : ${cdto.comment_num} 게시판번호 : ${cdto.areaboard_num} 아이디 :${cdto.user_nickname}
   	내용 : <input type="text" value="${cdto.comment_content}" style="border:none" readonly>
   	시간 : ${cdto.comment_time}
   	좋아요 : ${cdto.comment_like} 
   	싫어요 : ${cdto.comment_hate} 
   	리퍼 : ${cdto.comment_refer}
   	스텝 : ${cdto.comment_step} <!-- 답글버튼을 눌렀을때 답글이 나오고 다시 눌렀을때 접을수 있게 처리해야함 -->
   	</div>
   	<c:if test="${cdto.comment_step == 0}">
<button class="lookbt">답글</button>
</c:if>
	</c:if>
	
	<c:if test="${cdto.comment_step != 0 }">
		<div class="lookreply" style="display:none">
   	댓글번호 : ${cdto.comment_num} 게시판번호 : ${cdto.areaboard_num} 아이디 :${cdto.user_nickname}
   	내용 : <input type="text" value="${cdto.comment_content}" style="border:none" readonly>
   	시간 : ${cdto.comment_time}
   	좋아요 : ${cdto.comment_like} 
   	싫어요 : ${cdto.comment_hate} 
   	리퍼 : ${cdto.comment_refer}
   	스텝 : ${cdto.comment_step} <!-- 답글버튼을 눌렀을때 답글이 나오고 다시 눌렀을때 접을수 있게 처리해야함 -->
   	
   	</div>
   	
	</c:if>

<c:if test="${cdto.comment_step == 0}">

<div class="lookreply" style="display:none">
   	<form action="aboardrepre.do" method="post">
<input type="hidden" name="areaboard_num" value="${cdto.areaboard_num}">
<input type="hidden" name="areaboard_code" value="${fdto.areaboard_code}">
<input type="text" name="user_nickname" value="${login_userId}"  readonly>
<input type="hidden" name="comment_refer" value="${cdto.comment_refer}">
<textarea rows="5" cols="15" name="comment_content" ></textarea>
<hr>
<input type="submit" value="댓글작성" style="float:right">
</form>
</div>

</c:if>
  	
<c:if test="${cdto.user_nickname == login_userId}">
<button value="수정" onclick="goUpdate()">수정</button>

<a href="adelreply.do?areaboard_num=${cdto.areaboard_num}&comment_num=${cdto.comment_num}&areaboard_code=${fdto.areaboard_code}"><button>삭제</button></a>
<!--  <button onclick="goCdelete()">삭제</button> cdto.comment, fdto.freeboard_num hidden으로 값 전달  -->

</c:if>


<br />
  	
  	
  	</c:forEach>
  	</c:otherwise>
  	</c:choose>
  	      	
  	      	
     	▲ 다음글 보기<a class="title" href="aboarddetail.do?areaboard_num=${ndto.areaboard_num}&areaboard_code=${ndto.areaboard_code}">${ndto.areaboard_title}</a>
  	<p>
  		▼ 이전글 보기<a class="title" href="aboarddetail.do?areaboard_num=${bdto.areaboard_num}&areaboard_code=${bdto.areaboard_code}">${bdto.areaboard_title}</a>

  <script type="text/javascript">
  function goUpdate() {
	  location.href="aboardupdate.do?areaboard_num=${fdto.areaboard_num}&areaboard_code=${fdto.areaboard_code}";
  }
  function goDelete() {
	  location.href="aboarddel.do?areaboard_num=${fdto.areaboard_num}&areaboard_code=${fdto.areaboard_code}";
  }
//   function goNext() {
// 	  location.href="fboarddetail.do?freeboard_num=" + ${fdto.areaboard_num}+1;
//   }
//   function goBack()	{
// 	  location.href="fboarddetail.do?freeboard_num=" + ${fdto.areaboard_num}-1;
//   }

  
  </script>
  <jsp:include page="footer.jsp" />
  
</body>
</html>