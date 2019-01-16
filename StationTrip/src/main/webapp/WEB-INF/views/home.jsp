<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html lang="en">
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" type="text/css" media="screen" href="/trip/resources/css/main1.css" /> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> 


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
.max-small {
    width: 760px; height: 450px;

}

</style>


</head>


<div class="w3-display-container w3-animate-opacity">
  <img src="/trip/resources/images/s1.jpg" alt="boat" style="width:100%;min-height:350px;max-height:600px;">
  
</div>
<div class="w3-content w3-section" style="max-width:1600px;">

  <!-- Good offers -->	
 <div class="w3-container w3-margin-top">
    <h3>지금당장 떠나세요~</h3>
    <h6>멀리가지 말고 <strong>국내!</strong> 여행을 가세요~ </h6>
  </div>
  
 <div class="w3-row-padding w3-large">
  
    <div class="w3-half w3-margin-bottom">
      
       <div class="w3-row-padding" style="margin:0 -16px">
        
     <div class="w3-half w3-margin-bottom">
          <div class="w3-display-container">
  <img class="mySlides max-small" src="/trip/resources/images/ckdsud.jpg" alt="boat" style="height: 450px">
  <img class="mySlides max-small" src="/trip/resources/images/eowjs.jpg" alt="boat" style="height: 450px">
    <img class="mySlides max-small" src="/trip/resources/images/chunma.jpg" alt="boat" style="height: 450px">
    <img class="mySlides max-small" src="/trip/resources/images/a3.jpg" alt="boat" style="height: 450px">
     <img class="mySlides max-small" src="/trip/resources/images/s2.jpg" alt="boat" style="height: 450px">
      <img class="mySlides max-small" src="/trip/resources/images/s3.jpg" alt="boat" style="height: 450px">
       <img class="mySlides max-small" src="/trip/resources/images/s4.jpg" alt="boat" style="height: 450px">
        <span class="w3-display-bottomleft w3-padding"></span> 
      </div>
       <div class="w3-container w3-white">
     
      	<h3>다른사이트</h3>
       <h6>서울시 <strong>공식</strong> 관광정보 사이트~ </h6>
       </div>
       <img class="max-small" src="/trip/resources/images/visitseoul_sns.png" alt="boat" style="height: 450px">
       <a href="http://korean.visitseoul.net/index" class="w3-button w3-margin-bottom">자세히..</a>
    </div>
      </div>
    </div>
<!--      <div class="w3-half w3-margin-bottom"> -->
<!--       <img class='max-small' src="/trip/resources/images/bbb.jpg" alt="Austria" style="width: 760px; height: 1000px;"> -->
<!--     </div> -->
<div class=" w3-half w3-margin-bottom"> 
       <div class="target" data-scale="2" data-image="/trip/resources/images/bbb.jpg" style="width: 760px; height: 1000px;"></div> 
    </div> 

      </div>
       <script src="/trip/resources/js/main1.js"></script>
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
      <img class='max-small' src="/trip/resources/images/dhleh1.jpg" alt="Norway" style="height: 400px">
      <div class="w3-container w3-white">
        <h3>외 도</h3>
        <p class="w3-opacity"></p>
		<p>아름답고 이국적인 외도로~</p>
        <a href="http://localhost:9999/trip/areaDetail.do?con=126581&type=12" class="w3-button w3-margin-bottom w3-right">자세히..</a>
      </div>
    </div>
    <div class="w3-half w3-margin-bottom">
      <img class='max-small' src="/trip/resources/images/rhdtkstjd.jpg" alt="Austria" style="height: 400px">
      <div class="w3-container w3-white">
        <h3>공주 공산성</h3>
        <p>유네스코에 지정된 세계유산~</p>
        <a href="http://localhost:9999/trip/areaDetail.do?con=125949&type=12" class="w3-button w3-margin-bottom w3-right">자세히..</a>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
