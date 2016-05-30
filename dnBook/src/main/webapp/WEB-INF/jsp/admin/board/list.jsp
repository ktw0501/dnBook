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
	a {
		text-decoration: none;
		color: black;
	}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function jsPageMove(pageNo)
	{
		location.href = "list.do?pageNo=" + pageNo;
	}

</script>
</head>
<body>
	<div id="outer">
		<div id="container">
			
			<div id="top">
				<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
			</div>
			
			<div id="body">
				<div id="bleft">a</div>
				<div id="bmiddle">
					<div id="serviceLogo">
						<img src="${pageContext.request.contextPath}/img/serviceLogo.jpg" />
					</div>
					<div id="board">
						<table class="table table-striped">
							<tr>
								<th style="width: 10%;">삭제</th>
								<th style="width: 10%;">번호</th>
								<th style="width: 30%;">제목</th>
								<th style="width: 10%;">작성자</th>
								<th style="width: 10%;">조회수</th>
								<th style="width: 20%;">등록일</th>
							</tr>
							<c:forEach var="vo" items="${list}">
							<tr>
								<td><input type="checkBox" value="${vo.boardNo}" name = delCheck></td>
								<td>${vo.boardNo}</td>
								<td><a href="detail.do?boardNo=${vo.boardNo}&boardType=${vo.boardType}">${vo.title}</a></td>
								<td>관리자</td>
								<td>${vo.pageViewCnt}</td>
								<td>${vo.regDate}</td>
							</tr>
							
							</c:forEach>
							<tr>
								<td> <button id="delBtn"> 선택 삭제 </button></td>
							</tr>
							<c:if test="${empty list}">
							<tr><td colspan="5">게시물이 없습니다.</td></tr>
							</c:if>
						</table>
						<a href="registForm.do?boardType=${boardType}">글쓰기</a>
						<c:if test="${not empty list}">
							<navi:page/>
						</c:if>
					</div>
				</div>
				<div id="bright">a</div>
			</div>
			
			<div id="bottom">
				<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
			</div>
		</div>
	</div>
	
<script type="text/javascript">

$(function(){
	$("#delBtn").click(function(){

		var delNo = "";
		var i = 0;
		$("input:checked").each(function(){

			if(i!=0)
				delNo+=",";
			delNo+=$(this).val();		
			i++;
// 			$("#tr"+delNo[i++]).remove();
		});
		console.log(delNo);
		$.ajax({
			url:"delete.do",
			data:{"data":delNo}
			
		}).done(function(data)
		{
			console.log(data);
			jsPageMove("${page.pageNo}");
		})
		
	})
})

</script>
</body>
</html>