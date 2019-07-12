<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
body {
	background: #f8f8f8;
	padding: 60px 0;
}

#search-form>div {
	margin: 15px 0;
}
</style>
</head>
<body>
<div class="container">
	<div>
		<a href="#" id="checkIdPwd">로그인이 안되세요?</a>
	</div>
	<div class="panel panel-success">
		<div><br /></div>
		<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
			<div class="panel-title">1. 아이디를 찾으세요</div>
		</div>
		<div class="panel-body">
			<div id="searchIdForm">
				<form id="search-form">
					<div>
						<input type="text" class="form-control" id="inputname" name="name" placeholder="이름을 입력하세요"/>
					</div>
					<div>
						<select name="agency" id="">
							<option value="SKT">SKT</option>
							<option value="KT">KT</option>
							<option value="LGT">LGT</option>
						</select> &nbsp; <input type="number" name="phone1" max="999" id="p1"
							style="width: 50px;" />-<input type="number" name="phone2"
							max="9999" id="p2" style="width: 70px;" />-<input type="number"
							name="phone3" max="9999" id="p3" style="width: 70px;" /> &nbsp;
							<button type="button" onclick="sendSms()" class="form-control btn btn-primary"
							 style="width:150px; height:36px;">인증번호 전송</button>
					</div>
					<div align="center">
						<button	type="button" class="form-control btn btn-primary"
						 style="width:200px; height:48px;" onclick="pwdSearchMove();">비밀번호 찾기</button>
					</div>
				</form>
			</div>
			<div id="smsConfirm">
				<form id="search-form">
					<div>
						<input type="text" class="form-control" id="confrimCode" placeholder="인증번호를 입력하세요"/>
					</div>
				</form>
			</div>
			<div id="pwdSearch">
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel-title">2. 비밀번호를 재발급합니다</div>
				</div>
				<form id="search-form">
					<div>
						<input type="text" class="form-control" id="mid" placeholder="아이디를 입력하세요" readonly/>
					</div>
					<div>
						<input type="email" class="form-control" id="eamil" placeholder="이메일을 입력하세요"/>
					</div>
					<div align="center">
						<button	type="button" class="form-control btn btn-primary"
						 style="width:200px; height:48px;" onclick="pwdReload()">이메일 발송</button>
					</div>
				</form>
			</div>
		</div>			
	</div>
</div>
</body>
<script>
$(function(){
	$("#smsConfirm").hide();
	$("#pwdSearch").hide();
});
var smsCode;
var name;
var phone;

function pwdSearchMove(){
	$("#searchIdForm").hide();
	$("#mid").attr('readonly',false);
	$("#pwdSearch").show();
}

function sendSms(){
	name = $("#inputname").val();
	phone = $("#p1").val()+$("#p2").val()+$("#p3").val();
	smsCode = Math.floor(Math.random() * 1000000) + 100000;
	if(smsCode > 1000000){
		smsCode = smsCode - 1000000;
	}
	console.log(smsCode);
	$.ajax({
		url:"searchId.me",
		type:"post",
		data:{smsCode:smsCode,phone:phone},
		success:function(data){
			$("#smsConfirm").show();
			$("#searchIdForm").hide();
			console.log(data);
		}
	});
}

$("#confrimCode").on('keyup',function(){
	if($(this).val() == smsCode){
		$(this).prop('disabled',true);
		
		$.ajax({
			url:"getSearchId.me",
			type:"post",
			data:{name:name,phone:phone},
			success:function(data){
				console.log(data);
				if(data.error != null){
					alert('찾으시는 아이디가 존재하지 않습니다.');
					window.close();
				}else{
					$("#smsConfirm").hide();
					$("#mid").val(data.getId);
					$("#pwdSearch").show();
					var data = data;
					alert('찾으시는 아이디는 '+data.getId+'입니다.');					
				}
			}
		});
	}
});

function pwdReload(){
	var mid = $("#mid").val();
	console.log(mid);
	var email = $("#eamil").val();
	console.log(email);
	
	
	$.ajax({
		url:"pwdReload.me",
		type:"post",
		data:{mid:mid,email:email},
		success:function(data){
			if((data.error != null)){
				alert('비밀번호 재발급에 실패했습니다');
				window.close();
			}else{
				alert('임시 비밀번호가 이메일로 전송되었습니다.');
				window.close();	
			}
		}
	});
}
</script>
</html>