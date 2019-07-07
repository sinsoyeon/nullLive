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
    <div>
        <input type="hidden" id="mno" value="${loginUser.mno}"/>
        room-id : <input type="text" id="room-id" value="${roomid}" autocorrect=off autocapitalize=off size=20>
    </div>
    <section class="make-center">
        <button onclick="openJoinStreaming">openJoinStreaming</button>
        <div id="videos-container" style="margin: 20px 0;"></div>
        
        <div id="room-urls" style="text-align: center;display: none;background: #F1EDED;margin: 15px -10px;border: 1px solid rgb(189, 189, 189);border-left: 0;border-right: 0;"></div>
  </section>
  <script src="${contextPath}/resources/js/streaming/RTCMultiConnection.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="http://127.0.0.1:9002/socket.io/socket.io.js"> </script>

<!-- custom layout for HTML5 audio/video elements -->
<link rel="stylesheet" href="${contextPath}/resources/css/streaming/getHTMLMediaElement.css">
<script src="${contextPath}/resources/css/streaming/getHTMLMediaElement.js"></script>
<script src="${contextPath}/resources/js/streaming/streamingCustom.js"></script>
<script>
   //방송 종료 처리
   $(window).on('beforeunload', function() {
           var mno = $("#mno").val();
           console.log('mno : '+mno);
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