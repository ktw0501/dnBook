<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content">
<h1>회원 상세정보</h1>
<hr />
<table>
	<tr>
		<th>아이디</th>
		<td>${member.id}</td>
	</tr>	
	<tr>
		<th>이름</th>
		<td>${member.name}</td>
	</tr>	
	<tr>
		<th>주소</th>
		<td>${member.address}</td>
	</tr>	
	<tr>
		<th>상세주소</th>
		<td>${member.detailAddress}</td>
	</tr>	
	<tr>
		<th>이메일</th>
		<td>${member.email}</td>
	</tr>	
	<tr>
		<th>우편번호</th>
		<td>${member.postCode}</td>
	</tr>	
	<tr>
		<th>전화번호</th>
		<td>${member.tel}</td>
	</tr>	
	<tr>
		<th>회원상태</th>
		<td>${member.status}</td>
	</tr>	
	</table>
	<button type="button" id="stopBtn">회원 정지</button>
	<a href="updateForm.do?id=${member.id}"></a>	
</div>


<script type="text/javascript">
$(function () {
	$("#stopBtn").on("click", function () {
		var stopUrl = "update.do";
		if(${status} == 1) {
			recomUrl = "deleteRecom.do";
		}
		location.href = recomUrl + "?no=${board.no}";
	});
});




</script>



</body>
</html>