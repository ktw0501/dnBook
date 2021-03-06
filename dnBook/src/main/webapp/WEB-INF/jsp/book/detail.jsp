<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detailBook</title>
<style>

	.content111 {
		width: 650px; 
/* 		border: 1px solid black; */
	}
	.book {
		float: left;
	}
	#title {
		width: 648px; height: 50px;
/* 		border: 1px solid black; */
	}
	#bookInfoA1 {
		width: 648px; height: 200px;
/* 		border: 1px solid black; */
	}
	#img2 {
		width: 150px; height: 198px;
/* 		border: 1px solid black; */
	}
	#infoA2 {
		width: 494px; height: 198px;
/* 		border: 1px solid black; */
	}
	#infoA3 {
		height: 150px;
/* 		border: 1px solid black; */
	}
	#infoA41 {
		width: 280px; height: 100px;
/* 		border: 1px solid black; */
	}
	#infoA42 {
		width: 188px; height: 148px;
/* 		border: 1px solid black; */
	}
	#wish3 {
		height: 44px;
/* 		border: 1px solid black; */
	}  
	.btn {
		
	}
	
	
	#bookInfoB1 {
		width: 648px; height: 250px;
/* 		border: 1px solid black; */
		
	}
	.infoB21 {
		width: 648px; height: 40px;
/* 		border: 1px solid black; */
		
	}
	.infoB22 {
		width: 648px; height: 122px;
/* 		border: 1px solid black; */
	}
	.re1 {
		width: 80px;
		text-align: center;
	}
	.re2 {
		width: 500px;
	}
	.re22 {
		width: 500px;
		text-align: center;
	}
	.re3 {
		width: 50px;
		text-align: center;
	}
	
	
	#pass {
		position: fixed;
		left: 800px; top: 500px;
		width: 300px; height: 60px;
		background: gold;
		border: 2px solid black;
	}
	
 #outer {width: 100%}
 #container { width:1070px; margin: 0 auto;}
 #container #header { width:1030px; height:200px; margin-left:10px;  margin-bottom:10px;}
 #container #left { display:inline; float:left; width:190px; height:500px; margin-left:10px; background:#33CCFF; }
 #container #content { float:left; width:650px; margin-left:10px; background:#BFF484; }
 #container #right { float:left; width:190px; height:500px; margin-left:10px; background:#73534D; }
 #container #footer { clear:both; width:1050px; height:150px; margin-left:10px; margin-top:10px;}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.js"></script>
</head>
<body>
<div id="outer">
	   <div id="container" >
	     <div id="header">
			<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
		 </div>
	     <div id="left"><span>left</span></div>
	     <div id="content">
			<div class="container111">
				<div class="content111" >
					<div id="title">
						${book.title}
					</div>
					<div id="bookInfoA1">
						<div id="img2" class="book">${book.coverImg}</div>
						<div id="infoA2" class="book">
							<div id="infoA3">
								<div id="infoA41" class="book"  style="padding: 10px;">
									<div>저자 : ${book.author} <c:if test="${book.translator != null}"> | ${book.translator}</c:if></div>
									<div style="padding-top: 10px;">출판사 : ${book.publisher}</div>
									<div style="padding-top: 10px;">출판일 : ${book.pubDate}</div>
									<div style="padding-top: 10px;">정가 : ${book.price}원</div>
								</div>
								<div id="infoA42" class="book">
									추천 그래프
								</div>
							</div>
							<div id="wish3" style="padding-left: 10px;"> 
								<div>
									<button type="button" class="btn" id="wishBtn">장바구니 담기</button>
									<button type="button" class="btn" id="buyBtn">구매</button>
									<button type="button" class="btn" id="recomBtn">대여</button>
									<button type="button" class="btn" id="viewBtn">뷰어</button>
								</div>
							</div>
						</div>
					</div>
					<div id="bookInfoB1" >
						<div class="infoB21">
							주제분류
						</div>
						<div class="infoB21">
							>>
						</div>
						<div class="infoB21">
							책소개
						</div>
						<div class="infoB22">
							${book.description}
						</div>
					</div>
				
				
						
					<%-- 댓글 관련 부분 추가 --%>
					<form id="crForm" name="crForm" action="registReview.json">
						<!-- 게시물번호 -->
						<input type="hidden" name="bookCode" value="${book.bookCode}" />      
						<table>
						<tr>
							<td><textarea name="content" rows="2" cols="60"></textarea></td>
							<td><button>등록</button></td>
						</tr>	
						</table>
					</form>
			
					<form id="cmForm" name="cmForm" action="modifyReview.json">
						<!-- 게시물번호 -->
						<input type="hidden" name="reviewNo" />      
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
			
				
			</div>
		 </div>
	     <div id="right">
			<%@ include file="/WEB-INF/jsp/include/rightMenu.jsp" %>
		</div>
	     <div id="footer">
			<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
		 </div>
	   </div>
	</div>


	<div id="pass">
		<div>비밀번호 입력 <input type="password" id="pas"/></div>
		<div style="text-align: right; padding-right: 20px;">
			<button class="ok">확인</button>
			<button class="cancle">취소</button>
		</div>
	</div>


	
<script>
	$(function () {
		// 장바구니 버튼 ----------------------------------------------------
		$("#wishBtn").on("click", function () {
			var wishUrl = "registWish.do";
			if("${wishCount}" == "1") {				
				wishUrl = "deleteWish.do";
			}
			location.href = wishUrl + "?bookCode=${book.bookCode}";
		});
		// 추천 상태일 경우 버튼의  css 변경
		if("${wishCount}" == "1") {
// 			$("#wishBtn").attr("class", "wish");
			$("#wishBtn").empty();
			$("#wishBtn").html("장바구니 취소");
		}
		// -------------------------------------------------------장바구니
		// 구매 버튼 ----------------------------------------------------
		$("#pass").hide();   	// 처음 확인창
		$("#buyBtn").on("click", function () {
			$("#pass").show();   	// 확인창 보여주기
		});
		
		$(".cancle").on("click", function () {
			$("#pass").hide();   	// 확인창 보여주기
		});
		$(".ok").on("click", function () {
			passok();
		});
		// -------------------------------------------------------구매
		// 뷰어 버튼 ----------------------------------------------------
		$("#viewBtn").on("click", function () {
			openNewWindow("view.do?bookCode=${book.bookCode}");
// 			location.href = "view.do?bookCode=${book.bookCode}";
		});
		// -------------------------------------------------------뷰어
		
		
		console.log("sadfsad");
		
		// 댓글 관련 내용 추가 아래 -----------------------------
		$("#cmForm").hide();   	// 댓글 수정폼
		commentList();			// 댓글 목록 조회
		
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
//====================================================================== 뷰어 =======
	function pop() {
	var strURL ="view.jsp";
	var strPos = "dialogWidth:250px; dialogHeight:300; status:no; scroll:no; resizable:no";
	var result = new Array();
	var val = new Object();
	val.dirPath = ${book.rentalDirPath};
	result = window.showModalDialog(strURL, val, strPos);
}
//=============== ======================================================= 여기
	function passok() {
		if($("#pas").val() == "${pass}") {
			$.ajax({
				url: "passchk.do",
				data: {
					id: "${id}",
					pass: $("#pas").val(),
					bookCode: "${book.bookCode}"
				}
			})
			.done(function (data) {
				$("#pass").hide();
				alert("구매완료 되었습니다.");
			});
		} else {
			alert("비밀번호가 잘못");
		}
	}
//============================================================================
	
	
	
	// 댓글 목록
	function commentList() {
		$.ajax({
			url: "listReview.json",
			data: {bookCode: "${book.bookCode}"}
		})
		.done(resCommentList);
	}
	/**
	 *   댓글 목록,삭제 콜백 
	 */
	function resCommentList(list) {
		var table = $("<table>").append("<tr><th class='re1'>작성자</th><th class='re22'>내용</th><th class='re3'>삭제</th><th class='re3'>수정</th></tr>");
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
		var tr = $("<tr>").append($("<td class='re1'>").html(data.id))
		                  .append($("<td class='re2' id='" + data.reviewNo + "'>").html(data.content));
		var delHtml = "";
		var modHtml = "";
		if ("${user.id}" == data.id) {
			delHtml = '<a href="#1" onclick="commentDel(' + data.bookCode + ', ' + data.reviewNo + ')">삭제</a>';
			modHtml = '<a href="#1" onclick="setModCommentForm(' + data.reviewNo + ', \'' + data.content + '\')">수정</a>';
		} 
		tr.append($("<td>").html(delHtml));
		tr.append($("<td>").html(modHtml));
		return tr;
	}
	
	// 댓글 등록
	function commentReg() {
		var f = document.crForm;
		$.ajax({
			url: f.action,
			type: "POST",
			data: {
				bookCode: f.bookCode.value,
				content: f.content.value
			}
		})
		.done(function (data) {
			// 입력내용 초기화
			console.dir(data);
			f.content.value = "";
			$("#commentList > table > tbody > tr:eq(0)").after(makeTr(data));
		});
	}
	
	// 댓글 삭제
	function commentDel(bookCode, reviewNo) {
		$.ajax({
			url: "deleteReview.json",
			data: {
				bookCode: bookCode,
				reviewNo: reviewNo
			}
		})
		.done(resCommentList);
	}
	
	// 댓글 수정 폼 설정
	function setModCommentForm(reviewNo, content) {
		var f = document.cmForm;
			f.reviewNo.value = reviewNo;
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
				reviewNo: f.reviewNo.value,
				content: f.content.value
			}
		})
		.done(function (data) {
			$("#crForm").show();
			$("#cmForm").hide();
			
			// 목록의 내용을 수정된 내용으로 업데이트
			$("#" + f.reviewNo.value).html(f.content.value);
			
			f.reviewNo.value = "";
			f.content.value  = "";
		});
	}
	
	
</script>
</body>
</html>