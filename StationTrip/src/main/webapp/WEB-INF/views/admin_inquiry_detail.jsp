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
	border: 1px solid lightgray;
	height: 30px;
	margin: 5px;
	position: relative;
	left: 77%;
}
</style>
<title>자유게시판 리스트</title>

</head>
<body>


	<div id="amazingtext">
	<h1>1:1 문의</h1>
	</div>
	<hr style="border-color:#153d73;">
	<div
		style="width: 800px; min-height: 600px; margin: 50px auto auto; font-size: initial;">
		<form action="admin_inquiry_insert.do" method="get">
			<!-- 		<form action="inquiry_update.do" method="get"> -->
			<input type="hidden" name="inquiry_num"
				value="${inquiryDto.inquiry_num}">
			<div style="width: 760px; margin: auto;">
				<p class="hn" style="font-size: x-large; margin-left: 5px;">${inquiryDto.inquiry_title }</p>
				<p class="hn" style="margin-top: 10px; float: right; font-size: small;">
					<fmt:formatDate value="${inquiryDto.inquiry_time}" pattern="yyyy년 MM월 dd일" />
				</p>
				<hr>
				<input type="hidden" class="inquiry_input" name="inquiry_title"
					id="inquiry_title" value="${inquiryDto.inquiry_title }" />
				<div
					style="width: 700px; min-height: 300px; margin: 100px auto auto;"
					class="hn">${inquiryDto.inquiry_content }</div>

				<hr>
				<input type="submit" value="답변달기" id="submit" class="inquiry_input2" />
				<input type="button" value="돌아가기" class="inquiry_input2"
					onclick="location.href='admin_inquiry_sdel.do'" />
			</div>
		</form>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>