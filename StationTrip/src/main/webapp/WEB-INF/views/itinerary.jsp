<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>My page</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div style="text-align:center;	">
<div id="amazingtext">
<h1>My Page</h1>
</div>>
<a href="mypage.do">내정보 관리</a>
<a href="pwchange.do">비밀번호 변경</a>
<a href="myinquiry.do">나의 문의글</a>
<a href="itinerary.do">여행 일정</a>
<a href="withdrawalgo.do">회원 탈퇴</a>
<hr style="border-color:black;">
</div>
<div style="width: 800px;margin:auto;height: 80px;">
<h3 style="text-align:center;margin:0;">여행일정</h3>
<a href="schedulemake.do" style="float:right;padding-top: 15px;"><button>일정만들기</button></a>
<br>
</div>
<div style="width: 800px;height: 400px; margin:auto; font-size: initial;">
	${s_msg }
	${dto.schedule_name }
                                                                                                                                                                                                                                                                                              
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>