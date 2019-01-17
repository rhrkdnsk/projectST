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
<link rel="stylesheet" href="/trip/resources/css/mypage.css">
<script type="text/javascript" src="/trip/resources/js/train_info.js"></script>
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<!-- jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
function sch_Layer(){
	var sch_Layer = $("#sch_Layer");
    var sch_Link = $(".sch_Link");
    var sch_Content = $(".sch_Content"); 
    var marginLeft = sch_Content.outerWidth()/2;
	var marginTop = sch_Content.outerHeight()/2; 
    
	sch_Layer.fadeIn("slow");
	sch_Content.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
// 	$(this).blur();
	return false; 
   
}

function sch_div(){
	$("#sch_div").empty();
	$("#sch_div").append("<div id='ma_divId'></div>")
	$("#ma_divId").append("<form action='schedulemake.do' id='ma_formId'></form>")
	$("#ma_formId").append("<fieldset class='sch_fieldl'></fieldset>")
	$(".sch_fieldl").append("<ul class='sch_ul'></ul>")
	$(".sch_ul")
		.append("<li id='sch_li_1'></li>")
		.append("<li id='sch_li_2'></li>")
	$("#sch_li_1")
		.append("<input type='text' id='sch_name' name='sch_name' class='sch_input'  placeholder='일정명을 입력하세요' />")
		.append("<input type='submit' onclick='sch_click()' class='snip1535' value='확인'>")
	$("#sch_li_2")
		.append("<input type='text' id='Datepicker' name='sch_date' class='sch_input2' autocomplete=off>")
		.append("<div id='minus_btn' onclick='minus_day()'></div>")
		.append("<div id='day_info'></div>")
		.append("<div id='plus_btn' onclick='plus_day()'></div>")
		.append("<input type='button' value='취소' class='snip1535' onclick='location.href=\"itinerary.do\"'>")
	$("#minus_btn")
		.append("<img src='/trip/resources/images/city_item_minus_btn.png' class='btn_img'>")
	$("#day_info")
		.append("<span id='info_day'>10</span><span>일</span>")
		.append("<input type='hidden' id='dinfo_input' name='day_info' value=''>")
	$("#plus_btn")
		.append("<img src='/trip/resources/images/city_item_plus_btn.png' class='btn_img'>")
		
	$( "#Datepicker" ).datepicker({
		changeMonth: true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		dateFormat: "yymmdd",
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	});  

}

function sch_click(){
	var name = $("#sch_name").val();
	var date = $("#Datepicker").val();
	if(name == "" || name == null){
		alert("일정명을 입력하세요");
		event.preventDefault();
	} else if(date == "" || date == null){
		alert("날짜를 입력하세요");
		event.preventDefault();
	}
	$("#dinfo_input").val($("#info_day").text())
} 

function minus_day(){
	var now_day = $("#info_day").text();
	now_day = Number(now_day)
	now_day = now_day-1;
	$("#info_day").text(now_day)
}

function plus_day(){
	var now_day = $("#info_day").text();
	now_day = Number(now_day)	
	now_day = now_day+1;
	$("#info_day").text(now_day)
}


</script>
<style type="text/css">
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; }
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: blue; } 

	.sch_fieldl{
		margin: 10px;
   		border: none;
    }
    .sch_ul{
    	list-style:none;
    	padding-inline-start: 0;
    }
    .sch_ul li{
    	margin:3px;
    	border-width: 2px;
    	border-style: inset;
    	width: 374px;
    }
    #ma_divId{
    	width:420px;
    	margin:auto;
    }
    .sch_input{
    	width:300px;
    	height:30px;
    }
    .sch_input2{
    	width:200px;
    	height:30px;
    	float: left;
    	border:none;
    }
    #minus_btn{
    	float:left;
    	width:30px;
    }
     #day_info{
    	float:left;
    	width:40px;
    	text-align: center;
    	height: 30px;
    }
     #day_info span{
     	vertical-align: middle;
     }
     #plus_btn{
    	float:left;
    	width:30px;
    }
    .btn_img{
    	margin:5px;
    }
</style>
<title>My page</title>
</head>
<body>
	<div style="text-align:center;	">
		<div id="amazingtext">
			<h1 style="margin-bottom: 30px;">My Page</h1>
		</div>
		<a href="mypage.do" class="mp_menu" >내정보 관리</a>
		<a href="pwchange.do" class="mp_menu" >비밀번호 변경</a>
		<a href="myinquiry_sdel.do" class="mp_menu" >나의 문의글</a>
		<a href="itinerary.do" class="mp_menu" style="color:blue;">여행 일정</a>
		<a href="withdrawalgo.do" class="mp_menu" >회원 탈퇴</a>
		<hr style="border-color:black;">
	</div>
	<div style="width: 800px;margin:auto;height: 500px;" id="sch_div">
		<div style="width: 800px;margin:auto;height: 80px;">
			<h3 style="text-align:center;margin:0;">여행일정</h3>
			<a href="#sch_Layer" id="sch_Link" style="float:right;" onclick="sch_div()">일정만들기</a>
			<!-- <a href="#sch_Layer" id="sch_Link" class="openMask style="float:right;" onclick="abc()">일정만들기</a> -->
			<br>
		</div>
		<div style="width: 800px;height: 400px; margin:auto; font-size: initial;">
		<c:if test="${empty dto.schedule_name }">${s_msg }</c:if> 
		<c:if test="${!empty dto.schedule_name }">${dto.schedule_name }</c:if>                                                                                                                                                                                                                                   
		</div>
	</div>


	<div class="fr city_set_day_box">
		<div class="fl city_set_minus_btn">
			<img src="/trip/resources/images/city_item_minus_btn.png">
		</div>
		<div class="fl city_set_day_info">
			<span>2</span>일
		</div>
		<div class="fl city_set_plus_btn">
			<img src="/trip/resources/images/city_item_plus_btn.png">
		</div>
		<div class="clear"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>