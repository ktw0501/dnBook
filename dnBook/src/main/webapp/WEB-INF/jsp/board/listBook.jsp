<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>listBook</title>
<style>
	.container {
		width: 650px; height: 600px;
	}
	.list {
		width: 650px; height: 200px;
	}
	.book {
		floar: left;
	}
	#img {
		width: 150px; height: 100%;
	}
	#bookInfo {
		
	}
	#choice {
		width: 120px; height: 100%;
	}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.js"></script>
</head>
<body>
	<div class="container">
		<div class="search">
			상품명순 | 판매량순 | 등록일순 | 저가격순 | 고가격순
		</div>
		<div class="list">
			<c:forEach var="book" items="${list}">
				<div>
					<div id="img"  class="book">${book.coverImg}</div>
					<div id="bookInfo"  class="book">
						<div><a href="detailBook.do?bookCode=${book.bookCode}">${book.title}</a></div>
						<div>${book.author}(지은이) | ${book.publisher} | ${book.pubDate}</div>
						<div>${book.price}원</div>
						<div>${book.description}</div>
					</div>
					<div id="choice"  class="book">
						<div>찜</div>
						<div>구매</div>
						<div>대여</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="page">
			
		</div>
	</div>
</body>
</html>