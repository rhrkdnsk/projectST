$(function(){
	var contentId = $('#contentId').val();
	var contentTypeId = $('#contentTypeId').val();

	$.ajax({
		url : "detailView.do",
		mothod : "POST",
		data : {"con":contentId, "type":contentTypeId},
		async : false,
		success : function(obj){
			getCommomData(obj);
			getRepeatData(obj);
		},
		error : function(){
			alert("에러");
		}
	});
	
	function getCommomData(obj) {
		
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
	}
	
	function getRepeatData(obj) {
		var infotext = $(obj['infoView']).find('infotext');
		var infoname = $(obj['infoView']).find('infoname');
		for(var i=0; i < infoname.length; i++){
			
			
			$('#area-detail-infotext').append("<p>" + infoname.eq(i).text() + "</p>" +
					"<p>" + infotext.eq(i).text() + "</p>");
		}
	}
});