<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% response.addHeader("Access-Control-Allow-Origin","*"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap" rel="stylesheet">
<!-- custom layout for HTML5 audio/video elements -->
<link rel="stylesheet" href="${contextPath}/resources/css/streaming/getHTMLMediaElement.css">
<script src="${contextPath}/resources/css/streaming/getHTMLMediaElement.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/streaming/streamRoom.css" />
<link rel="stylesheet" href="${ contextPath }/resources/css/soyeonCss.css">
</head>
<body>
<section id="page">
  <header>
  <h1 id="titleH"><c:out value="${title}"/></h1>
  <img src="/nullLive/resources/image/logo.png" class="logo" id="logo" onclick="location.href='index.jsp'">
  </header>
  <div id="VideoArea">
      <section class="make-center">
          <div id="videos-container"></div>
    </section>
  </div>
  <nav id="chatArea">
   <div id="chat-box"></div>
   <input type="button" value="E" style="border: none;" id='eButton'>
    <input type="text" id="msg" style="width: 150px;"/>
    <button id="msg_send">전송</button>
    	<button class="btn btn-default" data-toggle="modal" data-target="#sponModal" id="sponBtn" >후원</button>

   <!--  <input id="nickName" value="빠숑" type="text" hidden> -->
     <!-- <div style="display:none;" id="otherClients"></div> -->
  </nav>
  <footer>
    <div class="card border-secondary mb-3" id="footerArea">
      <img src="${contextPath}/resources/uploadFiles/profile_image/${broadInfo['FILENAME']}" alt="IMG LOST" id="streamerProImg"/>
      <div class="card-header">
         <h4 id="footerTitle"><c:out value="${title}"/></h4>
        <c:out value="${broadInfo['NICKNAME']}"></c:out><br />

           누적 추천 수 : <label id="cumulativeSelects"><c:out value="${broadInfo['SELECTS']}"></c:out></label><br />
           좋아요 수 : <c:out value="${broadInfo['LIKES']}"></c:out>
        </div>
    </div>
 <div id="footerComuArea">
		<p>   현재 시청자 수 : <label id="currMems">0</label></p>
    	<p>   현재 추천 수 : <label id="currRecom">0</label></p>
		<div id="btnArea">
			<button class="btn btn-success" id="recomBtn" onclick="recomBtn()">추천</button>
			<button class="btn btn-success" id="favoBtn" onclick="favoBtn()">즐겨찾기</button>
		</div>
		<!-- <button onclick="endRecordAndService()">downtest</button> -->
	</div>
  <div id="emoticon">
  	<img src="${contextPath}/resources/image/emoticon/smail.png" class="emoticonImg" id="smail">
  	<img src="${contextPath}/resources/image/emoticon/angry.png" class="emoticonImg" id="angry">
  	<img src="${contextPath}/resources/image/emoticon/heart.png" class="emoticonImg" id="heart">
  	<img src="${contextPath}/resources/image/emoticon/good.png" class="emoticonImg" id="good">
  	<input value="smail" hidden id='smailVal'>
  	<input value="angry" hidden id='angryVal'>
  	<input value="heart" hidden id='heartVal'>
  	<input value="good" hidden id='goodVal'>
  </div>
	<div id="membersArea">
		<p>   현재 접속자</p>	
		<div id="membersList"></div>
	</div>
	<div id="userMenu">
		<p id="selectedId"></p><div id="userMenuCloseBtn" onclick="userMenuCloseBtn();">X</div>
		<br>
		<ul>
			<li><button class="btn btn-info" onclick="selectedLikeBtn();">좋아요</button></li>
			<li><button class="btn btn-info" onclick="reportBtn();">신고하기</button></li>
			<c:if test="${mid == roomId}">
				<li><button class="btn btn-danger" onclick="kickUser();">강퇴하기</button></li>
			</c:if>
		</ul>
	</div>
  </footer>
  <input type="hidden" id="broadMethod" value="${broadMethod}" />
  <input type="hidden" id="mid" value="${loginUser.mid}"/>
  <input type="hidden" id="room-id" value="${broadInfo['STREAMERADDRESS']}">
  <input type="hidden" id="bhno" value="${bhno}"/>
  <input type="hidden" id="mno" value="${loginUser.mno}" />
  <input type="hidden" id="point" value="${loginUser.point}" />
  <input type="hidden" id="nickName" value="${loginUser.nickName}" />
  <input type="hidden" id="endingComment" value="${broadInfo['ENDINGCOMMENT']}" />
  
  <%-- 
  <c:forEach var="editor" items="${partnerList}">
			<c:if test="${editor.PTYPE eq '편집자' }">
					<input type="hidden" class="mlistValue"/><c:out value="${editor.NICK_NAME}" />
				</c:if>
	</c:forEach> --%>
  
  
</section>
  

<div id="sponModal" class="modal fade" role="dialog" style="z-index:99999 !important;">
   <div class="modal-dialog" role="document" style="z-index:99999;">
      <div class="modal-content" style="z-index:99999;">
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
</div>

<!-- 신고 모달 -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div class="form-group">
				<label for="rTitle"> 제목 </label> <input
					type="text" class="form-control" id="rTitle" name="bTitle" style=" width: 80%; "/>
			</div>
			<div class="form-group">
				<label for="rType">신고유형 </label>
				<select class="form-control" id="rType" name="reportType" style=" width: 40%; ">
					<option value="기타">-------- 신고유형선택 --------</option>
					<option value="저작권 침해">저작권 침해</option>
					<option value="청소년 유해">청소년 유해</option>
					<option value="불법/음란">불법/음란</option>
					<option value="명예훼손">명예훼손</option>
					<option value="기타">기타</option>
				</select>
			</div>
			<div class="form-group">
				<label for="rContent"> 내용 </label> 
				<textarea rows="6" cols="30" class="form-control" id="rContent" name="bContent" style=" width: 80%; resize: none; " placeholder="신고내용을 상세히 적어 주시면 감사하겠습니다."></textarea>
			</div>
			<p class="btn btn-danger" id="modalReportBtn" onclick="selectedReport();">신고하기</p>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		</div>
		</div>
	</div>
</div>


<!-- rtc script -->
<script src="${contextPath}/resources/js/streaming/RTCMultiConnection.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="${contextPath}/resources/js/streaming/streamingOpenJoin.js"></script>
<script src="${contextPath}/resources/js/streaming/RecordRTC.js"></script>
<script src="${contextPath}/resources/js/streaming/TTSjs.js"></script>
<!-- chat script -->
<script src="https://192.168.1.130:3000/socket.io/socket.io.js"></script>
<script>
//방송 종료 처리
$(window).on('beforeunload', function() {
	beforeLeaveStreamRoom();
});
  

  
function beforeLeaveStreamRoom(){
	var mid = $("#mid").val();
	var roomId = $("#room-id").val();
	var bhno = $("#bhno").val();
	var ua  = navigator.userAgent.toLowerCase();
	if(mid == roomId){
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
			return confirm('강퇴되셨습니다.');
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
			return confirm('강퇴되셨습니다.');
		}
	}
}

//추천 수 리로드(자동)
// $(function(){
//    var roomId = $("#room-id").val();
//    setInterval(function(){
//       $.ajax({
//          url:"currRecom.st",
//          type:"post",
//          data:{roomId:roomId},
//          success:function(data){
//             console.log(data);
//             $("#currRecom").text(data.result);
//          }
//       });
//    },5000);   //현재 5초 마다로 해둠
// });
//추천 수 리로드
function reloadCurrRecom(){
   var roomId = $("#room-id").val();
   $.ajax({
      url:"currRecom.st",
      type:"post",
      data:{roomId:roomId},
      success:function(data){
         console.log(data);
         $("#currRecom").text(data.result);
      }
   });
}

//추천
function recomBtn(){
   var mid = $("#mid").val();
    var streamerAddress = $("#room-id").val();
   $("#recomBtn").attr('disabled',true);
   $.ajax({
      url:'recomStreamer.st',
      type:'post',
      data:{mid:mid,streamerAddress:streamerAddress},
      success:function(data){
         console.log(data);
         connection.send('recom##');
         reloadCurrRecom();
      }
   });
}

//즐겨찾기
function favoBtn(){
	var mid = $("#mid").val();
	var streamerAddress = $("#room-id").val();
	if(mid != streamerAddress){
		$.ajax({
			url:'favoStreamer.st',
			type:"post",
			data:{mid:mid,streamerAddress:streamerAddress},
			success:function(data){
				console.log(data);
				if(data == 'success'){
					$("#favoBtn").attr('disabled',true);
				}
				if(data == 'already'){
					alert('이미 즐겨찾기 하셨습니다.');
				}
			}
		});		
	}else{
		alert('자신은 즐겨찾기 할 수 없습니다!');
	}
}


//채팅
$(document).ready(function(){
   //노드랑 바로 연결
    var socket = io("https://192.168.1.130:3000");
    
  //엔터키 입력시
    $("#msg").keydown(function(key){
      if(key.keyCode == 13){
        //msg_send 클릭
        msg_send.click();
      }
    });
      
    //msg_send 클릭시
    $("#msg_send").click(function(){
     /*  var output ='';
      output += $("#nickName").val();
      output += ' : ';
      output += $("#inputMsg").val();  */
        
      //socket.emit("send_msg", output);
      
      
      
      //소켓에 send_msg 이벤트로 msg 전달
      socket.emit('send_msg',{
        name: $('#nickName').val(),
        message : $("#msg").val(),
        roomId : $("#room-id").val(),
        mid : $("#mid").val(),
        mno : $("#mno").val()
      
      });
      
      
      //#inputMsg 비움
      $("#msg").val("");
    });
    
  //이모티콘 클릭시
     $(".emoticonImg").click(function(){
    	 var emoticonImg = $(this).attr('id');
  	      //소켓에 send_emo 이벤트로 msg 전달
  	      socket.emit('send_emo',{
  	        name: $('#nickName').val(),
  	        message : emoticonImg,
  	        roomId : $("#room-id").val()
  	      });
         
         //#inputMsg 비움
         $("#msg").val("");
       });
  
    
  
   
    //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
      socket.on('send_msg', function(msg) {
          //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
         
         
          
         /*  if(var i=0; i<${mlist.length}; i++){
        	  mlist[i].
          } */
          
          
          if(msg.mid == $("#room-id").val()){
        	  console.log("스트리머!");
        	  
	          $('<div style="color:blue;"></div>').html("<img src='${contextPath}/resources/image/emoticon/sword.png'> "+ msg.name + " : " + msg.message).appendTo("#chat-box");
          }else{
        	  $('<div></div>').text(msg.name + " : " + msg.message).appendTo("#chat-box");
          }
          
          $("#chat-box").scrollTop($("#chat-box")[0].scrollHeight);
          
      });
      socket.on('send_emo', function(emo) {
          //div 태그를 만들어 텍스트를 emo로 지정을 한뒤 #chat_box에 추가를 시켜준다.
          $('<div></div>').html(emo.name + " : <img src='${contextPath}/resources/image/emoticon/"+emo.message+".png'>").appendTo("#chat-box");
          $("#chat-box").scrollTop($("#chat-box")[0].scrollHeight);
      });
      
      //매니저 채팅
      
      
    
     //DB에 저장되어 있는 내용을 가져올 경우
    socket.on('preload', function(data){
      $('<div></div>').text(data.name + " : " + data.message).appendTo("#chat-box");
      
    }); 

    
});







// $(document).ready(function(){
//    var connectionOptions =  {
//             "force new connection" : true,
//             "reconnectionAttempts": "Infinity", //avoid having user reconnect manually in order to prevent dead clients after a server restart
//             "timeout" : 10000, //before connect_error and connect_timeout are emitted.
//             "transports" : ["websocket"]
//         };
//    console.log(connectionOptions);

//     var socket = io("192.168.0.61:3002", {secure:true});
//     console.log(socket);
// })

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
//   
//     $("#msg_send").click(function(){
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
//    var xhr = new XMLHttpRequest();
//     xhr.onload = function(){
//      console.log(xhr.response);  
//     }; 
//     xhr.open("GET", "http://192.168.30.30:3002/");
//     xhr.send();

// window.onload = function(){
//     $("#logModal").modal('hide');
//    var xhr = new XMLHttpRequest();
//     xhr.onload = function(){
//      console.log(xhr.response);  
//     }; 
//     xhr.open("GET", "http://192.168.30.30:3002/");
//     xhr.send();
// }

var emoStatus=0;
$('#eButton').click(function() {
	if(emoStatus == 0){
		$('#emoticon').css("display","block");
		emoStatus = 1;
	}else{
		$('#emoticon').css("display","none");
		emoStatus = 0;
		}
})

</script>
</body>
</html>