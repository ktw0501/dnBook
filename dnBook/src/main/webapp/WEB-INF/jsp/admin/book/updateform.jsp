<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 입력 테스트 폼</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/admin/book/update.do" method="post"
		  enctype="multipart/form-data">
		<table>
			<tr>
				<th>coverImg</th>
				<td><input type="file" name="coverFile">
				<input type="hidden" name="bookCode" value="${book.bookCode}">
				<input type="hidden" name="coverImg" value="${book.coverImg}">
				<input type="hidden" name="rentalDirPath" value="${book.rentalDirPath}">
				<input type="hidden" name="pdfPath" value="${book.pdfPath}">
				</td>
			</tr>
			<tr>
				<th>title</th>
				<td><input type="text" name="title" value="${book.title}"></td>
			</tr>
			<tr>
				<th>publisher</th>
				<td><input type="text" name="publisher" value="${book.publisher}"></td>
			</tr>
			<tr>
				<th>작가</th>
				<td><input type="text" name="author" value="${book.author}"></td>
			</tr>
			<tr>
				<th>역자</th>
				<td><input type="text" name="translator" value="${book.translator}"></td>
			</tr>
			<tr>
				<th>책소개</th>
				<td><input type="text" name="description" value="${book.description}"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" value="${book.price}"></td>
			</tr>
			<tr>
				<th>대여가</th>
				<td><input type="text" name="rentPrice" value="${book.rentPrice}"></td>
			</tr>
			<tr>
				<th>pdf파일</th>
				<td><input type="file" name="pdfFile" ></td>
			</tr>
			<tr>
				<th>출판일</th>
				<td><input type="text" name="pubDate" value="${book.pubDate}"></td>
			</tr>
			<tr>
				<th>카테고리코드</th>
				<td><input type="text" name="categoryCode" value="${book.categoryCode}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정"></td>
			</tr>
			
		</table>
		
	</form>
</body>
</html>