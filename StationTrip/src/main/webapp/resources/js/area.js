$(function(){
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
	
	$("#case2").change(function(){
		alert($(case2).val());
	});
});
