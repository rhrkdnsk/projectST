<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/trip/resources/css/mypage.css">

<title>My page</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div style="text-align:center;	">
<div id="amazingtext">
<h1 style="margin-bottom: 30px;">My Page</h1>
</div>
<a href="mypage.do" class="mp_menu" style="color:blue;">내정보 관리</a>
<a href="pwchange.do" class="mp_menu">비밀번호 변경</a>
<a href="myinquiry_sdel.do" class="mp_menu">나의 문의글</a>
<!-- <a href="itinerary.do" class="mp_menu">여행 일정</a> -->
<a href="withdrawalgo.do" class="mp_menu">회원 탈퇴</a>
<hr style="border-color:black;">
</div>
<div style="width: 800px;margin:auto;">
<h3>내 정보를 <span style="color:red;">최신정보</span>로 관리해주세요</h3>
<br>
</div>
<div style="width: 800px;height: 420px; margin:auto; font-size: initial;">
	<div>
		<p><label class="labeltag">이메일</label>${dto.user_email }</p>
		<p><label class="labeltag">이름 </label>${dto.user_name }</p>
		<hr>
	</div>
	<div>
		<form action="nickchange.do">
		<p>
			<label class="labeltag">닉네임</label>  
			<input type="hidden"  name="n_email" value="${dto.user_email }"> 
			<input type="hidden"  name="ori_Nickname" value="${dto.user_nickname }"> 
			<input type="text" id="nickput" name="nickput" value="${dto.user_nickname }" style="border:none;" readonly="readonly"/>
			<span id="nickspan">
				<button id="btnnick" style="margin-left:15px;background-color:white;" >수정</button>
			</span>
		</p>
		</form>
		<form action="phonechange.do">
		<p>
			<label class="labeltag">연락처</label>
			<input type="hidden" name="p_email" value="${dto.user_email }">    
			<input type="text" id="phoneput" name="phoneput" value="${dto.user_phone }" style="border:none;" readonly="readonly"/>
			<span id="phonespan">
				<button id="btnph" style="margin-left:15px;background-color:white;" >수정</button>
			</span>
		</p>
		</form>
		<hr>
	</div>
	<div>
		<p><label class="labeltag">포인트</label>   ${dto.user_point }</p>
		<p><label class="labeltag">등급</label>   ${dto.tier }</p>
		<hr>
	</div>
</div>
<script type="text/javascript">
$("#btnnick").click(function(){
	$("#nickput").css("border","1px solid gray");
	$("#nickput").removeAttr("readonly");
	$("#nickspan").empty();
	$("#nickspan").append(
		"<button id='bchnick' style='margin-left:15px;background-color: white;' type='submit'>확인</button><button style='margin-left:15px;background-color: white;' onclick='location.href=\"mypage.do\"'>취소</button>"	
	);
});

$("#btnph").click(function(){
	$("#phoneput").css("border","1px solid gray");
	$("#phoneput").removeAttr("readonly");
	$("#phonespan").empty();
	$("#phonespan").append(
			"<button id='bchph' style='margin-left:15px;background-color: white;' type='submit'>확인</button><button style='margin-left:15px;background-color: white;' onclick='location.href=\"mypage.do\"'>취소</button>"		
	);
});
</script>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>