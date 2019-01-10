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
	
	<c:choose>
		<c:when test="${empty list}">
			<dl>
				<dd>-------작성된 댓글이 없습니다.----</dd>
			</dl>
		</c:when>

		<c:otherwise>
			<c:forEach items="${list}" var="cdto">
			
				<div class="lookreply" style="display: none">
					댓글번호 : ${cdto.comment_num} 
					게시판번호 : ${cdto.areaboard_num} 
					아이디 :${cdto.user_nickname} 
					내용 : <input type="text" value="${cdto.comment_content}" style="border: none" readonly>
					시간 : ${cdto.comment_time} 
					좋아요 : ${cdto.comment_like}
					싫어요 : ${cdto.comment_hate} 
					리퍼 : ${cdto.comment_refer} 
					스텝 : ${cdto.comment_step}
					<c:if test="${login_userId == cdto.user_nickname}">
						<a href="adelreply.do?areaboard_num=${cdto.areaboard_num}&comment_num=${cdto.comment_num}&areaboard_code=${fdto.areaboard_code}">
							<button>삭제</button>
						</a>
					</c:if>
					</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>