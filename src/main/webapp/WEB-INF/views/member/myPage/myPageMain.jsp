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
	padding-top: 80px;
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
	<div class="container-fluid" id="contentArea">
		<div class="row">
			<div class="col-md-12" style="display: inline; min-width: 1024;">
				<div class="col-md-2" style="display: inline; float: left;">
					<img src="${contextPath}/resources/image/profile_sample.PNG"
						width="120" height="150" />
				</div>
				<div class="col-md-9"
					style="display: inline; float: left; background: #e9e9e9;">
					<h3>
						<c:out value="${sessionScope.loginUser.name}" />
					</h3>
					<h5>
						<c:out value="" />
					</h5>
					<br /> <br />
					<div class="col-md-5" style="display: inline; float: left;">
						Null Point :
						<c:out value="${sessionScope.loginUser.point}" />
					</div>
					<div class="col-md-4" style="display: inline; float: right">
						<img src="${contextPath}/resources/image/heart.jpg" width="15%" />
						<c:out value="${sessionScope.loginUser.receivedLikes}"></c:out>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="margin-left: 20px;">
			<div class="col-md-5" style="height: 500px !important;">
				<h3>구독하는 방송</h3>
			</div>
			<div class="col-md-5" style="height: 500px !important;">
				<div style="display: block; float: left;">
					<img src="${contextPath}/resources/image/profile_sample.PNG"
						width="100" />
				</div>
				<div style="display: block; float: left;" align="center"
					width="100px">
					<button class="form-control btn btn-primary">방송국으로</button>
					<br />
					<button class="form-control btn btn-primary" onclick="location.href='start.st'">방송시작</button>
				</div>
				<div style="display: block; clear: left;">
					<br />
					<hr style="margin-top:10px;"/>
					<div>
						<h3>다시 보기</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>