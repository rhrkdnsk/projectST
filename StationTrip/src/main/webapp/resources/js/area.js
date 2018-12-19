$(function(){
	$.ajax({
		url : "area.do",
		mothod : "POST",
		success : function(doc){
			var names=$(doc).find("name");
			var areaCode=$(doc).find("code");
			$("#case1").empty();
			for (var i = 0; i < names.length; i++) {
				$("#case1").append("<option value='"+ areaCode.eq(i).text() +"'>" + names.eq(i).text() + "</option>");
			}
		},
		error:function(){
			alert("에러");
		}
	});
	
	$("#case1").change(function(){
		var code = $("#case1").val();

		$.ajax({
			url : "area.do",
			mothod : "POST",
			data : {"code" : code},
			success : function(doc){
				var names=$(doc).find("name");
				$("#case2").empty();
				for (var i = 0; i < names.length; i++) {
					$("#case2").append("<option value='"+ i +"'>" + names.eq(i).text() + "</option>");
				}
			},
			error:function(){
				alert("에러");
			}
		});
	});

	$("#case3").change(function(){
		
		
		var case1 = $("#case1").val();	// 시 코드
		var case2 = $("#case2").val();	// 군구 코드
		var case3 = $("#case3").val();	// 카테고리 코드
		$.ajax({
			url : "category.do",
			mothod : "POST",
			data : {"areaCode" : case1,
					"sigunguCode" : case2,
					"category" : case3},
			success : function(doc){
				var titles=$(doc).find("title");
				$("#titles").empty();
				for (var i = 0; i < titles.length; i++) {
					$("#titles").append("<option value='"+ i +"'>" + titles.eq(i).text() + "</option>");
				}
			},
			error:function(){
				alert("에러");
			}
		});
	});
});
