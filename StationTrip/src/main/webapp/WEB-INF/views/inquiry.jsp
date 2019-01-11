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
.inquiry_ninput {
	width: 100px;
	border: 1px solid lightgray;
	height: 30px;
	float:left;
	color:#4c80e4;
}
.inquiry_tinput {
	width: 622px;
	border: 1px solid lightgray;
	height: 30px;
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
	<div id="amazingtext">
	<h1>1:1 문의</h1>
	</div>
	<hr style="border-color:#153d73;">
	<div id="inquiry_div">
		<form action="inquiryinsert.do" method="get">
			<input type="hidden" name="user_nickname" value="${login_userId}">
			
			<div>
				<div style="width:722px;">
					<input type="text" class="inquiry_ninput" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${login_userId}" readonly="readonly"><span>
					<input type="text" placeholder="     제목을 작성하십시오"
						class="inquiry_tinput" name="inquiry_title" id="inquiry_title"/></span>
				</div>
				<div>
					<textarea name="inquiry_content" id="inquiry_content"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('inquiry_content', {
							width : '720px', // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
							height : '500px', // 입력창의 높이
							startupFocus : false,
							uiColor : ﻿'#fafafa'
						});
					</script>
				</div>
				<input type="submit" value="작성완료" id="inquiry_submit" class="inquiry_input " style="background-color:#9ab8f3;" />
			</div>

		</form>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>