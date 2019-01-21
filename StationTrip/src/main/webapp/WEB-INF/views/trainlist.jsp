<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="/trip/resources/js/train_info.js"></script>
<link rel="stylesheet" href="/trip/resources/css/train.css" type="text/css" />

<script type="text/javascript">

var trpage;
function tlist(data){
	var strArray = data.split(",");
	$("#traininfo").find('tbody').empty();
		for (var i = 0; i < strArray.length; i++) {
			trainlist = strArray[i].split(".")
			trpage = trainlist[6]
			var shour = trainlist[1].substr(8, 2);
			console.log("shour="+shour)
			var sminute = trainlist[1].substr(10, 2);
			var ssecond = trainlist[1].substr(12, 2);
			var sdate = shour+"시"+sminute+"분"
			    
			var ehour = trainlist[2].substr(8, 2);
			var eminute = trainlist[2].substr(10, 2);
			var esecond = trainlist[2].substr(12, 2);
			var edate = ehour+"시"+eminute+"분"
			$("#traininfo").find('tbody')
				.append($('<tr>')
					.append($('<td>')
						.append(trainlist[0])
						.append($('</td>')
						)
					)
					.append($('<td>')
						.append(sdate)
						.append($('</td>')
						)
					)
					.append($('<td>')
						.append(edate)
						.append($('</td>')
						)
					)
					.append($('<td>')
						.append(trainlist[3])
						.append($('</td>')
						)
					)
					.append($('<td>')
						.append(trainlist[4])
						.append($('</td>')
						)
					)
					.append($('<td>')
						.append(trainlist[5]+"원")
						.append($('</td>')
						)
					)
					.append($('</tr>')
						)
				)                                                                                                                                      
			}
			
}

function tnum(data){
	$(".list-bot").empty();
	console.log("tnum data = "+data)
	for(var i=1; i<= data; i++){
		console.log("for문 실행")
		$(".list-bot").append("<div onclick='straingo(" + i + ")' class='button-7'><div class='eff-7'></div><a>" + i + "</a></div>")
	}
}


</script>
<title>Insert title here</title>
</head>
<body>

	<table class="type03">
		<colgroup>
			<col width="16%">
			<col width="16%">
			<col width="16%">
			<col width="16%">
			<col width="16%">
			<col width="16%">
		</colgroup>
		<tr>
			<th>차량 종류</th>
			<th>출발시간</th>
			<th>도착시간</th>
			<th>출발지</th>
			<th>도착지</th>
			<th>운임</th>
		</tr>
	</table>
	<table id="traininfo" onchange="location.reload()" class="type04">
		<colgroup>
			<col width="16%">
			<col width="16%">
			<col width="16%">
			<col width="16%">
			<col width="16%">
			<col width="16%">
		</colgroup>
		<tr>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
	</table>
	<br>
	<br>
	<div class="list-bot" >
		<p></p>
	</div>
</body>
</html>