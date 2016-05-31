<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="navi" tagdir="/WEB-INF/tags"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<div class="container">
	<div class="header">
		<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
	</div>	
	<div class="content">
		<h2>게시판 등록</h2>
		<hr />
		<form action="regist.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="boardType" value="${boardType}" />
			<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>관리자</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content"></textarea>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="attachFile" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록" />
					<a href="${pageContext.request.contextPath}/admin/board/list.do?boardType=${boardType}">목록</a>
				</td>
			</tr>
			</table>
		</form>
	</div>
	<div class="footer">
		<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
	</div>
</div>
</body>
</html>