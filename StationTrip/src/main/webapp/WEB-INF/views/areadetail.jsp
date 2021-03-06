<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/trip/resources/js/areadetail.js"></script>
<!-- <script type="text/javascript" src="/trip/resources/js/area.js"></script> -->
<link rel="stylesheet" href="/trip/resources/css/area.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관광지 정보</title>
</head>
<body>
   <h1 id='opq'>관광지 정보</h1>
   <input type='hidden' value='${con}' id='contentId'>
   <input type='hidden' value='${type}' id='contentTypeId'>
   <div id='area-detail'>
      <div id='area-detail-img'>
         <!-- 이미지 -->
      </div>
      <div id="detail-all">
         <div id='area-detail-title'>
            <!-- 타이틀 -->
         </div>
         <div id='area-detail-addr'>
            <!-- 주소 -->
         </div>
         <div id='area-detail-content'>
            <!-- 설명 -->
         </div>
         <div id='area-detail-homepage'>
            <!-- 홈페이지 url -->
         </div>
         <br />
         <div id='area-detail-introtext'>
            <!-- 입 장 료 / 화장실 / 주차요금 / -->
         </div>
      </div>
      <div id="back">
         <button id='backPage' onclick="location.href='areaboardgo.do'">돌아가기</button>
      </div>
   </div>
   <%@include file="footer.jsp"%>
</body>
</html>