<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>test streaming</title>
</head>
<body>
	<video playsinline id="localVideo" width="500" controls preload="metadata" autoplay></video>
	<video id="remoteVideo" width="500" autoplay></video>
	
	<button id="call">call</button>
    <button id="hangUp">hang up</button>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/streaming/streaming.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
</html>