<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script type="text/javascript" src="/trip/resources/js/train_test.js"></script> 
<script type="text/javascript">
var trpage;
function test(data){
	//alert("data = "+data)
	var strArray = data.split(",");
	//console.log(strArray.length)
	$("#traininfo").find('tbody').empty();
		for (var i = 0; i < strArray.length; i++) {
			trainlist = strArray[i].split(".")
			trpage = trainlist[6]
			//console.log(trainlist)
			var shour = trainlist[1].substr(8, 2);
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
			
	
	tralist = []
	for(var i=0; i<splitArray(strArray, 10).length; i++){
		tralist.push(splitArray(strArray, 10)[i]);
		
	}
	//console.log(tralist.length)
}

function splitArray(arr, size) {
	var arr2 = arr.slice(0),
	arrays = [];
	while (arr2.length > 0) {
		arrays.push(arr2.splice(0, size));
	}
	return arrays;
}
</script>
<title>Insert title here</title>
</head>
<body>
<table>
	<colgroup>
		<col width="141px">
		<col width="141px">
		<col width="141px">
		<col width="141px">
		<col width="141px">
		<col width="141px">
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
<table id="traininfo">
	<colgroup>
		<col width="141px">
		<col width="141px">
		<col width="141px">
		<col width="141px">
		<col width="141px">
		<col width="141px">
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
<div class="list-bot">
<p>
<%
int tpage = ((Integer)session.getAttribute("page")).intValue();
int totalPage = ((Integer)session.getAttribute("totalPage1")).intValue();
int startPage = ((Integer)session.getAttribute("startPage1")).intValue();
int endPage = ((Integer)session.getAttribute("endPage1")).intValue();
if(tpage-1 != 0){
	%>
		<button onclick="straingo(${tpage-1})">이전</button>
	<%
}

	System.out.println("jsp list의 totalPage의 값 : " + totalPage);
		for(int i=startPage; i<=endPage; i++) {
			%>			
						<button onclick="straingo(<%=i%>)"><%=i%></button>						
			<%			
		}
		if(tpage+1 <= totalPage){
	%>
  <button onclick="straingo(${tpage+1})">다음</button>
<%
		}

%>
</p>
</div>
</body>
</html>