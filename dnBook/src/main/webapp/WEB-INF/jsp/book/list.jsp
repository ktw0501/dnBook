<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="navi" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>listBook</title>
<style>
	.content {
		width: 650px; height: 600px;
	}
	.list {
		width: 650px; height: 200px;
		border: 1px solid black;
	}
	.book {
		float: left;
	}
	#img {
		width: 150px; height: 200px;
		border: 1px solid black;
	}
	#bookInfo {
		width: 370px; height: 200px;
		border: 1px solid black;
		
	}
	#choice {
		width: 124px; height: 200px;
		border: 1px solid black;
	}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.js"></script>
<script>
	function jsPageMove(pageNo) {
		location.href = "${pageContext.request.contextPath}/book/list.do?pageNo=" + pageNo;
	}
</script>
</head>
<body>
<div class="container">
	<div class="header">
		<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
	</div>
	
	<div class="content">
	
		<div class="search">
			<a href="order.do?no=1">도서명순</a><span>|</span>
			<a href="order.do?no=2">판매량순</a><span>|</span>
			<a href="order.do?no=3">등록일순</a><span>|</span>
			<a href="order.do?no=4">저가격순</a><span>|</span>
			<a href="order.do?no=5">고가격순</a>
		</div>
		${list[0].title}${list[1].title}${list[2].title}
		<div>
			<c:forEach var="vo" items="${list}">
				<div class="list">
					<div id="img"  class="book">${vo.coverImg}</div>
					<div id="bookInfo"  class="book">
						<div><a href="detail.do?bookCode=${vo.bookCode}">${vo.title}</a></div>
						<div>${vo.author}(지은이) | ${vo.publisher} | ${vo.pubDate}</div>
						<div>${vo.price}원</div>
						<div>${vo.description}</div>
					</div>
					<div id="choice" class="book">
						<div>찜</div>
						<div>구매</div>
						<div>대여</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="page">
			<c:if test="${not empty list}">
				<navi:page />
			</c:if>
		</div>
	</div>
	
	<div class="footer">
		<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
	</div>
</div>
</body>
</html>