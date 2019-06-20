<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/semantic/semantic.min.css">
<link rel="stylesheet"
	href="${ contextPath }/resources/css/semantic/semantic.min.js">
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/streamerMenu.css">
<style>
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="row">
		
			<div class="sidebar">
				<div class="profile">
					<img src="${ contextPath }/resources/image/bbashong.png"
						class="img-circle" alt="Cinque Terre" id="profileImg">
					<h3 style="color: white">빠숑</h3>
					<h5 style="color: white">@bbashong</h5>
				</div>
				<br>
				<br>
				<br>
				<div class="streamerSideMenu">
					<h3>방송 설정</h3>
					<ul>
						<li><a onclick="broadSetting()">방송 기능 설정</a></li>
						<li><a href="">매니저 설정</a></li>
						<li><a href="">블랙리스트 관리</a></li>
						<li><a href="">방송 기록 관리</a></li>
						<li><a href="">금칙어 설정</a></li>
						<li><a href="">통계페이지</a></li>
					</ul>
					<h3>게시판</h3>
					<ul>
						<li><a href="">방송 공지 게시판</a></li>
						<li><a href="">시청자 소통 게시판</a></li>
						<li><a href="">신고 제보 게시판</a></li>
					</ul>
					<h3>개인 페이지</h3>
					<ul>
						<li><a href="">개인정보 수정</a></li>
					</ul>
					<br>
				</div>
			</div>
		
	</div>

	<script>
		function broadSetting() {
			location.href = "broadSetting.st";
		}
	</script>

</body>
</html>