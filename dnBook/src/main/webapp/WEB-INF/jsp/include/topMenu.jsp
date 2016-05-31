<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style>

	 #space{
	 	height:30px;
	 	margin-top:20px;
	 }
	 #nav_menu ul {
		 list-style-type:none;
		 padding-left:0px;
		 float:right;
	 }
	 #nav_menu ul li {
		 display:inline;
		 border-left: 1px solid #c0c0c0;
		 padding: 0px 10px 0px 10px;
	 }
	 #nav_menu ul li:first-child {
		 border-left: none;
	 }

	 #topLeft { 
	 	display:inline; 
	 	float:left; 
	 	width:185px; 
	 	height:150px; 
	 }
	 
	 #toplogo {
	 	width:140px;
	 	height:140px;
	 	margin-top: 20px;
	 }
	 
	 #topCenter { 
	 	float:left; 
	 	width:650px; 
	 	height:150px; 
	 	margin-top: 20px;
	 }
	 
	 .topmLogo {
	 	height: 100px;
	 	text-align: center;
		margin-top: 15px;
	 }
	  #topmlogo{
	 	width :320px;
	 	height:90px;
	 }
	 .topMenuBar {
	 	height: 50px;
	 }
	 
	 #topRight { 
	 	float:left; 
	 	width:190px; 
	 	height:150px; 
	 	margin-left: 5px;
	 	margin-top: 20px;
	 }
	 
	.topbutton {
		border: 1px dashed #00498c;
		background-Color:#B2EBF4;   /*--백그라운드 정의---*/
		font:12px 굴림;      /*--폰트 정의---*/
		font-weight:bold;   /*--폰트 굵기---*/
		color:#00498c;    /*--폰트 색깔---*/
		width:157px;
		height:30px;  /*--버튼 크기---*/
	}
	.topMenuBar{
		text-align: center;
	}

	 
</style>
<div id="topcontainer">
	<div id="space">
	<div id="nav_menu">
		<ul>
	        <c:choose>
	        	<c:when test="${empty member}">
	        <li>
	       		<a href="${pageContext.request.contextPath}/login/loginForm.do">로그인</a>
	        </li>
	        <li>
	       		<a href="${pageContext.request.contextPath}/member/joinForm.do">회원가입</a>
	        </li>
	        	</c:when>
	        	<c:otherwise>
	        <li>
	       		<a href="${pageContext.request.contextPath}/login/logout.do">로그아웃</a>
	        </li>
	        <li>
	       		<a href="${pageContext.request.contextPath}/member/infoConfirmForm.do">회원정보수정</a><br/>
	        </li>
	        <li>
	        	<a href="${pageContext.request.contextPath}/user/mypage/myPageHome.do?id=eunhwa">마이페이지</a>
	        </li>
	        	</c:otherwise>
	        </c:choose>
	        <li>
	        	<a href="${pageContext.request.contextPath}/service/list.do?boardType=1">고객센터</a>
	        </li>
        </ul>
	</div>
	
	</div>
	<div id="topLeft">
		<img id="toplogo" src="${pageContext.request.contextPath}/img/logo.gif">
	</div>
	<div id="topCenter">
		<div class="topmLogo">
			<a href="${pageContext.request.contextPath}/main.do">
			<img id="topmlogo" src="${pageContext.request.contextPath}/img/mlogo.gif">
			</a>
		</div>
		<div class="topMenuBar">
			<div class="menubar">
				<button type="button" class="topbutton"><a href="${pageContext.request.contextPath}/book/list.do">국내도서</a></button>
				<button type="button" class="topbutton">외국도서</button>
				<button type="button" class="topbutton">베스트셀러</button>
				<button type="button" class="topbutton">신간도서</button>
			</div>
		</div>
	</div>
	<div id="topRight">
	</div>
</div>

