<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="header">
		<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
	</div>	
	<div class="content">
		페이지 내용<br />
		페이지 내용<br />
		페이지 내용<br />
		<a href="${pageContext.request.contextPath}/admin/board/list.do?boardType=1">이벤트 게시판</a><br/>
		<a href="${pageContext.request.contextPath}/admin/member/detail.do?id=a">회원상세로</a><br/>
		<a href="${pageContext.request.contextPath}/admin/member/list.do?status=1">회원  목록으로</a>
	</div>
	<div class="footer">
		<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
	</div>
</div>

</body>
</html>





