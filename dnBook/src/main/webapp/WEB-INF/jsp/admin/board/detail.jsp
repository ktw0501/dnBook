<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#titleHr {
		width: 100%;
		color: black;
		border: thin;
	}
	#line {
		
	}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
						<div id="title"><c:out value="${board.title}" /></div>
						<div id="line"><hr id="titleHr"></div>
						<div id="content"><c:out value="${board.content}" /></div>
						<div>
							<a href="delete.do?boardNo=${board.boardNo}&boardType=${board.boardType}">삭제</a>
						</div>
						
						<div id="comment">
							<div>
								
							</div>
							<div id="commentList">
								<table class="table table-striped"></table>
							</div>
						</div>
						<div>
							<table>
								<c:if test="${not empty board.next.title}">
								<tr>
									<th>다음글</th>
									<td><a href="detail.do?boardNo=${board.next.boardNo}">${board.next.title}</a></td>
								</tr>
								</c:if>
								<c:if test="${not empty board.prev.title}">
								<tr>
									<th>이전글</th>
									<td><a href="detail.do?boardNo=${board.prev.boardNo}">${board.prev.title}</a></td>
								</tr>
								</c:if>
							</table>
						</div>
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
		$(function() {
			$.ajax({
				url: "commentList.json",
				data: {boardNo: "${board.boardNo}"}
			}).done(function(data) {
				console.dir(data);
				for(var vo in data) {
					var html = "<tr><td>" + data[vo].content + "</td><td>" + data[vo].id + "</td><td>" + data[vo].regDate + "</td>";
					if(vo.id === "${user.id}") {
						html += "<td><a href='updateComment(" + data[vo].commentNo + ");'>수정</a></td><td>" +
						        "<a href='delComment(" + data[vo].commentNo  + ");'>삭제</a></td>";
					}
					$(".table").append(html);
				}
			});
		})		
			
	</script>
</body>
</html>