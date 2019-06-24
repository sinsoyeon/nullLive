<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #f8f8f8;
	padding: 60px 0;
}

#login-form>div {
	margin: 15px 0;
}
</style>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="panel-title">NULL LIVE에 가입하세요!</div>
				</div>
				<div class="panel-body">
					<form action="insert.me" id="login-form" method="post">
						<div>
							<input type="text" class="form-control" name="mid" id="inputMid"
								placeholder="Id" autofocus>
							<div id="idAvailable" style="margin:5px;float:left;width:200px;height:25px;"></div>
						</div>
						<div>
							<input type="password" class="form-control" name="mpwd" id="inputMpwd"
								placeholder="Password">
						</div>
						<div>
							<input type="email" class="form-control" name="email" id="inputEmail"
								placeholder="Email" />
						</div>
						<div>
							<input type="radio" id="genderM" name="gender" value="M"/><label for="genderM">남</label> &nbsp;
							<input type="radio" id="genderF" name="gender" value="F" /><label for="genderF">여</label>
						</div>
						<div>
						<!-- <button type="button" onclick="IMP.certification()">인증</button> -->
							<select name="agency" id="">
								<option value="SKT">SKT</option>
								<option value="KT">KT</option>
								<option value="LGT">LGT</option>
							</select> &nbsp; <input type="number" name="phone1" max="999" id="p1"
								style="width: 50px;" />-<input type="number" name="phone2"
								max="9999" id="p2" style="width: 70px;" />-<input type="number"
								name="phone3" max="9999" id="p3" style="width: 70px;" />
						</div>
						<div>
							<input type="text" name="name" class="form-control" id="inputName"
								placeholder="성함" />
						</div>
						<div>
							<input type="date" name="birthday" class="form-control" placeholder="생년월일" id="birthday"/>
						</div>
						<div>
							<button align="center" id="joinBtn" class="form-control btn btn-primary" disabled>회원가입</button>
						</div>
					</form>
					<div>
						<button onclick="location.href='loginPage.me'" align="center"
						class="form-control btn btn-primary">로그인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
//회원가입 유효화
var idCheck = false;

//var IMP = window.IMP;
IMP.init('imp29088388');
//IMP.certification(param, callback) 호출
IMP.certification({ // param
 // phone:($("#p1").val()+$("#p2").val()+$("#p3").val()),
 // popup:true,
   merchant_uid : 'merchant_' + new Date().getTime() //본인인증과 연관된 가맹점 내부 주문번호가 있다면 넘겨주세요
}, function (rsp) { // callback
  if (rsp.success) {
	  console.log(rsp.imp_uid);
      console.log(rsp.merchant_uid);
      
      $.ajax({
				type : 'POST',
				url : '/certifications/confirm',
				dataType : 'json',
				data : {
					imp_uid : rsp.imp_uid
				}
		 }).done(function(rsp) {
		 	console.log(rsp);	
			 // 이후 Business Logic 처리하시면 됩니다.
		 });
      	
  } else {
  	 // 인증취소 또는 인증실패
      var msg = '인증에 실패하였습니다.';
      msg += '에러내용 : ' + rsp.error_msg;

      alert(msg);
  }
});

$("#inputMid").on("propertychange change paste input", function(){
	var currentVal = $(this).val();
	$.ajax({
		url:"duplicateTest.me",
		type:"POST",
		data:{currentVal:currentVal},
		success:function(data){
			if(data == 'lengthError') {
				console.log('길이부족');
				$("#idAvailable").css("color","grey").text('길이가 부족합니다.');
				idCheck=false;
			}else if(data == 'duplicate') {
				console.log('중복');
				$("#idAvailable").css("color","red").text('중복된 아이디입니다.');
				idCheck=false;
			}else if(data == 'success') {
				console.log('사용가능');
				$("#idAvailable").css("color","green").text('사용가능한 아이디입니다.');
				idCheck=true;
			}
		},
		error:function(){
			console.log("통신에러");
		}
	});
});

$("input").on("change",function(){
	availTest();
});

function availTest(){
	if(idCheck){
		if($("#inputMpwd").val() != ""){
			if($("#inputEmail").val() != ""){
				if($("#inputName").val() != ""){
					if($("#birthday").val() != ""){
						$("#joinBtn").attr('disabled',false);
					}else{
						$("#joinBtn").attr('disabled',true);
					}				
				}else{
					$("#joinBtn").attr('disabled',true);
				}
			}else{
				$("#joinBtn").attr('disabled',true);
			}
		}else{
			$("#joinBtn").attr('disabled',true);
		}
	}else{
		$("#joinBtn").attr('disabled',true);
	}
		
}
</script>
</body>
</html>