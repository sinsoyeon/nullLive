<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- <script src="//code.jquery.com/jquery.min.js"></script> -->
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>	 -->
 <!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script> --> 
<link href="https://fonts.googleapis.com/css?family=Literata&display=swap" rel="stylesheet">
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
	background: #f5f5f5;
	font-family: 'Montserrat', sans-serif;
	font-weight: lighter;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar ul li {
	position: relative;
	height: 60px;
}

.sidebar ul li:hover {
	cursor:pointer;
}

.sidebar ul li a {
	text-decoration: none;
	color: black;
}

.sidebar ul li a:hover {
	color:  #4a8522;
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

 <body id="myPageNavbar">
	<!-- 사이드바 -->
	<nav class="sidebar" style="margin-top: 40px; width: 210px;">
					<ul style="margin-top: 15px;">
						<li><a href="myPage.me"><i class="fas fa-home fa-lg"></i> <span>마이페이지 홈</span></a></li>
						
						<li><a href="start.st"><i class="fas fa-video fa-lg"></i> <span>방송하기</span></a></li>
						
						<!-- <li><a href=""> <i class="fas fa-envelope fa-lg"></i><span>쪽지</span></a></li>
						
						<li><a href=""><i class="fas fa-cut"></i><span>클립영상</span></a></li>
			
						<li><a href=""> <i class="fas fa-desktop fa-lg"></i><span>다시보기</span></a></li> -->
			
						<li><a href="updatePage.me"><i class="fas fa-id-badge"></i><span>개인정보수정</span></a></li>
						
						<li><a href="partner.me"><i class="fas fa-user-friends"></i><span>방송파트너</span></a></li>
						
						<li><a href="excView.sm"><i class="fas fa-pencil-alt"></i><span>기록</span></a></li>
						
						<li><a href="subscribeView.me"><i class="fa fa-heart"></i><span>구독 및 후원</span></a></li>
					</ul>
		</nav>
</body>