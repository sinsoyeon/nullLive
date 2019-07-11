<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
	<script>
		var referer = '${referer}';
		$(function(){
			alert("로그인이 필요합니다.");
			location.href="loginPage.me?referer="+referer;
		})
	</script>
</body>
</html>