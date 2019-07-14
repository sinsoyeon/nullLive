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
	padding-left: 225px;
}
#streamerPartnerArea{
	background: #e9e9e9;
	margin: 2%;
}
#streamerPartnerTable, #streamerPartnerTable tr>th{
text-align: center;
}

.blinking{
    animation:blink 0.8s ease-in-out infinite alternate;
    background: red;
    color: white;
    border: 0;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}

</style>
</head>
<body>
	<c:if test="${empty sessionScope.loginUser}">
		<jsp:forward page="../needLogin.jsp" />
	</c:if>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<jsp:include page="myPageNavbar.jsp" />
	<!-- Main -->
	<div id="contentArea" class="container-fluid" >
		<div id='streamerPartnerArea' align="center">
		<br>
			<h2>나와 함께 일 하는 스트리머</h2>
		<br>
				<table class="table" id="streamerPartnerTable">
					<thead class="thead-light">
						<tr class="table-success"
							style="background: #446600 !important; color: white;">
							<th scope="col">ON AIR</th>
							<th scope="col">스트리머</th>
							<th scope="col">계약 금액</th>
							<th scope="col">계약 시작 날짜</th>
							<th scope="col">계약 종료 날짜</th>
							<th scope="col">나의 직책<th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${partner}" var="p" >
							<tr>
							<c:if test="${p.onair eq 'N'}">
								<td>OFF</td>
							</c:if>
							<c:if test="${p.onair ne 'N'}">
								<td><button class="image blinking" disabled>ON AIR</button></td>
							</c:if>
								<td>${p.SNnick}</td>
								<td>${p.perprice}</td>
								<td>${p.startDate}</td>
								<td>${p.endDate}</td>
								<td>${p.ptype}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${empty partner}">
							현재 파트너가 없습니다.
				</c:if>
				<br>
		</div>
	</div>
	<script>
	</script>
</body>
</html>