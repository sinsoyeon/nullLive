<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />
	console.log(${amount });
	<div class="left-div">
		<div class="user-settings-wrapper">
			<ul class="nav">
				<li class="dropdown">

					<div class="dropdown-menu dropdown-settings">
						<div class="media">
							<a class="media-left" href="#"> </a>
							<div class="media-body">
								<h4 class="media-heading">Jhon Deo Alex</h4>
								<h5>Developer & Designer</h5>

							</div>
						</div>
						<h5>
							<strong>Personal Bio : </strong>
						</h5>
						Anim pariatur cliche reprehen derit.
						<a href="#" class="btn btn-info btn-sm">Full Profile</a>&nbsp; <a
							href="login.html" class="btn btn-danger btn-sm">Logout</a>

					</div>
				</li>
			</ul>
		</div>
	</div>

	<!-- LOGO HEADER END-->
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
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4 class="page-head-line">구독하기</h4>

				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="alert alert-success" style="text-align: center;">
						<p>지금 빠숑님을 구독하고 다양한 혜택을 받아보세요 ! 빠숑님이 기다리고 있어요.</p>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="dashboard-div-wrapper bk-clr-one">
						<i class="fa fa-venus dashboard-div-icon"></i>
					
						<h5>빠른 알람 가능</h5>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="dashboard-div-wrapper bk-clr-two">
						<i class="fa fa-edit dashboard-div-icon"></i>
					
						<h5>힘이 되는 메세지 보내기</h5>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="dashboard-div-wrapper bk-clr-three">
						<i class="fa fa-cogs dashboard-div-icon"></i>
					
						<h5>더욱 힘이 되어주는 매니저 되기</h5>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="dashboard-div-wrapper bk-clr-four">
						<i class="fa fa-bell-o dashboard-div-icon"></i>
						
						<h5>채팅에 색깔이 변해요</h5>
					</div>
				</div>

			</div>

			<div class="row">			
						<div class="col-md-12">
							
							<div class="Compose-Message" style="text-align: center;">
								<div class="panel panel-success">
									<div class="panel-heading">빠숑님에게 전할 정보</div>
									<div class="panel-body">

										<label>스트리머 </label> <input type="text" class="form-control" />
										<label>구독자 이름 </label> <input type="text" class="form-control" />
										<label>전달할 메세지 </label>
										<textarea rows="9" class="form-control"></textarea>
										<hr />
										<a href="#" class="btn btn-warning"><span
											class="glyphicon glyphicon-envelope"></span> 구독하기 </a>&nbsp;
										<a href="#" class="btn btn-success"><span
											class="glyphicon glyphicon-tags"></span> 스트리머 페이지 </a>
									</div>
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- CONTENT-WRAPPER SECTION END-->
			
</body>
</html>