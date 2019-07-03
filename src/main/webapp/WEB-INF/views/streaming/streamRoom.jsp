<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/js/streaming/easyrtc/easyrtc.css" />
<script src="http://localhost:8888/socket.io/socket.io.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/streaming/easyrtc/easyrtc.js"></script>
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
</style>
</head>
<body onload="my_init();">
<section id="page">
  <header>
	<h1>streamingRoom</h1>
  </header>
  <div id="mainArea">
	<video  style="float:left" id="self" width="100%" height="100%"></video>
	<div style="position:relative;float:left;width:300px;display:none;">
        <video id="caller" width="300" height="200"></video>
    </div>
  </div>
  <nav id="chatArea">
  	<div style="display:none;" id="otherClients"></div>
  </nav>
  <footer>
  	<div id="streamerProfile">
  		<img src="" alt="" />
  	</div>
  </footer>
</section>
</body>
<script>
var mno = ${sessionScope.loginUser.mno};
function my_init() {
	easyrtc.setRoomOccupantListener( loggedInListener);
    easyrtc.easyApp("Company_Chat_Line", "self", ["caller"],
        function(myId) {
           console.log("My easyrtcid is " + myId);
        }
    );
}


function loggedInListener(roomName, otherPeers) {
   var otherClientDiv = document.getElementById('otherClients');
   while (otherClientDiv.hasChildNodes()) {
       otherClientDiv.removeChild(otherClientDiv.lastChild);
   }
   for(var i in otherPeers) {
       var button = document.createElement('button');
       button.onclick = function(easyrtcid) {
           return function() {
               performCall(easyrtcid);
           }
       }(i);

       label = document.createTextNode(i);
       button.appendChild(label);
       otherClientDiv.appendChild(button);
   }
}


function performCall(easyrtcid) {
   easyrtc.call(
      easyrtcid,
      function(easyrtcid) { console.log("completed call to " + easyrtcid);},
      function(errorMessage) { console.log("err:" + errorMessage);},
      function(accepted, bywho) {
         console.log((accepted?"accepted":"rejected")+ " by " + bywho);
      }
  );
}

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
</html>