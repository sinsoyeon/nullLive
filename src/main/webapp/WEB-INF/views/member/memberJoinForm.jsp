<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.me">
		<table id="joinArea" align="center">
			<tr>
				<td>아이디 : <input type="text" name="mid" /></td>
			</tr>
			<tr>
				<td>비밀번호 : <input type="password" name="mpwd" /></td>
			</tr>
			<tr>
				<td>이메일 : <input type="email" name="email"/></td>
			</tr>
			<tr>
				<td><select name="agency" id="">
					<option value="SKT">SKT</option>
					<option value="KT">KT</option>
					<option value="LGT">LGT</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="number" name="phone1" max="999" style="width:50px;"/>
				-<input type="number" name="phone2" max="9999" style="width:70px;"/>
				-<input type="number" name="phone3" max="9999" style="width:70px;"/></td>
			</tr>
			<tr>
				<td>이름 : <input type="text" name="name"/></td>
			</tr>
			<tr>
				<td><button type="submit">회원가입</button></td>
			</tr>
		</table>
	</form>
	<div id="navArea" align="center">
		<button onclick="#" align="center">로그인</button>
	</div>
</body>
</html>