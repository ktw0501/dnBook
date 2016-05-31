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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- 우편번호 처리 script -->
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<!-- 작성 중 제한 -->
<script>
	$(function(){
			var f = document.jForm;
			var pass = f.pass;
			var repass = f.repass;
			var tel = f.tel;
			var email = f.email;
	//패스워드가 4자이상 8자 이하 메시지
		$("input[name=pass]").keyup(function(){
			var msg = "";
			if(pass.value.length < 4 || pass.value.length > 12){
				msg = "패스워드는 4자이상 12자 이하이어야 합니다.";
			}
				$("#presult").html(msg);
		});
	//패스워드 확인 불일치
		$("input[name=repass]").blur(function(){
			var msg = "";
			if(repass.value != pass.value){
				msg = "입력하신 패스워드가 일치하지 않습니다.";
				pass.focus();
				pass.select();
			}
				$("#rpresult").html(msg);
		});
	//휴대폰번호 유효확인
		$("input[name=tel]").blur(function(){
			var mobilestr = /[01](0|1|6|7|8|9)[-](\d{4}|\d{3})[-]\d{4}$/g;
			var msg = "";
			if(!tel.value.match(mobilestr)){
				msg = "전화번호를 정확하게 입력해주세요.";
				tel.focus();
				tel.select();
			}
				$("#tresult").html(msg);
		});
	//이메일 유효확인
		$("input[name=email]").blur(function(){
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var msg = "";
			if(!regEmail.test(email.value)) {
				msg = "잘못된 이메일 형식입니다.";
				email.focus();
				email.select();
			}
			$("#eresult").html(msg);
		});
	});
</script>
<!-- 확인버튼 클릭 시 제한 -->
<script>
function ckForm(){
	var f = document.jForm;
	var pass = f.pass;
	var repass = f.repass;
	var name = f.name;
	var postCode = f.postCode;
	var address = f.address;
	var detailAddress = f.detailAddress;
	var email = f.email;
	var tel = f.tel;
	var mobilestr = /[01](0|1|6|7|8|9)[-](\d{4}|\d{3})[-]\d{4}$/g;
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	console.log(pass);
	if(isEmpty(pass, "비밀번호를 입력하세요.")){
		return false;			
	}
	if(isEmpty(repass, "비밀번호확인을 입력하세요.")){
		return false;			
	}
	if(pass.value != repass.value){
		alert("비밀번호가 일치하지 않습니다.");
		pass.focus();
		pass.select();
		return false;
	}
	if(isEmpty(name, "이름을 입력하세요.")){
		return false;			
	}
	if(isEmpty(postCode, "주소를 입력하세요.")){
		return false;			
	}
	if(isEmpty(address, "주소를 입력하세요.")){
		return false;			
	}
	if(isEmpty(detailAddress, "주소를 입력하세요.")){
		return false;
	}
	if(isEmpty(email, "이메일을 입력하세요.")){
		return false;
	}
	if(isEmpty(tel, "휴대폰 번호를 입력하세요.")){
		return false;
	}
	if(!regEmail.test(email.value)) {
		msg = "잘못된 이메일 형식입니다.";
		email.focus();
		email.select();
	}
	if(!tel.value.match(mobilestr)){
		alert("전화번호를 정확하게 입력해주세요.");
		tel.focus();
		tel.select();
	}
}
</script>
<!-- 가입 취소 -->
<script>
$(function(){
	$("#updateCancel").on("click", function(){
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
	    	    <h1>회원정보수정 <small>horizontal form</small></h1>
	        </div>
	        <form class="form-horizontal" id="jForm" name="jForm" method="post" onsubmit = "return ckForm()" action="${pageContext.request.contextPath}/member/updateMember.do">
	       
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
	        <p class="help-block"><span id="presult">패스워드는 4자이상 12자 이하이어야 합니다.</span></p>
	        </div>
	        </div>
	       
	        <div class="form-group">
	              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
	             <div class="col-sm-6">
	              <input class="form-control" name = "repass" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
	                <p class="help-block"><span id="rpresult"></span></p>
	             </div>
	          </div>
	       
	       <div class="form-group">
	            <label class="col-sm-3 control-label" for="inputName">이름</label>
	          <div class="col-sm-6">
	            <input class="form-control" name="name" id="inputName" type="text" value="${member.name}" readonly>
	          </div>
	        </div>
	       
	       <div class="form-group">
	            <label class="col-sm-3 control-label" for="inputPost">주소</label>
	          <div class="col-sm-6">
	          <div class="input-group">
	          <input class="form-control" type="text" id="sample6_postcode" name="postCode" value="${member.postCode}">
	          	<span class="input-group-btn">
	          	<input class="btn btn-success" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	          	</span>
	          </div>
	        </div>
	       </div>
	        <div class="form-group">
	            <label class="col-sm-3 control-label" for="inputAdd"></label>
			  <div class="col-sm-6">
			  <div class="input-group">
			  <input class="form-control" type="text" id="sample6_address" name="address" value="${member.address}">
			  <input class="form-control" type="text" id="sample6_address2" name="detailAddress" value="${member.detailAddress}">
			  </div>
			</div>
			</div>
	       
	        <div class="form-group">
	          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
	        <div class="col-sm-6">
	          <input class="form-control" name = "email" id="inputEmail" type="text" value="${member.email}">
	          <p class="help-block"><span id="eresult">이메일 형식에 맞게 입력해 주세요.</span></p>
	        </div>
	        </div>
	        
	         <div class="form-group">
	          <label class="col-sm-3 control-label" for="inputTel">휴대폰번호</label>
	        <div class="col-sm-6">
	          <input class="form-control" name = "tel" id="inputTel" type="text" value="${member.tel}">
	          <p class="help-block"><span id="tresult">ex)01x-1234-5678</span></p>
	        </div>
	        </div>
	          
	        <div class="form-group">
	          <div class="col-sm-12 text-center">
	            <button class="btn btn-primary" type="submit">수정완료</button>
	            <button class="btn btn-danger" type="button" id ="updateCancel">취소</button>
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