<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	관리자페이지메인
		<a href="${pageContext.request.contextPath}/admin/board/list.do?boardType=1">이벤트 게시판</a><br/>
		<a href="${pageContext.request.c+ hvnyb0ontextPath}/admin/member/detail.do?id=a">회원상세로</a><br/>
		<a href="${pageContext.request.contextPath}/admin/member/list.do?status=1">회원  목록으로</a>

		<a href="${pageContext.request.contextPath}/admin/book/registform.do">글등록테스트</a><br>
		<a href="${pageContext.request.contextPath}/admin/book/updateform.do?bookCode=2">글수정테스트</a><br>
		<a href="${pageContext.request.contextPath}/admin/book/list.do">리스트테스트</a><br>
		
		<a href="${pageContext.request.contextPath}/admin/sales/main.do">매출관리</a><br>
		
</body>
</html>