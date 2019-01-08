/*	이메일 정규식	*/
var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

/*	비밀번호 정규식
	하나 이상의 영문 대문자 (?=.*?[AZ])
	적어도 하나의 영문 소문자 (?=.*?[az])
	하나 이상의 숫자 (?=.*?[0-9])
	하나 이상의 특수 문자 (?=.*?[#?!@$%^&*-])
	최소 8, 최대20 {8,20} (앵커 포함)	*/
var passRule = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$/;

/*	핸드폰 정규식	*/
var phoneRule = /^\d{3}-\d{3,4}-\d{4}$/;

$(function(){
	/*	로그인	*/
	$("#loginbtn").click(function(){
		var login_email = $("#email").val();
		var login_pw = $("#password").val();
		if(login_email == null || login_email == ""){
			alert("이메일을 입력하세요")
		} else if(login_pw == null || login_pw == ""){
			alert("비밀번호를 입력하세요")
		} else {
			ajaxLogin();
		}
	});
	
	/*	회원가입	*/
	$("#tsign").click(function(){
		var semail = $("#Semail").val();
		var spw = $("#Spassword").val();
		var snickname = $("#Snickname").val();
		var sname = $("#Sname").val();
		var sphone = $("#Sphone").val();
		if(semail == null || semail == ""){
			alert("이메일을 입력하세요")
		} else if(!emailRule.test(semail)){
			alert("이메일을 제대로 입력하세요")
		} else if(spw == null || spw == ""){
			alert("비밀번호를 입력하세요")
		} else if(!passRule.test(spw)){
			alert("비밀번호는 대문자,소문자,숫자,특수문자를 사용하여 8자이상 20자이하로 입력하세요")
		} else if(snickname == null || snickname == ""){
			alert("닉네임을 입력하세요")
		} else if(sname == null || sname == ""){
			alert("이름을 입력하세요")
		} else if(sphone == null || sphone == ""){
			alert("전화번호를 입력하세요")
		} else if(!phoneRule.test(sphone)){
			alert(" 숫자 사이에  - 를 입력하세요 ")
		} else {
			ajaxSign()
		}
	});
	
	/*	비밀번호 변경	*/
	$(".loginModalLink2").click(function(){
		var remail = $("#remail").val()
		if(!passRule.test(remail)){
			alert("비밀번호는 대문자,소문자,숫자,특수문자를 사용하여 8자이상 20자이하로 입력하세요")
		} else {
			console.log("pwchange")
			pwChange()
		}
	})

})

$(function(){
	$("#inquiry_submit").click(function(){
		var inquiry_title = $("#inquiry_title").val();
		var inquiry_content = CKEDITOR.instances['inquiry_content'].getData();
		console.log(inquiry_content)
		if(inquiry_title == null || inquiry_title == ""){
			event.preventDefault();
			alert("제목을 입력하세요")
		} else if(inquiry_content == null || inquiry_content == ""){
			event.preventDefault();
			alert("내용을 입력하세요")
		}
	})
})