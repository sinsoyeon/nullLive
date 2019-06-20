<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
</body>
<script>
	$(function() {
			$('li:eq(2)').addClass('active');
			$('#menu2').addClass('active in');
			$('#menu2 a:eq(1)').css('font-weight','bold');
	})
</script>
</html>