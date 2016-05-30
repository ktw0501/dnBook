<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" media="screen" title="no title" charset="utf-8">
	<script src="${pageContext.request.contextPath}/js/common.js"></script>

    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 확인버튼 패스워드 입력 여부 확인-->
<script>
function ckForm(){
	var f = document.jForm;
	var id = f.id;
	var pass = f.pass;
	if(isEmpty(pass, "비밀번호를 입력하세요.")){
		return false;			
	}
}
</script>
<!-- 아이디와 비밀번호 일치 확인 -->
<script>
	$(function(){
		if ("${msg}"){
			$("#result").html("${msg}");
		}
	})
</script>
<!-- 가입 취소 -->
<script>
$(function(){
	$("#confirmCancel").on("click", function(){
		location.href = "${pageContext.request.contextPath}/main.do";
	});
});
</script>
</head>
<body>
	  <div class = "outer">
	  	<div class = "container">
	  		<div class = "header">
	  		<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
	  		</div>
	        <div class="col-md-12">
	        <div class="page-header">
	    	    <h1>내 정보 <small>my info</small></h1><br />
	    	    	<p class="help-block">
	    	    	회원님의 정보를 수정할 수 있습니다.<br />
	    	    	개인정보 보호를 위해 비밀번호를 입력해주세요.
	    	    	</p>
	        </div>
	        <form class="form-horizontal" id="cForm" name="cForm" method="post" onsubmit = "return ckForm()" action="${pageContext.request.contextPath}/member/infoConfirm.do">
	       
	       <div class="form-group">
	            <label class="col-sm-3 control-label" for="inputId">아이디</label>
	          <div class="col-sm-6">
	          <div class="input-group">
	            <input class="form-control" name = "id" id="id" type="text" value="${member.id}" readonly>
	          	</div>
	          </div>
	        </div>
	        
	        <div class="form-group">
	          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
	        <div class="col-sm-6">
	          <input class="form-control" name = "pass" id="inputPassword" type="password" placeholder="비밀번호">
	       	  <p id="result" style="color: red; font-size: 12px;"></p>
	        </div>
	        </div>
	          
	        <div class="form-group">
	          <div class="col-sm-12 text-center">
	            <button class="btn btn-primary" type="submit">확인</button>
	            <button class="btn btn-danger" type="button" id ="confirmCancel">취소</button>
	          </div>
	        </div>
	        </form>
	          <hr>
	        </div>
	        <div class="footer">
				<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
			</div>		
	  	</div>
	  </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  </body>
</html>