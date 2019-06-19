<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login.me">
		<table id="loginArea" align="center">
			<tr>
				<td>아이디 : <input type="text" name="mid" /></td>
				<td colspan="2"><button type="submit">로그인</button></td>
			</tr>
			<tr>
				<td>비밀번호 : <input type="password" name="pwd" /></td>
			</tr>
		</table>
	</form>
	<div id="navArea" align="center">
		<button onclick="location.href='join.me'" align="center">회원가입</button>
	</div>


</body>
</html>