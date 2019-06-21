<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
    display: block;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/bootstrap/font-awesome.css">
<link rel="stylesheet"
	href="${ contextPath }/resources/css/bootstrap/style.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<section class="menu-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="navbar-collapse collapse " style="">
						<ul id="menu-top" class="nav navbar-nav navbar-right">
							<li><a class="menu-top-active" href="index.html">구독하기</a></li>
							<li><a href="ui.html">후원하기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</section>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-head-line">구독하기</h4>

				</div>

			</div>			
		</div>
	<div class="row">
		
		<div class="col-md-3"></div>
		<div class="col-md-6">
		<br /><br />
		
		<div>
				<div id="subscribeArea2">
				<div id="subscribeArea1">
					<span id="sub1">자동 구독권</span>
					<span id="sub2">30일권</span>
				</div>
				<div id="sub4">
					<div id="sub3">
						<span>좋아하는 스트리머를 1달간 구독합니다.</span>
					</div>
				</div>
				</div>
			</div>
		</div>
		<br />
			
		<div class="col-md-3"></div>
	</div>
</body>
</html>