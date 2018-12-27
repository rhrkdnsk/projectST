$(function() {
	/* 출발역 */
	$("#startcitycode").change(
			
			function() {
				var citycode = $("#startcitycode").val();
				if (citycode == 'scity') {
					$("#starttowncode").empty();
					$("#starttowncode").append(
							"<option value='starttowncode'>역 선택</option>");
				} else {
					var starttownArray = null;
					$.ajax({
						url : "towninfo.do",
						mothod : "GET",
						data : {
							"citycode" : citycode
						},
						success : function(doc) {
							$("#starttowncode").empty();
							$("#starttowncode").append(
							"<option value='starttowncode'>역 선택</option>");
							doc.replace(/\[/g, '');
							var strArray = doc.split(",");
							for (var i = 0; i < strArray.length; i++) {
								starttownArray = strArray[i].split(".")
								$("#starttowncode").append(
										"<option value='" + starttownArray[0]
												+ "'>" + starttownArray[1]
												+ "역" + "</option>");
							}
						},
						error : function() {
							alert("에러");
						}
					});
				}
//				document.getElementById('trainframe').contentWindow.location.reload(true)
				
			});

					
	/* 도착역 */
	$("#endcitycode").change(
			function() {
				var citycode = $("#endcitycode").val();
				if (citycode == 'ecity') {
					$("#endtowncode").empty();
					$("#endtowncode").append(
							"<option value='endtowncode'>역 선택</option>");
				} else {
					var endtownArray = null;
					$.ajax({
						url : "towninfo.do",
						mothod : "GET",
						data : {
							"citycode" : citycode
						},
						success : function(doc) {
							$("#endtowncode").empty();
							$("#endtowncode").append(
							"<option value='endtowncode'>역 선택</option>");
							doc.replace(/\[/g, '');
							var strArray = doc.split(",");
							for (var i = 0; i < strArray.length; i++) {
								endtownArray = strArray[i].split(".")
								$("#endtowncode").append(
										"<option value='" + endtownArray[0]
												+ "'>" + endtownArray[1] + "역"
												+ "</option>");
							}
						},
						error : function() {
							alert("에러");
						}
					});
				}
//				document.getElementById('trainframe').contentWindow.location.reload(true)
				
			});
					
});

function traingoti(no){
	
	startcode = $("#starttowncode").val();
	console.log("goti stcode = "+startcode)
	endcode = $("#endtowncode").val();
	console.log(endcode)
	traintime = $("#Datepicker").val();
	console.log(traintime)
	
	var trdata = { "startcode": startcode, "endcode": endcode, "traintime": traintime, "pageNo" : no };
	$.ajax({
		url:"traincheck.do",
		type:'GET',
		data: trdata,
		success:function(data){
			//alert("성공")
			framenum(data)
		},
		error:function(){
			alert("기차리스트 받기 실패ㅜㅜ") ;
		}
	}); 
	console.log("pno2 = "+no)
	
	traingo(no)	
}

	
function traingo(no){
	//traingoti(no)
	var startcode = $("#starttowncode").val();
	console.log(startcode)
	var endcode = $("#endtowncode").val();
	console.log(endcode)
	var traintime = $("#Datepicker").val();
	console.log(traintime)
	
	var data = { "startcode": startcode, "endcode": endcode, "traintime": traintime, "pageNo" : no };
	console.log("no = "+no)
	
	$.ajax({
		url:"trainlist.do",
		type:'GET',
		data: data,
		success:function(data){
			console.log("tgo data = "+data)
			tframe(data)
		},
		error:function(){
			alert("기차리스트 받기 실패ㅜㅜ") ;
		}
	}); 
}

function straingo(no){

	var data = { "pageNo" : no };
	$.ajax({
		url:"trainlist.do",
		type:'GET',
		data: data,
		success:function(data){
			tlist(data)
		},
		error:function(){
			alert("기차리스트 받기 실패ㅜㅜ") ;
		}
	}); 
	
}
function frameReload(){
	document.getElementById('trainframe').contentWindow.location.reload(true)
	console.log("리로드")
	
}
function framenum(data){
	$('#trainframe').get(0).contentWindow.tnum(data);
	console.log("넘버함수실행")
}

function tframe(data){
	$("#trainframe").css("display","block")
	console.log("블락")
	$('#trainframe').get(0).contentWindow.tlist(data);
	console.log("함수실행")
	
}

//날짜 형식 변환
function parse(str) {
    var hour = str.substr(8, 2);
    var minute = str.substr(10, 2);
    var second = str.substr(12, 2);
    return new Date(hour,minute,second);
}
var date = parse('20160418');

