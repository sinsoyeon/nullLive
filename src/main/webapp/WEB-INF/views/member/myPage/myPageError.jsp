<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
#contentArea {
	padding-left: 200px;
}
</style>
</head>
<body onload="error();">
	<!-- ryan -->
	<c:if test="${empty sessionScope.loginUser}">
		<jsp:forward page="../needLogin.jsp" />
	</c:if>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<jsp:include page="myPageNavbar.jsp" />
</body>
<script>
	function error(){
		alert(${msg});
		location.href="myPage.me";
	}
</script>
</html>