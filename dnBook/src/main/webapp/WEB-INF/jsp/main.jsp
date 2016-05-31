<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style  type="text/css">
 #outer {width: 100%}
 #container { width:1070px; margin: 0 auto;}
 #container #header { width:1030px; height:200px; margin-left:10px;  margin-bottom:10px;}
 #container #left { display:inline; float:left; width:190px; height:500px; margin-left:10px; background:#33CCFF; }
 #container #content { float:left; width:650px; height:500px; margin-left:10px; background:#BFF484; }
 #container #right { float:left; width:190px; height:500px; margin-left:10px; background:#73534D; }
 #container #footer { clear:both; width:1050px; height:150px; margin-left:10px; margin-top:10px;}
</style>

<body>

	<div id="outer">
	   <div id="container" >
	     <div id="header">
			<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
		 </div>
	     <div id="left"><span>left</span></div>
	     <div id="content">
			페이지 내용<br />
			페이지 내용<br />
			페이지 내용<br />
			<a href="${pageContext.request.contextPath}/admin/board/list.do?boardType=1">이벤트 게시판</a><br/>
			<a href="${pageContext.request.contextPath}/admin/board/list.do?boardType=2">공지 게시판</a><br/>

			<a href="${pageContext.request.contextPath}/admin/member/detail.do?id=a">회원상세로</a><br/>
			<a href="${pageContext.request.contextPath}/admin/member/list.do?status=1">회원  목록으로</a>
		
			<a href="${pageContext.request.contextPath}/admin/book/registform.do">글등록테스트</a><br>
			<a href="${pageContext.request.contextPath}/admin/book/updateform.do?bookCode=2">글수정테스트</a><br>
			<a href="${pageContext.request.contextPath}/admin/book/list.do">리스트테스트</a><br>
		 </div>
	     <div id="right">
			<%@ include file="/WEB-INF/jsp/include/rightMenu.jsp" %>
		</div>
	     <div id="footer">
			<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
		 </div>
	   </div>
	</div>
</body>