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
		location.href="gsessiondel.do";
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
		overflow: hidden;
		text-overflow: ellipsis;
		white-space:nowrap;
	}
/* 	textarea[name=testAjax]{ */
/* 		position: fixed; */
/* 		left: 100px; */
/* 		top:150px; */
/* 	} */
	#footer {

    position:absolute;

    bottom:0;

    width:100%;

    height:70px;   

    background:#ccc;

}
</style>
</head>
<body>
<div id="container" class="container w3-center" >
<div class="w3-panel w3-border w3-round-xxlarge w3-border-black"><h1>유저 목록</h1></div>
<a href="glist.do"></a>
<form action="smuldel.do" method="post" onsubmit="return confirmChk()">
<table class="table table-hover">
	
	<tr>
		<th class="w3-center"><input type="checkbox" name="all" onclick="allSel(this.checked)" class="w3-center"/></th>
		<th class="w3-center">닉네임</th>
		<th class="w3-center">이름</th>
		<th class="w3-center">이메일</th>
		<th class="w3-center">전화번호</th>
		<th class="w3-center">포인트</th>
		<th class="w3-center">등급</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr><td colspan="10">---작성된 글이 없습니다.---</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>

					<td>
						<input type="checkbox" name="chk" value="${dto.user_nickname}"/>
					</td>
					<td><a href="managerdetail.do?user_nickname=${dto.user_nickname}">${dto.user_nickname}</a></td>
					<td>${dto.user_name}</td>
					<td>${dto.user_email}</td>
					<td>${dto.user_phone}</td>
					<td>${dto.user_point}</td>
					<td>${dto.tier}</td>
					
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr>
	<td colspan="10">
<p>
<c:if test="${page-1 != 0 }"><a href="glist.do?pageNum=${page-1}">이전</a>	</c:if>
<%
	int totalPage = ((Integer)request.getAttribute("totalPage")).intValue(); // 목록뽑을 개수 나누기 총개수
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();

	System.out.println("jsp list의 totalPage의 값 : " + totalPage);
		for(int i=startPage; i<=endPage; i++) {
			%><a href="glist.do?pageNum=<%=i%>"><%=i%></a><%			
		}%>
  <c:if test="${page+1 <= totalPage}">
  <a href="glist.do?pageNum=${page+1}">다음</a>						
  </c:if>
</p>
<input class="btn btn-primary" type="submit" value="삭제"/> 
</td>
		
			
		
	</tr>
</table>
</form>
</div>

<script>
 function locainsert() {
 	alert("locainsert");
 	location.href = "insertform.do";
	 }

</script>
<div id="footer"><%@include file="footer.jsp" %></div>
</body>
</html>










