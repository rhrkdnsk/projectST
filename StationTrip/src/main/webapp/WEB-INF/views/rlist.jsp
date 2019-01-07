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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
	//전체 선택 체크박스 구현
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
	
	$(function(){ // onload: 페이지가 로딩 되면 바로 함수를 실행시켜주는 이벤트
		//답변형을 위한 속성중에 refer,step,depth를 감추고 보이게 하는 기능
		//slice(), each(), toggle(), click()
		$("#container > h1").click(function(){//h1을 클리한다면 함수를 실행해라
			$("#container form col").slice(5,8).toggle();
			$("#container form th").slice(5,8).toggle();//th중에 5번째~7번째선택해서 감추거나 보여주거나
			$("#container form tr").each(function(){//tr들의 개수만큼 함수를 반복 실행해라!!
				$(this).children("td").slice(5,8).toggle();//반복할때 tr하나씩 얻어와서 자식요소td구함
			});
		});
	
		//삭제된 글에 해당하는 체크박스를 비활성화 하자!!
		$(".delboard").each(function(){
			//this---> [delboard,delboard,delboard,delboard]
			$(this).parent("tr").children("td").eq(0)
			.find("input").attr("disabled","disabled");
		});
		
		//ajax처리: 글 제목에 마우스 올리면 textarea에 내용 출력하기
		$(".titleval").hover(function(){
			       // <a>  --> <td>  ---> <td>--> <td>--> <td>text</td>
			var seq=$(this).parent("td").prev().prev().text();
			$.ajax({
				url:"detailajax.do",
				data:{"seq":seq},// "seq="+seq
				datatype:"json",
				method:"post",
				success:function(obj){ //컨트롤에서 전달받은 객체(map)--> obj
					var dto=obj["dto"];//map에서 dto객체 꺼내고
					$("textarea[name=testAjax]").val(dto["content"]);
				},
				error:function(){
					alert("서버통신실패!!");
				}
			});
		},function(){
			$("textarea[name=testAjax]").val("");
		});
	});
	
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
		overflow: hidden;
		text-overflow: ellipsis;
		white-space:nowrap;
	}
	textarea[name=testAjax]{
		position: fixed;
		left: 100px;
		top:150px;
	}
</style>
</head>
<body>
<div id="container" class="list">
<h1>유저 목록</h1>
<a href="rlist.do"></a>
<form action="rmuldel.do" method="post" onsubmit="return confirmChk()">
<table class="table table-hover">
	<col width="50px">
	<col width="50px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	
	<tr>
		<th><input type="checkbox" name="all" onclick="allSel(this.checked)" /></th>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>이름</th>
		<th>시간</th>
		
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr><td colspan="10">---작성된 글이 없습니다.---</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="dto">
				<tr>

					<td>
						<input type="checkbox" name="chk" value="${dto.seq}"/>
					</td>
					<td><a href="rdetail.do?seq=${dto.seq}">${dto.seq}</a></td>
					<td>${dto.title}</td>
					<td>${dto.content}</td>
					<td>${dto.id}</td>
					<td>${dto.regdate}</td>
					
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<div class="list-bot">
<p>
<c:if test="${page-1 != 0 }">
						<a href="rlist.do?pageNum=${page-1}">이전</a>						

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
						<a href="rlist.do?pageNum=<%=i%>"><%=i%></a>						
			<%			
		}
%>



  <c:if test="${page+1 <= totalPage}">
  <a href="rlist.do?pageNum=${page+1}">다음</a>						
  </c:if>
</p>
</div>
	<tr>
		<td colspan="10">
			<a class="btn btn-primary" href="rinsertform.do">글쓰기</a>
			<input class="btn btn-primary" type="submit" value="삭제"/>
		</td>
	</tr>
</table>
</form>
</div>


<%@include file="footer.jsp" %>
</body>
</html>