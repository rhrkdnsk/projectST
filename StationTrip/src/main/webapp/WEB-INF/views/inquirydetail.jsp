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
		style="width: 800px; height: 400px; margin: auto; font-size: initial;">

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
			<input type="submit" value="작성완료" id="submit" class="inquiry_input" />
			<input type="button" value="돌아가기" class="inquiry_input" />
		</div>

	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>