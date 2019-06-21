<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<style>
#contentArea {
	padding-left: 100px;
	padding-top: 100px;
}
</style>
</head>
<body>
	<!-- ryan -->
	<c:if test="${empty sessionScope.loginUser}">
		<jsp:forward page="../needLogin.jsp" />
	</c:if>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<jsp:include page="myPageNavbar.jsp" />
	<!-- Main -->
	<div id="contentArea">
		<div class="container">
			<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-success">
					<div class="panel-heading">
						<div class="panel-title" text-align="center">개인정보수정</div>
					</div>
					<div class="panel-body">
						<form id="login-form" method="post">
							<div>
								아이디 : <input type="text" class="form-control" name="mid"
									value="${loginUser.mid}" readonly>
							</div>
							<div>
								비밀번호 : <button type="button" onclick="pwdModify()">비밀번호 변경</button>
							</div>
							<div>
								이메일 : <input type="email" class="form-control" name="email"
									placeholder="${loginUser.email}" autofocus/>
							</div>
							<div>
								휴대폰 : <input type="text" class="form-control" value="${loginUser.phone}" readonly/>
								<button onclick="">휴대폰 변경</button>
							</div>
							<div>
								닉네임 : <input type="text" name="nickName" class="form-control"
									placeholder="${loginUser.nickName}" />
							</div>
							<div style="margin-top:10px;">
								<button onclick="modify()" align="center" class="form-control btn btn-primary">변경</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function modify(){
			$("#login-form").attr('action','update.me').submit();
		}
		function pwdModify(){
			window.open('pwdInput.me','new','width=420,height=200,menubar=no, status=no, toolbar=no');
		}
	</script>
</body>
</html>