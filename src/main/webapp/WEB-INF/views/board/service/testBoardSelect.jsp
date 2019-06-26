<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.table .selectT{
	border:none;
}

#selectFaqT .sLabel{
	width:15%;
}
.backBtn {
	color: #fff;
	background-color: #3790dc;
	border-color: #3790dc;
	width: 10%;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="serviceMenubar.jsp" />
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
				<div class="input-group" style="margin-top: 20px; width: 240px;">
					<input type="text" class="form-control" id="searchFaq"
						placeholder="Search" style="border: 1px solid #8aad40;"> <span
						class="input-group-addon"
						style="background: #6e9a13; border: 1px solid #8aad40;"><i
						class="glyphicon glyphicon-search" style="color: white;"></i></span>
				</div>
				<div>
				<img alt="faq" src="/nullLive/resources/image/faqImg.png"
						style="width: 35%;margin-left: 38%;margin-top: 12px;position: absolute;">
				</div>
				<p style="color: #999; margin-top: 120px;">
					NullLive 서비스에<br> 대해 궁금하신 점이 있으세요?<br> 고객센터를 통해 궁금증을
					해결하세요.
				</p>
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-2">
						<h3>
							<b>FAQ</b>
						</h3>
					</div>
					<div class="col-md-7">
						<p style="color: #999; padding-top: 8%;">자주 묻는 질문입니다.</p>
					</div>
					<div class="col-md-3">
						<div class="dropdown" style="padding-top: 13%;">

							<button class="btn btn-default dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								style="width: 100%; text-align: left;">
								전체<span class="caret" style="float: right; margin-top: 8.5%;"></span>
							</button>
							<ul class="dropdown-menu" style="min-width: 134px;">
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
					<div style="height: 240px;background: #faebd7a6;border-radius: 13px;padding: 2.5%;">
						<table class="table">
							<tbody id="selectFaqT">
								<tr>
									<th class="selectT sLabel">질문</th>
									<td class="selectT" style="background: white; border-radius: 10px; "><b>Q. </b><span id="fTitle">질문</span></td>
								</tr>
								<tr style="height:10px;"></tr>
								<tr>
									<th class="selectT sLabel">답변</th>
									<td class="selectT" style=" height: 160px; background: white; border-radius: 10px; "><b>A. </b><span id="fContent">답변내용</span></td>
								</tr>
							</tbody>
						</table>
						</div>
						<div style="text-align: center;">
							<button type="button" class="btn pull-right backBtn" style=" margin-top: 3%; " onclick="fbackBtn">이전</button>
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
						<h3>
							<b>공지사항</b>
						</h3>
					</div>
					<div class="col-md-10">
						<p style="color: #999; padding-top: 3%;">알려드립니다.</p>
					</div>
				</div>
				<div style="height: 240px;background: #faebd7a6;border-radius: 13px;padding: 2.5%;">
				<table class="table">
					<tbody id="selectNoticeT">
						<tr>
							<th class="selectT" style=" width: 10%; ">제목</th>
							<td class="selectT" style=" width: 40%; background: white; border-radius: 10px;">TB - Monthly</td>
							<th class="selectT" style=" width: 10%; text-align: center;">작성일</th>
							<td class="selectT" style="background: white; border-radius: 10px; width: 13%; text-align: center;">01/04/2012</td>
							<th class="selectT" style=" width: 10%; text-align: center;">조회수</th>
							<td class="selectT" style="background: white; border-radius: 10px; width: 13%; text-align: center;">0</td>
						</tr>
						<tr style="height:10px;"></tr>
						<tr>
							<th class="selectT">내용</th>
							<td class="selectT" colspan="5" style="background: white; border-radius: 10px; height: 150px;">TB - Monthly</td>
						</tr>
					</tbody>
				</table>
				</div>
				<div style="text-align: center;">
					<button type="button" class="btn pull-right backBtn" style=" margin-top: 2.5%; ">이전</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>