<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="header">
		<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
	</div>	
	<div class="content">
		<h2>자유게시판</h2>
		<hr />
		<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="vo" items="${list}">
		<tr>
			<td>${vo.no}</td>
			<td><a href="detailBoard.do?no=${vo.no}">
					${vo.title}<c:if test="${vo.commentCnt != 0}">[${vo.commentCnt}]</c:if>
				</a>
			</td>
			<td>${vo.writer}</td>
			<td>${vo.pageViewCnt}</td>
			<td>${vo.regDate}</td>
		</tr>
		</c:forEach>
		<c:if test="${empty list}">
		<tr><td colspan="4">게시물이 없습니다.</td></tr>
		</c:if>
		</table>
		<a href="registForm.do">글쓰기</a>
		
		<%-- 
			*****************************************************************************	
			* 페이징 영역 시작 
			*****************************************************************************	
		--%>
		<c:if test="${not empty list}">
			<div style="width: 70%; text-align: center; vertical-align: middle">
				<%-- 처음 페이지 설정 --%>
				<c:if test="${pageNo ne 1}" >
					<a href="listBoard.do?pageNo=1">◀◀</a>
				</c:if>
				
				<%-- 이전 페이지 설정 --%>
				<c:if test="${beginPage ne 1}">
					<a href="listBoard.do?pageNo=${beginPage - 1}">◁</a>
				</c:if>
				
				<%-- 페이지 번호 설정 --%>			
				<c:forEach var="i" begin="${beginPage}" end="${endPage}">
					<c:if test="${i eq pageNo}">
						<strong>[${i}]</strong>
					</c:if>
					<c:if test="${i ne pageNo}">
						<a href="listBoard.do?pageNo=${i}">[${i}]</a>
					</c:if>
				</c:forEach>
				
				<%-- 다음 페이지 설정 --%>
				<c:if test="${endPage ne lastPage}" >
					<a href="listBoard.do?pageNo=${endPage + 1}">▷</a>
				</c:if>
				
				<%-- 마지막 페이지 설정 --%>
				<c:if test="${pageNo ne lastPage}" >
					<a href="listBoard.do?pageNo=${lastPage}">▶▶</a>
				</c:if>
			</div>
		</c:if>
		<%-- 
			*****************************************************************************	
			* 페이징 영역 종료                              
			*****************************************************************************	
		--%>
		
	</div>
	<div class="footer">
		<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
	</div>
</div>
</body>
</html>


