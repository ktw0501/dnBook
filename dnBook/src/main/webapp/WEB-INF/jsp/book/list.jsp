<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="navi" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>listBook</title>
<style>
	.content111 {
		width: 650px; height: 600px;
	}
	.list {
		width: 650px; height: 200px;
		border: 1px solid black;
	}
	.book {
		float: left;
	}
	#img {
		width: 150px; height: 200px;
		border: 1px solid black;
	}
	#bookInfo {
		width: 320px; height: 160px;
		border: 1px solid black;
		
	}
	#choice {
		width: 124px; height: 170px;
		border: 1px solid black;
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
 #container #content { float:left; width:650px; height:500px; margin-left:10px; background:#BFF484; }
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
	     <div id="content" style="height: auto;">
			<div class="container111" >
				<div class="content111" style="height: auto;">
				
					<div class="search">
						<a href="order.do?no=1">도서명순</a><span>|</span>
						<a href="order.do?no=2">판매량순</a><span>|</span>
						<a href="order.do?no=3">등록일순</a><span>|</span>
						<a href="order.do?no=4">저가격순</a><span>|</span>
						<a href="order.do?no=5">고가격순</a>
					</div>
					${list[0].title}${list[1].title}${list[2].title}
					<div>
						<c:forEach var="vo" items="${list}">
							<div class="list">
								<div id="img"  class="book">${vo.coverImg}</div>
								<div id="bookInfo"  class="book" style="padding: 20px;">
									<div><a href="detail.do?bookCode=${vo.bookCode}">${vo.title}</a></div>
									<div style="padding-top: 10px;">${vo.author}(지은이) | ${vo.publisher} | ${vo.pubDate}</div>
									<div style="padding-top: 10px;">${vo.price}원</div>
									<div style="padding-top: 10px;">${vo.description}</div>
								</div>
								<div id="choice" class="book"  style="padding-top: 10px;">
									<div style="padding-top: 10px;">
									<button type="button" class="btn" id="wishBtn">장바구니 담기</button>
									</div>
									<div style="padding-top: 10px;">
									<button type="button" class="btn" id="buyBtn">구매</button>
									</div>
									<div style="padding-top: 10px;">
									<button type="button" class="btn" id="recomBtn">대여</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div><br/>
					<div class="page" >
						<c:if test="${not empty list}">
							<navi:page />
						</c:if>
					</div>
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
	
	
	<div id="pass" style="padding: 15px;">
		<div>비밀번호 입력 <input type="password" id="pas"/></div>
		<div style="text-align: right; padding-right: 20px; padding-top: 5px;">
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
	//		$("#wishBtn").attr("class", "wish");
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
		
		
	});
	//====================================================================== 여기
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
	function jsPageMove(pageNo) {
		location.href = "${pageContext.request.contextPath}/book/list.do?pageNo=" + pageNo;
	}
</script>
</body>
</html>