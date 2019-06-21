<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body::-webkit-scrollbar {
   display: none;
}
tbody tr:hover{
	background:#e2f0d8;
	color:#46610e;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<div class="container-fluid"
		style="padding-right: 30px; padding-left: 30px; padding-top: 15px;">
		<div class="row">
			<div class="col-md-4">
				<h2 style="color: #8aad40;">
					<b>무엇을</b>
				</h2>
				<h2 style="color: #8aad40;">
					<b>도와드릴까요?</b>
				</h2>
				<div class="input-group" style=" margin-top: 20px; width: 240px;">
					<input type="text" class="form-control" id="searchFaq" placeholder="Search" style=" border: 1px solid #8aad40; ">
					<span class="input-group-addon" style=" background: #6e9a13; border: 1px solid #8aad40;"><i class="glyphicon glyphicon-search" style=" color: white; "></i></span>
				</div>
				<div>
					<img alt="faq" src="/nullLive/resources/image/faq.png" style=" width: 82%; margin-top: 20px; ">
				</div>
				<p style="color: #999; margin-top: 20px;">
					NullLive 서비스에<br> 대해 궁금하신 점이 있으세요?<br> 고객센터를 통해 궁금증을
					해결하세요.
				</p>
				
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-2">
						<h3><b>FAQ</b></h3>
					</div>
					<div class="col-md-7">
						<p style=" color: #999; padding-top: 8%; ">자주 묻는 질문입니다.</p>
					</div>
					<div class="col-md-3">
						<div class="dropdown" style=" padding-top: 13%; ">

							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown" style=" width: 100%;text-align: left; ">전체<span class="caret" style=" float: right; margin-top: 8.5%; "></span></button>
							<ul class="dropdown-menu" style=" min-width: 134px; ">
								<li><a href="#">회원정보</a></li>
								<li><a href="#">방송/시청하기</a></li>
								<li><a href="#">선물/후원</a></li>
								<li><a href="#">결제</a></li>
								<li><a href="#">기타</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead>
								<tr>
									<th>No.</th>
									<th>질문</th>
									<th>답변</th>
								</tr>
							</thead>
							<tbody id="faqTable">
								<tr>
									<td>1</td>
									<td>TB - Monthly</td>
									<td>Default</td>
								</tr>
								<tr>
									<td>2</td>
									<td>TB - Monthly</td>
									<td>Approved</td>
								</tr>
								<tr>
									<td>3</td>
									<td>TB - Monthly</td>
									<td>Declined</td>
								</tr>
								<tr>
									<td>4</td>
									<td>TB - Monthly</td>
									<td>Pending</td>
								</tr>
								<tr>
									<td>5</td>
									<td>TB - Monthly</td>
									<td>Call in to confirm</td>
								</tr>
							</tbody>
						</table>
						<div style=" text-align: center; ">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#">Previous</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(document)
					.ready(
							function() {
								$("#searchFaq")
										.on(
												"keyup",
												function() {
													var value = $(this).val()
															.toLowerCase();
													$("#faqTable tr")
															.filter(
																	function() {
																		$(this)
																				.toggle(
																						$(
																								this)
																								.text()
																								.toLowerCase()
																								.indexOf(
																										value) > -1)
																	});
												});
							});
		</script>

		<hr>
		
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
						<h3><b>공지사항</b></h3>
					</div>
					<div class="col-md-10">
						<p style=" color: #999; padding-top: 3%; ">알려드립니다.</p>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>TB - Monthly</td>
							<td>Default</td>
							<td>01/04/2012</td>
							<td>0</td>
						</tr>
						<tr class="table-active">
							<td>2</td>
							<td>TB - Monthly</td>
							<td>Approved</td>
							<td>01/04/2012</td>
							<td>0</td>
						</tr>
						<tr class="table-success">
							<td>3</td>
							<td>TB - Monthly</td>
							<td>Declined</td>
							<td>02/04/2012</td>
							<td>0</td>
						</tr>
						<tr class="table-warning">
							<td>4</td>
							<td>TB - Monthly</td>
							<td>Pending</td>
							<td>03/04/2012</td>
							<td>0</td>
						</tr>
						<tr class="table-danger">
							<td>5</td>
							<td>TB - Monthly</td>
							<td>Call in to confirm</td>
							<td>04/04/2012</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
				<div style=" text-align: center; ">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>