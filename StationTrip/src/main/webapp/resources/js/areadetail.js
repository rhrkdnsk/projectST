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
		var iView = $(obj['introView']);
		alert(iView.text())
		
		var parking =  iView.find('parking').text();
		var chkbabycarriage =  iView.find('chkbabycarriage').text();
		var chkpet =  iView.find('chkpet').text();
		var chkcreditcard =  iView.find('chkcreditcard').text();

		$('#area-detail-introtext')
			.append("<p>주차장 : " + parking + "</p>")
			.append("<p>유모차 대여 : " + chkbabycarriage + "</p>")
			.append("<p>애완동물 동반 : " + chkpet + "</p>")
			.append("<p>카드사용 : " + chkcreditcard + "</p>")
	}

	function getServiceData14(obj) {
		
		var parkingculture = $(obj['introView']).find('parkingculture').text();
		var chkbabycarriage = $(obj['introView']).find('chkbabycarriage').text();
		var chkpetculture = $(obj['introView']).find('chkpetculture').text();
		var chkcreditcardculture = $(obj['introView']).find('chkcreditcardculture').text();
		
		$('#area-detail-introtext').append("<p>주차장 : " + parkingculture + "</p>");
		$('#area-detail-introtext').append("<p>유모차 대여 : " + chkbabycarriage + "</p>");
		$('#area-detail-introtext').append("<p>애완동물 동반 : " + chkpetculture + "</p>");
		$('#area-detail-introtext').append("<p>카드사용 : " + chkcreditcardculture + "</p>");
	}
	
	function getServiceData28(obj) {
		
		var parkingleports = $(obj['introView']).find('parkingleports').text();
		var chkbabycarriageleports = $(obj['introView']).find('chkbabycarriageleports').text();
		var chkpetleports = $(obj['introView']).find('chkpetleports').text();
		var chkcreditcardleports = $(obj['introView']).find('chkcreditcardleports').text();
		var openperiod = $(obj['introView']).find('openperiod').text();
		var usetimeleports = $(obj['introView']).find('usetimeleports').text();
		var expagerangeleports = $(obj['introView']).find('expagerangeleports').text();
		var usefeeleports = $(obj['introView']).find('usefeeleports').text();
		var reservation = $(obj['introView']).find('reservation').text();
		var infocenterleports = $(obj['introView']).find('infocenterleports').text();
		
		$('#area-detail-introtext').append("<p>주차장 : " + parkingleports + "</p>");
		$('#area-detail-introtext').append("<p>유모차 대여 : " + chkbabycarriageleports + "</p>");
		$('#area-detail-introtext').append("<p>애완동물 동반 : " + chkpetleports + "</p>");
		$('#area-detail-introtext').append("<p>카드사용 : " + chkcreditcardleports + "</p>");
		$('#area-detail-introtext').append("<p>이용시간 : " + usetimeleports + "</p>");
		$('#area-detail-introtext').append("<p>문의 : " + infocenterleports + "</p>");
	}
	
	function getServiceData32(obj) {

		var parkinglodging = $(obj['introView']).find('parkinglodging').text();
		var checkintime = $(obj['introView']).find('checkintime').text();
		var checkouttime = $(obj['introView']).find('checkouttime').text();
		var infocenterlodging = $(obj['introView']).find('infocenterlodging').text();
		var reservationurl = $(obj['introView']).find('reservationurl').text();
		
		$('#area-detail-introtext').append("<p>주차장 : " + parkinglodging + "</p>");
		$('#area-detail-introtext').append("<p>입실 : " + checkintime + "</p>");
		$('#area-detail-introtext').append("<p>퇴실 : " + checkouttime + "</p>");
		$('#area-detail-introtext').append("<p>문의 : " + infocenterlodging + "</p>");
		$('#area-detail-introtext').append("<p>홈페이지 : " + reservationurl + "</p>");
	}
	
	function getServiceData38(obj) {
		
		var parkingshopping = $(obj['introView']).find('parkingshopping').text();
		var chkbabycarriageshopping = $(obj['introView']).find('chkbabycarriageshopping').text();
		var chkpetshopping = $(obj['introView']).find('chkpetshopping').text();
		var chkcreditcard = $(obj['introView']).find('chkcreditcard').text();
		
		var saleitem = $(obj['introView']).find('saleitem').text();
		var opentime = $(obj['introView']).find('opentime').text();
		var restdateshopping = $(obj['introView']).find('restdateshopping').text();
		var shopguide = $(obj['introView']).find('shopguide').text();
		var infocentershopping = $(obj['introView']).find('infocentershopping').text();
		
		$('#area-detail-introtext').append("<p>주차장 : " + parkingshopping + "</p>");
		$('#area-detail-introtext').append("<p>유모차 대여 : " + chkbabycarriageshopping + "</p>");
		$('#area-detail-introtext').append("<p>애완동물 동반 : " + chkpetshopping + "</p>");
		$('#area-detail-introtext').append("<p>카드여부 : " + chkcreditcard + "</p>");
		$('#area-detail-introtext').append("<p>판매 품목 : " + saleitem + "</p>");
		$('#area-detail-introtext').append("<p>영업시간 : " + opentime + "</p>");
		$('#area-detail-introtext').append("<p>쉬는날 : " + restdateshopping + "</p>");
		$('#area-detail-introtext').append("<p>매장안내 : " + shopguide + "</p>");
		$('#area-detail-introtext').append("<p>문의 : " + infocentershopping + "</p>");
	}
	
	function getServiceData39(obj) {
		
		var parkingfood = $(obj['introView']).find('parkingfood').text();
		var kidsfacility = $(obj['introView']).find('kidsfacility').text();
		var chkcreditcardfood = $(obj['introView']).find('chkcreditcardfood').text();
		var opentimefood = $(obj['introView']).find('opentimefood').text();
		var firstmenu = $(obj['introView']).find('firstmenu').text();
		var treatmenu = $(obj['introView']).find('treatmenu').text();
		var reservationfood = $(obj['introView']).find('reservationfood').text();
		var infocenterfood = $(obj['introView']).find('infocenterfood').text();
		
		$('#area-detail-introtext').append("<p>주차장 : " + parkingfood + "</p>");
		$('#area-detail-introtext').append("<p>키즈존 : " + kidsfacility + "</p>");
		$('#area-detail-introtext').append("<p>카드여부 : " + chkcreditcardfood + "</p>");
		$('#area-detail-introtext').append("<p>영업시간 : " + opentimefood + "</p>");
		$('#area-detail-introtext').append("<p>매뉴 : " + treatmenu + "</p>");
		$('#area-detail-introtext').append("<p>예약안내 : " + reservationfood + "</p>");
		$('#area-detail-introtext').append("<p>문의 : " + infocenterfood + "</p>");
	}

});