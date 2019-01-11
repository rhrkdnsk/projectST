<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/trip/resources/css/reply.css">

<style type="text/css">
hr {
background-color:#fafafa;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:#fafafa;font-family:Verdana,sans-serif;width:880px;">
	<c:if test="${empty relist}">
		<p style="color:gray;text-align:center;">등록된 댓글이 없습니다</p>
	</c:if>
	<c:if test="${!empty relist}">
		<c:forEach items="${relist}" var="rdto">
			<div class="lookreply">
<%-- 				댓글번호 : ${rdto.comment_num} --%>
<%-- 				 게시판번호 : ${rdto.freeboard_num} --%>
				 <strong >ㄴ  ${rdto.user_nickname}</strong>
				   <p style="margin-left:20px">${rdto.comment_content}</p>
    				<p style="margin-left:20px">${rdto.comment_time}</p>
<%-- 				좋아요 : ${rdto.comment_like} --%>
<%-- 				 싫어요 : ${rdto.comment_hate}  --%>
<%-- 				 리퍼 : ${rdto.comment_refer}  --%>
<%-- 				 스텝 : ${rdto.comment_step} --%>
				<c:if test="${login_userId == rdto.user_nickname}">

					<a
						href="fdelreplyList.do?freeboard_num=${rdto.freeboard_num}&comment_num=${rdto.comment_num}&comment_refer=${oriRefer}"><button>삭제</button></a>
				</c:if>
				  	  <hr />
			</div>
		</c:forEach>
	</c:if>

</body>
</html>