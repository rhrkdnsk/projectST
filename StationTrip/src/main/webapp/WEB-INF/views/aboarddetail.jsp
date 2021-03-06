<%@page import="com.hk.trip.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
  <jsp:include page="header.jsp" />

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/trip/resources/css/reply.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
.mar5 {
margin-bottom:5px;
width:888px;
}


#step1p {
	background-color: #efefef;
	border-bottom: 4px dotted white;
	height: 40px;
	width: 888px;
}

h1 {
  font-family: Nanum Pen Script;
  display: inline-block;
  margin: 0 auto;
  font-weight: 900;
  text-transform: uppercase;
  text-align: center;
/*   font-size: 9vw; */
  line-height: 120%;
/*   padding: 300px 0; */
  animation: background 20s linear infinite;
  
  background: linear-gradient(90deg, rgba(150,48,30,1) 0%,rgba(199,201,88,1) 10%,rgba(28,147,46,1) 20%,rgba(74,165,168,1) 30%,rgba(89,90,165,1) 40%,rgba(84,16,67,1) 50%,rgba(28,58,63,1) 60%,rgba(82,175,183,1) 70%,rgba(78,170,76,1) 80%,rgba(150,48,30,1) 90%,rgba(199,201,88,1) 100%);
  background-size: 1000% 100%;
  
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  
/*   position: absolute; */
/*   top: 50%; */
/*   left: 50%; */
/*   transform: translate(-50%, -50%); */
}
span {
/*   display: block; */
}
span:nth-child(1) {
  font-size: 214%;
  line-height: 85%;
  text-indent: -0.33em;
}
span:nth-child(2) {
  font-size: 214%;
  line-height: 69%;
  word-spacing: -0.2em;
  text-indent: -0.07em;
}

@keyframes background {
  0%{background-position:0% 50%}
  100%{background-position:100% 50%}
}

.lookbt{
    position: relative;
    left: -47.5%;
    margin-bottom:15px;
}
.fbdel{
	float:right;
}
#fboard_table td{
	border-top:1px solid black;
}
</style>

<script>
 
$(document).ready(function() {
	$('.lookbt').click(function() {
		var areaboard_num = $(".areaboard_num").val();
		var comment_refer = $(this).next().next().val();
		var areaboard_code = $("#areaboard_code").val();
		if ($(this).next().css("display") == "none") {
			jQuery(this).next().find("iframe").attr(
				"src","replyList.do?areaboard_num="
				+ areaboard_num+ "&comment_refer="
				+ comment_refer+"&areaboard_code="+areaboard_code+"");
			jQuery(this).next().show();
		} else {
			jQuery(this).next().find("iframe").removeAttr("src");
			jQuery(this).next().hide();
		}
	});




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
            $('p.like_count').html("좋아요 : "	+ result.like_count);
        }
    })
});

$(function(){
	$("#reply_submit").click(function(){
		var replycontent = $("#reply_content").val();
		
		
		if(replycontent.length < 3 || replycontent.length > 300 ){
			event.preventDefault();
			alert("댓글은 3글자 이상,300글자 이하로 작성해주셔야 합니다. ");
			document.getElementById("reply_content").focus();
			return false;
		}
	})
})


$(function(){
		$(".comment_submit").click(function(){
			
			var commentcontent = $(this).closest("table").find("td").children("textarea").val();

			
			if(commentcontent.length < 3 || commentcontent.length > 300 ){
				event.preventDefault();
				alert("댓글은 3글자 이상,300글자 이하로 작성해주셔야 합니다.");
				document.getElementById("comment_content").focus();
				return false;
			}
		})
	})

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
  <div id="container" class="container w3-center" style="width:900px;">
<h1><span>지역</span><span>게시판</span><span>상세보기</span></h1> <table id="fboard_table" border="1" class="table" style="margin-bottom:0;border-bottom:none; margin-top:10px; font-family: 'Nanum Pen Script', cursive;">
	<tr style="background-color:#c3bbbb;">
			<td style="text-align:left; font-size:24px;">제목 : ${fdto.areaboard_title}</td>
		</tr>
 
 <tr>
<td>	<span style="float:left; font-size:18px;">작성자 :${fdto.user_nickname}</span>		
			<span style="float:right; font-size:18px;">	날짜 : ${fdto.areaboard_time}
				조회수 :${fdto.areaboard_view}</span></td>
			</tr>
		
			<tr>
			<td style="text-align:left; border-bottom:none; font-family:Jeju Hallasan; padding-top:30px;">${fdto.areaboard_content}
			</td>
			<tr>
			<td style="border-top:none">
<div class="col-md-4" id="likeArea" style="width:870px;padding:0;margin-top:50px;">
    <button type="button" id="btnLike">
        <img src="${ isLiked == true ? '/trip/resources/images/heart.png' : '/trip/resources/images/empty heart.jpg' }" 
id="like_img" height="50px" width="50px">
    </button>
    <p class="like_count">좋아요 : ${fdto.areaboard_like }</p>    
   

<c:if test="${fdto.user_nickname  == login_userId}">
		<span style="float:right;">
		<button class="btn btn-primary" style="font-family:Sans-serif;" onclick="goUpdate()">수정</button> 
		<button class="btn btn-primary" style="font-family:Sans-serif;" onclick="goDelete()">삭제</button>
		</span>
</c:if>
</div>
</td>
</tr>
</table>

<form action="awritereply.do" method="post">
<div style="width:888px; border:1px solid black; height:200px;">
<input type="hidden" name="areaboard_code"	value="${fdto.areaboard_code}" />
<input type="hidden" name="areaboard_num" value="${fdto.areaboard_num}">
<input type="hidden" name="user_nickname" value="${login_userId}">
<p style="text-align:left; margin-left:15px;margin-top:15px;">
<strong>${login_userId}</strong>
</p>
<textarea rows="5" cols="55" id="reply_content" name="comment_content" style="margin: 0px;
 height: 88px; width: 885px; border: 1px solid lightgray; resize:none" placeholder="주제와 무관한 댓글,악플은 삭제될 수 있습니다" maxlength="300"></textarea>
<input type="submit" id="reply_submit" value="댓글작성" style="float:right; margin:10px;" class="btn btn-primary">

</div>
</form>

<br />
<hr class="mar5"/>
<p />
<!-- list는 따로 아래처럼 뽑아줘야 한다. -->
<c:choose>
	<c:when test="${empty list}">

  </c:when>
  
  <c:otherwise>
  <c:forEach items="${list}" var="cdto">
 	<!-- 댓글 본문 -->
 	<c:if test="${cdto.comment_step == 0}">
   	<div id="step1p"><div style="background-color:#fafafa;">
	<strong style="text-align:left;float:left; margin-left:10px; font-family:gulim;">${cdto.user_nickname}
	<span style="font-size:11px; font-weight:normal; margin-left:20px">${cdto.comment_time}</span>
	</strong>
   	
   <c:if test="${login_userId == cdto.user_nickname}">
 <a href="adelreply.do?areaboard_num=${cdto.areaboard_num}&comment_num=${cdto.comment_num}&areaboard_code=${fdto.areaboard_code}"><button class="fbdel btn btn-default btn-xs" style="margin-top: 10px;">삭제</button>
</a>
	</c:if>
	</div>
   <br>
   </div>
   <p style="text-align:left; width:500px; margin-top:10px; margin-left:10px; margin-bottom:30px;">${cdto.comment_content}</p>
	
	<input type="hidden" value="${cdto.areaboard_num}" class="areaboard_num">
   	
   	
   	<div style="width:888px;">
   	<button style="margin-left:15px;" class="lookbt btn btn-default btn-sm">답글 ${cdto.comment_count}</button>
   	<div class="lookreply" id="replyDiv" style="display:none" style="width: 888px;">
	 <iframe class="reList" id="replyIframe" style="width:888px;"></iframe>
   	<form action="aboardrepre.do" method="post">
   	<div id="rereplyDiv" style="width: 888px;height: 220px;">
		<input type="hidden" name="areaboard_num" value="${cdto.areaboard_num}">
		<input type="hidden" name="areaboard_code" id="areaboard_code" value="${fdto.areaboard_code}">
		<input type="hidden" name="user_nickname" value="${login_userId}">
		<input type="hidden" name="comment_refer" value="${cdto.comment_refer}">
		<p style="text-align: left; margin-top: 15px; margin-left: 45px;">
											<strong>${login_userId}</strong>
										</p>
						<div style="margin:auto;width: 800px;">
										
						<table id="trplyTable">
												<colgroup>
													<col width="90%">
													<col width="10%">
												</colgroup>
												<tr>
													<td colspan="2">
														<textarea rows="5" cols="55" id="comment_content" name="comment_content" placeholder="주제와 무관한 댓글,악플은 삭제될 수 있습니다" maxlength="300"></textarea>
													</td>
												</tr>
												<tr>
													<td></td>
													<td>
														<input type="submit" value="댓글작성" style="width:100%;border-radius:0px;" class="btn btn-primary comment_submit">
													</td>
												</tr>
											</table>
											</div>
											</div>					
	</form>
	</div>
	<input type="hidden" value="${cdto.comment_refer}" class="comment_refer">
	
	<hr class="mar5"/>
	</div>
	</c:if>

  	</c:forEach>
  	</c:otherwise>
  	</c:choose>
  	      	
  	      <c:if test="${ndto.areaboard_num != null }">
			<p style="text-align:left; margin:3px;"> ▲ 
				<a style="font-weight:bold; color:#000;" class="title" href="aboarddetail.do?areaboard_num=${ndto.areaboard_num}&areaboard_code=${ndto.areaboard_code}">다음글 보기</a>
				<a style="font-size:14px; color:#000; "class="title" href="aboarddetail.do?areaboard_num=${ndto.areaboard_num}&areaboard_code=${ndto.areaboard_code}">${ndto.areaboard_title}</a>
				<span style="float:right; font-size:13px; font-family: Verdana,sans-serif;"> ${ndto.user_nickname} &nbsp; &nbsp; &nbsp; ${ndto.areaboard_time}</span>
			</p>
			<hr style="margin:0;"/>
			</c:if>
			
		<c:if test="${bdto.areaboard_num != null}">
			<p style="text-align:left; margin:3px;"> ▼
				<a style="font-weight:bold; color:#000;" class="title" href="aboarddetail.do?areaboard_num=${bdto.areaboard_num}&areaboard_code=${bdto.areaboard_code}">이전글 보기</a>
				<a style="font-size:14px; color:#000;" class="title" href="aboarddetail.do?areaboard_num=${bdto.areaboard_num}&areaboard_code=${bdto.areaboard_code}">${bdto.areaboard_title}</a>
				<span style="float:right; font-size:13px; font-family: Verdana,sans-serif;"> ${bdto.user_nickname} &nbsp; &nbsp; &nbsp; ${bdto.areaboard_time}</span>
			</p>
		</c:if>
</div>
<div style="position: fixed; bottom: 5px; right: 22%;">
<a href="#"><img src="/trip/resources/images/up.png" title="위로 가기" style="width:70px; height:70px;"></a>

</div>
  <script type="text/javascript">
  $(function(){
		$("iframe.reList").load(function(){ //iframe 컨텐츠가 로드 된 후에 호출됩니다.
			var frame = $(this).get(0);
			var doc = (frame.contentDocument) ? frame.contentDocument : frame.contentWindow.document;
			$(this).height(doc.body.scrollHeight);
			$(this).width(doc.body.scrollWidth);
		});
	});
	
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