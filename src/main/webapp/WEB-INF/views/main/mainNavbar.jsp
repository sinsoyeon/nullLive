<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body::-webkit-scrollbar {
	display: none;
}

.sidebar {
	position: fixed;
	z-index: 9;
	top: 0;
	left: 0;
	bottom: 0;
	background: #fcf8e3d1;
	font-family: 'Montserrat', sans-serif;
	font-weight: lighter;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar ul li {
	position: relative;
	height: 65px;
}

.sidebar ul li a {
	text-decoration: none;
	color: #333;
}

.sidebar ul li a:hover {
	color: #6f8e30;
}

.sidebar ul li a i {
	text-align: center;
	width: 70px;
}

.sidebar ul li a span {
	font-size: 16px;
	padding-left: 17px;
	line-height: 50px;
}
</style>
</head>
<body>
	<!-- sidebar -->
	<nav class="sidebar" style="margin-top: 50px; width: 210px;">
		<ul style="margin-top: 15px;">
			<li><a href="#"> <i class="fas fa-star fa-lg"></i> <span>즐겨찾기</span>
			</a></li>
			<li><a href="#"> <i class="fas fa-play fa-lg"></i> <span>LIVE</span>
			</a></li>
			<li><a href="#"> <i class="fas fa-video fa-lg"></i> <span>VOD</span>
			</a></li>
			<li><a href="jobMain.jbo"> <i
					class="fas fa-mouse-pointer fa-lg"></i> <span>소통센터</span>
			</a></li>
			<li><a href="serviceMain.bo"> <i
					class="fas fa-headphones fa-lg"></i> <span>고객센터</span>
			</a></li>
			<li data-content="2" class="unread"
				onclick="location.href='testForm.me'"><a
				href="javascript:void(0)"> <i class="fa fa-heart"></i> <span>테스트용
						탭</span>
			</a></li>

			<li><a href="main.ad"> <i class="fas fa-star fa-lg"></i> <span>관리자
						테스트</span>
			</a></li>

			<%-- <li data-content="2" class="unread" onclick="location.href='main.st?smno=${loginUser.mno}';"><a
				href="javascript:void(0)"> <i class="fa fa-heart"></i> <span>스트리머
						탭</span>
			</a></li> --%>
		</ul>
	</nav>
</body>
</html>