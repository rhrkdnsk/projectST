<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html lang="en">
<head>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
.mySlides {display:none;}
</style>
</head>


<div class="w3-display-container w3-animate-opacity">
  <img src="/trip/resources/images/a1.jpg" alt="boat" style="width:100%;min-height:350px;max-height:600px;">
  
</div>
<div class="w3-content w3-section" style="max-width:1600px;">

  <!-- Good offers -->
 <div class="w3-container w3-margin-top">
    <h3>지금당장 떠나세요~</h3>
    <h6>멀리가지 말고 <strong>국내!</strong> 여행을 가세요~ </h6>
  </div>
  
  <div class="w3-row-padding w3-text-white w3-large">
  
    <div class="w3-half w3-margin-bottom">
      <div class="w3-display-container">
      <div class="w3-container w3-black">
      <h2><i class="w3-margin-right"></i>열차 찾기</h2>
    </div>
    <div class="w3-container w3-blue w3-padding-16">
    
    
    
    
    
	<form action="/action_page.php target="_blank"">
	
	
	
	</form>
      
      
      
      
      
      
    </div>
      </div>
       <div class="w3-row-padding" style="margin:0 -16px">
        <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
            <img src="/trip/resources/images/ckdsud.jpg" alt="Pisa" style="width:100%; max-width:500px">
            <span class="w3-display-bottomleft w3-padding">창녕</span>
          </div>
        </div>
     <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
       <img class="mySlides" src="/trip/resources/images/ckdsud.jpg" alt="boat" style="width:100%; max-width:500px">
  <img class="mySlides" src="/trip/resources/images/eowjs.jpg" alt="boat" style="width:100%; max-width:500px">
    <img class="mySlides" src="/trip/resources/images/chunma.jpg" alt="boat" style="width:100%; max-width:500px">
    <img class="mySlides" src="/trip/resources/images/a3.jpg" alt="boat" style="width:100%; max-width:500px">
        <span class="w3-display-bottomleft w3-padding"></span>
      </div>
    </div>
      </div>
    </div>
    
     <div class="w3-half w3-margin-bottom">
      <img src="/trip/resources/images/bbb.jpg" alt="Austria" style="width:100%">
      <div class="w3-container w3-white">
        <button class="w3-button w3-margin-bottom w3-right">자세히..</button>
      </div>
    </div>
      </div>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 4000);    
}
</script>
  <!-- Explore Nature -->
  <div class="w3-container">
    <h3>아름다운 우리 산과 바다</h3>
    <p>우리와 함께 여행하고 최고의 자연을 볼 수 있습니다.</p>
  </div>
  <div class="w3-row-padding">
    <div class="w3-half w3-margin-bottom">
      <img src="/trip/resources/images/ocean2.jpg" alt="Norway" style="width:100%">
      <div class="w3-container w3-white">
        <h3>동 해</h3>
        <p class="w3-opacity"></p>
		<p>시원한 바다 바람을 즐기고, 아침 해가 뜨는 동해로 가요!</p>
        <button class="w3-button w3-margin-bottom w3-right" >자세히..</button>
      </div>
    </div>
    <div class="w3-half w3-margin-bottom">
      <img src="/trip/resources/images/mountains2.jpg" alt="Austria" style="width:100%">
      <div class="w3-container w3-white">
        <h3>강원도 겨울 산</h3>
        <p>새하얀 눈길을 걸으며...</p>
        <button class="w3-button w3-margin-bottom w3-right">자세히..</button>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
