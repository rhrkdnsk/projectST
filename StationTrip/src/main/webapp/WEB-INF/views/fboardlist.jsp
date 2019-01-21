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
<title>자유게시판 리스트</title>
<script type="text/javascript">
function locainsert() {
	location.href = "insertform.do";
}

function check() {
<%-- 	<% session.removeAttribute("skeyWord"); --%>
//     session.removeAttribute("skeyField");
<%--     %> --%>
    
	check1();
	
}
function check1() {

    if (document.search.keyWord.value == "") {
        alert("검색어를 입력하세요.");
        document.search.keyWord.focus();
        return;
    }
  
    document.search.submit();
}

function lookBoard() {
    document.looksetting.submit();
}

function setnull() {
	location.href="fsessiondel.do";
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
<div id="container" class="container w3-center" style="min-height:800px">
<div class="w3-panel w3-border w3-round-xxlarge w3-border-black"><h1>자 유 게 시 판</h1></div>
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
	<form action="fboardPage.do?pageNum=1" method = "post" name="looksetting">
<select name="settingnum" onchange="lookBoard()" class="form-control" style="width:200px">
<option value="">게시글 개수 조절</option> <!-- 개발 당시에만 남겨두고 나중에 10개씩 글보기할때 삭제하면 됨 10,30,50 -->
<option value="10" <c:if test="${setnum == 10}">selected</c:if> onclick="lookBoard()">10개씩보기</option>
<option value="15" <c:if test="${setnum == 15}">selected</c:if> onclick="lookBoard()">15개씩보기</option>
<option value="20" <c:if test="${setnum == 20}">selected</c:if> onclick="lookBoard()">20개씩보기</option>
</select>
</form>
</td>
<td colspan="4">
</td>
</tr>
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
  	<td class="w3-center">${fdto.freeboard_num}</td>
  	
  	<%
  		if(session.getAttribute("login_userId") == null) {
  			%>
	  			<td class="w3-center">${fdto.freeboard_title} [${fdto.freeboard_commentcount}]</td>
	
	<%
  		} else {
  			%>
  			<td class="sub"><a class="title" href="fboarddetail.do?freeboard_num=${fdto.freeboard_num}">${fdto.freeboard_title} [${fdto.freeboard_commentcount}]</a></td>
  			<%
  		}
  	
  	%>
  	<td class="w3-center">${fdto.user_nickname}</td>
  	<td class="w3-center">${fdto.freeboard_time}</td>
  	<td class="w3-center">${fdto.freeboard_view}</td>
  	<td class="w3-center">${fdto.freeboard_like}</td>
  	<td class="w3-center">${fdto.freeboard_category}</td>
  	</tr>
  	</c:forEach>
  	</c:otherwise>
  	</c:choose>
  	

	<tr>
	<td>
	  <button onclick="setnull()" class="btn btn-primary btn-xs" style="float:left; margin-top:5px">목록으로</button>	
	</td>
	<td colspan="5">
<div style="margin-top:10px;">

<c:if test="${page-1 != 0 }">

						<a href="fboardPage.do?pageNum=${page-1}">이전</a>						

</c:if>

<c:forEach var="i" begin="${ startPage }" end="${ endPage }">

                              <c:choose>



                                      <c:when test="${ i == nowPage }">
<a href="fboardPage.do?pageNum=${i}" style="color:red;">${i}
						</a>


                                      </c:when>

								<c:otherwise>
								<a href="fboardPage.do?pageNum=${i}">${i}
						</a>
								</c:otherwise>


                              </c:choose>

                       </c:forEach>

  <c:if test="${page+1 <= totalPage}">
  <a href="fboardPage.do?pageNum=${page+1}">다음</a>						
  </c:if>
  
</div>
</td><td>
<%
  		if(session.getAttribute("login_userId") != null) {
  			%>
  			
  			 <button type="button" id="writebt" onclick="locainsert()" class="btn btn-success">글쓰기</button>
  			 
  			<%
  		} 	
  	%></td>
</tr>
</table>
<form action="fboardPage.do?pageNum=1" name="search" method="post" class="form-inline">

<div class="form-group">
<select name="keyField" size="1" style="width:100px" class="form-control">
	<option value="user_nickname" <c:if test="${skeyField eq 'user_nickname'}">selected</c:if> >아이디</option>
	<option value="freeboard_title" <c:if test="${skeyField eq 'freeboard_title' }">selected</c:if> >제목</option>
	<option value="freeboard_category" <c:if test="${skeyField eq 'freeboard_category' }">selected</c:if> >분류</option>
</select>

<input type="text" size="20" placeholder="검색어 입력" name="keyWord" value="${skeyWord}" class="form-control" style="width:200px" />
<input type="button" value="검색" onclick="check()" class="btn btn-default" />
<input type="hidden" name="page" value="0" />
</div>
</form>


</div>

<jsp:include page="footer.jsp"/>
</body>
</html>