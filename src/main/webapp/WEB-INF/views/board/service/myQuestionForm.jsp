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
thead th, td{
	text-align:center;
}
tbody tr:hover{
	background:#ffffffb5;
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="serviceMenubar.jsp" />
	</header>
	<div class="container-fluid" style="padding-right: 30px; padding-left: 30px; padding-top: 15px;">
		<div class="row">
			<div class="col-md-5">
				<h2 style="color: #8aad40;">
					<b>MY 문의내역</b>
				</h2>
				<br>
				<p style="color: #999;">
					문의하신 내용과 받아보신 답변을 확인하는 공간입니다.
				</p>
			</div>
			<div class="col-md-7">
				<img alt="myQuestion"
					src="/nullLive/resources/image/myQuestion.png" style=" width: 100%; "/>
			</div>
		</div>
		<div class="row" style=" background: #faebd7a6; padding: 5%; height: 528px;">
			<div class="col-md-12">
				<div style=" height: 390px; ">
				<table class="table">
							<thead>
								<tr>
									<th style=" width: 20%; ">문의일자</th>
									<th>제목</th>
									<th style=" width: 20%; ">답변여부</th>
								</tr>
							</thead>
							<tbody id="myQTable">
								<tr>
									<td>01/04/2012</td>
									<td>TB - Monthly</td>
									<td>답변완료</td>
								</tr>
								<tr>
									<td>01/04/2012</td>
									<td>TB - Monthly</td>
									<td>답변완료</td>
								</tr>
								<tr>
									<td>01/04/2012</td>
									<td>TB - Monthly</td>
									<td>답변완료</td>
								</tr>
								<tr>
									<td>01/04/2012</td>
									<td>TB - Monthly</td>
									<td>답변완료</td>
								</tr>
								<tr>
									<td>01/04/2012</td>
									<td>TB - Monthly</td>
									<td>답변완료</td>
								</tr>
							</tbody>
						</table>
						</div>
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