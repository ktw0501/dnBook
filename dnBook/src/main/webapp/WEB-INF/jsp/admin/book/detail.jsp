<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>

			<tr>
				<th>title</th>
				<td>${book.title}</td>
			</tr>
			<tr>
				<th>publisher</th>
				<td>${book.publisher}</td>
			</tr>
			<tr>
				<th>작가</th>
				<td>${book.author}</td>
			</tr>
			<tr>
				<th>역자</th>
				<td>${book.translator}</td>
			</tr>
			<tr>
				<th>책소개</th>
				<td>${book.description}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${book.price}</td>
			</tr>
			<tr>
				<th>대여가</th>
				<td>${book.rentPrice}</td>
			</tr>
			<tr>
				<th>pdf파일</th>
				<td>${book.pdfPath}</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td>${book.rentalDirPath}</td>
			</tr>
			<tr>
				<th>커버</th>
				<td>${book.coverImg}</td>
			</tr>
			<tr>
				<th>출판일</th>
				<td>${book.pubDate}</td>
			</tr>
			<tr>
				<th>카테고리코드</th>
				<td>${book.categoryCode}</td>
			</tr>
			
		</table>
</body>
</html>