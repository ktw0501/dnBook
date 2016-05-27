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
		<h1>자유게시판</h1>
		<hr />
		<form action="update.do" method="post">
		<input type="hidden" name="no" value="${board.no}" />
		<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="${board.title}"/></td>
		</tr>	
		<tr>
			<th>내용</th>
			<td><textarea name="content" rows="8" cols="70">${board.content}</textarea></td>
		</tr>	
		</table>	
		<input type="submit" value="수정" />
		</form>
	</div>
	<div class="footer">
		<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
	</div>
</div>
</body>
</html>