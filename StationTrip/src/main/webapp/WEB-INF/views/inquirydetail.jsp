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
<script type="text/javascript" src="/trip/resources/js/ckeditor/ckeditor.js"></script>
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
    left: 89%;
}


</style>
<title>자유게시판 리스트</title>

</head>
<body>

	<div style="text-align:center;	">
		<div id="amazingtext">
			<h1 style="margin-bottom: 30px;">My Page</h1>
		</div>
		<a href="mypage.do" class="mp_menu" >내정보 관리</a>
		<a href="pwchange.do" class="mp_menu" >비밀번호 변경</a>
		<a href="myinquiry_sdel.do" class="mp_menu" style="color:blue;">나의 문의글</a>
		<a href="itinerary.do" class="mp_menu" >여행 일정</a>
		<a href="withdrawalgo.do" class="mp_menu" >회원 탈퇴</a>
		<hr style="border-color:black;">
	</div>
	<!-- <div style="width: 800px; margin: auto;">
		<h3>
			나의 <span style="color: red;">문의글</span>
		</h3>
		<br>
	</div> -->
	<div style="width: 800px; min-height: 600px; margin: 50px auto auto; font-size: initial;">
<!-- 		<form action="inquiry_update.do" method="get"> -->
		<input type="hidden" name="inquiry_num" value="${inquiryDto.inquiry_num}">
		<div style="width:760px;margin:auto;">
<%-- 			<c:if test="${empty inquiryDto.admin_id}"> --%>
				<p class="hn" style="font-size: x-large; margin-left: 5px;">${inquiryDto.inquiry_title }</p>
				<p  class="hn" style="margin-top: 10px;float: right;font-size: small;"><fmt:formatDate value="${inquiryDto.inquiry_time}" pattern="yyyy년 MM월 dd일" /></p>
				<hr>
				<input type="hidden" class="inquiry_input" name="inquiry_title" id="inquiry_title" value="${inquiryDto.inquiry_title }"/>
				<div style="width:700px;min-height:300px;margin: 100px auto auto;" class="hn">${inquiryDto.inquiry_content }</div>
				<%-- <textarea name="inquiry_content" id="inquiry_content" class="idetail_cont">${inquiryDto.inquiry_content }</textarea>
				<script type="text/javascript">
					CKEDITOR.replace('inquiry_content', {
						width : '758px', // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
						height : '500px', // 입력창의 높이
						startupFocus : false
					});
				</script> --%>
				<hr>
				<input type="button" value="돌아가기" class="inquiry_input2 " onclick="location.href='myinquiry_sdel.do'"/>
<!-- 				<input type="submit" value="수정하기" id="inquiry_submit" class="inquiry_input2" /> -->
			<%-- </c:if>
			<c:if test="${!empty inquiryDto.admin_id}">
				<div>
					<input type="text" class="inquiry_input" name="inquiry_title" id="inquiry_title" value="${inquiryDto.inquiry_title }" readonly/>
				</div>
				<div>
					<textarea name="inquiry_content" id="inquiry_content" class="idetail_cont" readonly>${inquiryDto.inquiry_content }</textarea>
					<script type="text/javascript">
						CKEDITOR.replace('inquiry_content', {
							width : '720px', // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
							height : '300px', // 입력창의 높이
							startupFocus : false
						});
					</script>
				</div>
				<input type="button" value="돌아가기" class="inquiry_input" onclick="location.href='myinquiry_sdel.do'"/>
			</c:if> --%>
		</div>
<!-- 		</form> -->
	</div>
	</body>
	<jsp:include page="footer.jsp" />

</html>