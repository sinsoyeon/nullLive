<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="UTF-8">
<title>NullLive</title>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
		

		<div align="center">
			<br>
			<b>1회 충전 금액 통계</b>
			<div id="chart_div" style="width: 900px; height: 500px;"></div>
			<br>
			<b>1회 충전 금액 통계</b>
			<div id="chart_div1" style="width: 900px; height: 500px;"></div>
		</div>
	
</body>
<script>
$(function() {
	$('li:eq(2)').addClass('active');
	$('#menu2').addClass('active in');
	$('#menu2 a:eq(3)').css('font-weight','bold');
})
</script>
</html>