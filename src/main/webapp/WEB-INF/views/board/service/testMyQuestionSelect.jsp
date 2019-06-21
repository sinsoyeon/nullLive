<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.backBtn {
	color: #fff;
	background-color: #3790dc;
	border-color: #3790dc;
	width: 10%;
}

#myQTableOne tr td {
	border: none;
	border-radius: 8px;
}

#myQTableOne tr:first-child {
	background: #3790dc;
	color: white;
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
			<div class="col-md-5">
				<h2 style="color: #8aad40;">
					<b>MY 문의내역</b>
				</h2>
				<br>
				<p style="color: #999;">문의하신 내용과 받아보신 답변을 확인하는 공간입니다.</p>
			</div>
			<div class="col-md-7">
				<img alt="myQuestion" src="/nullLive/resources/image/myQuestion.png"
					style="width: 100%;" />
			</div>
		</div>
		<div class="row"
			style="background: #faebd7a6; padding: 5%; height: 528px;">
			<div class="col-md-12" style=" padding: 0; ">
				<div style="height: 390px;">
					<table class="table">
						<tbody id="myQTableOne">
							<tr>
								<td><b>Q. </b><span><b>TB - Monthly</b></span>
									<span class="pull-right"><b>01/04/2012</b></span></td>
							</tr>
							<tr>
								<td style="height: 100px;padding-top: 2%;">문의내용</td>
							</tr>
							<tr style="background:white;">
								<td style="height: 220px;"><b>A. 안녕하세요. 널라이브 고객센터입니다.</b><br><br>
									<span style=" margin-left: 3%; ">답변내용</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<button type="button" class="btn pull-right backBtn">이전</button>
		</div>
	</div>
</body>
</html>