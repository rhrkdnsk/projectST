<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE"> 
<META HTTP-EQUIV="EXPIRES" CONTENT="Mon, 22 Jul 2002 11:12:01 GMT">

<!-- 구글 로그인  -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="280265674654-1dvded6q2daokt54rmif098cno7cc0o6.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- ------ -->

<link rel="stylesheet" href="/trip/resources/css/google&fb.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<link rel="stylesheet" href="/trip/resources/css/login.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>  
<script type="text/javascript" src="/trip/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/trip/resources/js/constraints.js"></script>
<script type="text/javascript" src="/trip/resources/js/login.js"></script>



<title>역장수</title>    
</head>
<body>

 <div class="w3-bar w3-black w3-card w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" 
    href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="home.do" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
    
    <a href="cityinfo.do" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">열차 조회</a>
    <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Notifications">여행정보 <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="areaboard.do" class="w3-bar-item w3-button">지역 정보</a>
      <a href="#" class="w3-bar-item w3-button">관광 지도</a>
      <a href="#" class="w3-bar-item w3-button">지역 게시판</a>
    </div>
  </div>
    <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Notifications">게시판 <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="fsessiondel.do" class="w3-bar-item w3-button">자유 게시판</a>
      <a href="aboarddelsession.do" class="w3-bar-item w3-button">지역 게시판</a>
    </div>
  </div>
    <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Notifications">고객 센터<i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="rsessiondel.do" class="w3-bar-item w3-button">공지 사항</a>
      <a href="qlist.do" class="w3-bar-item w3-button">Q.A</a>
       <a 
      <%if(session.getAttribute("login_userId")==null){
    	  %>
    	href="#"
    	  <%} else { %>
      	href="inquiry.do"
      <%} %> class="w3-bar-item w3-button">1:1문의</a>
    </div>
  </div>
  <%
  		if(session.getAttribute("login_admin") != null) {
  			%>
 		<div class="w3-dropdown-hover w3-hide-small">
    	<button class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Notifications">관리자 고객 센터<i class="fa fa-caret-down"></i></button>     
    	<div class="w3-dropdown-content w3-card-4 w3-bar-block">
    	 <a href="gsessiondel.do" class="w3-bar-item w3-button">회원 관리</a>
      <a href="rsessiondel.do" class="w3-bar-item w3-button">공지사항 관리</a>
      <a href="qlist.do" class="w3-bar-item w3-button">Q.A</a>
      <a href="admin_inquiry_sdel.do" class="w3-bar-item w3-button">1:1문의</a>
    </div>
  </div>  			<%
  		}
  	
  	%>
 

<script type="text/javascript" src="/trip/resources/js/google&fb.js"></script> 


   <%if(session.getAttribute("login_userId") == null) {
		%>
		<a href="#loginModalLayer" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right loginModalLink openMask">로그인</a>
		<%
	} else {
		%>
		<a href="index.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right" onclick="signOut();" >로그아웃</a>
		<span class="w3-dropdown-hover w3-hide-small w3-right">
		<%if(session.getAttribute("login_user") == null) {
			
			%>
			<a href="#"  style="color:white;text-decoration:none">
				<button class="w3-button w3-hide-small w3-padding-large w3-hover-white" onclick="alert('역장수 회원만 이용가능')"><%=session.getAttribute("login_userId") %></button>
			</a>
			<%
		} else {
			%> 
			<a href="mypage.do"  style="color:white;text-decoration:none">
				<button class="w3-button w3-hide-small w3-padding-large w3-hover-white"><%=session.getAttribute("login_userId") %></button>
			</a>
			<%	} 
		%>
		</span>
		<%
	}
	%>
   
   <div id="mask"></div>
	   <div class="window">
		   <div id="loginModalLayer">
				<div class="loginModalContent">
					<fieldset class="login_fieldl">
						<legend>로그인</legend>
						<ul class="login_ul">
							<li>
							<button class="loginBtn loginBtn--facebook"  id="authBtn" value="checking..." scope="public_profile,email" onlogin="checkFacebookStatus();"  onclick="
							  	if(this.value === 'Login'){
							  		//now logout
							  		FB.login(function(response){
							  			console.log('login =>', response);
							  			
							  			checkFacebookStatus(response);
							  		});
							  	}
							  ">
							  Login with Facebook
							</button>

							</li>
							<li>
								<button class="loginBtn loginBtn--google" id="loginBtn" value="checking..." onclick="
							 		if(this.value == 'Login'){
							 			gauth.signIn().then(function(){
							 				console.log('gauth.signIn');
							 				checkLoginStatus();
							 			});
							 		}">
								  Login with Google
								</button>

							<li>
							</li>
						</ul>
						<ul class="login_ul">
							<li style="margin-bottom:5px;">
								<input type="text" class="login_inputbox" id="email" placeholder="Email" <%   
								Cookie[] cookies = request.getCookies() ;
								String cName = null;
							    String cValue = null;
							    if(cookies != null){
							    	for(int i=0; i < cookies.length; i++){
							            Cookie c = cookies[i] ;
							            cName = c.getName();
							            cValue = c.getValue() ;
							        	if(cName.equals("saveId")){
									%>
									value="<%=cValue %>"
									<%
							    		}
							    	}
							    }
								%>/>
							</li>
							<li>
								<input type="password" class="login_inputbox"  id="password" placeholder="Password"  onkeydown = "if (event.keyCode == 13)
                       				document.getElementById('loginbtn').click()"/>
							</li>
							<li style="font-size:3px;margin-top:10px;">
								<input type="checkbox" id="idCheck" <%   							     
							    if(cookies != null){
							    	for(int i=0; i < cookies.length; i++){
							            Cookie c = cookies[i] ;
							            cName = c.getName();
							            cValue = c.getValue() ;
							        	if(cName.equals("saveId")){
									%>
										checked
									<%
							        	}
							    	}
							    }
								%>>아이디 저장
								<a href="#searchModalLayer" class="searchModalLink aright" ><button class="login_button" id="pwSearch" >비밀번호 찾기</button></a>
							</li>
							<li>
								<button id="loginbtn" class="login_button">로그인</button>
								<a href="#signModalLayer" class="signModalLink aright" ><button id="signBtn" class="login_button">회원가입</button></a>
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
			<div id="searchModalLayer">
				<div class="searchModalContent">
					<fieldset class="login_fieldl">
						<legend>비밀번호 찾기</legend>
						<br />
						<ul class="login_ul">
							<li>
								<input type="text" id="femail"  class="login_inputbox"  placeholder="Email" />
							</li>
							<li>
								<input type="text" id="femailNumber"  class="login_inputbox"  placeholder="인증번호"/>
								<button id="femailBtn" class="login_button2" style="border-radius: unset;" onclick="ajaxEmail()">인증번호<br>전송</button>
							</li>
							<li>
							<br><br>
							</li>
							<li>
								<a href="#resetModalLayer" class="resetModalLink aright"><button id="signBtn" class="login_button2">비밀번호 재설정</button></a>
							</li>
							<li>
								<a href="#signModalLayer" class="signModalLink aright" ><button id="signBtn2" class="login_button2">회원가입</button></a>
								<button id="signBtn2" class="can aright login_button2">취소</button>
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
			<div id="resetModalLayer">
				<div class="resetModalContent">
					<fieldset class="login_fieldl">
						<legend>비밀번호 재설정</legend>
						<br />
						<ul class="login_ul">
							<li>
								<input type="password" id="remail" class="login_inputbox"  placeholder="Password" />
							</li>
							<li>
								<input type="password" id="remailchk" class="login_inputbox"  placeholder="Password 확인"/>
							</li>
							<li>
								 <a href="#loginModalLayer" class="loginModalLink2"><button id="signBtn" class="login_button2">변경 완료</button></a>
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
			  	<div id="signModalLayer">
					<div class="signModalContent">
					<fieldset class="login_fieldl">
						<legend>회원가입</legend>
						<ul class="login_ul">
							<li>
								<input type="text" id="Semail" class="login_inputbox" placeholder="Email" />
							</li>
							<li>
								<input type="password" id="Spassword" class="login_inputbox"  placeholder="Password"/>
							</li>
							<li>
								<input type="text" id="Snickname" class="login_inputbox"  placeholder="닉네임"/>
							</li>
							<li>
								<input type="text" id="Sname" class="login_inputbox"  placeholder="이름" />
							</li>
							<li>
								<input type="text" id="Sphone"  class="login_inputbox" placeholder="전화번호" onkeydown = "if (event.keyCode == 13)
                       				document.getElementById('tsign').click()"/>
							</li>
							<li>
								<button id="tsign" class="login_button2">회원가입</button>
								<button id="tsignCan" class="can aright login_button2">취소</button>
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
	</div>
  </div>
<script type="text/javascript">

</script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</body>
</html>
