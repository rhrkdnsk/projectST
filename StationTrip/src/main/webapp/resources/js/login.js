
$(document).ready(function(){
	  var modalLayer = $("#modalLayer");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 

	  modalLink.click(function(){
	    modalLayer.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent > #email").focus(); 
	    return false;
	  });

	  var modalLayer2 = $("#modalLayer2");
	  var modalLink2 = $(".modalLink2");
	  var modalCont2 = $(".modalContent2");

	  modalLink2.click(function(){
	    modalLayer2.fadeIn("slow");
	    modalCont2.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent2 > #email").focus(); 
	    return false;
	  });
	  
      $('.can').click(function (e) {  
          e.preventDefault();  
          modalLayer2.hide();  
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
        $('.window .close').click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $('#mask, .window').hide();  
        });       

        //검은 막을 눌렀을 때
        $('#mask').click(function () {  
            $(this).hide();  
            $("#modalLayer2").hide();
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
		},
		error:function(){
			alert("로그인 실패ㅜㅜ") ;
		}
	}); 
} 

function sessionCheck(data){
	
	var username= data
	
	//alert(username); 
	if(!username){
		username = null;
		alert("로그인 실패"); 
	} else {
		username = null;
		$("#modalLayer").hide();
		$('#mask').hide();
		$('.window').hide(); 
	}
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
			$("#modalLayer").hide();
			$('#mask').hide();
			$('.window').hide(); 
		},
		error:function(){
			alert("가입 실패ㅜㅜ") ;
		}
	}); 
} 


// ---------------------------- //