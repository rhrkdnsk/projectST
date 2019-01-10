<%@page import="com.hk.trip.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">



<script>
<<<<<<< HEAD
	
=======
 
$(document).ready(function(){

    $('.lookbt').click(function () {  
    	var freeboard_num = $(".freeboard_num").val();
    	var comment_refer = $(this).next().next().val()
		console.log(comment_refer)
    	
    	alert(comment_refer)
    	alert($(this).next().css("display"))
        if($(this).next().css("display") == "none"){
        	jQuery(this).next().find("iframe").attr("src","freplyList.do?freeboard_num="+freeboard_num+"&comment_refer="+comment_refer+"");
            jQuery(this).next().show();   
        } else {  
        	jQuery(this).next().find("iframe").removeAttr("src");
            jQuery(this).next().hide();   
        }  
    });   
   
});

$(document).ready(function(){
$('#btnLike').click(function ()  {
    $.ajax({
        url:"fboardLike.do",
        data: {user_nickname: '${login_userId}', board_num: '${fdto.freeboard_num}' },
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
>>>>>>> branch 'master' of https://github.com/rhrkdnsk/projectST.git
	
	$(document).ready(
			function() {
				$('.lookbt').click(
					function() {
						var freeboard_num = $(".freeboard_num").val();
						var comment_refer = $(this).next().next().val()
						alert(comment_refer)
						alert($(this).next().css("display"))
							if ($(this).next().css("display") == "none") {
								jQuery(this).next().find("iframe").attr(
										"src",
										"freplyList.do?freeboard_num="
												+ freeboard_num
												+ "&comment_refer="
												+ comment_refer + "");
								jQuery(this).next().show();
							} else {
								jQuery(this).next().find("iframe").removeAttr(
										"src");
								jQuery(this).next().hide();
							}
						});
			});

	$(document)
			.ready(function() {
				$('#btnLike').click(function() {
							$.ajax({
								url : "fboardLike.do",
								data : {
								user_nickname : '${login_userId}',
								board_num : '${fdto.freeboard_num}'
										},
								type : "post",
								success : function(data) {
									var result = JSON.parse(data);
										if (result.status == 404) {
											$('img#like_img').attr('src','/trip/resources/images/empty heart.jpg');
											} else {
												$('img#like_img').attr('src','/trip/resources/images/heart.png');
												}
												$('p.like_count').html("좋아요 : "	+ result.like_count);
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
	<div id="container" class="container w3-center" >
		<h1>자유게시판 상세보기</h1>
	
	<table border="1" class="table table-hover">
		<col width="80px">
		<col width="150px">
		<col width="80px">

		<tr>
			<td>작성자 : ${fdto.user_nickname}</td>		
			<td>날짜 : ${fdto.freeboard_time}</td> 
			<td>조회수 :${fdto.freeboard_view}</td>
		</tr>
		
		<tr>
		<td style="width:310px">제목 : ${fdto.freeboard_title}</td>
	
		</tr>
		<tr>
			<td>${fdto.freeboard_content}

				<div class="col-md-4" id="likeArea">
					<button type="button" id="btnLike" style="text-align:center;">
						<img
							src="${ isLiked == true ? '/trip/resources/images/heart.png' : '/trip/resources/images/empty heart.jpg' }"
							id="like_img" height="50px" width="50px">
					</button>
					<p class="like_count">좋아요 : ${fdto.freeboard_like}</p>

				</div>
			
			</td>
		</tr>
		
	</table>
	
	<p />
	<c:if test="${fdto.user_nickname  == login_userId}">

		<button value="수정" onclick="goUpdate()">수정</button>
		<button onclick="goDelete()">삭제</button>

	</c:if>
	
	<p>
	
	<p>--------------------------------댓글
		보기---------------------------------------------------------------------
	
	<form action="writereply.do" method="post">
		<div style="width: 1140px; border: 1px solid black; height: 200px;">
			<input type="hidden" name="user_nickname" value="${login_userId}" style="border: none;" readonly>
			<p style="text-align: left; margin-left:10px "><strong>${login_userId}</strong></p>
			<input type="hidden" name="freeboard_num" value="${fdto.freeboard_num}"> 
			<textarea rows="5" cols="55" name="comment_content" style="margin: 0px;
			 height: 88px; width: 1124px; border:none;" placeholder="주제와 무관한 댓글,악플은 삭제될 수 있습니다"></textarea>
			<hr>
			<input type="submit" value="댓글작성" style="float: right; margin-bottom:10px;" class="btn btn-primary">

		</div>
		<%-- <input type="hidden" name="freeboard_num" value="${fdto.freeboard_num}"> --%>
		<%-- <input type="text" name="user_nickname" value="${login_user.user_nickname}" readonly> --%>
		<!-- <input type="text" name="comment_content" size="50"> -->
		<!-- <input type="submit" value="댓글작성"> -->
	</form>
	<p>
	<!-- list는 따로 아래처럼 뽑아줘야 한다. -->
	<c:choose>
		<c:when test="${empty list}">
			<dl>
				<dd>-------작성된 댓글이 없습니다.----</dd>
			</dl>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="cdto">

				<c:if test="${cdto.comment_step==0 }">
					<div id="step1p">
						<%--    	댓글번호 : ${cdto.comment_num} --%>
						<%--    	 게시판번호 : ${cdto.freeboard_num} --%>

						<h3>${cdto.user_nickname}</h3>
						<p />
						<h6>${cdto.comment_content}</h6>
						<h6>${cdto.comment_time}</h6>
						<%--    	좋아요 : ${cdto.comment_like}  --%>
						<%--    	싫어요 : ${cdto.comment_hate}  --%>
						<%--    	리퍼 : ${cdto.comment_refer} --%>
						<%--    	스텝 : ${cdto.comment_step} <!-- 답글버튼을 눌렀을때 답글이 나오고 다시 눌렀을때 접을수 있게 처리해야함 --> --%>
					</div>
					<c:if test="${cdto.user_nickname == login_userId}">
						<a
							href="fdelcomment.do?freeboard_num=${cdto.freeboard_num}&comment_num=${cdto.comment_num}"><button>삭제</button></a>
					</c:if>
					<input type="hidden" value="${cdto.freeboard_num}"
						class="freeboard_num" />

					<button class="lookbt">답글</button>
					<!--<hr /> 들어올 곳-->

					<div class="lookreply" style="display: none">

						<iframe class="reList" style="width: 800px;"></iframe>
						<form action="fboardrepre.do" method="post">
							<div
								style="width: 800px; border: 1px solid black; height: 357px;">
								<input type="hidden" name="freeboard_num"
									value="${cdto.freeboard_num}"> <input type="hidden"
									name="user_nickname" value="${login_userId}"
									style="width: 150px" style="border:none" readonly>
								<h6>${login_userId}</h6>
								<input type="hidden" name="comment_refer"
									value="${cdto.comment_refer}">
								<textarea rows="10" cols="85" name="comment_content"></textarea>
								<input type="submit" value="댓글작성" style="float: right;">
							</div>
						</form>

					</div>
					<input type="hidden" value="${cdto.comment_refer}"
						class="comment_refer">
					<hr />

				</c:if>



			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
	<br /> ▲ 다음글 보기
	<a class="title"
		href="fboarddetail.do?freeboard_num=${ndto.freeboard_num}">${ndto.freeboard_title }</a>
	<p>
		▼ 이전글 보기<a class="title"
			href="fboarddetail.do?freeboard_num=${bdto.freeboard_num}">${bdto.freeboard_title}</a>

		<script type="text/javascript">
			function goUpdate() {
				location.href = "fboardupdate.do?freeboard_num=" + $
				{
					fdto.freeboard_num
				}
				;
			}
			function goDelete() {
				location.href = "fboarddelete.do?freeboard_num=" + $
				{
					fdto.freeboard_num
				}
				;
			}
			function goNext() {
				location.href = "fboarddetail.do?freeboard_num=" + $
				{
					fdto.freeboard_num
				}
				+1;
			}
			function goBack() {
				location.href = "fboarddetail.do?freeboard_num=" + $
				{
					fdto.freeboard_num
				}
				-1;
			}
		</script>
		<jsp:include page="footer.jsp" />
</body>
</html>