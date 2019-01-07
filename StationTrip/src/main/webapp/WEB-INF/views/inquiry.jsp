<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
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

.inquiry_inputImage {
	width: 722px;
	border: none;
	height: 30px;
}

#inquiry_image_div {
	border: 1px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1 style="text-align: center;">1:1 문의</h1>
		<hr>
	</div>
	<div id="inquiry_div">
		<form action="inquiryinsert.do" method="get">
			<input type="hidden" name="user_nickname" value="${login_userId}">
			<div>
				<div>
					<input type="text" placeholder="     제목을 작성하십시오"
						class="inquiry_input" name="inquiry_title" />
				</div>
				<div>
					<textarea name="inquiry_content" id="inquiry_content"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('inquiry_content', {
							width : '720px', // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
							height : '300px', // 입력창의 높이
							startupFocus : false
						});
					</script>
				</div>
				<div id="inquiry_image_div">
					<input type="file" class="inquiry_input" />
				</div>
				<input type="submit" value="작성완료" id="submit" class="inquiry_input" />
			</div>

		</form>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>