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
	<div id="contentArea" align="center">
	<h1>으아!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</h1>
	</div>
	<script>
		$(function(){
			console.log('${loginUser.isStreamer}');
		})
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
			window.open('pwdInput.me','new','width=420,height=200,menubar=no, status=no, toolbar=no');
		}
	</script>
</body>
</html>