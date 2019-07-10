<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<meta name="mobile-web-app-capable" content="yes">
<meta id="theme-color" name="theme-color" content="#ffffff">
 <base target="_blank">
<style>
#page {
  display: grid;
  width: 100%;
  height: 768px;
  grid-template-columns: 2.2fr 0.8fr;
  grid-template-rows: 0.3fr 2fr 0.8fr;
  grid-template-areas: "head head" "main nav" "foot foot";
}
#page > header {
  grid-area: head;
  background-color: #8ca0ff;
}
#page > #mainArea {
  grid-area: main;
  background-color: black;
}
#page > #chatArea {
  grid-area: nav;
  background-color: grey;
}
#page > footer {
  grid-area: foot;
  background-color: #8cffa0;
}
#streamerProfile {
  width:400px;
  height:100%;
  background-color: red;
}
#chat-box{
   background:black;
   color:white;
   width:300px;
   height:600px;
}
</style>
</head>
<body>
<section id="page">
<%--test --%>
<jsp:forward page="testStream.jsp"/>
  <header>
	<h1>streamingRoom</h1>
	<button onclick="location.href='record.st'">testRecoding</button>
    <button onclick="location.href='screenSharing.st'">screenSharing</button>
  </header>
  <div id="mainArea">
    <video id="localVideo" playsinline autoplay muted></video>
    <video id="remoteVideo" playsinline autoplay></video>
	<!-- <video  style="float:left" id="self" width="100%" height="100%"></video> -->
	<!-- <div style="position:relative;float:left;width:300px;display:none;">
        <video id="caller" width="300" height="200"></video>
    </div> -->
  </div>
  <nav id="chatArea">
  	<div id="chat-box"></div>
    <input type="text" id="inputMsg"/>
    <button id="msg_send">전송</button>
    <input id="nickName" value="빠숑" type="text" hidden>
  </nav>
  <footer>
   <div class="box">
              <button id="startButton">Start</button>
              <button id="callButton">Call</button>
              <button id="hangupButton">Hang Up</button>
    </div>
  	<div id="streamerProfile">
  		<img src="" alt="" />
  	</div>
  </footer>
</section>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="${contextPath}/resources/js/streaming/main.js"></script>
<script src="http://192.168.30.30:9001/socket.io/socket.io.js"></script>
<script>
   $(document).ready(function(){
      var socket = io("http://192.168.30.30:9001");
      
      //엔터키 입력시
      $("#inputMsg").keydown(function(key){

         if(key.keyCode == 13){
            //msg_send 클릭
            msg_send.click();
         }
      });
      
      //msg_send 클릭시
      $("#msg_send").click(function(){
         /* var output ='';
         output += $("#nickName").val();
         output += ' : ';
         output += $("#inputMsg").val(); */
         
         //소켓에 send_msg 이벤트로 msg 전달
         socket.emit('send_msg',{
            name: $('#nickName').val(),
            message : $("#inputMsg").val()
         
         });
         
         
         /* socket.emit("send_msg", output); */
         
         
         //#inputMsg 비움
         $("#inputMsg").val("");
      });
      
      //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
        socket.on('send_msg', function(msg) {
            //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
            $('<div></div>').text(msg.name + " : " + msg.message).appendTo("#chat-box");
        });
     
      //DB에 저장되어 있는 내용을 가져올 경우
      socket.on('preload', function(data){
    	  $('<div></div>').text(data.name + " : " + data.message).appendTo("#chat-box");
      });

   });
   $(window).on('beforeunload', function() {
	    var msg = "팝업창을 닫으시겠습니까?";
	    var ua  = navigator.userAgent.toLowerCase();
	    if ((navigator.appName == 'Netscape' && ua.indexOf('trident') != -1) || (ua.indexOf("msie") != -1)){
	        confirm('test1');
	    }else{
	    	$.ajax({
	    		url:"endStreaming.st",
	    		type:"post",
	    		data:{mno:mno},
	    		success:function(data){
	    			console.log("성공 "+data);
	    		}
	    	});
	        return confirm('test2');
	    }
	});
</script>
</body>
</html>