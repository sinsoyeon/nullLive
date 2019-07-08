<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live Join</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #f8f8f8;
	padding: 60px 0;
}

#login-form>div {
	margin: 15px 0;
}
</style>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<script>
			alert("카카오 첫 로그인 시 추가 정보 입력이 필요합니다!");
		</script>
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">NULL LIVE에 가입하세요!</div>
				</div>
				<div class="panel-body">
					<form action="insert.me" id="login-form" method="post">
						<div>
							<input type="text" class="form-control" name="mid" id="inputMid"
							autofocus value="${userInfo.userId }" hidden>
							<div id="idAvailable" style="margin:5px;float:left;width:200px;height:25px;"></div>
						</div>
						<div>
							<input type="password" class="form-control" name="mpwd" id="inputMpwd" value="${userInfo.userId }"
								hidden>
						</div>
						<div>
							<input type="email" class="form-control" name="email" id="inputEmail"
								placeholder="Email" />
						</div>
						<div>
							<input type="radio" id="genderM" name="gender" value="M"/><label for="genderM">남</label> &nbsp;
							<input type="radio" id="genderF" name="gender" value="F" /><label for="genderF">여</label>
						</div>
						<div>
						<!-- <button type="button" onclick="IMP.certification()">인증</button> -->
							<select name="agency" id="">
								<option value="SKT">SKT</option>
								<option value="KT">KT</option>
								<option value="LGT">LGT</option>
							</select> &nbsp; <input type="number" name="phone1" max="999" id="p1"
								style="width: 50px;" />-<input type="number" name="phone2"
								max="9999" id="p2" style="width: 70px;" />-<input type="number"
								name="phone3" max="9999" id="p3" style="width: 70px;" />
						</div>
						<div>
							<input type="text" name="name" class="form-control" id="inputName"
								placeholder="성함" />
						</div>
						<div>
							<input type="date" name="birthday" class="form-control" placeholder="생년월일" id="birthday"/>
						</div>
						<div>
							<button align="center" id="joinBtn" class="form-control btn btn-primary">회원가입</button>
						</div>
					</form>
					<div>
						<button onclick="location.href='loginPage.me'" align="center"
						class="form-control btn btn-primary">로그인</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>