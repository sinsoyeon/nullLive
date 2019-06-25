<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<body>
	<video playsinline id="localVideo" width="500" controls preload="metadata" autoplay></video>
	<video id="remoteVideo" width="500" controls autoplay></video>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/streaming/streaming.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script>
	$("#localVideo").css('display','none');
</script>
</body>
</html>