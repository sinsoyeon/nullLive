<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="/_ah/channel/jsapi"></script>
</head>
<body>
<body>
<!--화상 테이블-->
<table width="100%">
    <tr>
        <td colspan="2" align="center">testStream</td>
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

<!--방 이름 입력 & 연결 버튼-->
<div>
    방이름
    <input type="text" id="room" style="width:200px;" placeholder="입장하실 방이름을 입력해주세요.">
    <input type="button" id="connectBtn" value="연결">
</div>

<!--채팅창-->
<div>
    <textarea rows="10" cols="100" id="chatArea" readonly></textarea>
</div>
<div>
    <input type="text" id="chatMsg" style="width:400px;" placeholder="메세지를 입력하세요." disabled>
</div>
</body>
<script src="${contextPath}/resources/js/streaming/startStreaming.js"></script>
</html>