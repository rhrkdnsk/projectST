<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>지역게시판 리스트</title>
<title>지역게시판</title>
<script type="text/javascript">
function locainsert() {
	alert("locainsert");
	location.href = "aboardinsertform.do";
	
}

function check() {
<%-- 	<% session.removeAttribute("skeyWord"); --%>
//     session.removeAttribute("skeyField");
<%--     %> --%>
    
	check1();
	
}
function check1() {

    if (document.search.akeyWord.value == "") {
        alert("검색어를 입력하세요.");
        document.search.akeyWord.focus();
        return;
    }
  
    document.search.submit();
}

function lookBoard() {
	alert(document.looksetting.settingnum.value);
    document.looksetting.submit();
}

function setnull() {
	location.href="abacklist.do";
}

function codeBoard() {
	alert(document.boardcode.areaboard_code.value);
    document.boardcode.submit();
    
}
</script>

<jsp:include page="header.jsp" />
<style type="text/css">

*, *:before, *:after{
	box-sizing: unset;
}

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
</head>
<body>

<div id="container" class="container w3-center">

<div class="w3-panel w3-border w3-round-xxlarge w3-border-black"><h1>지 역 게 시 판(${myArea})</h1></div>

<table class="table table-hover">
	<col width="50px">
	<col width="200px">
	<col width="80px">
	<col width="100px">
	<col width="50px">
	<col width="50px">
	<col width="50px">
	<tr>
	<td colspan="4">
<form action="aboardPage.do?apageNum=1&areaboard_code=${sareaboard_code}" method = "post" name="looksetting">
<select name="settingnum" onchange="lookBoard()" class="form-control" style="width:200px;"> 
<option value="">게시글 개수 조절</option> <!-- 개발 당시에만 남겨두고 나중에 10개씩 글보기할때 삭제하면 됨 10,30,50 -->
<option value="5" <c:if test="${asetnum == 5}">selected</c:if> onclick="lookBoard()">5개씩보기</option>
<option value="10" <c:if test="${asetnum == 10}">selected</c:if> onclick="lookBoard()">10개씩보기</option>
<option value="15" <c:if test="${asetnum == 15}">selected</c:if> onclick="lookBoard()">15개씩보기</option>
</select>
</form>
</td>

<td colspan="4">
<form action="aboardPage.do?apageNum=1" method="post" name="boardcode">
<select name="areaboard_code" onchange="codeBoard()" class="form-control" style="width:150px; float:right;" >
<option value="1" <c:if test="${sareaboard_code == 1}">selected</c:if> onclick="codeBoard()">서울</option>
<option value="2" <c:if test="${sareaboard_code == 2}">selected</c:if>  onclick="codeBoard()">경기</option>
<option value="3" <c:if test="${sareaboard_code == 3}">selected</c:if> onclick="codeBoard()">강원</option>
<option value="4" <c:if test="${sareaboard_code == 4}">selected</c:if> onclick="codeBoard()" >대구</option>
<option value="5" <c:if test="${sareaboard_code == 5}">selected</c:if> onclick="codeBoard()">부산</option>
<option value="6" <c:if test="${sareaboard_code == 6}">selected</c:if> onclick="codeBoard()">전라</option>
<option value="7" <c:if test="${sareaboard_code == 7}">selected</c:if> onclick="codeBoard()">경상</option>
<option value="8" <c:if test="${sareaboard_code == 8}">selected</c:if> onclick="codeBoard()">기타</option>
</select>
</form>
</td>
  <tr>
   <td class="w3-center">번호</td>
   <td class="w3-center">제목</td>
   <td class="w3-center">작성자</td>
   <td class="w3-center">작성일</td>
   <td class="w3-center">조회수</td>
   <td class="w3-center">좋아요</td>
   <td class="w3-center">분류</td>
   </tr>  
	<c:choose>
	<c:when test="${empty list}">
	<tr>	
		<td colspan="7">-------작성된 글이 없습니다.----</td>
	</tr>
  </c:when>
  <c:otherwise>
  <c:forEach items="${list}" var="fdto">
  <tr>
  	<td class="w3-center">${fdto.areaboard_num}</td>
  	
  	<%
  		if(session.getAttribute("login_userId") == null) {
  			%>
	  			<td class="w3-center">${fdto.areaboard_title} [${fdto.areaboard_commentcount}]</td>
	
	<%
  		} else {
  			%>
  			<td class="sub"><a class="title" href="aboarddetail.do?areaboard_num=${fdto.areaboard_num}&areaboard_code=${fdto.areaboard_code}">${fdto.areaboard_title} [${fdto.areaboard_commentcount}]</a></td>
  			<%
  		}
  	
  	%>
  	<td class="w3-center">${fdto.user_nickname}</td>
  	<td class="w3-center">${fdto.areaboard_time}</td>
  	<td class="w3-center">${fdto.areaboard_view}</td>
  	<td class="w3-center">${fdto.areaboard_like}</td>
  	<td class="w3-center">${fdto.areaboard_category}</td>
  	
  	</tr>
  	
  	</c:forEach>
  	</c:otherwise>
  	</c:choose>

   <tr>
   <td colspan="6">
 <p style="margin-top:10px">
 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<c:if test="${page-1 != 0 }">
						<a href="aboardPage.do?apageNum=${page-1}&areaboard_code=${sareaboard_code}">이전</a>						

</c:if>

<%
// String aaa = (String)request.getAttribute("totalPage");
// 	System.out.println("list에서 aaa의 값 : " + aaa);
	int totalPage = ((Integer)request.getAttribute("totalPage")).intValue(); // 목록뽑을 개수 나누기 총개수
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();

	System.out.println("jsp list의 totalPage의 값 : " + totalPage);
//int totalPage = Integer.parseInt(aaa);
		for(int i=startPage; i<=endPage; i++) {
			%>			
						<a href="aboardPage.do?apageNum=<%=i%>&areaboard_code=${sareaboard_code}"><%=i%></a>						
			<%			
		}
%>

  <c:if test="${page+1 <= totalPage}">
  <a href="aboardPage.do?apageNum=${page+1}&areaboard_code=${sareaboard_code}">다음</a>						
  </c:if>  	
  <button onclick="setnull()" class="btn btn-primary btn-xs" style="float:left;">목록으로</button>
</p> 
</td><td>
<%
  		if(session.getAttribute("login_userId") != null) {
  			%>
  			 <button type="button" id="writebt" class="btn btn-success" onclick="locainsert()">글쓰기</button>
  			<%
  		} 	
  	%> </td>
</table>

<div>

<form action="aboardPage.do?apageNum=1&areaboard_code=${sareaboard_code}" name="search" method="post" class="form-inline">
<div class="form-group">
<select name="akeyField" size="1" style="width:100px" class="form-control">
	<option value="user_nickname" <c:if test="${askeyField eq 'user_nickname'}">selected</c:if> >아이디</option>
	<option value="areaboard_title" <c:if test="${askeyField eq 'areaboard_title'}">selected</c:if> >제목</option>
	<option value="areaboard_category" <c:if test="${askeyField eq 'areaboard_category'}">selected</c:if> >분류</option>
</select>


<input type="text" size="20" placeholder="검색어 입력" name="akeyWord" value="${askeyWord}" class="form-control"  style="width:200px" />
<input type="button" value="검색" onclick="check()" class="btn btn-default"/>
<input type="hidden" name="page" value="0" />
</div>
</form>
</div>


</div>
<jsp:include page="footer.jsp" />

</body>
</html>