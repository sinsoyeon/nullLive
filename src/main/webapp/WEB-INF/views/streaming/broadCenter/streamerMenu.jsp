<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/semantic/semantic.min.css">
	<script type="text/javascript" src="${ contextPath }/resources/css/semantic/semantic.min.js"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/streamerMenu.css">
<style>
</style>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />
	<div class="row">
		
			<div class="sidebar">
				<div class="profile">
					<img src="${ contextPath }/resources/image/bbashong.png"
						class="img-circle" alt="Cinque Terre" id="profileImg" onclick="location.href='main.st'">
					<h3 style="color: white">${loginUser.nickName}</h3>
					<h5 style="color: white">@${loginUser.mid}</h5>
				</div>
				<br>
				<br>
				<br>
				<div class="streamerSideMenu">
					<h3>방송 설정</h3>
					<ul>
						<li><a onclick="location.href='broadSetting.st'">방송 기능 설정</a></li>
						<li><a onclick="location.href='partnerManage.st'">매니저 설정</a></li>
						<li><a onclick="location.href='blackListManage.st'">블랙리스트 관리</a></li>
						<li><a onclick="">방송 기록 관리</a></li>
						<li><a onclick="location.href='prohibitiveWordManage.st'">금칙어 설정</a></li>
						<li id="chartList"><a onclick="location.href='chartView.sm'">통계페이지</a></li>
					</ul>
					<h3>게시판</h3>
					<ul>
						<li><a onclick="location.href='noticeBoard.st'">방송 공지 게시판</a></li>
						<li><a onclick="location.href='communicationBoard.st'">시청자 소통 게시판</a></li>
						<li><a onclick="location.href='reportBlackListBoard.st'">블랙리스트 제보 게시판</a></li>
					</ul>
					<h3>개인 페이지</h3>
					<ul>
						<li><a onclick="location.href='updateProfile.st'">개인정보 수정</a></li>
					</ul>
					<br>
				</div>
			</div>
		
	</div>

	

</body>
</html>