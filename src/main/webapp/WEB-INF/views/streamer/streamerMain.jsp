<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/streamer/streamerMain.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>

	<div class="row">
		<div class="col-sm-3">
			<jsp:include page="../common/streamerMenu.jsp" />
		</div>
		<div class="col-sm-8">
			<div class="container">
				<label>방송 상태: 방송 전</label><br> 
				<label>현재 시청자 수 : 200</label>
				<br><br>
				<div class="sumnail" style="height:200px">
					<label>영상 썸네일</label>
				</div>
				<button class="ui green button" style="width:200px; font-size:20px">방송 시작하기</button>
			</div>
		</div>
	</div>

</body>
</html>