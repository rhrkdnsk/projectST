$(function(){
	var contentId = $('#contentId').val();
	var contentTypeId = $('#contentTypeId').val();

	$.ajax({
		url : "detailView.do",
		mothod : "POST",
		data : {"con":contentId, "type":contentTypeId},
		async : false,
		success : function(obj){
			var dView = $(obj['detailView']);
			var iView = $(obj['introView']);

			getCommomData(dView);

			var getService = "getServiceData" + contentTypeId;
			eval(getService)(iView);
		},
		error : function(){
			alert("에러");
		}
	});

	function getCommomData(dView) {

		var img = dView.find('firstimage').text();
		var title = dView.find('title').text();
		var addr = dView.find('addr1').text();
		var content = dView.find('overview').text();
		var homepage = dView.find('homepage').text();

		$('#area-detail-img').append("<img id='area-img' src='" + img
				+ "' onerror='" + 'this.src="/trip/resources/images/no-image-icon-23494.png"' 
				+ "' alt='썸네일' />");
		$('#area-detail-title').append("<p>" + title + "</p>");
		$('#area-detail-addr').append("<p>" + addr + "</p>");
		$('#area-detail-content').append("<p>" + content + "</p>");
		$('#area-detail-homepage').append("<p>" + homepage + "</p>");
	}

	function getServiceData12(iView) {

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

	function getServiceData14(iView) {

		var parkingculture = iView.find('parkingculture').text();
		var chkbabycarriage = iView.find('chkbabycarriage').text();
		var chkpetculture = iView.find('chkpetculture').text();
		var chkcreditcardculture = iView.find('chkcreditcardculture').text();

		$('#area-detail-introtext')
			.append("<p>주차장 : " + parkingculture + "</p>")
			.append("<p>유모차 대여 : " + chkbabycarriage + "</p>")
			.append("<p>애완동물 동반 : " + chkpetculture + "</p>")
			.append("<p>카드사용 : " + chkcreditcardculture + "</p>");
	}

	function getServiceData28(iView) {

		var parkingleports = iView.find('parkingleports').text();
		var chkbabycarriageleports = iView.find('chkbabycarriageleports').text();
		var chkpetleports = iView.find('chkpetleports').text();
		var chkcreditcardleports = iView.find('chkcreditcardleports').text();
		var usefeeleports = iView.find('usefeeleports').text();
		var infocenterleports = iView.find('infocenterleports').text();

		$('#area-detail-introtext')
			.append("<p>주차장 : " + parkingleports + "</p>")
			.append("<p>유모차 대여 : " + chkbabycarriageleports + "</p>")
			.append("<p>애완동물 동반 : " + chkpetleports + "</p>")
			.append("<p>카드사용 : " + chkcreditcardleports + "</p>")
			.append("<p>이용시간 : " + usetimeleports + "</p>")
			.append("<p>문의 : " + infocenterleports + "</p>");
	}

	function getServiceData32(iView) {

		var parkinglodging = iView.find('parkinglodging').text();
		var checkintime = iView.find('checkintime').text();
		var checkouttime = iView.find('checkouttime').text();
		var infocenterlodging = iView.find('infocenterlodging').text();
		var reservationurl = iView.find('reservationurl').text();

		$('#area-detail-introtext')
			.append("<p>주차장 : " + parkinglodging + "</p>")
			.append("<p>입실 : " + checkintime + "</p>")
			.append("<p>퇴실 : " + checkouttime + "</p>")
			.append("<p>문의 : " + infocenterlodging + "</p>")
			.append("<p>홈페이지 : " + reservationurl + "</p>");
	}

	function getServiceData38(iView) {

		var parkingshopping = iView.find('parkingshopping').text();
		var chkbabycarriageshopping = iView.find('chkbabycarriageshopping').text();
		var chkpetshopping = iView.find('chkpetshopping').text();
		var saleitem = iView.find('saleitem').text();
		var opentime = iView.find('opentime').text();
		var restdateshopping = iView.find('restdateshopping').text();
		var infocentershopping =  iView.find('infocentershopping').text();

		$('#area-detail-introtext')
			.append("<p>주차장 : " + parkingshopping + "</p>")
			.append("<p>유모차 대여 : " + chkbabycarriageshopping + "</p>")
			.append("<p>애완동물 동반 : " + chkpetshopping + "</p>")
			.append("<p>판매 품목 : " + saleitem + "</p>")
			.append("<p>영업시간 : " + opentime + "</p>")
			.append("<p>쉬는날 : " + restdateshopping + "</p>")
			.append("<p>문의 : " + infocentershopping + "</p>");
	}

	function getServiceData39(iView) {

		var parkingfood = iView.find('parkingfood').text();
		var kidsfacility = iView.find('kidsfacility').text();
		var chkcreditcardfood = iView.find('chkcreditcardfood').text();
		var opentimefood = iView.find('opentimefood').text();
		var treatmenu = iView.find('treatmenu').text();
		var reservationfood = iView.find('reservationfood').text();
		var infocenterfood = iView.find('infocenterfood').text();

		$('#area-detail-introtext')
			.append("<p>주차장 : " + parkingfood + "</p>")
			.append("<p>키즈존 : " + kidsfacility + "</p>")
			.append("<p>카드여부 : " + chkcreditcardfood + "</p>")
			.append("<p>영업시간 : " + opentimefood + "</p>")
			.append("<p>매뉴 : " + treatmenu + "</p>")
			.append("<p>예약안내 : " + reservationfood + "</p>")
			.append("<p>문의 : " + infocenterfood + "</p>");
	}

});