<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
	<div class="panel-body">
		<form id="pwdChangeForm" method="post">
		<input type="hidden" id="userName" name="userName" value="${loginUser.name}"/>
			<div id="inputArea">
				<div>
					이름 : <input type="text" class="form-control" name="name" id="name" autofocus>
				</div>
				<div></div>
				<div>
					휴대폰 :  <select name="agency" id="">
									<option value="SKT">SKT</option>
									<option value="KT">KT</option>
									<option value="LGT">LGT</option>
									</select> &nbsp; <input type="number" name="phone1" max="999" id="p1"
									style="width: 50px;" />-<input type="number" name="phone2"
									max="9999" id="p2" style="width: 70px;" />-<input type="number"
									name="phone3" max="9999" id="p3" style="width: 70px;" />
				</div>
				<div style="margin-top:20px;">
					<button type="button" class="form-control btn btn-primary" id="pwdBtn" 
					onclick="conAdultSms()">인증</button>
				</div>
			</div>
			<div id="confArea">
				<h4>휴대폰으로 인증번호가 전송되었습니다.</h4>
				<div>
					<input type="text" class="form-control" id="confirmCode" placeholder="인증번호를 입력하세요"/>
				</div>
			</div>
		</form>
	</div>
<script>
var smsCode;
$(function(){
	console.log($("#userName").val());
	$("#confArea").hide();
});
$("#p3").keydown(function(key){
    if(key.keyCode == 13){
    	conAdultSms();
    }
});
function conAdultSms(){
	var phone = $("#p1").val()+$("#p2").val()+$("#p3").val();
	if($("#name").val() == $("#userName").val() && phone == "${loginUser.phone}"){
		$("#inputArea").hide();
		$("#confArea").show();
		//인증번호 로직
		smsCode = Math.floor(Math.random() * 1000000) + 100000;
		if(smsCode > 1000000){
			smsCode = smsCode - 1000000;
		}
		console.log(smsCode);
		//sms 보내기
		$.ajax({
			url:"conPhone.me",
			type:"post",
			data:{smsCode:smsCode,phone:phone},
			success:function(data){
				console.log(data);
			},error:function(data){
				alert(data.result);
			}
		});
	}else{
		alert('본인이 아니면 인증 절차를 진행할 수 없습니다!');
		window.close();
	}
}
$("#confirmCode").on('keyup',function(){
	if($(this).val() == smsCode){
		$(this).attr('disabled',true);
		alert('인증되었습니다.');
		$.ajax({
			url:"confrimAdult.me",
			type:"post",
			success:function(data){
				if(data == 'success'){
					alert('성인인증 되셨습니다.');
				}else{
					alert(data+'\n다시 시도해주세요');
				}
				window.opener.location.href="myPage.me";
				window.close();
			}
		});
	}
});
</script>
</body>
</html>