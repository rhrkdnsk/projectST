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

	
	<div style="width: 800px; margin: auto;">
		<h3>
			1:1 <span style="color: red;">문의글</span>
		</h3>
		<br>
	</div>
	<div
		style="width: 800px; height: 600px; margin: auto; font-size: initial;">
		<form action="admin_inquiry_insert.do" method="get">
		<input type="hidden" name="inquiry_num" value="${inquiryDto.inquiry_num}" readonly>
		<div>
			<div>
				<input type="text" name="inquiry_title" class="inquiry_input"  value="${inquiryDto.inquiry_title}" readonly>
				<textarea name="inquiry_content" id="inquiry_content" readonly>${inquiryDto.inquiry_content }</textarea>
				<script type="text/javascript">
					CKEDITOR.replace('inquiry_content', {
						width : '720px', // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
						height : '300px', // 입력창의 높이
						startupFocus : false
					});
				</script>
			</div>
			<input type="submit" value="답변달기" id="submit" class="inquiry_input2" />
			<input type="button" value="돌아가기" class="inquiry_input2" onclick="location.href='admin_inquiry.do'"/>
		</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>