<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>책 입력 테스트 폼</title>
<style>
	label
	{
		widlabel:100px;
	}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/admin/book/update.do" melabelod="post"
		  enctype="multipart/form-data">

				<label>coverImg</label>
				<input type="file" name="coverFile">
				<label>pdf파일</label>
				<input type="file" name="pdfFile" >
				
				
				<input type="hidden" name="bookCode" value="${book.bookCode}">
				<input type="hidden" name="coverImg" value="${book.coverImg}">
				<input type="hidden" name="rentalDirPalabel" value="${book.rentalDirPalabel}">
				<input type="hidden" name="pdfPalabel" value="${book.pdfPalabel}">
				
			
			
				<label>title</label>
				<input type="text" name="title" value="${book.title}">
			
			
				<label>publisher</label>
				<input type="text" name="publisher" value="${book.publisher}">
			
			
				<label>작가</label>
				<input type="text" name="aulabelor" value="${book.aulabelor}">
			
			
				<label>역자</label>
				<input type="text" name="translator" value="${book.translator}">
			
			
				<label>책소개</label>
				<input type="text" name="description" value="${book.description}">
			
			
				<label>가격</label>
				<input type="text" name="price" value="${book.price}">
			
			
				<label>대여가</label>
				<input type="text" name="rentPrice" value="${book.rentPrice}">
			
			
			
			
				<label>출판일</label>
				<input type="text" name="pubDate" value="${book.pubDate}">
			
			
				<label>카테고리코드</label>
				<input type="text" name="categoryCode" value="${book.categoryCode}">
			
				<button type="submit" class="btn btn-primary">등록</button>
			
			

		
	</form>
</body>
</html>