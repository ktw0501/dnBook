<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.recom {
		background: tomato;
		color: white;
		font-weight: bold;
		border: 1px solid black;
	}  
</style>
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
</head>
<body>
<div class="container">
	<div class="header">
		<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
	</div>	
	<div class="content">
		<h1>자유게시판</h1>
		<hr />
		<table>
		<tr>
			<th>제목</th>
			<td>${board.title}</td>
		</tr>	
		<tr>
			<th>작성자</th>
			<td>${board.writer}</td>
		</tr>	
		<tr>
			<th>내용</th>
			<td>${board.content}</td>
		</tr>	
		<tr>
			<th>조회수</th>
			<td>${board.pageViewCnt}</td>
		</tr>	
		<tr>
			<th>첨부파일</th>
			<td><a href="${pageContext.request.contextPath}/down?realName=${file.filePath}/${file.realFileName}&downName=${file.oriFileName}">${file.oriFileName}</a> (${file.fileSize} byte)</td>
		</tr>	
		</table>	
		<button type="button" id="recomBtn">추천</button>
		<button type="button" id="recomBtn2">추천</button>
		<button type="button" id="recomBtn3">추천(자신글)</button>
		<a href="updateForm.do?no=${board.no}">수정</a>
		<a href="delete.board.do?no=${board.no}">삭제</a>
		<a href="listBoard.do">목록</a>
		
		<div>
			<table>
			<c:if test="${not empty board.prev.title}">
			<tr>
				<th>이전글</th>
				<td><a href="detailBoard.do?no=${board.prev.no}">${board.prev.title}</a></td>
			</tr>
			</c:if>
			<c:if test="${not empty board.next.title}">
			<tr>
				<th>다음글</th>
				<td><a href="detailBoard.do?no=${board.next.no}">${board.next.title}</a></td>
			</tr>
			</c:if>
			</table>
		</div>
		
		
		<%-- 댓글 관련 부분 추가 --%>
		<form id="crForm" name="crForm" action="registComment.json">
			<!-- 게시물번호 -->
			<input type="hidden" name="no" value="${board.no}" />      
			<table>
			<tr>
				<td><textarea name="content" rows="2" cols="60"></textarea></td>
				<td><button>등록</button></td>
			</tr>	
			</table>
		</form>

		<form id="cmForm" name="cmForm" action="modifyComment.json">
			<!-- 게시물번호 -->
			<input type="hidden" name="commentNo" />      
			<table>
			<tr>
				<td><textarea name="content" rows="2" cols="60"></textarea></td>
				<td><button>수정</button></td>
			</tr>	
			</table>
		</form>
		
		<!-- 댓글 목록 -->
		<div id="commentList"></div>
		
	</div>
	<div class="footer">
		<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
	</div>
</div>
<script>
	$(function () {
		
		$("#recomBtn").on("click", function () {
			if("${recomCount}" == "1") {
				alert("이미 추천하셨습니다.");
				return ;
			}
			location.href = "registRecom.do?no=${board.no}";
		});
		$("#recomBtn2").on("click", function () {
			var recomUrl = "registRecom.json";
			if("${recomCount}" == "1") {
				recomUrl = "deleteRecom.do";
			}
			location.href = recomUrl + "?no=${board.no}";
		});
		$("#recomBtn3").on("click", function () {
			if ("${user.id}" ==  "${board.writer}") {
				alert("자신이 작성한 글은 추천할 수 없습니다.");
				return;
			}
			
			var recomUrl = "registRecom.json";
			if("${recomCount}" == "1") {
				recomUrl = "DeleteRecom";
			}
			location.href = recomUrl + "?no=${board.no}";
		});
		// 추천 상태일 경우 버튼의  css 변경
		if("${recomCount}" == "1") {
			$("#recomBtn2").attr("class", "recom");
		}
		
		// 댓글 관련 내용 추가 아래 -----------------------------
		$("#cmForm").hide();   // 댓글 수정폼
			
		// 댓글 목록 조회
		commentList();
		
		// 등록폼 
		$("#crForm").submit(function (event) {
			commentReg();
			event.preventDefault();
		});
		
		// 수정폼 
		$("#cmForm").submit(function (event) {
			commentMod();
			event.preventDefault();
		});
	});
	
	// 댓글 목록
	function commentList() {
		$.ajax({
			url: "listComment.json",
			data: {no: "${board.no}"}
		})
		.done(resCommentList);
	}
	
	/**
	 *   댓글 목록,삭제 콜백 
	 */
	function resCommentList(list) {
		var table = $("<table>").append("<tr><th>작성자</th><th>내용</th><th>작성일시</th><th>삭제</th></tr>");
		for (var i in list) {
			table.append(makeTr(list[i]));
		}
		if (list.length == 0) {
			table.append($("<tr>").append($("<td colspan='4'>").html("작성된 댓글이 없습니다.")));
		}
		$("#commentList").empty();
		$("#commentList").append(table);
	}
	
	// 댓글 tr 생성하기
	function makeTr(data) {
// 				<td>t:formatDate value="${commentVO.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
		var tr = $("<tr>").append($("<td>").html(data.id))
		                  .append($("<td id='" + data.commentNo + "'>").html(data.content));
		var delHtml = "";
		if ("${user.id}" == data.id) {
			delHtml = '<a href="#1" onclick="commentDel(' + data.no + ', ' + data.commentNo + ')">삭제</a>'
			        + '<a href="#1" onclick="setModCommentForm(' + data.commentNo + ', \'' + data.content + '\')">수정</a>';
		} 
		var rDate = new Date(data.regDate);
		var rTime = rDate.getFullYear() + "-" + rDate.getMonth()   + "-" + rDate.getDate() + " "
		          + rDate.getHours()    + ":" + rDate.getMinutes() + ":" + rDate.getSeconds();
		tr.append($("<td>").html(rTime));
		tr.append($("<td>").html(delHtml));
		return tr;
	}
	
	// 댓글 등록
	function commentReg() {
		var f = document.crForm;
		$.ajax({
			url: f.action,
			type: "POST",
			data: {
				no: f.no.value,
				content: f.content.value
			}
		})
		.done(function (data) {
			// 입력내용 초기화
			f.content.value = "";
			$("#commentList > table > tbody > tr:eq(0)").after(makeTr(JSON.parse(data)));
		});
	}
	
	// 댓글 삭제
	function commentDel(no, commentNo) {
		$.ajax({
			url: "deleteComment.json",
			data: {
				no: no,
				commentNo: commentNo
			}
		})
		.done(resCommentList);
	}
	
	// 댓글 수정 폼 설정
	function setModCommentForm(commentNo, content) {
		var f = document.cmForm;
			f.commentNo.value = commentNo;
			f.content.value = content;

		$("#crForm").hide();
		$("#cmForm").show();
	}

	// 댓글 수정 Ajax
	function commentMod() {
		var f = document.cmForm;
		$.ajax({
			url: f.action,
			type: "POST",
			data: {
				commentNo: f.commentNo.value,
				content: f.content.value
			}
		})
		.done(function (data) {
			$("#crForm").show();
			$("#cmForm").hide();
			
			// 목록의 내용을 수정된 내용으로 업데이트
			$("#" + f.commentNo.value).html(f.content.value);
			
			f.commentNo.value = "";
			f.content.value   = "";
		});
	}
	
</script>
</body>
</html>





