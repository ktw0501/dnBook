<%@ tag body-content="empty" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div style="width: 100%; text-align: center; vertical-align: middle">
				<%-- 처음 페이지 설정 --%>
				<c:if test="${page.pageNo ne 1}" >
					<a href="#" onclick="jsPageMove(1)">◁◁</a>
				</c:if>
				
				<%-- 이전 페이지 설정 --%>
				<c:if test="${page.beginPage ne 1}">
					<a href="#" onclick="jsPageMove(${beginPage - 1})">◀</a>
				</c:if>
				
				<%-- 페이지 번호 설정 --%>			
				<c:forEach var="i" begin="${page.beginPage}" end="${page.endPage}">
					<c:if test="${i eq page.pageNo}">
						<strong>[${i}]</strong>
					</c:if>
					<c:if test="${i ne page.pageNo}">
						<a href="#" onclick="jsPageMove(${i})">[${i}]</a>
					</c:if>
				</c:forEach>
				
				<%-- 다음 페이지 설정 --%>
				<c:if test="${page.endPage ne page.lastPage}" >
					<a href="#" onclick="jsPageMove(${page.endPage + 1})">▶</a>
				</c:if>
				
				<%-- 마지막 페이지 설정 --%>
				<c:if test="${page.pageNo ne page.lastPage}" >
					<a href="#" onclick="jsPageMove(${page.lastPage})">▷▷</a>
				</c:if>
</div>