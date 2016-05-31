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
	#title {
		float: left;
	}
	#viewCnt {
		float:right;
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
						<table>
							<tr >
								<td style="border-bottom: 1px solid black">
									<div id="title" ><c:out value="${board.title}" /></div>
									<div id="viewCnt">조회수 ${board.pageViewCnt}</div>
								</td>
							</tr>
							<tr>
								<td style="border-bottom: 1px solid black">
									<br />
									<textarea id="content" style="resize: none; border: none;" rows="8" cols="90"  
									><c:out value="${board.content}" /></textarea>
								</td>
							</tr>
						</table>
						<div id="comment">
							<div id="commentReg">
								<textarea rows="2" cols="60" style="resize: none;"></textarea> <button type="button" onclick="regComment();">입력</button>
							</div>
							<div id="commentUpd">
								<textarea rows="2" cols="60" style="resize: none;"></textarea> <button type="button" onclick="updComment();">수정</button>
							</div>
							<div id="commentList">
								<table class="table table-striped"></table>
							</div>
						</div>
						<div>
							<table>
								<c:if test="${not empty next.title}">
								<tr>
									<th>다음글</th>
									<td><a href="detail.do?no=${next.boardNo}">${next.title}</a></td>
								</tr>
								</c:if>
								<c:if test="${not empty prev.title}">
								<tr>
									<th>이전글</th>
									<td><a href="detail.do?no=${prev.boardNo}">${prev.title}</a></td>
								</tr>
								</c:if>
							</table>
							<a href="list.do?boardType=${board.boardType}">목록</a>
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
			$("#commentUpd").hide();
			$.ajax({
				url: "commentList.json",
				data: {boardNo: "${board.boardNo}"}
			}).done(function(data) {
				mkCommentList(data);
			});
		});
		
		function mkCommentList(data) {
			$(".table").empty();
			for(var vo in data) {
				var html = "<tr><td>" + data[vo].content + "</td><td>" + data[vo].id + "</td><td>" + data[vo].regDate + "</td>";
				if(data[vo].id == "aa") {
					html += "<td><a href='#' onclick='updSetComment(" + data[vo].commentNo + ", " + data[vo].content + ");'>수정</a></td><td>" +
					        "<a href='#' onclick='delComment(" + data[vo].commentNo  + ");'>삭제</a></td>";
				}
				$(".table").append(html);
			}
		};
			
		function regComment() {
			$.ajax({
				url: "insertComment.json",
				data: {boardNo: "${board.boardNo}",
					   content: $("#commentReg > textarea").val(),
					   id: "aa"}
			}).done(function(data) {
				mkCommentList(data);
				$("#commentReg > textarea").val("");
			});
		}
		
		function updSetComment(commentNo, content) {
			$("#commentUpd").show();
			$("#commentReg").hide();
			$("#commentUpd > textarea").val(content);
			
			updateComment(commentNo);
		}
		
		function updateComment(commentNo) {
			$.ajax({
				url: "updateComment.json",
				data: {
						boardNo: "${board.boardNo}",
						commentNo: commentNo,
						content: $("#commentUpd > textarea").val(),
						id: "aa"
				}
			}).done(function(data) {
				mkCommentList(data);
				$("#commentUpd").hide();
				$("#commentReg").show();
			});
		}
		
		function delComment(commentNo) {
			$.ajax({
				url: "deleteComment.json",
				data: {
						boardNo: "${board.boardNo}",
						commentNo: commentNo
				}
			}).done(function(data) {
				mkCommentList(data);
			});
		};
			
	</script>
</body>
</html>