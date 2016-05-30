<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 로그인 실패시 오류메시지 띄우기 -->
<script>
	$(function(){
	if ("${msg}"){
		$("#result").html("${msg}");
	}
	})
</script>
<!-- 아이디 저장 체크시 쿠키저장 -->
<script>
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 1); // 1일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>
<script>


</script>
<style>
span {
	font-size: 10px;
	color: #BBBBBB;
}

.login {
	width: 400px;
	height : 390px;
	margin: 0px auto;
	border: 1px solid;
	border: 1px dashed #00498c;
	padding-top: 50px;
}

table {
	margin: 0px auto;
}
h1{
	color: #00498c;
	text-shadow: 5px 3px 5px #aaaaaa;
}

th{
	font-size: 12px;
	color: #776269;
}
.join{
	
	border: 1px solid;
	border-color: #dcdcdc;
	text-align: center;
	
	}
a { text-decoration: none; color: #776269; display: block;}

.join > a:hover { 
	background : #00498c; 
	color: white;
}
hr{
	border-color:  #00498c;
}

.loginBtn {
	height: 50px;
	background-color:#00498c;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	border:1px solid #337fed;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:8px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #1570cd;
}
</style>

</head>
<body>

	<div class="container">
		<div class="header">
		<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %>
		</div>
		<div class="content">
			<div class = "login">
				<form id="lForm" name="lForm" onsubmit="return ckForm()" action="${pageContext.request.contextPath}/login/login.do" method="post">
					<table>
						<tr>
							<td colspan="3" align="center">
								<h3>회원로그인<br />
								<span>회원 아이디와 비밀번호를 입력하시고 로그인을 클릭해주세요.</span>
								</h3>
							</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" required/></td>
							<td rowspan="2">
							<button class = "loginBtn"type="submit">로그인</button>
							</td>					
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" name="pass" required/></td>
						</tr>
						<tr>
							<th id="result" colspan="4" style="color: red; font-size: 12px;"></th>
						</tr>
						<tr>
							<td></td>
							<th colspan="2" align="left">
								<input type="checkbox" id="idSaveCheck" />아이디저장
							</th>
						</tr>
						<tr>
							<th colspan="3" align="center" >
								<hr />
								>아직 회원이 아니신가요?<br />
								<span>회원으로 가입하시면 다양하고 특별한 혜택을 누리실 수 있습니다.</span>
								<div class="join"><a href="${pageContext.request.contextPath}/member/joinForm.do">회원가입</a></div>								
							</th>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/WEB-INF/jsp/include/bottom.jsp" %>
		</div>
	</div>
</body>