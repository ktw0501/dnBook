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
	
</style>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	function jsPageMove(pageNo) {
		location.href = "list.do?pageNo=" + pageNo + "&boardType=${boardType}";
	}


// 	function jsPageMove(pageNo)
// 	{
// 		location.href = "list.do?pageNo=" + pageNo;
// 	}

</script>
</head>
<body>



	<c:import url="../include/basic.jsp" />
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-show-columns="true">
			<thead>
				<tr>
					<th>삭제</th>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<c:forEach var="board" items="${list}">

				<tr id="tr${board.boardNo}">
					<td><input type="checkBox" value="${board.boardNo}"
						name=delCheck></td>
					<td>${board.boardNo}</td>
					<td><a href="${pageContext.request.contextPath}/admin/board/detail.do?boardNo=${board.boardNo}&boardType=${board.boardType}">${board.title}</a></td>
					<td>${board.pageViewCnt}</td>
					<td>${board.regDate}</td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${not empty list}">
			<navi:page />
		</c:if>
		<button class="btn btn-primary" id="delBtn">삭제</button>
		<button class="btn btn-primary" id="registBtn">글 등록</button>
	</div>








	<script type="text/javascript">

$(function(){
	$("#delBtn").click(function(){

		var delNo = "";
		var i = 0;
		var boardType = ${boardType};
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
			data:{"data":delNo,
				"boardType":boardType}
			
		}).done(function(data)
		{
			console.log(data);
			jsPageMove("${page.pageNo}");
		})
	});
	$("#registBtn").click(function(){
		location.href = "registForm.do?boardType=" + ${boardType};
	})
})

</script>
</body>
</html>