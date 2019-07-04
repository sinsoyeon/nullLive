'use strict';

//Define peer connections, streams and video elements.
const remoteVideo = document.getElementById('remoteVideo');

let remoteStream;

let localPeerConnection;
let remotePeerConnection;

//Handles remote MediaStream success by adding it as the remoteVideo src.
function gotRemoteMediaStream(event) {
	  const mediaStream = event.stream;
	  remoteVideo.srcObject = mediaStream;
	  remoteStream = mediaStream;
}

//Logs a message with the id and size of a video element.
function logVideoLoaded(event) {
  const video = event.target;
  trace(`${video.id} videoWidth: ${video.videoWidth}px, ` +
        `videoHeight: ${video.videoHeight}px.`);
}
remoteVideo.addEventListener('loadedmetadata', logVideoLoaded);

////////////////////////////////////////////////////////////////////////////////////////////////
//Define RTC peer connection behavior.

//Connects with new peer candidate.
function handleConnection(event) {
const peerConnection = event.target;
const iceCandidate = event.candidate;

if (iceCandidate) {
const newIceCandidate = new RTCIceCandidate(iceCandidate);
const otherPeer = getOtherPeer(peerConnection);

otherPeer.addIceCandidate(newIceCandidate)
 .then(() => {
   handleConnectionSuccess(peerConnection);
 }).catch((error) => {
   handleConnectionFailure(peerConnection, error);
 });

trace(`${getPeerName(peerConnection)} ICE candidate:\n` +
     `${event.candidate.candidate}.`);
}
}

//Logs that the connection succeeded.
function handleConnectionSuccess(peerConnection) {
trace(`${getPeerName(peerConnection)} addIceCandidate success.`);
};

//Logs that the connection failed.
function handleConnectionFailure(peerConnection, error) {
trace(`${getPeerName(peerConnection)} failed to add ICE Candidate:\n`+
   `${error.toString()}.`);
}

//Logs changes to the connection state.
function handleConnectionChange(event) {
const peerConnection = event.target;
console.log('ICE state change event: ', event);
trace(`${getPeerName(peerConnection)} ICE state: ` +
   `${peerConnection.iceConnectionState}.`);
}

//Logs error when setting session description fails.
function setSessionDescriptionError(error) {
trace(`Failed to create session description: ${error.toString()}.`);
}

//Logs success when setting session description.
function setDescriptionSuccess(peerConnection, functionName) {
const peerName = getPeerName(peerConnection);
trace(`${peerName} ${functionName} complete.`);
}

//Logs success when localDescription is set.
function setLocalDescriptionSuccess(peerConnection) {
setDescriptionSuccess(peerConnection, 'setLocalDescription');
}

//Logs success when remoteDescription is set.
function setRemoteDescriptionSuccess(peerConnection) {
setDescriptionSuccess(peerConnection, 'setRemoteDescription');
}

//Logs offer creation and sets peer connection session descriptions.
function createdOffer(description) {
  trace(`Offer from localPeerConnection:\n${description.sdp}`);

  trace('localPeerConnection setLocalDescription start.');
  localPeerConnection.setLocalDescription(description)
    .then(() => {
      setLocalDescriptionSuccess(localPeerConnection);
    }).catch(setSessionDescriptionError);

  trace('remotePeerConnection setRemoteDescription start.');
  remotePeerConnection.setRemoteDescription(description)
    .then(() => {
      setRemoteDescriptionSuccess(remotePeerConnection);
    }).catch(setSessionDescriptionError);

  trace('remotePeerConnection createAnswer start.');
  remotePeerConnection.createAnswer()
    .then(createdAnswer)
    .catch(setSessionDescriptionError);
}

// Logs answer to offer creation and sets peer connection session descriptions.
function createdAnswer(description) {
  trace(`Answer from remotePeerConnection:\n${description.sdp}.`);

  trace('remotePeerConnection setLocalDescription start.');
  remotePeerConnection.setLocalDescription(description)
    .then(() => {
      setLocalDescriptionSuccess(remotePeerConnection);
    }).catch(setSessionDescriptionError);

  trace('localPeerConnection setRemoteDescription start.');
  localPeerConnection.setRemoteDescription(description)
    .then(() => {
      setRemoteDescriptionSuccess(localPeerConnection);
    }).catch(setSessionDescriptionError);
}

//Gets the name of a certain peer connection.
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