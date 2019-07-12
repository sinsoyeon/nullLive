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
#subListArea{
	height:300px;
	overflow:auto;
}
</style>
<script>
	//var subList = ${subList};
	console.log('${subList}');
</script>
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
				<div class="col-md-2" style="display: inline; float: left;" onclick="modifyProImage()">
					<img src="${contextPath}/resources/uploadFiles/profile_image/${imgSource}" width="100px" />
				</div>
				<div class="col-md-10"
					style="display: inline; float: left; background: #e9e9e9;">
					<h3>
						<c:out value="${sessionScope.loginUser.name}" />
					</h3>
					<h5>
						<c:out value="${sessionScope.loginUser.nickName}"/> 님의 페이지입니다.
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
		<div class="row" style="margin-left: 20px;margin-top:20px;">
			<div class="col-md-6" style="height: 450px !important;">
				<h3>구독하는 방송</h3>
				<div id="subListArea">
					<table class="table" id="subListTable" >
						<thead class="thead-light">
							<tr class="table-success"
								style="background: #446600 !important; color: white;">
								<th scope="col">스트리머</th>
								<th scope="col">시작 날짜</th>
								<th scope="col">종료 날짜</th>
								<th scope="col">방송 중</th>
								<th style="visibility: hidden;"></th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="sub" items="${subList}">
							<tr>
								<td><c:out value="${sub.nickName}" /></td>
								<td><c:out value="${sub.startDate}" /></td>
								<td><c:out value="${sub.periodDate}" /></td>
								<td><c:out value="${sub.byn}" /></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-6" style="height: 450px !important;">
				<div class="col-md-2" style="display: block; float: left; width:100px;">
					<img src="${contextPath}/resources/image/profile_sample.PNG"
						width="100px" />
				</div>
				<div class="col-md-3" style="display: block; float:left;margin-left:20px;margin-top:10px;width:200px;" align="center">
					<button class="form-control btn btn-primary" onclick="location.href='main.st'">방송국으로</button>
					<button style="margin-top:10px;" class="form-control btn btn-primary" onclick="location.href='start.st'">방송시작</button>
					<button onclick="enterStreaming();">방송보기 test</button>
				</div>
				<div class="col-md-5" style="display: block; clear: left;">
					<br />
					<hr style="margin-top:10px; width:300px;"/>
					<div>
						<h3>다시 보기</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script>	
function modifyProImage(){
	var pwdWin = window.open('modifyProImagePage.me','new','width=420,height=400,menubar=no, status=no, toolbar=no');
}

function enterStreaming(){
	var streamerAddress = prompt('streamerAddress를 입력하세요','kakao111687');
	window.open('enterStreaming.st?streamerAddress='+streamerAddress,'new','width=1024,height=768,menubar=no, status=no, toolbar=no');
}
</script>
</body>
</html>