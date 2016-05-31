<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="navi" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script type="text/javascript">
	function jsPageMove(pageNo)
	{
		location.href = "list.do?pageNo=" + pageNo;
	}
</script>
</head>
<body>
	<c:import url="../include/basic.jsp"/> 
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
	<table data-toggle="table"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true">
	    <thead>
	    <tr>
	        <th >삭제</th>
	        <th >BookCode</th>
	        <th >Cover</th>
	        <th >title</th>
	        <th >publisher</th>
	    </tr>
	    </thead>
	<c:forEach var="book" items="${list}">
	
	<tr id="tr${book.bookCode}">
	<td><input type="checkBox" value="${book.bookCode}" name = delCheck></td>
	<td>${book.bookCode}</td>
	<td><img src="${book.rentalDirPath}/${book.coverImg}"/></td>
	<td><a href="${pageContext.request.contextPath}/admin/book/detail.do?bookCode=${book.bookCode}">${book.title}</a></td>
	<td>${book.publisher}</td>
	</tr>	
	</c:forEach>
</table>
	<c:if test="${not empty list}">
		<navi:page/>
	</c:if>
	<button id="delBtn"> 삭제 </button>
	<button id="registBtn"> 글 등록 </button>
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
			url:"deleteBook.do",
			data:{"data":delNo}
			
		}).done(function(data)
		{
			console.log(data);
			jsPageMove("${page.pageNo}");
		})
		
	});
	$("#registBtn").click(function(){
		location.href = "registform.do";
	})
})

</script>


</body>
</html>