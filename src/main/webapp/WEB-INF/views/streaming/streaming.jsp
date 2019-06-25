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
<%-- <jsp:forward page="stream.jsp"/> --%>
<button onclick="location.href='record.st'">testRecoding</button>
<button onclick="location.href='connect.st'">testConnection</button>
<button onclick="location.href='screenSharing.st'">screenSharing</button>
 
    <video id="localVideo" playsinline autoplay muted></video>
    <video id="remoteVideo" playsinline autoplay></video>

    <div class="box">
        <button id="startButton">Start</button>
        <button id="callButton">Call</button>
        <button id="hangupButton">Hang Up</button>
    </div>

    <div class="box">
        <span>SDP Semantics:</span>
        <select id="sdpSemantics">
            <option selected value="">Default</option>
            <option value="unified-plan">Unified Plan</option>
            <option value="plan-b">Plan B</option>
        </select>
    </div>
</div>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="${contextPath}/resources/js/streaming/main.js"></script>
</body>
</html>
