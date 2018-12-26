$(function(){
	var case1_Code = null;
	var case2_Code = null;
	var case3_Code = null;
	start();
	
	function start(){
		alert("start 들어옴");
		$.ajax({
			url : "area.do",
			mothod : "POST",
			data : {"case1":case1_Code,"case2":case2_Code,"case3":case3_Code},
			async:false,
			success : function(obj){
//				var areaCase2=obj["areaCase2"];
//				alert(areaCase1.find("name").eq(i).text());
//				alert(areaCase2);
				var areaCase1=$(obj["areaCase1"]).find("name");
				var areaCode1=$(obj["areaCase1"]).find("code");
				$("#case1").empty();
				for (var i = 0; i < areaCase1.length; i++) {
					$("#case1").append("<li value='"+ areaCode1.eq(i).text() +"'>" + areaCase1.eq(i).text() + "</li>");
				}
				var areaCase2=$(obj["areaCase2"]).find("name");
				var areaCode2=$(obj["areaCase2"]).find("code");
				$("#case2").empty();
				for (var i = 0; i < areaCase2.length; i++) {
					$("#case2").append("<li value='"+ areaCode2.eq(i).text() +"'>" + areaCase2.eq(i).text() + "</li>");
				}
			},
			error:function(){
				alert("에러");
			}
		});
	}
	
	$("#case1").on("click", "li", function(){
		case1_Code = $(this).attr('value');
		alert(case1_Code);
		start();
	});
	
	$("#case2").on("click", "li", function(){
		case2_Code = $(this).attr('value');
		alert(case2_Code);
		start();
	});




//	$("#case1").on("click", "li", function(){
//	case1 = $(this).attr('value');
//	alert(case1);
//	$.ajax({
//	url : "area.do",
//	mothod : "POST",
//	data : {"code" : case1},
//	success : function(doc){
//	var names=$(doc).find("name");
//	var areaCode=$(doc).find("code");
//	$("#case2").empty();
//	for (var i = 0; i < names.length; i++) {
//	$("#case2").append("<li value='"+ areaCode.eq(i).text() +"'>" + names.eq(i).text() + "</li>");
//	}
//	},
//	error:function(){
//	alert("에러");
//	}
//	});
//	});

//	// test

//	$("#case2").on("click", "li", function(){
//	case2 = $(this).attr('value');
//	alert(case2);

//	});
//	$("#case3").on("click", "option", function(){
//	case3 = $(this).attr('value');
//	alert('case1='+case1+'case2='+case2+'case3='+case3);
//	$.ajax({
//	url : "category.do",
//	mothod : "POST",
//	data : {"areaCode" : case1,
//	"sigunguCode" : case2,
//	"category" : case3},
//	success : function(doc){
//	var titles=$(doc).find("title");
//	$("#titles").empty();
//	for (var i = 0; i < titles.length; i++) {
//	$("#titles").append("<li value='"+ i +"'>" + titles.eq(i).text() + "</li>");
//	}
//	},
//	error:function(){
//	alert("에러");
//	}
//	});
//	});
});
