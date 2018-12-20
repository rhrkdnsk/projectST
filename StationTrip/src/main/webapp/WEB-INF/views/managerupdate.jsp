<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
	/* 	링크에 밑줄 제거 */
	table a{text-decoration: none;}
	img{width:10px; height: 10px;}
	
/* 	입력범위가 벗어나는 경우 텍스트 처리 (내용이....) */
	.titleval{
		display: inline-block;
		width: 200px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space:nowrap;
	}
	textarea[name=testAjax]{
		position: fixed;
		left: 100px;
		top:150px;
	}
</style>
</head>
<body>
<div id="container">
<h1>회원 정보 수정</h1>
<form action="supdateBoard.do" method="post">
<input type="hidden" name="user_nickname" value="${fdto.user_nickname}"/>
<table class="table table-hover">
	<tr>
		<th>닉네임</th>
		<td>${fdto.user_nickname}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${fdto.user_name}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${fdto.user_email}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${fdto.user_phone}</td>
	</tr>
	<tr>
		<th>포인트</th>
		<td><input type="text" name="user_point" value="${fdto.user_point}"/></td>
	</tr>
	<tr>
		<th>등급</th>
		<td><textarea rows="1" cols="10" name="tier">${fdto.tier}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정완료"/>
			<button type="button" onclick="location.href='glist.do'">글목록</button>
		</td>
	</tr>
</table>
</form>
</div>
<%@include file="footer.jsp" %>
</body>
</html>








