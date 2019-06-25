<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="mobile-web-app-capable" content="yes">
<meta id="theme-color" name="theme-color" content="#ffffff">
 <base target="_blank">
<style>
body {
  font-family: sans-serif;
}

video {
  max-width: 100%;
  width: 320px;
}
</style>
</head>
<body>
<div>
<jsp:forward page="stream.jsp"/>
<button onclick="location.href='record.st'">testRecoding</button>
<button onclick="location.href='connect.st'">testConnection</button>
<button onclick="location.href='screenSharing.st'">screenSharing</button>
<video id="gum-local" autoplay playsinline></video>
    <button id="showVideo">Open camera</button>

    <div id="errorMsg"></div>

    <p class="warning"><strong>Warning:</strong> if you're not using headphones, pressing play will cause feedback.</p>

    <p>Display the video stream from <code>getUserMedia()</code> in a video element.</p>

    <p>The <code>MediaStream</code> object <code>stream</code> passed to the <code>getUserMedia()</code> callback is in
        global scope, so you can inspect it from the console.</p>
</div>

<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="${contextPath}/resources/js/streaming/main.js"></script>
  

<script>
import adapter from 'webrtc-adapter';
</script>
</head>
<body>


	
</body>
</html>