<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>My page</title>
</head>
<body>


<div style="text-align:center;	">
<div id="amazingtext">
<h1 style="margin-bottom: 30px;">My Page</h1>
</div>>
<a href="mypage.do" class="mp_menu" >내정보 관리</a>
<a href="pwchange.do" class="mp_menu" >비밀번호 변경</a>
<a href="myinquiry_sdel.do" class="mp_menu" >나의 문의글</a>
<a href="itineray.do" class="mp_menu" style="color:blue;">여행 일정</a>
<a href="withdrawalgo.do" class="mp_menu" >회원 탈퇴</a>
<hr style="border-color:black;">
</div>
<div style="width: 800px;margin:auto;height: 80px;">
<h3 style="text-align:center;margin:0;">여행일정</h3>
<button style="float:right;" onclick="location.href='schedulemake.do'">일정만들기</button>
<br>
</div>
<div style="width: 800px;height: 400px; margin:auto; font-size: initial;">
	${s_msg }
	${dto.schedule_name }
                                                                                                                                                                                                                                                                                              
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>