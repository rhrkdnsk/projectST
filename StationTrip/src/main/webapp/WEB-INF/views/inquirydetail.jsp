<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="/trip/resources/js/ckeditor/ckeditor.js"></script>
	<style type="text/css">
.labeltag {
	margin-right: 20px;
	text-align: right;
	color: green;
}

#inquiry_div {
	width: 722px;
	margin: auto;
	border: 1px solid lightgray;
}

.inquiry_input {
	width: 722px;
	border: 1px solid lightgray;
	height: 30px;
}
.inquiry_input2 {
	width: 361px;
	border: 1px solid lightgray;
	height: 30px;
	float:left;
}

</style>
<title>자유게시판 리스트</title>

</head>
<body>

	<div style="text-align: center;">
		<h1>My Page</h1>
		<a href="mypage.do">내정보 관리</a> 
		<a href="pwchange.do">비밀번호 변경</a> 
		<a href="myinquiry.do">나의 문의글</a> 
		<a href="itinerary.do">여행 일정</a> 
		<a href="withdrawalgo.do">회원 탈퇴</a>
		<hr style="border-color: black;">
	</div>
	<div style="width: 800px; margin: auto;">
		<h3>
			나의 <span style="color: red;">문의글</span>
		</h3>
		<br>
	</div>
	<div
		style="width: 800px; height: 600px; margin: auto; font-size: initial;">
		<form action="inquiry_update.do" method="get">
		<input type="hidden" name="inquiry_num" value="${inquiryDto.inquiry_num}">
		<div>
			<div>
				<input type="text" class="inquiry_input" name="inquiry_title" value="${inquiryDto.inquiry_title }"/>
				<span><fmt:formatDate value="${list.inquiry_time}" pattern="yyyy년 MM월 dd일" /></span>
			</div>
			<div>
				<textarea name="inquiry_content" id="inquiry_content">${inquiryDto.inquiry_content }</textarea>
				<script type="text/javascript">
					CKEDITOR.replace('inquiry_content', {
						width : '720px', // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
						height : '300px', // 입력창의 높이
						startupFocus : false
					});
				</script>
			</div>
			<input type="submit" value="수정하기" id="submit" class="inquiry_input2" />
			<input type="button" value="돌아가기" class="inquiry_input2" onclick="location.href='myinquiry.do'"/>
		</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>