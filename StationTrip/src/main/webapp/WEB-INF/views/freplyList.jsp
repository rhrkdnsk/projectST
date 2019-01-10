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
<style type="text/css">
hr {
background-color:#fafafa;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:#fafafa;">

	<c:if test="${!empty relist}">
		<c:forEach items="${relist}" var="rdto">
			<div class="lookreply">
<%-- 				댓글번호 : ${rdto.comment_num} --%>
<%-- 				 게시판번호 : ${rdto.freeboard_num} --%>
				 <h3>ㄴ  ${rdto.user_nickname}</h3>
				   <h6>${rdto.comment_content}</h6>
    				<h6>${rdto.comment_time}</h6>
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