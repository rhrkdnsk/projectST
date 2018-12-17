<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 구글 로그인  -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="280265674654-tkajr3mg8i747ig3dopron35pks6tj8b.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- ------ -->


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/trip/resources/css/login.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>  
<script type="text/javascript" src="/trip/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/trip/resources/js/login.js"></script>
<title>header페이지</title>    
</head>
<body>

 <div class="w3-bar w3-black w3-card w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" 
    href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="home.do" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
    
    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">열차 조회</a>
    <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Notifications">여행정보 <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="#" class="w3-bar-item w3-button">지역 정보</a>
      <a href="#" class="w3-bar-item w3-button">관광 지도</a>
      <a href="#" class="w3-bar-item w3-button">지역 게시판</a>
    </div>
  </div>
    <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Notifications">게시판 <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="fboardlist.do" class="w3-bar-item w3-button">자유 게시판</a>
      <a href="#" class="w3-bar-item w3-button">질문 과 답변</a>
      <a href="#" class="w3-bar-item w3-button">지역 게시판</a>
    </div>
  </div>
    <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-hide-small w3-padding-large w3-hover-white" title="Notifications">고객 센터<i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="#" class="w3-bar-item w3-button">Q.A</a>
      <a href="#" class="w3-bar-item w3-button">공지 사항</a>
      <a href="#" class="w3-bar-item w3-button">1:1문의</a>
      <a href="glist.do" class="w3-bar-item w3-button">1:1문의</a>
    </div>
  </div>
   <%if(session.getAttribute("login_user") == null) {
		%>
		<a href="#loginModalLayer" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right loginModalLink openMask">로그인</a>
		<%
	} else {
		%>
		<a href="index.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right" onclick="signOut();" >로그아웃</a>
		<%
	}
	%>
   
   <div id="mask"></div>
	   <div class="window">
		   <div id="loginModalLayer">
				<div class="loginModalContent">
					<fieldset>
						<legend>로그인</legend>
						<br />
						<ul>
							<li>
								<div class="g-signin2" <%if(session.getAttribute("login_user") == null) {
									%>
										data-onsuccess="onSignIn" 
									<%
								}
								%>
								data-theme="dark"></div>
							</li>
							<li>
								<span class="labeltag">
								<label>이메일</label>
								</span>
								<input type="text" id="email" <%   
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
								<span class="labeltag">
								<label>비밀번호</label>
								</span>
								<input type="password" id="password" />
							</li>
							<li>
								<br />
							</li>
							<li>
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
								<a href="#searchModalLayer" class="searchModalLink aright" >비밀번호 찾기</a>
							</li>
							<li>
								<button onclick="ajaxLogin()">로그인</button>
								<a href="#signModalLayer" class="signModalLink aright" >회원가입</a>
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
			<div id="searchModalLayer">
				<div class="searchModalContent">
					<fieldset>
						<legend>비밀번호 찾기</legend>
						<br />
						<ul>
							<li>
								<span class="labeltag">
								<label>이메일</label>
								</span>
								<input type="text" id="femail" />
							</li>
							<li>
								<input type="text" id="femailNumber" placeholder="인증번호"/>
								<button onclick="ajaxEmail()">인증번호 전송</button>
							</li>
							<li>
								<a href="#resetModalLayer" class="resetModalLink aright"">비밀번호 재설정</a>
							</li>
							<li>
								<a href="#signModalLayer" class="signModalLink aright" >회원가입</a>
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
			<div id="resetModalLayer">
				<div class="resetModalContent">
					<fieldset>
						<legend>비밀번호 재설정</legend>
						<br />
						<ul>
							<li>
								<span class="labeltag">
								<label >비밀번호</label>
								</span>
								<input type="password" id="remail" />
							</li>
							<li>
								<span class="labeltag">
								<label>확인</label>
								</span>
								<input type="password" id="remailchk" />
							</li>
							<li>
								 <a href="#loginModalLayer" class="loginModalLink2">변경 완료</a>
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
			  	<div id="signModalLayer">
					<div class="signModalContent">
					<fieldset>
						<legend>회원가입</legend>
						<br />
						<ul>
							<li>
								<span class="labeltag">
								<label>이메일</label>
								</span>
								<input type="text" id="Semail" />
							</li>
							<li>
								<span class="labeltag">
								<label>비밀번호</label>
								</span>
								<input type="password" id="Spassword" />
							</li>
							<li>
								<span class="labeltag">
								<label>닉네임</label>
								</span>
								<input type="text" id="Snickname" />
							</li>
							<li>
								<span class="labeltag">
								<label>이름</label>
								</span>
								<input type="text" id="Sname" />
							</li>
							<li>
								<span class="labeltag">
								<label>전화번호</label>
								</span>
								<input type="text" id="Sphone" />
							</li>
							<li>
								<button onclick="ajaxSign()">회원가입</button>
								<input type="button" class="can aright" value="취소" />	
							</li>
						</ul>
					</fieldset>
				</div>
			</div>
	</div>
<!--    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right">회원가입</a> -->
  </div>
<script type="text/javascript">
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function () {
		console.log('User signed out.');
	})

}
</script>
</body>
</html>
