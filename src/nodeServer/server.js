// http://127.0.0.1:9002
// http://localhost:9002

var server = require('http'),
    url = require('url'),
    path = require('path'),
    fs = require('fs');

``
function serverHandler(request, response) {
    var uri = url.parse(request.url).pathname,
        filename = path.join(process.cwd(), uri);

    fs.exists(filename, function(exists) {
        if (!exists) {
            response.writeHead(404, {
                'Content-Type': 'text/plain'
            });
            response.write('404 Not Found: ' + filename + '\n');
            response.end();
            return;
        }

        if (filename.indexOf('favicon.ico') !== -1) {
            return;
        }

        var isWin = !!process.platform.match(/^win/);

        if (fs.statSync(filename).isDirectory() && !isWin) {
            filename += '/index.html';
        } else if (fs.statSync(filename).isDirectory() && !!isWin) {
            filename += '\\index.html';
        }``

        fs.readFile(filename, 'binary', function(err, file) {
            if (err) {
                response.writeHead(500, {
                    'Content-Type': 'text/plain'
                });
                response.write(err + '\n');
                response.end();
                return;
            }

            var contentType;

            if (filename.indexOf('.html') !== -1) {
                contentType = 'text/html';
            }

            if (filename.indexOf('.js') !== -1) {
                contentType = 'application/javascript';
            }

            if (contentType) {
                response.writeHead(200, {
                    'Content-Type': contentType
                });
            } else response.writeHead(200);

            response.write(file, 'binary');
            response.end();
        });
    });
}

var config = {
  "socketURL": "http://localhost:9002",
  "dirPath": "",
  "homePage": "/",
  "socketMessageEvent": "RTCMultiConnection-Message",
  "socketCustomEvent": "RTCMultiConnection-Custom-Message",
  "port": 9002,
  "enableLogs": false,
  "isUseHTTPs": false,
  "enableAdmin": false
};

var RTCMultiConnectionServer = require('rtcmulticonnection-server');
var ioServer = require('socket.io');

var app = server.createServer(serverHandler);
RTCMultiConnectionServer.beforeHttpListen(app, config);
app = app.listen(process.env.PORT || 9002, process.env.IP || "0.0.0.0", function() {
    RTCMultiConnectionServer.afterHttpListen(app, config);
});

// --------------------------
// socket.io codes goes below

ioServer(app).on('connection', function(socket) {
    RTCMultiConnectionServer.addSocket(socket, config);

    // ----------------------
    // below code is optional

    const params = socket.handshake.query;

    if (!params.socketCustomEvent) {
        params.socketCustomEvent = 'custom-message';
    }

    socket.on(params.socketCustomEvent, function(message) {
        socket.broadcast.emit(params.socketCustomEvent, message);
    });





    

    //1. 서버 사용을 위해 http 모듈을 http변수에 담음
var fs = require('fs');

var http = require('http');
var connect = require('connect');
var app = connect();
var socketio = require('socket.io')

//4. mongoose 모듈 가져오기
var mongoose = require('mongoose');
  
//5. testDB 세팅
mongoose.connect('mongodb://localhost:27017/nullLive');

//6. 연결된 nullLive 사용
var db = mongoose.connection;

db.on('error' , console.error.bind(console, 'connection error :'));

db.once('open', function calback(){
    console.log('open : success');
});

Schema = mongoose.Schema;

var userSchema = mongoose.Schema({
   username : 'String',
   message : 'String'
});

var Chat = mongoose.model('Chat', userSchema);




/* var member = Schema({
   mno : 'Number',
   nickName : 'String',
});

var chat = Schema({
   cno : 'String',
   place : 'String',
   date : {type :Date},
   mno : 'Number',
   content : 'String'
});

var Member = mongoose.model('Member', member);
var chat = mongoose.model('Chat', chat);
*/


var server = http.createServer(app);

//3. listen 함수로 9011 포트를 가진 서버를 실행. 서버가 실행된 것을 콘솔창에서
//   확인하기 위해 출력
server.listen(9011, function(){
   console.log('server is running...');
 });


var io = socketio.listen(server);

io.on('connection', function(socket){
   console.log('한명의 유저가 접속했습니다.');


   //DB에서 메세지 가져오기
   Chat.find(function(err, result){
      for(var i=0; i<result.length; i++){
         var dbData = {name : result[i].username, message : result[i].message};
         io.sockets.sockets[socket.id].emit('preload', dbData);
      }
   });

   //send_msg 띄우기 + DB에 저장하기(username + message)
   socket.on('send_msg', function(msg){
      console.log(msg);
      io.emit('send_msg',msg);

      //add chat into the model
      var chat = new Chat({username: msg.name, message: msg.message});

      chat.save(function(err, data){
         if(err){
            console.log("save error");
         }
         console.log('message is inserted');
      });
   });


   socket.on('disconnect',function(){
      console.log('한명의 유저가 접속해제를 했습니다.');
   });

  
})



});
