<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/streaming/main.js"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/streamerMain.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- sidebar -->
			<div class="col-sm-3">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>
			
			<!-- main content -->
			<div class="col-sm-9" >
				<div id="main">
					<table class="headInfo">
						<tr>
							<th>즐겨찾기 수</th>
							<td>1000</td>
							<th>구독자 수</th>
							<td>25</td>
						</tr>
					</table><br><br><br><br><br>
					<div class="broadStatus">
					<label>방송 상태:</label>
					<label>방송 전</label><br>
					<label>현재 시청자 수:</label>
					<label>200</label>

					<!-- 방송화면 삽입-->
					<br><br>
					<button class="ui green button" id="button">방송 시작하기</button>
																	
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>