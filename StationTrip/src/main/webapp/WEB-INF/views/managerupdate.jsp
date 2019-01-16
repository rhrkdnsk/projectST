<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	#footer {

    position:absolute;

    bottom:0;

    width:100%;

    height:70px;   

    background:#ccc;
    }
    .jb-large { font-size: large; }
     .jb-x-large { font-size: x-large; }
</style>
</head>
<body>
<div id="container" class="container w3-center jb-large">
<h1>회원 정보 수정</h1>
<form action="supdateBoard.do" method="post">
<input type="hidden" name="user_nickname" value="${fdto.user_nickname}"/>
<table class="table table-hover w3-center">
	<tr>
		<th class="w3-center jb-x-large">닉네임</th>
<%-- 		<td class="form-control jb-large">${fdto.user_nickname}</td> --%>
		<td><input class="form-control jb-large" value="${fdto.user_nickname}"/></td>
	</tr>
	<tr>
		<th class="w3-center jb-x-large">이름</th>
<%-- 		<td class="form-control jb-large">${fdto.user_name}</td> --%>
		<td><input class="form-control jb-large" value="${fdto.user_name}"/></td>
	</tr>
	<tr>
		<th class="w3-center jb-x-large">이메일</th>
<%-- 		<td class="form-control jb-large">${fdto.user_email}</td> --%>
		<td><input class="form-control jb-large" value="${fdto.user_email}"/></td>
	</tr>
	<tr>
		<th class="w3-center jb-x-large">전화번호</th>
<%-- 		<td class="form-control jb-large">${fdto.user_phone}</td> --%>
		<td><input class="form-control jb-large" value="${fdto.user_phone}"/></td>
	</tr>
	<tr>
		<th class="w3-center jb-x-large">포인트</th>
		<td><input type="text" class="form-control jb-large" name="user_point" value="${fdto.user_point}"/></td>
	</tr>
	<tr>
		<th class="w3-center jb-x-large">등급</th>
		<td><select id="value" name="tier"  class="form-control jb-large">
			<option value="${fdto.tier}"  id="value">${fdto.tier}</option>
			<option value="Bronze" id="value" class="jb-large">Bronze</option>
			<option value="Silver" id="value"  class="jb-large">Silver</option>
			<option value="Gold" id="value"  class="jb-large">Gold</option>
			<option value="Platinum" id="value"  class="jb-large">Platinum</option>
</select>
</td>
<%-- 		<td><input type="text" name="tier" value="${fdto.tier}"/></td> --%>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정완료"/>
			<button type="button" onclick="location.href='glist.do'">글목록</button>
		</td>
	</tr>
</table>
</form>
</div>
<div id="footer"><%@include file="footer.jsp" %></div>
</body>
</html>








