<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="sponAndSubscribeNav.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h4 class="page-head-line">구독 내역</h4>
			</div>

		</div>
	</div>
	
	<script>
		$(function(){
			$(".menu-top-active").css("background","#3D3D3D");
			$(".subListTab").css("background","#C36464");
		})
	</script>
</body>
</html>