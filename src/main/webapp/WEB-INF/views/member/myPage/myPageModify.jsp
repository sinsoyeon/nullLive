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
						<input type="hidden" name="mno" value="${loginUser.mno}"/>
							<div>
								아이디 : <input type="text" class="form-control" name="mid"
									value="${loginUser.mid}" readonly>
							</div>
							<div>
								비밀번호 : <button type="button" onclick="pwdModify()">비밀번호 변경</button>
							</div>
							<div>
								이메일 : <input type="email" class="form-control" name="email" id="email"
									placeholder="${loginUser.email}" autofocus/>
							</div>
							<div>
								휴대폰 : <input type="text" class="form-control" value="${loginUser.phone}" readonly/>
								<button onclick="">휴대폰 변경</button>
							</div>
							<div>
								닉네임 : <input type="text" name="nickName" class="form-control" id="nickName"
									placeholder="${loginUser.nickName}" />
							</div>
							<%-- 스트리머인 경우 --%>
							<c:if test="${loginUser.isStreamer == 'Y'}">
							<div>
							은행 : <select name="bank_code" id="bank_code" class="form-control" style="width:150px;">
								<option value="26">신한은행</option>
							</select>
								계좌번호 : <input type="text" name="account" class="form-control" id="account"
									placeholder="${streamer.account}" />
							</div>
							<div>
								은행주 : <input type="text" name="holder" class="form-control" id="holder"
									placeholder="${streamer.holder}" />
							</div>
							</c:if>
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
		$(function(){
			console.log('${loginUser.isStreamer}');
		})
		function modify(){
			if($("#email").val() != ""){
				if($("#nickName").val() != ""){
					if('${loginUser.isStreamer}' == 'Y'){
						if($("#account").val() != ""){
							if($("#holder").val() != ""){
								$("#login-form").attr('action','update.me').submit();	
							}else{
								alert('누락된 정보가 있습니다.');
							}
						}else{
							alert('누락된 정보가 있습니다.');
						}
					}else{
						$("#login-form").attr('action','update.me').submit();						
					}
				}else{
					alert('누락된 정보가 있습니다.');
				}
			}else{
				alert('누락된 정보가 있습니다.');
			}
		}
		function pwdModify(){
			window.open('pwdInput.me','new','width=420,height=200,menubar=no, status=no, toolbar=no');
		}
	</script>
</body>
</html>