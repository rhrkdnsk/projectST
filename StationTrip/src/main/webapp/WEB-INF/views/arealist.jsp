<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<%@include file="header.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지역정보</title>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/trip/resources/js/area.js"></script>
<link rel="stylesheet" href="/trip/resources/css/area.css">

</head>
<body>
   <form id="areaBoard">
      <h1>관광지 검색</h1>
      <hr />
      <div id="area-list">
         <div id="area-list-border">
            <p class='area-search-text'>지역별</p>
            <ul id="case1" class="area-options">
               <!-- 시 단위 options -->
            </ul>
            <ul id="case2" class="area-options">
               <!-- 구,군 단위 options -->
            </ul>
         </div>
      </div>
      <div id="content-list">
         <div id="content-list-border">
            <p class='area-search-text'>여행지</p>
            <ul id="case3" class="area-options">
               <!-- 지역 별 컨텐츠 목록 조회  -->
               <li value="12" id="tree">관광지</li>
               <li value="14">문화시설</li>
               <li value="28">레포츠</li>
               <li value="32">숙박</li>
               <li value="38">쇼핑</li>
               <li value="39">음식점</li>
            </ul>
         </div>
         <div class="content-list-item">
            <p class='area-search-text'>목록조회</p>
            <ul id="titles" class="area-content">
               <!-- 컨텐츠 별 검색 내용 -->
            </ul>
         </div>
         <div id="pages"></div>
      </div>
   </form>
   <%@include file="footer.jsp"%>
</body>
</html>