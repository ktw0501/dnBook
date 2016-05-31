<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<title>책 입력 테스트 폼</title>
<style>
	label
	{
		width:100px;
	}
</style>
</head>
<body>
	<c:import url="../include/basic.jsp"/> 
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
	
	<form role="form" action="${pageContext.request.contextPath}/admin/book/regist.do" method="post"
		  enctype="multipart/form-data">
		  

				<label>coverImg</label>
				<input type="file" name="coverFile">
				<br>
				
				<label>pdf파일</label>
				<input type="file" name="pdfFile">
				<br>
				<label>title</label>
				<input type="text" name="title">
				<br>
				<label>publisher</label>
				<input type="text" name="publisher">
				<br>

				<label>작가</label>
				<input type="text" name="author">
				<br>

				<label>역자</label>
				<input type="text" name="translator">
				<br>

				<label>책소개</label>
				<input type="text" name="description">
				<br>

				<label>가격</label>
				<input type="text" name="price">
				<br>

				<label>대여가</label>
				<input type="text" name="rentPrice">
				<br>


				<label>출판일</label>
				<input type="text" name="pubDate">
				<br>

				<label>카테고리코드</label>
				<input type="text" name="categoryCode">
				<br>


		<button type="submit" class="btn btn-primary">등록</button>
	</form>
	</div>
</body>
</html>