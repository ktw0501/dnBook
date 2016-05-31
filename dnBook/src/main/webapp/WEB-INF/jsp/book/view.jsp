<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#viewPage {
		position: relative;
	}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.js"></script>
</head>
<body>
	<div>
		<div id="viewTable">
			<div id="lbutton">
				<button type="button" onclick="moveToLeft();">◁</button>
			</div>
			<div>
				<img id="view" src="${pageContext.request.contextPath}/img/view.png">
			</div>
				
			<div id="rbutton">
				<button type="button" onclick="moveToRight();">▷</button>
			</div>
		</div>
		<div id="viewPage">
			<div id="lView">
				<img src="" />
			</div>
			<div id="rView">
				<img src="" />
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var Path;
		$(function() {
			var opener = window.dialogArguments; 
			var dirPath = opener.dirPath;
			path = "${pageContext.request.contextPath}/" + dirPath;
			$("#lView").attr("src", path + "/1.jpg");
			$("#rView").attr("src", path + "/2.jpg");
			
		})
		var currentPage = 1;
		function moveToLeft(path) {
			if(currentPage == 1) {
				return;
			} else {
				currentPage -= 2;
				var lPath = path + "/" + currentPage;
				var rPath = path + "/" + currentPage + 1;
				$("#lView").attr("src", lPath + ".jpg");
				$("#rView").attr("src", rPath + ".jpg");
			}
			
		}
	
		function moveToRight(path) {
			currentPage += 2;
			if(currentPage > "${book.maxPage}") {
				return;
			} else  if(currentPage == "${book.maxPage}") {
				var lPath = path + "/" + currentPage;
				var rPath = path + "/" + currentPage + 1;
				$("#lView").attr("src", lPath + ".jpg");
				$("#rView").attr("src", "");
			} else {
				var lPath = path + "/" + currentPage;
				var rPath = path + "/" + currentPage + 1;
				$("#lView").attr("src", lPath + ".jpg");
				$("#rView").attr("src", rPath + ".jpg");
			}
		}
	</script>
</body>
</html>