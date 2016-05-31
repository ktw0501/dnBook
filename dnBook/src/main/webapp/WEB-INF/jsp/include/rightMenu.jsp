<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 로그인 실패시 오류메시지 띄우기 -->
<script>
	$(function(){
		if ("${msg}"){
			$("#result").html("${msg}");
		}
		function list (data) { //리스트 보여주는 함수
			var result = eval(data);
			for(var i in result){
				
				var title = result[i].title;
				var title = result[i].no;
				$("#noticeresult").append("<tr><td><a onclick = detail("+ no + ")>" + title + "</a></td></td></tr>");
			}
		};
		
		$.ajax({ //최초 리스트
			url: "${pageContext.request.contextPath}/user/include/noticeList.json?boardType=1"
		})
		.done(function(data) {
			list(data);
		});
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


<style>
.rightcontainer{
	 width:190px; 
	 height:150px; 
}

.loginForm{
	position:relative;
	border: 1px dashed #00498c;
	background-Color:#B2EBF4;   
	width: 188px;
	height: 180px;
	position:relative}
	
 .loginForm .box{
 	width:188px; 
 	margin-left: 5px;
 	color:#00498c;
 	font:15px 굴림;
 	font-weight:bold; 
 	}
 .fleft{
 	margin-right: 10px;
 }
 #rightmenutext{
 	text-align: right;
	padding-right: 20px;
	color:#00498c;
	margin-bottom: 20px;
}
 #loginBtn{
 	margin-top: 10px;
	margin-left: 10px;
	background-color: #00498c;
	color: white;
	width:40px;
	height: 20px;
	}
	#mypage{
	border: 1px dashed #00498c;
	background-Color:#B2EBF4;   
	width: 188px;
	height: 180px;
	position:relative}
	}
	#mypagemsg{
	padding-top: 10px;
	color:#00498c;
 	font:12px 굴림;
 	font-weight:bold; 
	}
	.buttons {
    float: left;
    padding-bottom: 20px;
    clear: both;
}
	.mypateBtn{
		border: ;
		background-Color:#B2EBF4;   /*--백그라운드 정의---*/
		font:12px 굴림;      /*--폰트 정의---*/
		font-weight:bold;   /*--폰트 굵기---*/
		color:#00498c;    /*--폰트 색깔---*/
}
	#notice{
		margin-top: 10px;
		border: 1px dashed #00498c;
		background-Color:#B2EBF4;   
		width: 188px;
		height: 240px;
		position:relative}
	}
	#noticecontent{
		margin-left: 6px;
	}
	#noticeresult{
		margin-left: 12px;
		width: 160px;
	}

</style>
<div class="rightcontainer">
<c:choose>
	<c:when test="${empty user}">
 	<div class="loginForm">
 	<h3 id="rightmenutext">Login</h3>
 	<hr />
		<form id="lForm" name="lForm" onsubmit="return ckForm()" action="${pageContext.request.contextPath}/login/login.do" method="post">
           <div class="box">
            ID : <br/><input type="text" name="id" required/>
            <br>
            PASS : <br /><input type="password" name="pass" required/>
            <br>
            <div id="links">
              <span class="fleft"><br><input type="checkbox" id="idSaveCheck" />아이디 저장</label></span> 
              <span class="fright"><a href="${pageContext.request.contextPath}/member/joinForm.do">회원가입</a></span>
            </div>
          </div>
          <button type="submit" id="loginBtn">Login</button>
        </form>
	</div>
	</c:when>
	<c:otherwise>
	<div id="mypage">
		<div><h3 id="rightmenutext">Mypage</h3></div>
		 <hr />
		<div id="mypagemsg" style="text-align: center; margin-bottom: 20px;">
			${user.name}님 <br />
			로그인 하셨습니다.
		</div>
		<div class="buttons" style="margin-left: 11px;">
		<a href="${pageContext.request.contextPath}/user/mypage/salesList.do?id=${user.id}" class="mypateBtn">구매 |</a>
		<a href="${pageContext.request.contextPath}/user/mypage/rentList.do?id=${user.id}" class= "mypateBtn">대여 |</a>
		<a href="${pageContext.request.contextPath}/user/mypage/wishList.do?id=${user.id}"class="mypateBtn">찜목록 |</a>
		<a href="${pageContext.request.contextPath}/member/infoConfirmForm.do?id=${user.id}"class="mypateBtn">내정보</a>
        </div>
	</div>
	</c:otherwise>
</c:choose>
	<div id="notice">
	<div><h3 id="rightmenutext">Notice</h3></div>
	 <hr />
		<div id="noticelist">
			<div id="noticecontent" style="margin-top:5px;">
				<table id="noticeresult">
					<tr>
					  <td></td>
					</tr>
				</table>
			</div>
			<div align="right"><a href="${pageContext.request.contextPath}/service/list.do?boardType=1">more</a></div>
		</div>
	</div>
</div>