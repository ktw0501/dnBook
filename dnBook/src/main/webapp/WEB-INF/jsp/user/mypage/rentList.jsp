<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style  type="text/css">
 #outer {width: 100%}
 #container { width:1070px; margin: 0 auto;}
 #container #header { width:1030px; height:200px; margin-left:10px;  margin-bottom:10px;}
 #container #left { display:inline; float:left; width:190px; height:500px; margin-left:10px; background:#33CCFF; }
 #container #content { float:left; width:650px; height:500px; margin-left:10px; background:#BFF484; }
 #container #right { float:left; width:190px; height:500px; margin-left:10px; background:#73534D; }
 #container #footer { clear:both; width:1050px; height:150px; margin-left:10px; margin-top:10px;}
</style>

<body>

	<div id="outer">
	   <div id="container" >
	     <div id="header">
			<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
		 </div>
	     <div id="left"><span>left</span></div>
	     <div id="content">
	<table>
		<tr>
			<th>책표지</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>대여시작일<th>
			<th>대여만료일</th>
			<th>보기</th>
		</tr>
		<c:forEach var="vo" items="${list}">
		<tr>
			<td>${vo.coverImg}</td>
			<td><a href="${pageContext.request.contextPath}/book/detail.do?bookCode=${vo.bookCode}">${vo.title}</a></td>
			<td>${vo.author}</td>
			<td>${vo.rentDate}</td>
			<td>${vo.expireDate}</td>
			<th><a href="#">책보기</a></th>
		</tr>
		</c:forEach>
		<c:if test="${empty list}">
		<tr><td colspan="5">대여 내역이 없습니다.</td></tr>
		</c:if>
		</table>
		<navi:page />
		
	</div>
	     <div id="right">
			<%@ include file="/WEB-INF/jsp/include/rightMenu.jsp" %>
		</div>
	     <div id="footer">
			<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
		 </div>
	   </div>
	</div>
</body>