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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>  
<script type="text/javascript">
$(function() {
    $( "#Datepicker" ).datepicker({
    	changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        dateFormat: "yymmdd",
        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        
    });

})

$(function() {
	var marginLeft = modalCont.outerWidth()/2;
	var marginTop = modalCont.outerHeight()/2; 

	var sch_Layer = $("#sch_Layer");
    var sch_Link = $(".sch_Link");
    var sch_Content = $(".sch_Content"); 
     
    sch_Link.click(function(){
    	alert("click")
		sch_Layer.fadeIn("slow");
		sch_Content.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		$(this).blur();
    });
})
</script>
<style type="text/css">
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; }
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: blue; } 

	#sch_Layer {
		display: none;
		position: relative;
	}
	
	#sch_Layer .sch_Link {
		width: 340px;
	    height: 400px;
	    padding: 0px;
	    border: 1px solid #ccc;
	    position: fixed;
	    left: 50%;
	    top: 25%;
	    z-index: 11;
	    background: #fff;
	    color: black;
	    border-radius:10px;
	}
</style>
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
		<a href="#sch_Layer" class="sch_Link" style="float:right;">일정만들기</a>
		<br>
	</div>
	<div style="width: 800px;height: 400px; margin:auto; font-size: initial;">
		${s_msg }
		${dto.schedule_name }                                                                                                                                                                                                                                                                                      
	</div>
	<div id="sch_Layer">
		<div class="sch_Content">
			<form>
				<fieldset class="sch_fieldl">
					<br />
					<ul class="sch_ul">
						<li>
							<input type="text" id="remail"  placeholder="일정명을 입력하세요" />
						</li>
						<li>
							<input type="text" id="Datepicker" class="traindate" autocomplete=off>
							<input type="submit" value="확인">
						</li>
					</ul>
				</fieldset>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>