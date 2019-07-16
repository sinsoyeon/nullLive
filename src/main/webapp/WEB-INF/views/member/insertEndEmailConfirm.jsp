<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Cabin:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:900"
	rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header style="height: 50px;">
		<jsp:include page="../common/menubar.jsp" />
	</header>

	<div class="container-fluid">
		<div class="row">
			<!-- 왼쪽 사이드바 -->
			<div class="col-md-2">
				<jsp:include page="../main/mainNavbar.jsp" />
			</div>
			<div class="col-md-10" style="padding-left: 55px; padding-top: 28px;">
				<img alt="email" src="/nullLive/resources/image/email.png"
					style="width: 73%; margin-left: 12%; margin-top: 11%;" />
				<p
					style="font-size: 15px; color: #555; margin-left: 24%; margin-top: 2%;">
					<c:out value="${joinMember.email}"></c:out>
					로 잠시 후 인증 이메일이 전송됩니다.
				</p>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			console.log('${joinMember}');
			var mid = '${joinMember.mid}';
			var email = '${joinMember.email}';
			$.ajax({
				url : "emailConfirm.me",
				data : {
					mid : mid,
					email : email
				},
				type : "post",
				success : function(data) {
					alert('이메일 전송 완료');
				}
			});
		});
	</script>
</body>
</html>