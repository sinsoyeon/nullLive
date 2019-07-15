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
	background: #e2f0d869;
	/*background: #fcf8e3d1;*/
	font-family: 'Montserrat', sans-serif;
	font-weight: lighter;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar ul li {
	position: relative;
	height: 75px;
}

.sidebar ul li:hover {
	cursor: pointer;
}

.sidebar ul li a {
	text-decoration: none;
	color: #333;
}

.sidebar ul li a:hover {
	color: #4a8522;
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
			<li><a href="favorite.st"><i class="fas fa-star fa-lg"></i><span>즐겨찾기</span></a></li>
			
			<li onclick="location.href='index.jsp'"><a><i class="fas fa-play fa-lg"></i> <span>LIVE</span></a></li>

			<li><a onclick="goMain();"><i class="fas fa-video fa-lg"></i> <span>VOD</span></a></li>

			<li><a href="jobMain.jbo"> <i class="fas fa-mouse-pointer fa-lg"></i> <span>소통센터</span></a></li>

			<li><a href="serviceMain.bo"> <i class="fas fa-headphones fa-lg"></i> <span>고객센터</span></a></li>
		</ul>
	</nav>
	<script>
		function goMain(){
			alert("즐겨찾기 페이지에서는 이동할 수 없습니다.");
			location.href="index.jsp";
		}
	</script>
</body>
</html>