<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../main/main.jsp" />
	<script>
		alert('이메일 인증이 완료되었습니다!\n 회원가입한 아이디로 로그인 해주세요');
		location.href="logout.me";
	</script>
</body>
</html>