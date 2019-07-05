<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<body>
<!--화상 테이블-->
<table width="100%">
    <tr>
        <td colspan="2" align="center">testStream bhno : <c:out value="${bhno}"></c:out></td>
    </tr>
    <tr>
        <td align="center">Local</td>
        <td align="center">Remote</td>
    </tr>
    <tr>
        <td width="50%"><video width="100%" id="localVideo" autoplay></video></td>
        <td width="50%"><video width="100%" id="remoteVideo" autoplay></video></td>
    </tr>
</table>

<div>
    <input type="hidden" id="mno" value="${loginUser.mno}"/>
    <input type="hidden" id="bhno" value="${bhno}">
</div>

<!--채팅창-->
<div>
    <textarea rows="10" cols="100" id="chatArea" readonly></textarea>
</div>
<div>
    <input type="text" id="chatMsg" style="width:400px;" placeholder="메세지를 입력하세요." disabled>
</div>
</body>
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
<script src="http://127.0.0.1:9011/socket.io/socket.io.js"></script>
<script src="${contextPath}/resources/js/streaming/startStreaming.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
</html>