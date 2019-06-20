<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</head>
<body>
	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">NULL LIVE에 가입하세요!</div>
				</div>
				<div class="panel-body">
					<form action="insert.me" id="login-form" method="post">
						<div>
							<input type="text" class="form-control" name="mid"
								placeholder="Id" autofocus>
						</div>
						<div>
							<input type="password" class="form-control" name="mpwd"
								placeholder="Password">
						</div>
						<div>
							<input type="email" class="form-control" name="email"
								placeholder="Email" />
						</div>
						<div>
							<input type="radio" id="genderM" name="gender" value="M"/><label for="genderM">남</label> &nbsp;
							<input type="radio" id="genderF" name="gender" value="F" /><label for="genderF">여</label>
						</div>
						<div>
							<select name="agency" id="">
								<option value="SKT">SKT</option>
								<option value="KT">KT</option>
								<option value="LGT">LGT</option>
							</select> &nbsp; <input type="number" name="phone1" max="999"
								style="width: 50px;" />-<input type="number" name="phone2"
								max="9999" style="width: 70px;" />-<input type="number"
								name="phone3" max="9999" style="width: 70px;" />
						</div>
						<div>
							<input type="text" name="name" class="form-control"
								placeholder="Name" />
						</div>
						<div>
							<button align="center" class="form-control btn btn-primary">회원가입</button>
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