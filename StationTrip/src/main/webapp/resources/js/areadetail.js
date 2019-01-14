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

			var getService = "getServiceData" + contentTypeId;
			eval(getService)(obj);
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

	function getServiceData12(obj) {

		var parking = $(obj['introView']).find('parking').text();
		var babycarriage = $(obj['introView']).find('chkbabycarriage').text();
		var chkpet = $(obj['introView']).find('chkpet').text();
		var reditcard = $(obj['introView']).find('chkcreditcard').text();

		$('#area-detail-introtext').append("<p>주차장 : " + parking + "</p>");
		$('#area-detail-introtext').append("<p>유모차 대여 : " + babycarriage + "</p>");
		$('#area-detail-introtext').append("<p>애완동물 동반 : " + chkpet + "</p>");
		$('#area-detail-introtext').append("<p>카드 사용 : " + creditcard + "</p>");
		
	}

	function getServiceData14(obj) {
		var parking = $(obj['introView']).find('parkingculture').text();
		var babycarriage = $(obj['introView']).find('chkbabycarriage').text();
		var chkpet = $(obj['introView']).find('chkpetculture').text();
		var reditcard = $(obj['introView']).find('chkcreditcardculture').text();
		
		$('#area-detail-introtext').append("<p>주차장 : " + parking + "</p>");
		$('#area-detail-introtext').append("<p>유모차 대여 : " + babycarriage + "</p>");
		$('#area-detail-introtext').append("<p>애완동물 동반 : " + chkpet + "</p>");
		$('#area-detail-introtext').append("<p>카드 사용 : " + reditcard + "</p>");
	}
	
	function getServiceData15(obj) {

	}
	
	function getServiceData25(obj) {

	}
	
	function getServiceData28(obj) {

	}
	
	function getServiceData32(obj) {

	}
	
	function getServiceData38(obj) {

	}
	
	function getServiceData38(obj) {

	}

});