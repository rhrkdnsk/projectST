<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">

	function allSel(bool){
		var chks=document.getElementsByName("chk");//배열로 반환[chk,chk,chk...]
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked=bool;
		}
	}
	//체크박스 유효값 처리(하나라도 체크가 안되있으면 submit 실행 X)
	//submit이벤트를 취소하면, false를 반환해주면 된다!!
	function confirmChk(){
		var chks=document.getElementsByName("chk");//[chk,chk,chk..]
		var count=0;
		for (var i = 0; i < chks.length; i++) {
			if(chks[i].checked){ //체크되어 있으면 true, 아니면 false
				count++;  //체크가 되어 있으면 카운트 증가
			}
		}
		if(count==0){// count가 0이면 하나도 체크 안했다는 얘기~~
			alert("최소한 하나이상 체크해야 됩니다.~~");
		}
		
		return count>0?true:false;//true이면 submit실행, false이면 취소
	}
	
	
	
	function setnull() {
		location.href="rsessiondel.do";
	}
</script>
<style type="text/css">
	/* 	링크에 밑줄 제거 */
	table a{text-decoration: none;}
	img{width:10px; height: 10px;}
	
/* 	입력범위가 벗어나는 경우 텍스트 처리 (내용이....) */
	.titleval{
		display: inline-block; 
		width: 200px; 
		white-space: nowrap; 
		overflow: hidden; 
		text-overflow: ellipsis;
		white-space: normal; line-height: 1; height: 2em;


	}
</style>
</head>
<body>
<div id="container" class="container w3-center" >
<div class="w3-panel w3-border w3-round-xxlarge w3-border-black"><h1>공 지 사 항</h1></div>
<a href="rlist.do"></a>
<%
  		if(session.getAttribute("login_admin") == null) {
  			%>
  						
	
	<%
  		} else {
  			%>
 		<form action="rmuldel.do" method="post" onsubmit="return confirmChk()">
 					<%
  		}
  	
  	%>
<table class="table table-hover">
	<col width="50px">
	<col width="100px">
	<col width="100px">
	<col width="50px">
	<col width="100px">
	
	<tr>
		<%
  		if(session.getAttribute("login_admin") == null) {
  			%>
  						
	
	<%
  		} else {
  			%>
 		<th class="w3-center"><input type="checkbox" name="all" onclick="allSel(this.checked)" class="w3-center"/></th>
 					<%
  		}
  	
  	%>
		
		<th class="w3-center">번호</th>
		<th class="w3-center">제목</th>
		<th class="w3-center">내용</th>
		<th class="w3-center">이름</th>
		<th class="w3-center">시간</th>
		
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr><td colspan="10">---작성된 글이 없습니다.---</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>
<%
  		if(session.getAttribute("login_admin") == null) {
  			%>
  						
	
	<%
  		} else {
  			%>
 		<td>
						<input type="checkbox" name="chk" value="${dto.seq}"/>
					</td>
 					<%
  		}
  	
  	%>
					<td><a href="rdetail.do?seq=${dto.seq}">${dto.seq}</a></td>
					<td><a class="titleval"href="rdetail.do?seq=${dto.seq}">${dto.title}</a></td>
					<td><a class="titleval"href="rdetail.do?seq=${dto.seq}">${dto.content}</a></td>
					<td>${dto.id}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.regdate}"/> </td>
					
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
		<tr>
		<td colspan="6">
	<p>
	<c:if test="${page-1 != 0 }"><a href="rlist.do?pageNum=${page-1}">이전</a>	</c:if>
	<%
		int totalPage = ((Integer)request.getAttribute("totalPage")).intValue(); // 목록뽑을 개수 나누기 총개수
		int startPage = ((Integer)request.getAttribute("startPage")).intValue();
		int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	
		System.out.println("jsp list의 totalPage의 값 : " + totalPage);
			for(int i=startPage; i<=endPage; i++) {
				%><a href="rlist.do?pageNum=<%=i%>"><%=i%></a><%			
			}%>
	  <c:if test="${page+1 <= totalPage}">
	  <a href="rlist.do?pageNum=${page+1}">다음</a>						
	  </c:if>
	</p>
	</td>
			
				
			
		</tr>
	
<%
  		if(session.getAttribute("login_admin") == null) {
  			%>
	  			
	
	<%
  		} else {
  			%>
<tr>
		<td colspan="10">
			<a class="btn btn-primary" href="rinsertform.do">글쓰기</a>
			<input class="btn btn-primary" type="submit" value="삭제"/>
		</td>
	</tr>  			<%
  		}
  	
  	%>
	
</table>
</form>
</div>

<%@include file="footer.jsp" %>
</body>
</html>