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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${!empty relist}">
		<c:forEach items="${relist}" var="rdto">
			<div class="lookreply">
				댓글번호 : ${rdto.comment_num} 게시판번호 : ${rdto.freeboard_num} 아이디
				:${rdto.user_nickname} 내용 : <input type="text"
					value="${rdto.comment_content}" style="border: none" readonly>
				시간 : ${rdto.comment_time} 좋아요 : ${rdto.comment_like} 싫어요 :
				${rdto.comment_hate} 리퍼 : ${rdto.comment_refer} 스텝 :
				${rdto.comment_step}
				<c:if test="${login_userId == rdto.user_nickname}">

					<a
						href="fdelreplyList.do?freeboard_num=${rdto.freeboard_num}&comment_num=${rdto.comment_num}&comment_refer=${oriRefer}"><button>삭제</button></a>
				</c:if>
			</div>
		</c:forEach>
	</c:if>

</body>
</html>