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
		<div>
			<h4>저장된 휴대폰으로 인증번호가 전송되었습니다.</h4>
			<div>
				<input type="text" class="form-control" id="confrimCode" placeholder="인증번호를 입력하세요"/>
			</div>
		</div>
		<div id="phoneInputForm" style="margin-top:5px;">
			<form id="phoneCheck" method="post">
				<input type="hidden" name="mid" value="${loginUser.mid}"/>
						휴대폰 : <select name="agency" id="">
								<option value="SKT">SKT</option>
								<option value="KT">KT</option>
								<option value="LGT">LGT</option>
								</select> &nbsp; <input type="number" name="phone1" max="999" id="p1"
								style="width: 50px;" />-<input type="number" name="phone2"
								max="9999" id="p2" style="width: 70px;" />-<input type="number"
								name="phone3" max="9999" id="p3" style="width: 70px;" />
				<div style="margin-top:20px;">
					<button type="button" class="form-control btn btn-primary" onclick="phoneCheck()">변경</button>
				</div>
			</form>
		</div>
	</div>
	<script>
	var smsCode;
	$("#p3").keydown(function(key){
	    if(key.keyCode == 13){
	    	phoneCheck();
	    }
	});
	$(function(){
		$("#phoneInputForm").hide();
		//쿼리 스트링 값 가져오기 (key=value 식)
		var qString = {}; 
		window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { qString[key] = value; });
		console.log(qString.phone);
		var phoneArr = qString.phone.split('-');
		var phone = "";
		for ( var i in phoneArr) {
			phone += phoneArr[i];
		}
		console.log(phone);
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
				console.log('메세지가 전송되었습니다');
			},error:function(data){
				alert(data.result);
			}
		});
	});
	$("#confrimCode").on('keyup',function(){
		if($(this).val() == smsCode){
			$(this).attr('disabled',true);
			$("#phoneInputForm").show();
		}
	});
	function phoneCheck(){
		$("#phoneCheck").attr("action","phoneChange.me").submit();
	}
	</script>
</body>
</html>