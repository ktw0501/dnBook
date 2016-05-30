<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#container{
		width:1050px;
		margin:0px;
		padding:5px;
	}
	#header{
		width:1050px;
		height:180px;
	}
	#content{
		width: 1050px;
		min-height: 300px;
		float:left;
	}
	.leftside{
		width:190px;
		min-height: 300px;
		float: left;
		background-color: #eeeeee;
	}
	.contentsmain{
		width: 670px;
		min-height: 300px;
		float: left;
	}
	.rightside{
		width: 190px;
		min-height: 300px;
		float: left;
		background-color: #e6e6fa;
	}
	#footer{
		width: 1050px;
		min-height: 200px;
		background-color: #dddddd;
		clear:both;
	}
</style>
</head>
<body>
<div id="container">
	<div id="header">
		<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
	</div>	
	<div class="content">
		페이지 내용<br />
		페이지 내용<br />
		페이지 내용<br />
		<a href="${pageContext.request.contextPath}/admin/board/list.do?boardType=1">이벤트 게시판</a><br/>
		<a href="${pageContext.request.contextPath}/admin/member/detail.do?id=a">회원상세로</a><br/>
		<a href="${pageContext.request.contextPath}/admin/member/list.do?status=1">회원  목록으로</a>
		<a href="${pageContext.request.contextPath}/admin/book/registform.do">글등록테스트</a><br>
		<a href="${pageContext.request.contextPath}/admin/book/updateform.do?bookCode=2">글수정테스트</a><br>
		<a href="${pageContext.request.contextPath}/admin/book/list.do">리스트테스트</a><br>
	</div>
	<div class="rightside">Right side</div>
	<div id="footer">
		<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
	</div>
</div>
</body>
</html>