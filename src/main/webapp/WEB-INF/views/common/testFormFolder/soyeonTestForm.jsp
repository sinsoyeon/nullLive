<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<button onclick="paymentFormOpen();" style="width:150px; height:150px; background:pink; color:white;" >결제 테스트</button>
	</div>	
	
	
	<script>
		function paymentFormOpen(){
			
			window.open("pay.me",'결제창','width=400,height=450,tollbar=no,menubar=no,scrollbars=no,resizable=no')
		}
	</script>
</body>
</html>`