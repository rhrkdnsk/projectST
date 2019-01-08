$(function(){
	var contentId = $('#contentId').val();
	
	$.ajax({
		url : "detailView.do",
		mothod : "POST",
		data : {"con":contentId},
		async : false,
		success : function(obj){
			var img = $(obj['detailView']).find('firstimage');
			var title = $(obj['detailView']).find('title');
			var addr = $(obj['detailView']).find('addr1');
			var content = $(obj['detailView']).find('overview');
			var homepage = $(obj['detailView']).find('homepage');
			
			$('#area-detail-img').append("<img id='area-img' src='" + img.text()
								+ "' onerror='" + 'this.src="/trip/resources/images/no-image-icon-23494.png"' 
								+ "' alt='썸네일' />");
			$('#area-detail-title').append("<p>" + title.text() + "</p>");
			$('#area-detail-addr').append("<p>" + addr.text() + "</p>");
			$('#area-detail-content').append("<p>" + content.text() + "</p>");
			$('#area-detail-homepage').append("<p>" + homepage.text() + "</p>");
			
		},
		error : function(){
			alert("에러");
		}
	});

});