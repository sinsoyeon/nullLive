<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
	<div class="panel-body">
		<form id="pwdCheckForm" method="post">
		<input type="hidden" name="mid" value="${loginUser.mid}"/>
			<div>
				비밀번호 : <input type="password" class="form-control" name="mpwd">
			</div>
			<div style="margin-top:20px;">
				<button type="button" class="form-control btn btn-primary" onclick="pwdCheck()">입력</button>
			</div>
		</form>
	</div>
	<script>
		function pwdCheck(){
			$("#pwdCheckForm").attr("action","pwdCheck.me").submit();
		}
	</script>
</body>
</html>