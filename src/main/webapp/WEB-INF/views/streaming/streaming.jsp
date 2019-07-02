<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<meta name="mobile-web-app-capable" content="yes">
<meta id="theme-color" name="theme-color" content="#ffffff">
<base target="_blank">
<style>
body {
	font-family: sans-serif;
}

video {
	max-width: 100%;
	width: 700px;
	background: lightgrey;
}

#videoArea {
	width: 65%;
}

#chatArea {
	widht: 30%;
}

#chat-box {
	background: black;
	color: white;
	width: 300px;
	height: 600px;
}
</style>
</head>
<body>
	<div id="contentArea" class="col-md-11"
		style="display: inline; min-width: 1024;">
		<div class="row">
			<div id="videoArea" class="col-md-5"
				style="display: block; float: left;">
				<jsp:forward page="streamRoom.jsp" />
				<button onclick="location.href='record.st'">testRecoding</button>
				<button onclick="location.href='connect.st'">testConnection</button>
				<button onclick="location.href='screenSharing.st'">screenSharing</button>
				<br />
				<video id="localVideo" playsinline autoplay muted></video>
				<video id="remoteVideo" playsinline autoplay></video>

				<div class="box">
					<button id="startButton">Start</button>
					<button id="callButton">Call</button>
					<button id="hangupButton">Hang Up</button>
				</div>
			</div>

			<div id="chatArea" class="col-md-5"
				style="display: block; float: right;">
				<div id="chat-box"></div>
				<input type="text" id="inputMsg" />
				<button id="msg_send">전송</button>
			</div>
		</div>
	</div>
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script src="${contextPath}/resources/js/streaming/main.js"></script>
	<script src="http://127.0.0.1:9011/socket.io/socket.io.js"></script>
	<script>
		$(document).ready(function() {
			var socket = io("http://127.0.0.1:9011");

			//엔터키 입력시
			$("#msg").keydown(function(key) {
				if (key.keyCode == 13) {
					//msg_send 클릭
					msg_send.click();
				}
			});

			//msg_send 클릭시
			$("#msg_send").click(function() {
				//소켓에 send_msg 이벤트로 msg 전달
				socket.emit("send_msg", $("#inputMsg").val());
				//#inputMsg 비움
				$("#inputMsg").val("");
			});

			//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
			socket.on('send_msg', function(msg) {
				//div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
				$('<div></div>').text(msg).appendTo("#chat-box");
			});
		});
	</script>
</body>
</html>