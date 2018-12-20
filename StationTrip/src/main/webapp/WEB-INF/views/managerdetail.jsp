<%@page import="com.hk.trip.dto.LoginDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
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
<h1>회원 정보</h1>
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
		<td>${fdto.user_point}</td>
	</tr>
	<tr>
		<th>등급</th>
		<td>${fdto.tier}</td>
	</tr>
	<tr>
		<td colspan="2">
			<button onclick="supdateForm('${fdto.user_nickname}')">수정</button>
			<button onclick="sdelDelete('${fdto.user_nickname}')">삭제</button>
			<button onclick="location.href='glist.do'">회원목록</button>
		</td>
	</tr>
</table>
</div>
<script type="text/javascript">
	//수정폼으로 이동
	function supdateForm(user_nickname){
		location.href="managerupdate.do?user_nickname="+user_nickname;
	}
	//게시글 삭제로 이동
	function sdelDelete(user_nickname){
		location.href="sdelBoard.do?user_nickname="+user_nickname;
	}
	 
</script>
<%@include file="footer.jsp" %>
</body>
</html>





