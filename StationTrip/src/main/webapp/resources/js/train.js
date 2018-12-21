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
			});
					
});
	
function traingo(){
	var startcode = $("#starttowncode").val();
	console.log(startcode)
	var endcode = $("#endtowncode").val();
	console.log(endcode)
	var traintime = $("#Datepicker").val();
	console.log(traintime)
	
	var data = { "startcode": startcode, "endcode": endcode, "traintime": traintime };
    var trainlist = null;
	$.ajax({
		url:"trainlist.do",
		type:'GET',
		data: data,
		success:function(data){
			$("#traininfo").css("display","block")
			var strArray = data.split(",");
			console.log(strArray.length)
			$("#traininfo").find('tbody').empty();
			for (var i = 0; i < strArray.length; i++) {
				trainlist = strArray[i].split(".")
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
			var count = $("#traininfo tr").length/10+1
		},
		error:function(){
			alert("기차리스트 받기 실패ㅜㅜ") ;
		}
	}); 
}

//날짜 형식 변환
function parse(str) {
    var hour = str.substr(8, 2);
    var minute = str.substr(10, 2);
    var second = str.substr(12, 2);
    return new Date(hour,minute,second);
}
var date = parse('20160418');