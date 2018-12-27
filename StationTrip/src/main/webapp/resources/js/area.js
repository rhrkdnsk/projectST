$(function(){
	var case1_Code = null;
	var case2_Code = null;
	var case3_Code = null;
	var pageNo = null;
	areaList();

	function areaList(){
		$.ajax({
			url : "areaList.do",
			mothod : "POST",
			data : {"case1":case1_Code,"case2":case2_Code,"case3":case3_Code},
				async:false,
				success : function(obj){
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
					
					
//					var areaContent=$(obj["areaContent"]).find("title");
//					var imgTag=$(obj["areaContent"]).find("firstimage");
//					var addr=$(obj["areaContent"]).find("addr1");
//					var pageNo=$(obj["areaContent"]).find("pageNo");
//					var totalCount=$(obj["areaContent"]).find("totalCount");
//					$("#titles").empty();
//					for (var i = 0; i < areaContent.length; i++) {
//						$("#titles").append("<li id='viewBox'>" + "<img id='area-img' src='" + imgTag.eq(i).text()
//								+ "' onerror='" + 'this.src="/trip/resources/images/noimage.png"' 
//								+ "' alt='썸네일' /><p id='titleText"+i+"' class='inlineText'><b>"
//								+ areaContent.eq(i).text() + "</b></p></li>");
//						$("#titleText"+i).after("<p id='addr' class='inlineText'>[" + addr.eq(i).text() + "]</p>");
//					}
//					for (var i = 1; i <= totalCount.text(); i++) {
//						$("#titles").append("<a vlaue='" + i + "'>"+ i + "</a>");
//					}
				},
				error:function(){
					alert("에러");
				}
		});
		contentList();
	}

	function contentList(){
		$.ajax({
			url : "contentList.do",
			mothod : "POST",
			data : {"case1":case1_Code,"case2":case2_Code,"case3":case3_Code,
				"pageNo":pageNo},
				async:false,
				success : function(obj){
					var areaContent=$(obj["areaContent"]).find("title");
					var imgTag=$(obj["areaContent"]).find("firstimage");
					var addr=$(obj["areaContent"]).find("addr1");
					var pageNo=$(obj["areaContent"]).find("pageNo");
					var totalCount=$(obj["areaContent"]).find("totalCount");
					$("#titles").empty();
					for (var i = 0; i < areaContent.length; i++) {
						$("#titles").append("<li id='viewBox'>" + "<img id='area-img' src='" + imgTag.eq(i).text()
								+ "' onerror='" + 'this.src="/trip/resources/images/noimage.png"' 
								+ "' alt='썸네일' /><p id='titleText"+i+"' class='inlineText'><b>"
								+ areaContent.eq(i).text() + "</b></p></li>");
						$("#titleText"+i).after("<p id='addr' class='inlineText'>[" + addr.eq(i).text() + "]</p>");
					}
					for (var i = 1; i <= totalCount.text(); i++) {
						$("#titles").append("<p vlaue='"+i+"'>"+ i + "</p>");
					}
					
				},
				error:function(){
					alert("에러");
				}
		});

	}

	$("#case1").on("click", "li", function(){
		case1_Code = $(this).attr('value');
		case2_Code = null;
		case3_Code = null;
		areaList();
	});

	$("#case2").on("click", "li", function(){
		case2_Code = $(this).attr('value');
		case3_Code = null;
		areaList();
	});

	$("#case3").on("click", "li", function(){
		case3_Code = $(this).attr('value');
		areaList();
	});

	$("#titles").on("click", "p", function(){
		pageNo = $(this).attr('value');
		contentList();
	})

});


/* 안 쓰지만 언젠간 쓸 거 같은 느낌 */


//$("#case1").on("click", "li", function(){
//case1 = $(this).attr('value');
//alert(case1);
//$.ajax({
//url : "area.do",
//mothod : "POST",
//data : {"code" : case1},
//success : function(doc){
//var names=$(doc).find("name");
//var areaCode=$(doc).find("code");
//$("#case2").empty();
//for (var i = 0; i < names.length; i++) {
//$("#case2").append("<li value='"+ areaCode.eq(i).text() +"'>" + names.eq(i).text() + "</li>");
//}
//},
//error:function(){
//alert("에러");
//}
//});
//});

//// test

//$("#case2").on("click", "li", function(){
//case2 = $(this).attr('value');
//alert(case2);

//});
//$("#case3").on("click", "option", function(){
//case3 = $(this).attr('value');
//alert('case1='+case1+'case2='+case2+'case3='+case3);
//$.ajax({
//url : "category.do",
//mothod : "POST",
//data : {"areaCode" : case1,
//"sigunguCode" : case2,
//"category" : case3},
//success : function(doc){
//var titles=$(doc).find("title");
//$("#titles").empty();
//for (var i = 0; i < titles.length; i++) {
//$("#titles").append("<li value='"+ i +"'>" + titles.eq(i).text() + "</li>");
//}
//},
//error:function(){
//alert("에러");
//}
//});
//});

