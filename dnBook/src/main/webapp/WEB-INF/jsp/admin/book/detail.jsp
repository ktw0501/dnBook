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
	#cover
	{
		width: 300px;
	}
</style>
</head>
<body>
	<c:import url="../include/basic.jsp"/> 
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
	
	<form role="form" action="${pageContext.request.contextPath}/admin/book/regist.do" method="post"
		  enctype="multipart/form-data">
		  

				<label>coverImg</label>
				<img id="cover" src="${pageContext.request.contextPath}/upload/${book.rentalDirPath}/${book.coverImg}"/>
				<br>
				
				<label>pdf파일</label>
				<a href="${pageContext.request.contextPath}/admin/book/down.do?downName=${book.title}?realName=${book.rentalDirPath}/${book.pdfPath}"> 다운로드 </a>
				<br>
				
				<label>title</label>
				${book.title}
				<br>
				<label>publisher</label>
				${book.publisher}
				<br>

				<label>작가</label>
				${book.author}
				<br>

				<label>역자</label>
				${book.translator}
				<br>

				<label>책소개</label>
				${book.description}
				<br>

				<label>가격</label>
				${book.price}
				<br>

				<label>대여가</label>
				${book.rentPrice}
				<br>	


				<label>출판일</label>
				${book.pubDate}
				<br>

				<label>카테고리코드</label>
				${book.categoryCode}
				<br>
				<a class="btn btn-primary" href = "${pageContext.request.contextPath}/admin/book/updateform.do?bookCode=${book.bookCode}"> 수정 </a>
				

	</form>
	</div>
	<script type="text/javascript">

	
	</script>
</body>
</html>
