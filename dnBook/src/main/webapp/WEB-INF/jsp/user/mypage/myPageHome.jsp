<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Jquery -->
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<!-- 부트스트랩 관련 JS-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	#outer {
		width: 100%;
	}	
	
	#container {
		margin: 0 auto;
		width: 1070px;
	}
	a[href]
	{
		margin: 20px;
	}
	#mytitle{
		font-size: 50px;
		font-family: fantasy;
		font-weight: bold;
/* 		color:gray; */
		text-align: center;
	}
</style>
</head>
<body>
<div id="outer">


	<div id="container">
	<div class="header">
		<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
		</div>
		<div id="body">
			<div id="bleft"></div>
			<div id="mytitle">
			<p class="navbar-text"><a href="${pageContext.request.contextPath}/user/mypage/myPageHome.do?id=eunhwa">My Page</a></p><br />
			</div>
			<div>
<%-- 			<p class="navbar-text" style="text-align : right font-size: 13px">${user.id}님 반갑습니다.</p> --%>
			</div>
			<div id="bmiddle" style="padding: 30px">
				<a href="${pageContext.request.contextPath}/user/mypage/salesList.do?id=eunhwa" class="btn btn-success btn-lg">Shopping List</a>
				<a href="${pageContext.request.contextPath}/user/mypage/rentList.do?id=eunhwa" class="btn btn-info btn-lg">Rent List</a>
				<a href="${pageContext.request.contextPath}/user/mypage/wishList.do?id=eunhwa" class="btn btn-warning btn-lg">Wish List</a>
				<a href="${pageContext.request.contextPath}/member/infoConfirmForm.do?id=eunhwa" class="btn btn-primary btn-lg" >My Info</a>
			</div>
			<div class="footer">
			<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
		</div>
		</div>
	</div>

</div>
</body>
</html>