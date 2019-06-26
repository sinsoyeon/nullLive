<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/bootstrap/font-awesome.css">
<link rel="stylesheet"
	href="${ contextPath }/resources/css/bootstrap/style.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>

<body>
	<jsp:include page="../../common/menubar.jsp" />
	<section class="menu-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="navbar-collapse collapse " style="">
						<ul id="menu-top" class="nav navbar-nav navbar-right">
							<li><a class="menu-top-active" href="index.html">구독하기</a></li>
							<li><a href="ui.html" class="sponTab">후원하기</a></li>
							<li><a href="subscribeListView.sm" class="subListTab">구독내역</a></li>
							<li><a href="ui.html" class="sponListTab">후원내역</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>