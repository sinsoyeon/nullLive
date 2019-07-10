<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header style="height: 50px;">
		<jsp:include page="../common/menubar.jsp" />
	</header>

	<div class="container-fluid">
		<div class="row">
			<!-- 왼쪽 사이드바 -->
			<div class="col-md-2">
				<jsp:include page="mainNavbar.jsp" />
			</div>

			<!-- Hot -->
			<div class="col-md-10" style="padding-left: 55px; padding-top: 28px;">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-2">
									<span style="font-size: 18px;">HOT &nbsp;<i
										class="fas fa-crown"></i></span>
								</div>
								<div class="col-md-10"
									style="padding-top: 4px; margin-bottom: 0px;">
									<ul style="list-style: none; padding: 0;">
										<li class="active" style="float: left; padding-right: 4%;"><a
											data-toggle="pill" href="#hLive">LIVE</a></li>
										<li><a data-toggle="pill" href="#hVod">VOD</a></li>
									</ul>
								</div>
							</div>

							<!-- HOT 방송목록 영역 -->
							<div class="tab-content">

								<!-- HOT LIVE -->
								<div id="hLive" class="tab-pane fade in active">
									<div class="row" style="height: 200px; margin-top: 1%;"
										id="hotDivL">
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">

												<p
													style="margin-top: 2%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
													<strong id="hbTitle"
														style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><span>[생]
													</span>배그★ 랜덤듀오에서 배린이아아앙</strong>
												</p>

												<p
													style="margin-bottom: 0; font-size: 12px; display: inline; color: #3498db;"
													id="hbUser">스트리머01</p>
												<p
													style="font-size: 11px; color: #999; display: inline; float: right; margin-top: 1%; margin-right: 1%;">
													<i class="fas fa-user-friends"></i><span id="hbViewer">1,000</span>명
													시청
												</p>
											</div>
										</div>
									</div>
								</div>

								<!-- HOT VOD -->
								<div id="hVod" class="tab-pane fade">
									<div class="row" style="height: 200px; margin-top: 1%;"
										id="hotDivV">
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">

												<p
													style="margin-top: 2%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
													<strong id="hbTitle"
														style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">배그★
														랜덤듀오에서 배린이아아앙</strong>
												</p>

												<p
													style="margin-bottom: 0; font-size: 12px; display: inline; color: #3498db;"
													id="hbUser">스트리머01</p>
												<p
													style="font-size: 11px; color: #999; display: inline; float: right; margin-top: 1%; margin-right: 1%;">
													<i class="fas fa-user-friends"></i><span id="hbViewer">930</span>명
													시청
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>

					<br>

					<!-- 전체 -->
					<!-- 전체는 HOT에서 방송 div 가져와야 함 -->
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-1">
									<span style="font-size: 17px;">전체</span>
								</div>
								<div class="col-md-3">
									<div class="form-group"
										style="margin-top: -3%; margin-bottom: 0; width: 70%;">
										<select class="form-control" id="bCategory">
											<option value="1">-카테고리-</option>
											<option value="2">캠방</option>
											<option value="3">게임</option>
											<option value="4">음악</option>
											<option value="5">야방</option>
											<option value="6">취미</option>
											<option value="7">펫방</option>
											<option value="8">스포츠</option>
											<option value="9">라디오</option>
											<option value="0">기타</option>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<ul style="list-style: none; padding: 0; margin-top: 1%;">
										<li class="active" style="float: left; padding-right: 10%;"><a
											data-toggle="pill" href="#aLive">LIVE</a></li>
										<li><a data-toggle="pill" href="#aVod">VOD</a></li>
									</ul>
								</div>
								<div class="col-md-4">
									<div class="btn-group" style=" float: right; margin-bottom: 6%; margin-top: -2%; ">
									  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									    <i class="fas fa-bars"></i>
									  </button>
										<ul class="dropdown-menu" role="menu" style="margin-left: -192%;min-width: 0;">
									    <li><a href="#">최신방송순</a></li>
									    <li><a href="#">시청인원순</a></li>
									  </ul>
									</div>
								</div>
							</div>

							<div class="tab-content">
								<!-- 전체 LIVE -->
								<div id="aLive" class="tab-pane fade in active">
									<div class="row" style="margin-top: 1%;" id="allDivL">
										
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong><span>[생] </span>배그★ 랜덤듀오에서 배린이</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머01</p>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong><span>[생] </span>대왕연어초밥1개 + 신라면 10</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머02</p>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong><span>[생] </span>멜론음악▶최신노래/인기가</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머03</p>
											</div>
										</div>


										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong><span>[생] </span>배그★ 랜덤듀오에서 배린이</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머01</p>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong><span>[생] </span>대왕연어초밥1개 + 신라면 10</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머02</p>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong><span>[생] </span>멜론음악▶최신노래/인기가</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머03</p>
											</div>
										</div>
									</div>

								</div>

								<!-- 전체 VOD -->
								<div id="aVod" class="tab-pane fade">
									<div class="row" style="margin-top: 1%;" id="allDivV">

										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong>배그★ 랜덤듀오에서 배린이</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머01</p>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong>대왕연어초밥1개 + 신라면 10</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머02</p>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong>멜론음악▶최신노래/인기가</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머03</p>
											</div>
										</div>


										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong>배그★ 랜덤듀오에서 배린이</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머01</p>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong>대왕연어초밥1개 + 신라면 10</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머02</p>
											</div>
										</div>
										<div class="col-md-4">
											<div class="thumbnail">
												<img src="/nullLive/resources/image/broad.PNG"
													style="width: 100%; height: 120px;">
												<p>
													<strong>멜론음악▶최신노래/인기가</strong>
												</p>
												<p style="font-size: 12px; color: #3498db;">스트리머03</p>
											</div>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
	});
	
	/* HOT 방송 목록 */
	//HOT 실시간 방송 조회
	
	</script>
</body>
</html>