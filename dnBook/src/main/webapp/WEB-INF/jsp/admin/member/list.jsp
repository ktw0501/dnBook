<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="navi" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#outer {
		width: 100%;
	}
	
	#container {
		width: 1050px;
		margin: 0 auto;
	}
	
	#serviceLogo > img {
		width: 650px;
	}
	
	#bleft, #bright {
		width: 180px;
	}
	#body > div {
		float: left;
	} 
	#bmiddle {
		margin: 0 auto;
	}
	#bottom {
		clear: both;
	}
	#body {
		height: auto;
		width: 1050px;
		margin-top: 50px;
		margin-bottom: 50px;
	}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<c:import url="../include/basic.jsp" />
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-show-columns="true">
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>주소</th>
					<th>이메일</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<c:forEach var="member" items="${list}">

				<tr id="tr${board.boardNo}">
					
					<td><a href="${pageContext.request.contextPath}/admin/member/detail.do?id=${member.id}">${member.id}</a></td>
					<td><a href="${pageContext.request.contextPath}/admin/member/detail.do?id=${member.id}">${member.name}</a></td>
					<td><a href="${pageContext.request.contextPath}/admin/member/detail.do?id=${member.id}">${member.address} ${member.detailAddress}</a></td>
					<td>${member.email}</td>
					<td><a href="${pageContext.request.contextPath}/admin/member/detail.do?id=${member.id}">${member.tel}</a></td>
					
				</tr>
			</c:forEach>
		</table>
		<c:if test="${not empty list}">
			<navi:page />
		</c:if>
<!-- 		<button class="btn btn-primary" id="delBtn">삭제</button> -->
<!-- 		<button class="btn btn-primary" id="registBtn">글 등록</button> -->
	</div>






	<script type="text/javascript">
		function jsPageMove(pageNo) {
			location.href = "list.do?pageNo=" + pageNo + "&status=${status}";
		}
	</script>
</body>
</html>