<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Insert title here</title>
<style>
body{
background: black;
}
h1{
color: white;
}
h4{
color: lightgray;
}
p{
color: gray;
}
</style>
</head>
<body>
<div align="center" style="background: black;">
	<img src="/nullLive/resources/image/errorLogo.png" >
	<br><br>
	<h1>페이지를 표시할 수 없습니다.</h1>
	<br>
	<h4>찾으시는 페이지가 다른 메뉴나 다른 URL로 이동하였거나 더이상 제공되지 않는 경우일 수 있습니다.</h4>
	<h4>먼저 "F5"키를 이용하여 새로 고침 해보시기 바랍니다.</h4>
	<h4>그래도 페이지가 정상적으로 표시되지 않는다면 고객센터를 통해 문의 주세요.</h4>
	<br><br>
	<p>5초 뒤 이전페이지로 돌아갑니다.</p>
</div>
</body>
<script>
setTimeout(function() {
	history.back();
	}, 5000);
	
var s = 4;
setInterval(function() {
	$("p").text(s+"초 뒤 이전페이지로 돌아갑니다.");
	s=s-1;
}, 1000);
</script>
</html>