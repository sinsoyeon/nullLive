<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.9.0/css/all.css">
<title>Insert title here</title>
<style>
.logo:hover{
	cursor:pointer;
}
</style>
</head>
<body>
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />
	<!-- nav -->
	<div class="row" style="display: inline;">
		<div class="col-md-12">
			<nav class="navbar navbar-fixed-top navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header" style=" width: 160.72px; height: 50px; ">
						<img src="/nullLive/resources/image/logo.png" class="logo" onclick="location.href='index.jsp'" style="width: 164.72px;height: 57px;margin-top: 3px;">
					</div>

					<ul class="nav navbar-nav" style="height: 30px;margin-top: 4px;">
						<c:if test="${empty sessionScope.loginUser}">
							<li><a href="needLogin.me"><b>문의하기</b></a></li>
							<li><a href="needLogin.me"><b>신고하기</b></a></li>
						</c:if>
						<c:if test="${!empty sessionScope.loginUser}">
							<li><a href="question.bo"><b>문의하기</b></a></li>
							<li><a href="report.bo"><b>신고하기</b></a></li>
						</c:if>
					</ul>
					
					<ul class="nav navbar-nav navbar-right" style="height: 30px;margin-top: 4px;">
						<c:if test="${empty sessionScope.loginUser}">
							<li><a href="loginPage.me"><i
									class="fas fa-sign-in-alt fa-lg" style="color: #fff;"></i></a></li>
							<li><a href="join.me"><i class="fas fa-user fa-lg"
									style="color: #fff;"></i></a></li>
						</c:if>
						<c:if test="${!empty sessionScope.loginUser}">
							<li><a href="myQuestion.bo">MY문의내역</a></li>
							<li><a href="logout.bo"><i
									class="fas fa-sign-out-alt fa-lg" style="color: #fff;"></i></a></li>
						</c:if>
					</ul>

				</div>
			</nav>
		</div>
	</div>
</body>
</html>