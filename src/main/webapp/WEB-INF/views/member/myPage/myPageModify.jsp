<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <script
	src="${contextPath}/resources/css/mypage/bootstrap.min.css"></script> --%>
<style>
#contentArea {
	padding-left: 100px;
	padding-top: 25px;
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
								비밀번호 : <button type="button" class="form-control btn btn-primary" onclick="pwdModify()">비밀번호 변경</button>
							</div>
							<div>
								이메일 : <input type="email" class="form-control" name="email" id="email"
									placeholder="${loginUser.email}" autofocus/>
							</div>
							<div>
								휴대폰 : <input type="text" class="form-control" value="${loginUser.phone}" readonly/>
								<button type="button" class="form-control btn btn-primary" onclick="phoneModify()">휴대폰 변경</button>
							</div>
							<div>
								닉네임 : <input type="text" name="nickName" class="form-control" id="nickName"
									placeholder="${loginUser.nickName}" />
							</div>
							<%-- 계좌 정보가 있는 경우 --%>
							<c:if test="${existBankAccount == 'Y'}">
							<div>
							은행 : <select name="bankCode" id="bankCode" class="form-control" style="width:150px;">
								<option value="26">신한은행</option>
							</select>
								계좌번호 : <input type="text" name="bankAccount" class="form-control" id="bankAccount"
									placeholder="${bankAccount.bankAccount}" />
							</div>
							<div>
								은행주 : <input type="text" name="holder" class="form-control" id="holder"
									placeholder="${bankAccount.holder}" />
							</div>
							</c:if>
							<div style="margin-top:10px; text-align:center;">
								<button onclick="modify()" align="center" style="width: 48%;" class="form-control btn btn-primary">변경</button> &nbsp;
								<button onclick="conAdult()" align="center" style="width: 48%;" class="form-control btn btn-warning">성인 인증</button>
							</div>
							<div style="margin-top:15px;">
								<button type="button" onclick="secession()" class="form-control btn btn-danger">탈퇴</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function modify(){
			if($("#email").val() != ""){
				if($("#nickName").val() != ""){
					if('${loginUser.isStreamer}' == 'Y'){
						if($("#bankAccount").val() != ""){
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
			//창 크기 지정
			var popWidth = 420;
			var popHeight = 200;
			//위치 지정
			var popupX = (window.screen.width / 2) - (popWidth / 2);
			var popupY = (window.screen.height / 2) - (popHeight / 2);
			
			window.open('pwdInput.me','new','width='+popWidth+',height='+popHeight+',left='+popupX+',top='+popupY+',menubar=no, status=no, toolbar=no');
		}
		function phoneModify(){
			//창 크기 지정
			var popupWidth = 440;
			var popupHeight = 200;
			//위치 지정
			var popupX = (window.screen.width / 2) - (popupWidth / 2);
			var popupY = (window.screen.height / 2) - (popupHeight / 2);
			
			window.open('phoneInput.me?phone='+'${loginUser.phone}','new','width='+popupWidth+',height='+popupHeight+',left='+popupX+',top='+popupY+',menubar=no, status=no, toolbar=no');
		}
		function secession(){
			var conf = confirm('정말로 탈퇴하시겠습니까? (주의 : 금전적 손실이 발생할 수 있습니다!)');
			if(conf){
				var form = document.createElement('form');
				form.setAttribute('method','post');
				form.setAttribute('action',"secession.me");
				document.body.appendChild(form);
				
				var mid = document.createElement('input');
				mid.setAttribute('type','hidden');
				mid.setAttribute('name','mid');
				mid.setAttribute('value',$("input[name=mid]").val());
				form.appendChild(mid);
				
				form.submit();
			}
		}
		function conAdult(){
			if('${loginUser.adult}'=='Y'){
				alert('이미 성인인증 하셨습니다');
			}else{
				var name = '${loginUser.name}';
				//창 크기 지정
				var popupWidth = 440;
				var popupHeight = 200;
				//위치 지정
				var popupX = (window.screen.width / 2) - (popupWidth / 2);
				var popupY = (window.screen.height / 2) - (popupHeight / 2);
				
				var openWin = window.open('conAdult.me','new','width='+popupWidth+',height='+popupHeight+',left='+popupX+',top='+popupY+',menubar=no, status=no, toolbar=no');
			}
		}
	</script>
</body>
</html>