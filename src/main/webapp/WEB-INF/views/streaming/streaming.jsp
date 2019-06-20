<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/streamerMain.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script>
import adapter from 'webrtc-adapter';
</script>
</head>
<body>


	<div class="container-fluid">
		<div class="row">
			<!-- sidebar -->
			<div class="col-sm-3">
				<jsp:include page="../streaming/streamerMenu.jsp" />
			</div>
			
			<!-- main content -->
			<div class="col-sm-6">
				<main style="padding-left: 2%;padding-right: 2%;"> <video
					src=""></video>
				<h1>???</h1>

				</main>
			</div>
		</div>
	</div>




</body>
</html>