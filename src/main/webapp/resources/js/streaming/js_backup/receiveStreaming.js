'use strict';

// Set up media stream constant and parameters.
var isChannelReady = false;
var isInitiator = false;
var isStarted = false;
var pc;
let remoteStream;

// Set up audio and video regardless of what devices are present.
var sdpConstraints = {
  offerToReceiveAudio: true,
  offerToReceiveVideo: true
};

//Define initial start time of the call (defined as connection between peers).
let startTime = null;

//Define peer connections, streams and video elements.
const localVideo = document.getElementById('remoteVideo');

var pcConfig = {
  'iceServers': [{
    urls: 'stun:stun.l.google.com:19302'
  },
  {urls: "turn:numb.viagenie.ca",
    credential: "nullLive",
    username: "nL_test"}
  ]
};
/////////////////////////////////////////////
var room = document.getElementById('bhno').value;
var socket = io.connect('http://localhost:9011');

//function start when document is ready
$(document).ready(function(){
  createPeerConnection();
  console.log(localVideo);
});

//Logs a message with the id and size of a video element.
function logVideoLoaded(event) {
  const video = event.target;
  trace(`${video.id} videoWidth: ${video.videoWidth}px, ` +
        `videoHeight: ${video.videoHeight}px.`);
}
localVideo.addEventListener('loadedmetadata', logVideoLoaded);

//RTCPerrConnection 으로 peer connection
function maybeStart(){
	console.log('>>>>>> maybeStart() ',isStarted, isChannelReady);
	if(!isStarted && isChannelReady){
		console.log('>>>>>> creating peer connection');
		createPeerConnection();
		//pc.addStream(localStream);
		isStarted = true;
		console.log('isInitiator',isInitiator);
		if(isInitiator){			//스트리머인경우 client에게 rtc 요청
			doCall();
		}
	}
}

window.onbeforeunload = function () {
  sendMessage('bye');
};
////////////////////////////////////////////////////////////////////////////////////////////////
//Define RTC peer connection behavior.
//PeerConnection생성
function createPeerConnection(){
	try{
		pc = new RTCPeerConnection(pcConfig);
		pc.onicecandidate = handleIceCandidate;
        pc.onaddstream = handleRemoteStreamAdded;
        pc.onremovestream = handleRemoteStreamRemoved;
        console.log('Created RTCPeerConnnection');
    } catch (e) {
        console.log('Failed to create PeerConnection, exception: ' + e.message);
        alert('Cannot create RTCPeerConnection object.');
        return;
    }
}

function handleIceCandidate(event) {
  console.log('icecandidate event: ', event);
  if (event.candidate) {
      sendMessage({
          type: 'candidate',
          label: event.candidate.sdpMLineIndex,
          id: event.candidate.sdpMid,
          candidate: event.candidate.candidate
      });
  } else {
      console.log('End of candidates.');
  }
}

function handleRemoteStreamAdded(event) {
  console.log('Remote stream added.');
  remoteStream = event.stream;
  localVideo.srcObject = remoteStream;
}

function handleRemoteStreamRemoved(event) {
  console.log('Remote stream removed. Event: ', event);
}

function handleCreateOfferError(event) {
  console.log('createOffer() error: ', event);
}

function doCall() {
  console.log('Sending offer to peer');
  pc.createOffer(setLocalAndSendMessage, handleCreateOfferError);
}

function doAnswer() {
  console.log('Sending answer to peer.');
  pc.createAnswer().then(
      setLocalAndSendMessage,
      onCreateSessionDescriptionError
  );
}

function setLocalAndSendMessage(sessionDescription) {
  pc.setLocalDescription(sessionDescription);
  console.log('setLocalAndSendMessage sending message', sessionDescription);
  sendMessage(sessionDescription);
}

function onCreateSessionDescriptionError(error) {
  trace('Failed to create session description: ' + error.toString());
}

/*turn 서버 요청 CORS 문제 발생*/
function requestTurn(turnURL) {
  var turnExists = true;
  // for (var i in pcConfig.iceServers) {
  //     if (pcConfig.iceServers[i].urls.substr(0, 5) === 'stun:') {
  //         turnExists = true;
  //         turnReady = true;
  //         console.log("Exist stun server");
  //         break;
  //     }
  // }
  if (!turnExists) {
      // console.log('Getting TURN server from ', turnURL);
      // // No TURN server. Get one from computeengineondemand.appspot.com:
      // var xhr = new XMLHttpRequest();
      // xhr.onreadystatechange = function() {
      //     if (xhr.readyState === 4 && xhr.status === 200) {
      //         var turnServer = JSON.parse(xhr.responseText);
      //         console.log('Got TURN server: ', turnServer);
      //         pcConfig.iceServers.push({
      //             'urls': 'turn:' + turnServer.username + '@' + turnServer.turn,
      //             'credential': turnServer.password
      //         });
      //         turnReady = true;
      //     }
      // };
      //
      // xhr.open('GET', turnURL, true);
      // xhr.send();
  }
}

function hangup() {
  console.log('Hanging up.');
  stop();
  sendMessage('bye');
}

function stop() {
  isStarted = false;
  pc.close();
  pc = null;
}

////////////////////////////////////////////////////////////////////////////////////////////////
if (room !== '') {
  socket.emit('create or join', room);
  console.log('Attempted to create or  join room', room);
}
socket.on('connection', function () {
  socket.emit("onCollabo", socket.id);
  console.log('Socket connected / onCollabo start by '+socket.id);
});

socket.on('collabo', function (room) {
	socket.emit('create or join', room);
	console.log('Attempted to create or  join room on collabo', room);
});

socket.on('full', function (room) {
	console.log('Room ' + room + ' is full');
});

socket.on('join', function (room) {
  console.log('Another peer made a request to join room ' + room); 
  if(isInitiator){
    console.log('This peer is the initiator of room ' + room + '!');
    isChannelReady = true;
  }else{
    console.log('This peer is not the initiator of room '+room+'!');
  }
});

socket.on('joined', function (room) {
	console.log('joined: ' + room);
	isChannelReady = true;
});

socket.on('log', function (array) {
	console.log.apply(console, array);
});

function sendMessage(message) {
	console.log('Client sending message: ', message);
	socket.emit('message', message);
}

// This client receives a message
socket.on('message', function (message) {
	console.log('Client received message:', message);
	if (message === 'got user media') {
		maybeStart();
	} else if (message.type === 'offer') {
		if (!isInitiator && !isStarted) {
			maybeStart();
		}
		pc.setRemoteDescription(new RTCSessionDescription(message));
		doAnswer();
	} else if (message.type === 'answer' && isStarted) {
		pc.setRemoteDescription(new RTCSessionDescription(message));
	} else if (message.type === 'candidate' && isStarted) {
		var candidate = new RTCIceCandidate({
			sdpMLineIndex: message.label,
			candidate: message.candidate
		});
		pc.addIceCandidate(candidate);
	} else if (message === 'bye' && isStarted) {
		handleRemoteHangup();
	}
});

////////////////////////////////////////////////////////////////////////////////////////////////
// Define helper functions.

// Gets the "other" peer connection.
function getOtherPeer(peerConnection) {
  return (peerConnection === localPeerConnection) ?
      remotePeerConnection : localPeerConnection;
}

// Gets the name of a certain peer connection.
function getPeerName(peerConnection) {
  return (peerConnection === localPeerConnection) ?
      'localPeerConnection' : 'remotePeerConnection';
}

////////////////////////////////////////////////////////////////////////////////////////////////
//Logs an action (text) and the time when it happened on the console.
function trace(text) {
  text = text.trim();
  const now = (window.performance.now() / 1000).toFixed(3);

  console.log(now, text);
}