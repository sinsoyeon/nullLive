<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header style="height: 50px;">
		<jsp:include page="../common/menubar.jsp" />
	</header>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="mainNavbar.jsp" />
			</div>
			<div class="col-md-10">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-2">
									<span style="font-size: 18px;">HOT &nbsp;<i
										class="fas fa-crown"></i></span>
								</div>
								<div class="col-md-10"></div>
							</div>
							<div class="row" style="height: 200px; margin-top: 1%;">
								<div class="col-md-12">
									<div class="row" id="hotDiv">
										<div>
											<div class="col-md-4">
												<div class="thumbnail">
													<img src="/nullLive/resources/image/broad.jpg">
													<p>
														<strong>Paris</strong>
													</p>
													<p>Yes, we built Paris</p>
												</div>
											</div>
											<div class="col-md-4">
												<div class="thumbnail">
													<img src="/nullLive/resources/image/broad.jpg" alt="Paris">
													<p>
														<strong>Paris</strong>
													</p>
													<p>Yes, we built Paris</p>
												</div>
											</div>
											<div class="col-md-4">
												<div class="thumbnail">
													<img src="/nullLive/resources/image/broad.jpg" alt="Paris">
													<p>
														<strong>Paris</strong>
													</p>
													<p>Yes, we built Paris</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-2">
									<span style="font-size: 17px;">전체</span>
								</div>
								<div class="col-md-3"></div>
								<div class="col-md-4"></div>
								<div class="col-md-3"></div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="row" id="allDiv">
										<div></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>