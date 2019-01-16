$(function(){
	var case1_Code = null;
	var case2_Code = null;
	var case3_Code = null;
	var pageNo = null;
	
	areaList();
	
	/* Area List 생성 */
	function getAreaSearchData(obj, num){
		var name = $(obj["areaCase" + num]).find("name");
		var code = $(obj["areaCase" + num]).find("code");

		$("#case" + num).empty();

		for(var i = 0; i < name.length; i++){
			$("#case" + num).append("<li value='"+ code.eq(i).text() +"'>" + name.eq(i).text() + "</li>");
		}
	}
	
	/* Area Data 요청 */
	function areaList(){
		$.ajax({
			url : "areaList.do",
			mothod : "POST",
			data : {"case1":case1_Code,"case2":case2_Code,"case3":case3_Code},
			async:false,
			success : function(obj){

				for(var num = 1; num < 3; num++){
					getAreaSearchData(obj, num);
				}

				contentList();
			},
			error:function(){
				alert("에러");
			}
		});
	}

	/* Content Block 생성 */
	function getContentSize(obj, contentId, rows){
		var count = $(obj["content"]).find("totalCount").text().trim();
		var totalPage = Math.ceil(count / rows);

		$("#titles").empty();

		for(var i = 0; i < rows; i++){
			$("#titles").append("<li id='" + contentId.eq(i).text().trim() + "' class='contentId'></li>" );
			$("#"+ contentId.eq(i).text().trim()).append("<div id='content-img-" + i + "'class='img-side'></div>" );
			$("#"+ contentId.eq(i).text().trim()).append("<div id='content-text-" + i + "'class='text-side'></div><butten");
		}

		for (var i = 1; i <= totalPage; i++) {
			$("#titles").append("<p id='"+i+"' class='pageNum'>"+ i + "</p>");
		}
	}
	
	/* Content Block > Title, Image, Content-text 입력 */
	function getContentData(contentId, rows){
		for(var i = 0; i < rows; i++){
			$.ajax({
				url : "overView.do",
				mothod : "POST",
				data : {"contentId" : contentId.eq(i).text().trim()},
				async:false,
				success : function(obj){

					var imgSrc = $(obj["overView"]).find("firstimage");
					var title = $(obj["overView"]).find("title");
					var overView = $(obj["overView"]).find("overview");

					$("#content-img-"+i).append("<img id='area-img' src='" + imgSrc.text()
							+ "' onerror='" + 'this.src="/trip/resources/images/no-image-icon-23494.png"' 
							+ "' alt='썸네일' />");
					$("#content-text-"+i).append("<p id='titleText" + i + "' class='titleText'>" + title.text() + "</p>");
					$("#titleText"+i).after("<p class='overView'>" +  overView.text() + "</p>");
				},
				error:function(){
					alert("에러");
				}
			});
		}
	}
	
	/* Content Data 요청 */
	function contentList(){
		$.ajax({
			url : "contentList.do",
			mothod : "POST",
			data : {"case1":case1_Code,"case2":case2_Code,"case3":case3_Code,"pageNo":pageNo},
			async:false,
			success : function(obj){

				var contentId = $(obj["content"]).find("contentId");
				var rows = $(obj["content"]).find("numOfRows").text().trim();

				getContentSize(obj, contentId, rows);
				getContentData(contentId, rows);
			},
			error:function(){
				alert("에러");
			}
		});
	}

	/* 클릭 이벤트 */
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
	});

	$("#titles").on("click", ".img-side", function(){
		var con = $(this).parent().attr('id');
		if(case3_Code == null){
			case3_Code = "12";
		}
		location.href='areaDetail.do?con=' + con + '&type=' + case3_Code;
	});
	
});