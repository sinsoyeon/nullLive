// ......................................................
// .......................UI Code........................
// ......................................................
$(function(){
    openJoinStreaming();
})
function openStreaming() {
    connection.open(document.getElementById('room-id').value, function() {
        showRoomURL(connection.sessionid);
    });
};

function openJoinStreaming() {
    connection.openOrJoin(document.getElementById('room-id').value, function(isRoomExist, roomid) {
        if (isRoomExist === false && connection.isInitiator === true) {
            // if room doesn't exist, it means that current user will create the room
            showRoomURL(roomid);
        }

        if(isRoomExist) {
          connection.sdpConstraints.mandatory = {
              OfferToReceiveAudio: true,
              OfferToReceiveVideo: true
          };
        }
    });
};

// ......................................................
// ..................RTCMultiConnection Code.............
// ......................................................

var connection = new RTCMultiConnection();

// by default, socket.io server is assumed to be deployed on your own URL

// comment-out below line if you do not have your own socket.io server
// connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
connection.socketURL = 'http://localhost:9002/';

// type of broadCast
connection.socketMessageEvent = 'video-broadcast-demo';

//web-cam braodcast
connection.session = {
    audio: true,
    video: true,
    oneway: true
};
//screen-sharing
// connection.session = {
//     screen: true,
//     oneway: true
// };

connection.sdpConstraints.mandatory = {
    OfferToReceiveAudio: false,
    OfferToReceiveVideo: false
};
//...............resolution change..............
// function applyConstraints(stream) {
//     var width = 1280;
//     var height = 720;

//     var supports = navigator.mediaDevices.getSupportedConstraints();

//     var constraints = {};
//     if (supports.width && supports.height) {
//         constraints = {
//             width: width,
//             height: height
//         };
//     }
// }

// applyConstraints(connection.attachStreams[0]);
// ...............................resoultion change end

// https://www.rtcmulticonnection.org/docs/iceServers/
// use your own TURN-server here!
connection.iceServers = [{
    'urls': [
        'stun:stun.l.google.com:19302',
        'stun:stun1.l.google.com:19302',
        'stun:stun2.l.google.com:19302',
        'stun:stun.l.google.com:19302?transport=udp',
    ]
}];

connection.videosContainer = document.getElementById('videos-container');
connection.onstream = function(event) {
    var existing = document.getElementById(event.streamid);
    if(existing && existing.parentNode) {
      existing.parentNode.removeChild(existing);
    }

    event.mediaElement.removeAttribute('src');
    event.mediaElement.removeAttribute('srcObject');
    event.mediaElement.muted = true;
    event.mediaElement.volume = 0;

    var video = document.createElement('video');
    try {
        video.setAttributeNode(document.createAttribute('autoplay'));
        video.setAttributeNode(document.createAttribute('playsinline'));
        video.setAttributeNode(document.createAttribute('controls'));
    } catch (e) {
        video.setAttribute('autoplay', true);
        video.setAttribute('playsinline', true);
        video.setAttribute('controls', true);
    }

    if(event.type === 'local') {
      video.volume = 0;
      try {
          video.setAttributeNode(document.createAttribute('muted'));
      } catch (e) {
          video.setAttribute('muted', true);
      }
    }
    video.srcObject = event.stream;
    var width = parseInt(connection.videosContainer.clientWidth) - 20;
    var mediaElement = getHTMLMediaElement(video, {
        //title: event.userid,          //영상 속성으로 위에 id 출력됌
        buttons: ['full-screen'],
        width: width,
        showOnMouseEnter: false,
    });

    connection.videosContainer.appendChild(mediaElement);

    setTimeout(function() {
        mediaElement.media.play();
    }, 5000);
    mediaElement.id = event.streamid;
    
    // to keep room-id in cache
    localStorage.setItem(connection.socketMessageEvent, connection.sessionid);
    // ..............RecordRTC................start
    var recorder = connection.recorder;
    if(!recorder) {
        recorder = RecordRTC([event.stream], {
            type: 'video'
        });
        recorder.startRecording();
        connection.recorder = recorder;
    }
    if(!connection.recorder.streams) {
        connection.recorder.streams = [];
    }
    connection.recorder.streams.push(event.stream);
    recordingStatus.innerHTML = 'Recording ' + connection.recorder.streams.length + ' streams';
}

function endRecordAndService(){
    var recorder = connection.recorder;
    if(!recorder) return alert('No recorder found.');
    recorder.stopRecording(function() {
        var blob = recorder.getBlob();
        invokeSaveAsDialog(blob);
        connection.recorder = null;
    });
}
    //.......................................RecordRTCend


connection.onstreamended = function(event) {
    var mediaElement = document.getElementById(event.streamid);
    if (mediaElement) {
        mediaElement.parentNode.removeChild(mediaElement);

        if(event.userid === connection.sessionid && !connection.isInitiator) {
          alert('Broadcast is ended. We will reload this page to clear the cache.');
          location.reload();
        }
    }
};

connection.onMediaError = function(e) {
    if (e.message === 'Concurrent mic process limit.') {
        if (DetectRTC.audioInputDevices.length <= 1) {
            alert('Please select external microphone. Check github issue number 483.');
            return;
        }

        var secondaryMic = DetectRTC.audioInputDevices[1].deviceId;
        connection.mediaConstraints.audio = {
            deviceId: secondaryMic
        };

        connection.join(connection.sessionid);
    }
};

// ..................................
// ALL below scripts are redundant!!!
// ..................................
// ......................................................
// ......................Handling Room-ID................
// ......................................................

function showRoomURL(roomid) {
    var roomHashURL = '#' + roomid;
    var roomQueryStringURL = '?roomid=' + roomid;

    var html = '<h2>Unique URL for your room:</h2><br>';

    html += 'Hash URL: <a href="' + roomHashURL + '" target="_blank">' + roomHashURL + '</a>';
    html += '<br>';
    html += 'QueryString URL: <a href="' + roomQueryStringURL + '" target="_blank">' + roomQueryStringURL + '</a>';

    var roomURLsDiv = document.getElementById('room-urls');
    roomURLsDiv.innerHTML = html;

    roomURLsDiv.style.display = 'block';
}

(function() {
    var params = {},
        r = /([^&=]+)=?([^&]*)/g;

    function d(s) {
        return decodeURIComponent(s.replace(/\+/g, ' '));
    }
    var match, search = window.location.search;
    while (match = r.exec(search.substring(1)))
        params[d(match[1])] = d(match[2]);
    window.params = params;
})();

var roomid = '';
if (localStorage.getItem(connection.socketMessageEvent)) {
    localStorage.setItem(connection.socketMessageEvent, document.getElementById('room-id').value);
    roomid = localStorage.getItem(connection.socketMessageEvent);
} else {
    roomid = document.getElementById('room-id').value;
}
document.getElementById('room-id').value = roomid;
document.getElementById('room-id').onkeyup = function() {
    console.log('room-id value : '+document.getElementById('room-id').value);
    localStorage.setItem(connection.socketMessageEvent, document.getElementById('room-id').value);
    console.log('localStorage : '+localStorage.getItem(connection.socketMessageEvent));
};

var hashString = location.hash.replace('#', '');
if (hashString.length && hashString.indexOf('comment-') == 0) {
    hashString = '';
}

var roomid = params.roomid;
if (!roomid && hashString.length) {
    roomid = hashString;
}

if (roomid && roomid.length) {
    document.getElementById('room-id').value = roomid;
    localStorage.setItem(connection.socketMessageEvent, roomid);

    // auto-join-room
    (function reCheckRoomPresence() {
        connection.checkPresence(roomid, function(isRoomExist) {
            if (isRoomExist) {
                connection.join(roomid);
                return;
            }

            setTimeout(reCheckRoomPresence, 5000);
        });
    })();

    disableInputButtons();
}

// detect 2G
if(navigator.connection &&
   navigator.connection.type === 'cellular' &&
   navigator.connection.downlinkMax <= 0.115) {
  alert('2G is not supported. Please use a better internet service.');
}