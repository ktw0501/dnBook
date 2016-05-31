<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>

*{
	margin: 0px;
	padding: 0px;
} 

.logo{
	clear:both;
	line-height:60px;
	height: 60px;
	font-family: 'Gabia Solmee';
	font-size:60px;
	color:#00498c;
	margin-top: 50px;
}

.subLnb{
	width:1050px;
	height: 180px;
}

.button {
	border: 1px dashed #00498c;
	background-Color:#B2EBF4;   /*--백그라운드 정의---*/
	font:12px 굴림;      /*--폰트 정의---*/
	font-weight:bold;   /*--폰트 굵기---*/
	color:#00498c;    /*--폰트 색깔---*/
	width:160px;
	height:30px;  /*--버튼 크기---*/
}

</style>

<div class="subLnb" align="center">
	<div class="statelogoff" align="right">
		<ul class="nav navbar-nav navbar-right">
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
	        	<a href="${pageContext.request.contextPath}/user/mypage/salesList.do?id=eunhwa">마이페이지</a>
	        </li>
	        	</c:otherwise>
	        </c:choose>
	        <li>
	        	<a href="${pageContext.request.contextPath}/service/list.do?boardType=1">고객센터</a>
	        </li>
        </ul>
	</div>
	<br />
	<div class="logo">
		<a href="${pageContext.request.contextPath}/main.do">동네책방</a>
	</div>
	<div class="menubar">
		<button type="button" class="button"><a href="${pageContext.request.contextPath}/book/list.do">국내도서</a></button>
		<button type="button" class="button">외국도서</button>
		<button type="button" class="button">베스트셀러</button>
		<button type="button" class="button">신간도서</button>
	</div>
	<div>
		
	</div>
</div>
