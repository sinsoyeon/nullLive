<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
ul li.unread:after {
	content: attr(data-content);
	position: absolute;
	top: 10px;
	left: 25px;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 15px;
	height: 15px;
	border-radius: 50%;
	color: #fff;
	background: #ef5952;
	font-size: 8px;
}
</style>
</head>
<body>
   <!-- 소연 -->
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
	<!-- nav -->
	<div class="row" style="display: inline;">
		<div class="col-md-12">
			<nav class="navbar navbar-fixed-top navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">
						<img src="/nullLive/resources/image/logo.png"
							style="width: 30px; float: left; height: 41px; padding-top: 5%;">
						<a class="navbar-brand" href="#"
							style="width: 145.72px; padding-left: 15%; text-shadow: 3px 3px 2px #6f8e3085; font-size: 25px; color: #fff;"><b>NullLive</b></a>
					</div>

					<form class="navbar-form navbar-left" action="/action_page.php"
						style="margin-left: 2%;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search"
								name="search">
							<div class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${empty sessionScope.loginUser}">
					<li><a href="loginPage.me"><i class="fas fa-sign-in-alt fa-lg" style="color: #fff;"></i></a></li>
					<li><a href="join.me"><i class="fas fa-user fa-lg" style="color: #fff;"></i></a></li>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<li data-content="2" class="unread"><a href="#"> <i
								class="fas fa-globe-asia fa-lg" style="color: #fff;"></i>
						</a></li>
					<li><a href="logout.me"><i class="fas fa-sign-out-alt fa-lg" style="color: #fff;"></i></a></li>
					<li><a href="myPage.me"><c:out value="${sessionScope.loginUser.name} 님"/></a></li>
				</c:if>
			</ul>

				</div>
			</nav>
		</div>
	</div>
</body>
</html>