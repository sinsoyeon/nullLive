<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	var referer = '${referer}';
	window.onload = function(){
		alert('${msg}');
		location.href="loginPage.me?referer="+referer;
	}
</script>
<body>
</body>
</html>