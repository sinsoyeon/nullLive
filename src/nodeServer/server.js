//서버 사용을 위해 변수 선언
var app = require('express')();
var http = require('http').Server(app); //http 모듈로 서버를 생성
var io = require('socket.io')(http);

app.get('/', function(req,res){
	res.send('<h1>안녕하세요 "/" 경로입니다.</h1>');
});

io.on('connection', function(socket){
	console.log('한명의 유저가 접속했습니다.');
	socket.on('disconnect',function(){
	console.log('한명의 유저가 접속해제를 했습니다.');
});

	socket.on('send_msg', function(msg){
		console.log(msg);
		io.emit('send_msg',msg);
	});
})

// listen 함수로 9011 포트를 가진 서버를 실행. 서버가 실행된 것을 콘솔창에서
//   확인하기 위해 출력
http.listen(9011, function(){
  console.log('server is running...');
});
