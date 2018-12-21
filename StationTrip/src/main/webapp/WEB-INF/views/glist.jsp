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
<div id="container">
<h1>유저 목록</h1>
<form action="smuldel.do" method="post" onsubmit="return confirmChk()">
<table class="table table-hover">
	<col width="50px">
	<col width="50px">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="50px">
	<tr>
		<th><input type="checkbox" name="all" onclick="allSel(this.checked)" /></th>
		<th>닉네임</th>
		<th>이름</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>포인트</th>
		<th>등급</th>
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
			<input class="btn btn-primary" type="submit" value="삭제"/>
		</td>
	</tr>
</table>
</form>

<form action="fboardlist.do" name="search" method="post">

<select name="keyField" size="1">
	<option value="user_nickname">아이디</option>
	<option value="freeboard_title">제목</option>
	<option value="제목+내용">제목+내용</option>
	<option value="분류">분류</option>
</select>

<input type="text" size="20" placeholder="검색어 입력" name="keyWord" value="" />
<input type="button" value="검색" onclick="check()" />
<input type="hidden" name="page" value="0" />
</form>
</div>
<script>
 function locainsert() {
 	alert("locainsert");
 	location.href = "insertform.do";
	 }

</script>
<%@include file="footer.jsp" %>
</body>
</html>





