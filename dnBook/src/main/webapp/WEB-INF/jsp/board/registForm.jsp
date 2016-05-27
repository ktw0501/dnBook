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
		<h2>자유게시판</h2>
		<hr />
		<form action="regist.do" method="post" enctype="multipart/form-data">
			<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input type="text" name="writer" value="${user.id}" /></td>
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
					<a href="${pageContext.request.contextPath}/board/listBoard.do">목록</a>
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