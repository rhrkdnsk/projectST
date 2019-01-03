$(function(){
	var case1_Code = null;
	var case2_Code = null;
	var case3_Code = null;
	var contentId = null;
	var pageNo = null;
	var list_length = null;
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
					var totalCount=$(obj["areaContent"]).find("totalCount").text();
					var totalPage = Math.ceil(totalCount / 15);
					contentId=$(obj["areaContent"]).find("contentId");
					pageNo=$(obj["areaContent"]).find("pageNo");
					list_length = areaContent.length;
					$("#titles").empty();
					for (var i = 0; i < areaContent.length; i++) {
						$("#titles").append("<li id='listNum" + i + "'>" 
								+ "<img id='area-img' src='" + imgTag.eq(i).text()
								+ "' onerror='" + 'this.src="/trip/resources/images/noimage.png"' 
								+ "' alt='썸네일' /><p id='titleText"+i+"' class='inlineText'><b>"
								+ areaContent.eq(i).text() + "</b></p></li>");
						$("#titleText"+i).after("<p id='addr' class='inlineText'>[" + addr.eq(i).text() + "]</p>");
					}
					for (var i = 1; i <= totalPage; i++) {
						$("#titles").append("<p id='"+i+"' class='pageNum'>"+ i + "</p>");
					}
				},
				error:function(){
					alert("에러");
				}
		});
		contentOverView();
	}

	function contentOverView(){
		for(var i = 0; i < list_length; i++){
			$.ajax({
				url : "overView.do",
				mothod : "POST",
				data : {"contentId" : contentId.eq(i).text()},
				async:false,
				success : function(obj){
					var overView=$(obj["overView"]).find("overview");
//					alert("그냥 + " + overView);
//					alert("콘덴츠아이디 :" + contentId.eq(i).text());
//					alert("eq : "+ overView.eq(0).text());
					$("#listNum"+i).append("<p id='ad'>" +  overView.text() + "</p>");
//					alert( "끝");
				},
				error:function(){
					alert("에러");
				}
			});
		}
		
	}

	$("#case1").on("click", "li", function(){
		case1_Code = $(this).attr('value');
		case2_Code = null;
		case3_Code = null;
		pageNo = null;
		areaList();
	});

	$("#case2").on("click", "li", function(){
		case2_Code = $(this).attr('value');
		case3_Code = null;
		pageNo = null;
		areaList();
	});

	$("#case3").on("click", "li", function(){
		case3_Code = $(this).attr('value');
		pageNo = null;
		areaList();
	});

	$("#titles").on("click", ".pageNum", function(){
		pageNo = $(this).attr('id');
		contentList();
	})
});