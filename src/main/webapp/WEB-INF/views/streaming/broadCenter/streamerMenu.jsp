<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/semantic/semantic.min.css">
<script type="text/javascript"
	src="${ contextPath }/resources/css/semantic/semantic.min.js"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/streamerMenu.css">
<!-- <script src="https://code.jquery.com/jquery-1.4.4.min.js"></script> -->
<style>
body::-webkit-scrollbar {
	display: none;
}
/* 스트리머 사이드바 */
#sidebar {
	position: fixed;
	z-index: 9;
	top: 0;
	left: 0;
	bottom: 0;
	background: #e2f0d869;
	font-family: 'Montserrat', sans-serif;
	font-weight: lighter;
}

#sidebar ul {
	list-style-type: none;
	padding: 0;
}

#sidebar ul li {
	position: relative;
	height: 42px;
}

#sidebar ul li:hover {
	cursor: pointer;
}

#sidebar ul li a {
	text-decoration: none;
	color: black;
}

#sidebar ul li a:hover {
	color: #4a8522;
}

#sidebar ul li a i {
	text-align: center;
	width: 70px;
}

#sidebar ul li a span {
	font-size: 14px;
	padding-left: 17px;
	line-height: 50px;
}
/* 일반 사용자 사이드바 */
#sideba {
	position: fixed;
	z-index: 9;
	top: 0;
	left: 0;
	bottom: 0;
	background: #e2f0d869;
	font-family: 'Montserrat', sans-serif;
	font-weight: lighter;
}

#sideba ul {
	list-style-type: none;
	padding: 0;
}

#sideba ul li {
	position: relative;
	height: 65px;
}

#sideba ul li:hover {
	cursor: pointer;
}

#sideba ul li a {
	text-decoration: none;
	color: black;
}

#sideba ul li a:hover {
	color: #4a8522;
}

#sideba ul li a i {
	text-align: center;
	width: 70px;
}

#sideba ul li a span {
	font-size: 14px;
	padding-left: 17px;
	line-height: 50px;
}
</style>
</head>
<body>
	<div class="row">
		<!-- ryan -->
		<c:if test="${empty sessionScope.loginUser}">
			<jsp:forward page="../needLogin.jsp" />
		</c:if>
		<div style="width: 210px; margin-top: -15px; height: 170px;">
		<c:if test="${loginUser.isStreamer eq 'Y'}">
			<nav id="sidebar" style="width: 210px;">
				<div class="profile">
					<img class="img-circle" alt="Cinque Terre" id="profileImg"
						onclick="location.href='main.st?smno=${broadCenter.mno}'">
					<h4 id="nickName" style="color: black;"></h4>
					<h5 id="id" style="color: #767676f2"></h5>
				</div>
				<ul style="margin-top: 1%;">
					<li><a href="broadSetting.st"><i class="fas fa-cog fa-lg"></i><span>방송기능설정</span></a></li>
					<li><a href="partnerManage.st?mno=${loginUser.mno}"><i
							class="fas fa-user-cog fa-lg"></i><span>매니저 설정</span></a></li>
					<li><a href="blackListManage.st"><i
							class="fas fa-angry fa-lg"></i><span>블랙리스트관리</span></a></li>
					<!-- <li><a href=""><i class="fas fa-file-video fa-lg"></i><span>방송기록관리</span></a></li> -->
					<li><a href="prohibitiveWordManage.st"><i
							class="fas fa-comment-slash fa-lg"></i><span>금칙어설정</span></a></li>
					<li id="chartList"><a href="chartView.sm"><i
							class="fas fa-chart-line fa-lg"></i><span>통계페이지</span></a></li>
					<!-- 일반 사용자 -->
					<!-- <li><a href="boardsSetting.st"><i class="fas fa-edit fa-lg"></i><span>게시판관리</span></a></li> -->
					<li><a href="noticeBoard.st"><i
							class="fas fa-bullhorn fa-lg"></i><span>방송공지게시판</span></a></li>
					<li><a
						onclick="location.href='communicationBoard.st?smno=${broadCenter.mno}'"><i
							class="fas fa-mouse-pointer fa-lg"></i><span>시청자소통게시판</span></a></li>
					<li><a
						onclick="location.href='reportBlackListBoard.st?smno=${broadCenter.mno}'"><i
							class="fas fa-thumbs-down fa-lg"></i><span>블랙리스트제보</span></a></li>
					<li><a onclick="location.href='updateProfile.st'"><i
							class="fas fa-id-badge fa-lg"></i><span>개인정보수정</span></a></li>
				</ul>
			</nav>
		</c:if>
		<c:if test="${loginUser.isStreamer ne 'Y'}">
			<nav id="sideba" style="width: 210px;">
				<div class="profile">
					<img class="img-circle" alt="Cinque Terre" id="profileImg" style="margin-top: 80px; height: 140px; width: 140px; background: white;"
						onclick="location.href='main.st?smno=${broadCenter.mno}'">
					<h4 id="nickName" style="color: black;margin-top: 10%;"></h4>
					<h5 id="id" style="color: #767676f2"></h5>
				</div>
				<ul style="margin-top: 10%;">
					<!-- 일반 사용자 -->
					<!-- <li><a href="boardsSetting.st"><i class="fas fa-edit fa-lg"></i><span>게시판관리</span></a></li> -->
					<li><a href="noticeBoard.st"><i
							class="fas fa-bullhorn fa-lg"></i><span>방송공지게시판</span></a></li>
					<li><a
						onclick="location.href='communicationBoard.st?smno=${broadCenter.mno}'"><i
							class="fas fa-mouse-pointer fa-lg"></i><span>시청자소통게시판</span></a></li>
					<li><a
						onclick="location.href='reportBlackListBoard.st?smno=${broadCenter.mno}'"><i
							class="fas fa-thumbs-down fa-lg"></i><span>블랙리스트제보</span></a></li>
					<li><a onclick="location.href='updateProfile.st'"><i
							class="fas fa-id-badge fa-lg"></i><span>개인정보수정</span></a></li>
				</ul>
			</nav>
		</c:if>
		</div>

	</div>


	<script>
		window.onload = function() {
			$.ajax({
				url : "profile.sm",
				type : "get",
				success : function(data) {
					//console.log(data.data);
					$("#profileImg").attr(
							'src',
							"${contextPath}/resources/uploadFiles/profile_image/"
									+ data.changeName);
					$("#nickName").text(data.data.NICK_NAME);
					$("#id").text("@" + data.data.MID);
				},
				error : function() {
					console.log("프로필 조회 실패!");
				}
			});

		}
	</script>


</body>
</html>