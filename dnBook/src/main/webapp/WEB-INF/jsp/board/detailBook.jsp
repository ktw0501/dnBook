<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.datail {
		
	}
	.book {
		floar: left;
	}
</style>
</head>
<body>
	<div class="detail">
		<div>
			${book.title}
		</div>
		<div>
			<div class="book">${book.coverImg}</div>
			<div class="book">
				<div>저자 : ${book.author}<c:if test="${book.translator != null}">${book.translator}</c:if></div>
				<div>출판사 : ${book.author}</div>
				<div>출판일 : ${book.author}</div>
				<div>정가 : ${book.author}</div>
				<div> </div>
			</div>
		</div>
		<div>
			주제분류
		</div>
		<div>
			>>
		</div>
		<div>
			책소개
		</div>
		<div>
			${book.description}
		</div>
	</div>
</body>
</html>