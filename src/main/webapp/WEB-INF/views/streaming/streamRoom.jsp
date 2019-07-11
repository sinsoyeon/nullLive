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
    <button data-toggle="modal" data-target="#logModal"  style="background: pink; color: white;">결제테스트</button>
    

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
      <button onclick="testMsg()">testMsg</button>
      <button onclick="endRecordAndService()">downtest</button>
    </div>
  </footer>
  <input type="hidden" id="broadMethod" value="${broadMethod}" />
  <input type="hidden" id="mid" value="${loginUser.mid}"/>
  <input type="hidden" id="room-id" value="${streamerAddress}">
  <input type="hidden" id="bhno" value="${bhno}"/>
  <input type="hidden" id="mno" value="${loginUser.mno}" />
  <input type="hidden" id="point" value="${loginUser.point}" />
  <input type="hidden" id="nickName" value="${loginUser.nickName}" />
  
<!--   
  	<div id="logModal" class="modal fade" role="dialog" style="z-index:99999; important">
		<div class="modal-dialog" role="document" style="z-index=99999;">

			<div class="modal-content" style="z-index=99999;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<form action="">
					<div id="infoArea">
					
						<p align="center"><i class="fa fa-heart" style="font-size:48px;color:#ed7679"></i>빠숑님에게 별풍선 선물하기</p>
					</div>
				
					<p id="selectNull">보유 중인 NULL POINT : ${loginUser.point }</p>
					<table id="nullArea">
						<tr>
							<td><input type="radio" name="money" value="1000" id="moneyRadio1">
								<label>1000 NULL</label>
							</td>
							<td><input type="radio" name="money" value="5000" id="moneyRadio2">
								<label>5000 NULL</label>
							</td>	
							<td><input type="radio" name="money" value="10000" id="moneyRadio3">
								<label>10000 NULL</label>
							</td>											
						</tr>
						<tr>
							<td><input type="radio" name="money" value="20000" id="moneyRadio4">
								<label>20000 NULL</label>
							</td>	
							<td><input type="radio" name="money" value="30000" id="moneyRadio5">
								<label>30000 NULL</label>
							</td>		
							<td><input type="radio" name="money" value="50000" id="moneyRadio6">
								<label>50000 NULL</label>
							</td>																								
						</tr>
						<tr>
							<td>
							<label>금액 입력</label>
							</td>	
							<td colspan="2"><input type="number" placeholder="NULL" name="money" id="inputMoney"><label for="">  NULL</label></td>
						</tr>
						<tr>
							<td><label for="">전송할 메시지 : </label></td>
							<td><textarea name="requestMsg" id="requestMsg" cols="30" rows="10"></textarea></td>
						</tr>
					</table>
					
					<p id="butn" onclick="payment();">후원하기</p>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> -->
  
  </section>

<!-- rtc script -->
<script src="${contextPath}/resources/js/streaming/RTCMultiConnection.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="https://rtcmulticonnection.herokuapp.com:443/socket.io/socket.io.js"> </script>	<!-- rtc signaling server on socket.io // port:9002 -->
<script src="${contextPath}/resources/js/streaming/streamingOpenJoin.js"></script>
<script src="${contextPath}/resources/js/streaming/RecordRTC.js"></script>
<script src="${contextPath}/resources/js/streaming/TTSjs.js"></script>
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
// $(document).ready(function(){
//   var socket = io("http://192.168.30.30:9011");
    
//   //엔터키 입력시
//   $("#inputMsg").keydown(function(key){
//     if(key.keyCode == 13){
//       //msg_send 클릭
//       msg_send.click();
//     }
//   });
    
//   //msg_send 클릭시
//   $("#msg_send").click(function(){
//     /* var output ='';
//     output += $("#nickName").val();
//     output += ' : ';
//     output += $("#inputMsg").val(); */
      
//     //소켓에 send_msg 이벤트로 msg 전달
//     socket.emit('send_msg',{
//       name: $('#nickName').val(),
//       message : $("#inputMsg").val()
    
//     });
    
      
//     /* socket.emit("send_msg", output); */
    
    
//     //#inputMsg 비움
//     $("#inputMsg").val("");
//   });
    
//   //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
//     socket.on('send_msg', function(msg) {
//         //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
//         $('<div></div>').text(msg.name + " : " + msg.message).appendTo("#chat-box");
//     });
  
//   //DB에 저장되어 있는 내용을 가져올 경우
//   socket.on('preload', function(data){
//     $('<div></div>').text(data.name + " : " + data.message).appendTo("#chat-box");
//   });

// });



// window.onload = function(){
// 	var xhr = new XMLHttpRequest();
// 	 xhr.onload = function(){
// 	  console.log(xhr.response);  
// 	 }; 
// 	 xhr.open("GET", "http://192.168.30.30:3002/");
// 	 xhr.send();

// }


</script>
</body>
</html>