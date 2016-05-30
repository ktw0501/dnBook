<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
		<h2>My page : 구매목록</h2>
		<hr />
		<table>
		<tr>
			<th>책표지</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>구매일자</th>
			<th>가격</th>
		</tr>
		<c:forEach var="vo" items="${list}">
		<tr>
			<td>${vo.coverImg}</td>
			<td><a href="${pageContext.request.contextPath}/book/detail.do?bookCode=${vo.bookCode}">${vo.title}</a></td>
			<td>${vo.author}</td>
			<td>${vo.salesDate}</td>
			<td>${vo.price}</td>
		</tr>
		</c:forEach>
		<c:if test="${empty list}">
		<tr><td colspan="5">구매 내역이 없습니다.</td></tr>
		</c:if>
		</table>
		
	</div>
	<div class="footer">
		<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
	</div>
</div>
</body>
</html>