<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지역게시판 리스트</title>
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
	location.href="fsessiondel.do";
}

function codeBoard() {
	alert(document.boardcode.areaboard_code.value);
    document.boardcode.submit();
    
}
</script>
<style>

* {
  margin:0; padding:0;
}

body {
  font-size:14px;
  font-family:"맑은 고딕";
}

 a {
    color:#000;
   text-decoration:none;
   cursor:pointer;
  }

  a:hover {
    color:yellowgreen;
    text-decoration:underline;
  }

#board {
  width:890px;
  margin:30px auto 10px;
}

  #title {
    height:45px;
   font-weight:bold;
   font-size:16px;
    clear:both;
  }

.list dl dt {
  float:left;
}

.list dl dd {
  float:left;
}

   .list .num {width:60px;} 
.list .sub {width:410px;} 
.list .name {width:95px;} 
.list .data {width:140px;} 
.list .count {width:60px;} 


.list dt {
  width:150px;
  text-align:center;
  background-color:lightblue;
  border-bottom:2px solid black;
  padding:10px 5px;
  }

.list dd {
  width:150px;
  text-align:center;
  padding:8px 5px;
  border-bottom:1px solid #ccc;
}

  .list dd.sub {
  text-align:center; padding-left:5px; width:410px;
}

#board .list-bot {
   clear: both;
   text-align:center;
   padding:10px 10px;
}

#writebt {
	margin-left: 790px;
	margin-top : 10px;
}


/* #notice { */
/* 	text-align:center; */
/* border-bottom:10px 5px solid #ccc; */
/* margin-top: 10px; */

/* } */

</style>
<jsp:include page="header.jsp" />
<style type="text/css">
*, *:before, *:after{
	box-sizing: unset;
}

</style>
</head>
<body>
<h1>${login_userId}님</h1>
<h1>현재 페이지 번호${page}</h1>
<h1> 카운트의 값 : ${totalCount}</h1>
<h1>totalPage의 값 : ${totalPage }</h1>

<div id="board">

<div id="title">
    <h3>l 게시판</h3>
</div>

<div class="list" style="border-bottom: 1px; border-bottom-color: black; border-bottom-style: solid; "> 

  <dl>
   <dt class="num">번호</dt>
   <dt class="sub">제목</dt>
   <dt class="name">작성자</dt>
   <dt class="data">작성일</dt>
   <dt class="count">조회수</dt>
   <dt class="count">좋아요</dt>
   
  </dl>
	<dl id="notice" style="text-align:center; font-size:30px; ">공지사항</dl>
  <dl>
   <dd class="num">3</dd>
   <dd class="sub"><a href="#">월요일 입니다.</a></dd>
   <dd class="name">김민석</dd>
   <dd class="data">2000-10-10</dd>
   <dd class="count">1</dd>
   <dd class="count">1</dd>
   
  </dl>
  
  <dl>
   <dd class="num">2</dd>
   <dd class="sub"><a href="#">화요일 입니다.</a></dd>
   <dd class="name">김준면</dd>
   <dd class="data">2000-10-10</dd>
   <dd class="count">1</dd>
      <dd class="count">1</dd>
   
  </dl>

  <dl>
   <dd class="num">1</dd>
   <dd class="sub"><a href="#">수요일 입니다.</a></dd>
   <dd class="name">김종인</dd>
   <dd class="data">2000-10-10</dd>
   <dd class="count">1</dd>
      <dd class="count">1</dd>
   
  </dl>

  
  <p style="text-align:center; color:white;">----------------------------------------------------------------------------------------------------------------------------------</p>
  
	<c:choose>
	<c:when test="${empty list}">
	<dl>	
		<dd>-------작성된 글이 없습니다.----</dd>
	</dl>
  </c:when>
  <c:otherwise>
  <c:forEach items="${list}" var="fdto">
  <dl>
  	<dd class="num">${fdto.areaboard_num}</dd>
  	
  	<%
  		if(session.getAttribute("login_userId") == null) {
  			%>
	  			<dd class="sub">${fdto.areaboard_title} [${fdto.areaboard_commentcount}]</dd>
	
	<%
  		} else {
  			%>
  			<dd class="sub"><a class="title" href="aboarddetail.do?areaboard_num=${fdto.areaboard_num}&areaboard_code=${fdto.areaboard_code}">${fdto.areaboard_title} [${fdto.areaboard_commentcount}]</a></dd>
  			<%
  		}
  	
  	%>
  	<dd class="name">${fdto.user_nickname}</dd>
  	<dd class="data">${fdto.areaboard_time}</dd>
  	<dd class="count">${fdto.areaboard_view}</dd>
  	<dd class="count">${fdto.areaboard_like}</dd>
  	</dl>
  	
  	</c:forEach>
  	</c:otherwise>
  	</c:choose>
	
   
 
   
   
   

<%
  		if(session.getAttribute("login_userId") != null) {
  			%>
  			 <button type="button" id="writebt" onclick="locainsert()">글쓰기</button>
  			<%
  		} 	
  	%>
<div class="list-bot">
<p>
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



 <!--  <a href="#">◀</a>
  <a href="#">◁</a>
  <a href="#">1</a>
  <a href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a> 
  <a href="#">▷</a>
  <a href="#">▶</a> -->
  <c:if test="${page+1 <= totalPage}">
  <a href="aboardPage.do?apageNum=${page+1}&areaboard_code=${sareaboard_code}">다음</a>						
  </c:if>
</p>
</div>
</div>
</div>


<form action="aboardPage.do?apageNum=1&areaboard_code=${sareaboard_code}" name="search" method="post">

<select name="akeyField" size="1">
	<option value="user_nickname">아이디</option>
	<option value="areaboard_title">제목</option>
	<option value="제목+내용">제목+내용</option>
	<option value="areaboard_category">분류</option>
</select>

<input type="text" size="20" placeholder="검색어 입력" name="akeyWord" value="${akeyWord}" />
<input type="button" value="검색" onclick="check()" />
<input type="hidden" name="page" value="0" />
</form>

<form action="aboardPage.do?apageNum=1&areaboard_code=${sareaboard_code}" method = "post" name="looksetting">
<select name="settingnum" onchange="lookBoard()">
<option value="">게시글 개수 조절</option> <!-- 개발 당시에만 남겨두고 나중에 10개씩 글보기할때 삭제하면 됨 10,30,50 -->
<option value="5" onclick="lookBoard()">5개씩보기</option>
<option value="10" onclick="lookBoard()">10개씩보기</option>
<option value="15" onclick="lookBoard()">15개씩보기</option>
</select>
</form>

<form action="aboardPage.do?apageNum=1" method="post" name="boardcode">
지역 <select name="areaboard_code" onchange="codeBoard()" >
<option value="지역">분류</option>
<option value="1" onclick="codeBoard()">서울</option>
<option value="2" onclick="codeBoard()">경기</option>
<option value="3" onclick="codeBoard()">강원</option>
<option value="4" onclick="codeBoard()">대구</option>
<option value="5" onclick="codeBoard()">부산</option>
<option value="6" onclick="codeBoard()">전라</option>
<option value="7" onclick="codeBoard()">경상</option>
<option value="8" onclick="codeBoard()">기타</option>
</select>
</form>
<button onclick="setnull()">목록으로</button>

<jsp:include page="footer.jsp" />

</body>
</html>