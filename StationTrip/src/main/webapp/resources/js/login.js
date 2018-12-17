
$(document).ready(function(){
	  //로그인 모달
	  var modalLayer = $("#loginModalLayer");
	  var modalLink = $(".loginModalLink");
	  var modalCont = $(".loginModalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 

	  modalLink.click(function(){
	    modalLayer.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".loginModalContent > #email").focus(); 
	    return false;
	  });
	  
	  
	  
	  var modalLink5 = $(".loginModalLink2");
	  modalLink5.click(function(){
		  var remail = $("#remail").val();
		  var remailchk = $("#remailchk").val();
		  
		  if(remail != remailchk){
			  alert("비밀번호가 다릅니다")
		  } else {
				//alert(password)
			  var data = { "email": femail, "password": remail };
			  $.ajax({
				  url:"resetpw.do",
				  type:'GET',
				  data: data,
				  success:function(data){
					  if(data == ""){
						  alert("비밀번호 변경에 실패하였습니다")
						  modalLayer.fadeIn("slow");
						  modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
						  $(this).blur();
						  $(".loginModalContent > #email").focus(); 
						  return false;
					  } else {
						  alert(data)
						  $("#resetModalLayer").hide();
						  $("#searchModalLayer").hide();
						  $("#signModalLayer").hide();
						  modalLayer.fadeIn("slow");
						  modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
						  $(this).blur();
						  $(".loginModalContent > #email").focus(); 
						  return false;
					  }
				  },
				  error:function(){
					  alert("로그인 실패ㅜㅜ") ;
				  }
			  }); 
		  	}
	  	});

	  //회원가입 모달
	  var modalLayer2 = $("#signModalLayer");
	  var modalLink2 = $(".signModalLink");
	  var modalCont2 = $(".signModalContent");

	  modalLink2.click(function(){
	    modalLayer2.fadeIn("slow");
	    modalCont2.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".signModalContent > #email").focus(); 
	    return false;
	  });
	  
      $('.can').click(function (e) {  
          e.preventDefault();  
          modalLayer2.hide();  
      }); 
      
      
      //비밀번호찾기 모달
	  var modalLayer3 = $("#searchModalLayer");
	  var modalLink3 = $(".searchModalLink");
	  var modalCont3 = $(".searchModalContent");

	  modalLink3.click(function(){
	    modalLayer3.fadeIn("slow");
	    modalCont3.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".searchModalContent > #email").focus(); 
	    return false;
	  });
	  
      $('.can').click(function (e) {  
          e.preventDefault();  
          modalLayer3.hide();  
      }); 
      
      //비밀번호 재설정 모달
      
      var modalLayer4 = $("#resetModalLayer");
      var modalLink4 = $(".resetModalLink");
      var modalCont4 = $(".resetModalContent"); 
      
      modalLink4.click(function(){
		  var femailNumber = $("#femailNumber").val();
		 // alert("resetNum = " + resetNum);
		  //alert("femailNumber = " + femailNumber)
		  if(femailNumber == resetNum) {
			  modalLayer4.fadeIn("slow");
			  modalCont4.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
			  $(this).blur();
			  $(".searchModalContent > #email").focus(); 
			  return false;
		  } else {
			  alert("인증번호가 다릅니다");
		  }
		
     });
		
});
/* 모달사용시 화면가리기 */
function wrapWindowByMask(){
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  

        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#mask').css({'width':maskWidth,'height':maskHeight});  

        //애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
//         $('#mask').fadeIn(1000);      
        $('#mask').fadeTo("fast",0.8);    

        //윈도우 같은 거 띄운다.
        $('.window').show();
    }

    $(document).ready(function(){
        //검은 막 띄우기
        $('.openMask').click(function(e){
            e.preventDefault();
            wrapWindowByMask();
        });

        //닫기 버튼을 눌렀을 때
        /*$('.window .close').click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $('#mask, .window').hide();  
        });    */   

        //검은 막을 눌렀을 때
        $('#mask').click(function () {  
            $(this).hide();  
            $("#signModalLayer").hide();
            $("#searchModalLayer").hide();
            $("#resetModalLayer").hide();
            $('.window').hide();  
        });      
    });
/* ------------ */

// -------- 로그인 Ajax ---------- //
function ajaxLogin(){
	//alert('click');
	var email = $("#email").val();
	//alert(email)
 	var password = $("#password").val();
	//alert(password)


	
	var data = { "email": email, "password": password };
     
	$.ajax({
		url:"login.do",
		type:'GET',
		data: data,
		success:function(data){
			sessionCheck(data);
			window.location.reload()
		},
		error:function(){
			alert("로그인 실패ㅜㅜ") ;
		}
	}); 
	
	var cookiecheck = $("#idCheck").prop("checked");
	if(cookiecheck == true){
		var saveId = $.cookie("saveId");
		//alert(saveId);
		if(saveId == null || saveId == undefined){
			createCookie();
		}
		if(saveId != email){
			var demail = decodeURI(email);
			//alert("demail = "+demail);
			$.removeCookie("saveId");
			createCookie();
		}
	} else {
		$.removeCookie("saveId");
	}
	
} 

function sessionCheck(data){
	
	var username= data
	
	//alert(username); 
	if(!username){
		username = null;
		alert("로그인 실패"); 
	} else {
		//username = null;
		$("#loginModalLayer").hide();
		$('#mask').hide();
		$('.window').hide(); 
	}
}

function createCookie(){

	var email = $("#email").val();
	var data = { "email": email };
	$.ajax({
		url:"createCookie.do",
		type:'GET',
		data: data,
		success:function(){
			//alert("ajax = " + $.cookie("saveId"));
		},
		error:function(){
			alert("쿠키생성 실패ㅜㅜ") ;
		}
	}); 

}

//------------------------------------- //


// -------  회원가입  Ajax --------- //

function ajaxSign(){
	//alert('click');
	var Semail = $("#Semail").val();
	//alert("email = "+Semail);
 	var Spassword = $("#Spassword").val();
 	//alert("password = "+Spassword);
 	var Snickname = $("#Snickname").val();
 	//alert("nickname = "+Snickname);
 	var Sname = $("#Sname").val();
 	//alert("name = "+Sname);
 	var Sphone = $("#Sphone").val();
 	//alert("phone = "+Sphone);
	
	var data = { "email": Semail, "password": Spassword, "nickname": Snickname, "name": Sname, "phone": Sphone };
     
	$.ajax({
		url:"signup.do",
		type:'GET',
		data: data,
		success:function(data){
			alert(data);
			$("#Semail").val("");
			$("#Spassword").val("");
			$("#Snickname").val("");
			$("#Sname").val("");
			$("#Sphone").val("");
			$("#signModalLayer").hide();
			$("#loginModalLayer").fadeIn("slow");
			$(".loginModalContent").css({"margin-top" : -$(".loginModalContent").outerHeight()/2, "margin-left" : -$(".loginModalContent").outerWidth()/2});
			/*$('#mask').hide();
			$('.window').hide();*/ 
		},
		error:function(){
			alert("가입 실패ㅜㅜ") ;
		}
	}); 
} 


// ---------------------------- //


//-------  이메일인증 Ajax --------- //
var resetNum;
var femail;
function ajaxEmail(){
	//alert('click');
	femail = $("#femail").val();
	
	var data = { "email": femail };
  
	$.ajax({
		url:"mailSender.do",
		type:'GET',
		data: data,
		success:function(data){
			//alert(data);
			if(data != ""){
				alert("인증번호 전송 완료")
				resetNum = data;
			} else {
				alert("정확한 이메일을 입력하세요")
			}
		},
		error:function(){
			alert("인증 실패ㅜㅜ") ;
		}
	}); 
}
//---------------------------- //


// 구글 로그인, 로그아웃 //
function onSignIn(googleUser) {
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    console.log('Full Name: ' + profile.getName());
    console.log('Given Name: ' + profile.getGivenName());
    console.log('Family Name: ' + profile.getFamilyName());
    console.log("Image URL: " + profile.getImageUrl());
    console.log("Email: " + profile.getEmail());

    // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);
    
    var google_name = profile.getName();
//    sessionStorage.setItem("login_user", google_name );
//    
//    var chk = sessionStorage.getItem("login_user");
//    alert(chk);
    
    //alert(google_name)
	var data = { "google_name": google_name };
  
	$.ajax({
		url:"googlelogin.do",
		type:'GET',
		data: data,
		success:function(data){
			//alert(data);
			
		},
		error:function(){
			alert("구글로그인 실패ㅜㅜ") ;
		}
	}); 
	window.location.reload()
};
  
//function signOut() {
//	var auth2 = gapi.auth2.getAuthInstance();
//	auth2.signOut().then(function () {
//		console.log('User signed out.');
//	})
//
//}

function googleOut(){
	
	$.ajax({
		url:"signout.do",
		type:'GET',
		success:function(){
			alert("로그아웃");
		},
		error:function(){
			alert("로그인 실패ㅜㅜ") ;
		}
	})

}

// ----------------------------------- //