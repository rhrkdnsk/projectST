<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@charset "UTF-8";

a {
	color: #000;
}

.mask {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 10;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
}

#modalLayer {
	display: none;
	position: relative;
}

#modalLayer .modalContent  {
	width: 440px;
	height: 400px;
	padding: 20px;
	border: 1px solid #ccc;
	position: fixed;
	left: 50%;
	top: 25%;
	z-index: 11;
	background: #fff;
	color: black;
}
#modalLayer2 {
	display: none;
	position: relative;
}


#modalLayer2 .modalContent2  {
	width: 440px;
	height: 400px;
	padding: 20px;
	border: 1px solid #ccc;
	position: fixed;
	left: 50%;
	top: 25%;
	z-index: 11;
	background: #fff;
	color: black;
}
.labeltag {
	float:left;
	width:80px;
}

/* 모달사용시 화면가리기용 */
#mask {  
      position:absolute;  
      z-index:9000;  
      background-color:#000;  
      display:none;  
      left:0;
      top:0;
    }
    .window{
      display: none;
      position:absolute;  
      left:100px;
      top:100px;
      z-index:10000;
    }
/*---------------*/
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>header페이지</title>    
</head>
<body>

 <div class="w3-bar w3-black w3-card w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" 
    href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
    
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
    </div>
  </div>
   <a href="#modalLayer" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right modalLink openMask">로그인</a>
   <div id="mask"></div>
	   <div class="window">
		   <div id="modalLayer">
				<div class="modalContent">
					<h2>로고 들어갈 자리</h2>
					<br />
					<ul>
						<li>
							<span class="labeltag">
							<label>이메일</label>
							</span>
							<input type="text" id="email" />
						</li>
						<li>
							<span class="labeltag">
							<label>비밀번호</label>
							</span>
							<input type="password" id="password" />
						</li>
					</ul>
					<button onclick="ajaxFunc()">로그인</button>
					<a href="#modalLayer2" class="modalLink2" >회원가입</a>
					<!-- <button type="button" class="close">닫기</button> -->
				</div>
			</div>
			  	<div id="modalLayer2">
					<div class="modalContent2">
					<form action="signup.do">
					<h2>로고 들어갈 자리</h2>
					<br />
					<ul>
						<li>
							<span class="labeltag">
							<label>이메일</label>
							</span>
							<input type="text" name="email" />
						</li>
						<li>
							<span class="labeltag">
							<label>비밀번호</label>
							</span>
							<input type="password" name="password" />
						</li>
						<li>
							<span class="labeltag">
							<label>닉네임</label>
							</span>
							<input type="text" name="nickname" />
						</li>
						<li>
							<span class="labeltag">
							<label>이름</label>
							</span>
							<input type="text" name="name" />
						</li>
						<li>
							<span class="labeltag">
							<label>전화번호</label>
							</span>
							<input type="text" name="phone" />
						</li>
					</ul>
					<input type="submit" value="가입" />
					<input type="button" class="can" value="취소" />
					</form>
					<!-- <button type="button" class="close">닫기</button> -->
				</div>
			</div>
	</div>
<!--    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right">회원가입</a> -->
  </div>
  
<script type="text/javascript" src="login.js"></script>
</body>
</html>
