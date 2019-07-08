<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
#page {
  display: grid;
  width: 100%;
  height: 768px;
  grid-template-columns: 2.2fr 0.8fr;
  grid-template-rows: 0.3fr 2fr 0.8fr;
  grid-template-areas: "head head" "video chat" "foot foot";
}
#page > header {
  grid-area: head;
  background-color: #8ca0ff;
}
#page > #VideoArea {
  grid-area: video;
  background-color: black;
}
#page > #chatArea {
  grid-area: chat;
  background-color: #ffa08c;
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
   background:gray;
   color:white;
   width:100%;
   height:95%;
}
</style>
</head>
<body>
<section id="page">
  <header>
  <h1><c:out value="${title}"/></h1>
  </header>
  <div id="VideoArea">
      <section class="make-center">
          <div id="videos-container" style="margin: 20px 0;"></div>
    </section>
  </div>
  <nav id="chatArea">
  	<div id="chat-box"></div>
    <input type="text" id="inputMsg"/>
    <button id="msg_send">전송</button>
    <input id="nickName" value="빠숑" type="text" hidden>
  	<!-- <div style="display:none;" id="otherClients"></div> -->
  </nav>
  <footer>
    <div class="card border-secondary mb-3" style="max-width: 18rem;">
      <div class="card-header"><c:out value="${streamerAddress}"></c:out></div>
      <div class="card-body text-secondary">
        <img src="" alt="" />
        <h5 class="card-title"></h5>
        <p class="card-text"></p>
      </div>
      <button onclick="endRecordAndService()">downtest</button>
    </div>
  </footer>
  <input type="hidden" id="mid" value="${loginUser.mid}"/>
  <input type="hidden" id="room-id" value="${streamerAddress}">
  <input type="hidden" id="bhno" value="${bhno}"/>
</section>

<!-- rtc script -->
<script src="${contextPath}/resources/js/streaming/RTCMultiConnection.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com:443/socket.io/socket.io.js"> </script>	<!-- rtc signaling server on socket.io // port:9002 -->
<script src="${contextPath}/resources/js/streaming/streamingOpenJoin.js"></script>
<script src="${contextPath}/resources/js/streaming/RecordRTC.js"></script>
<!-- custom layout for HTML5 audio/video elements -->
<link rel="stylesheet" href="${contextPath}/resources/css/streaming/getHTMLMediaElement.css">
<script src="${contextPath}/resources/css/streaming/getHTMLMediaElement.js"></script>
<script>
//방송 종료 처리
$(window).on('beforeunload', function() {
        var mid = $("#mid").val();
        var roomId = $("#room-id").val();
        var bhno = $("#bhno").val();
        var ua  = navigator.userAgent.toLowerCase();
        if(mid=='${streamerAddress}'){
	        if ((navigator.appName == 'Netscape' && ua.indexOf('trident') != -1) || (ua.indexOf("msie") != -1)){
	            confirm('test1');
	        }else{
	            $.ajax({
	                url:"endStreaming.st",
	                type:"post",
	                data:{mid:mid},
	                success:function(data){
                    endRecordAndService();
	                  console.log("성공 "+data);
	                }
	            });
	        	return confirm('test2');
	      	}
    	}else{
    		if ((navigator.appName == 'Netscape' && ua.indexOf('trident') != -1) || (ua.indexOf("msie") != -1)){
	            confirm('test1');
	        }else{
	            $.ajax({
	                url:"exitStreaming.st",
	                type:"post",
	                data:{mid:mid,bhno:bhno},
	                success:function(data){
	                    console.log("성공 "+data);
	                }
	            });
	        	return confirm('test2');
	      	}
    	}
});


//채팅
$(document).ready(function(){
    var socket = io("http://127.0.0.1:9011");
    
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