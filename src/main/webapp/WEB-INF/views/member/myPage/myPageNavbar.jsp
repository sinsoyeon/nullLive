<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<style>
  /* 사이드바 래퍼 스타일 */
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 200px;
    height: 100%;
    margin-left: -250px;
    background: #e9e9e9;
    overflow-x: hidden;
    overflow-y: auto;
  }  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 200px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 2em;
    line-height: 2.3em;
  }
	
  hr {
  	width:170px;
  	color: #222222;    /* IE */
    border-color: #222222;  /* 사파리 */
    background-color: #222222;   /* 크롬, 모질라 등, 기타 브라우저 */
  }
  
  .sidebar-nav li a {
    display: block;
    font-size:1.5em;
    text-align:center;
    text-decoration: none;
    color: #000;
  }
  
  .sidebar-nav li:hover {
  	font-size:1.1em;
    color: white;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.2em;
    line-height: 3em;
  }
</style>
</head>

<body id="myPageNavbar">
	<div id="page-wrapper">
	<!-- 사이드바 -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="myPage.me">마이페이지 홈</a></li>
				<li><hr/></li>
				<li><a href="start.st">방송하기</a></li>
				<li><a href="">쪽지</a></li>
				<li><hr /></li>
				<li><a href="">클립영상</a></li>
				<li><a href="">다시보기</a></li>
				<li><hr /></li>
				<li><a href="updatePage.me">개인정보수정</a></li>
				<li><a href="partner.me">방송파트너</a></li>
				<li><a href="excView.sm">기록</a></li>
				<li><a href="subscribeView.me">구독 및 후원</a></li>					
			</ul>
		</div>
	</div>
</body>