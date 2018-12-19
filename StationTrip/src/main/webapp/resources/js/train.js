$(function() {
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