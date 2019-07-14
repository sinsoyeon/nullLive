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
		<input type="hidden" name="mid" value="${loginUser.mid}"/>
			<div>
				비밀번호 : <input type="password" class="form-control" name="mpwd" id="mpwd1" autofocus>
			</div>
			<div>
				비밀번호 확인 : <input type="password" class="form-control" id="mpwd2">
			</div>
			<div style="margin-top:20px;">
				<button type="button" class="form-control btn btn-primary" id="pwdBtn" 
				onclick="pwdChange()" disabled>입력</button>
			</div>
		</form>
	</div>
	
<script>
$("#mpwd2").keydown(function(key){
    if(key.keyCode == 13){
    	pwdChange();
    }
});
$("#mpwd2").on('keyup',function(){
	if($(this).val() == $("#mpwd1").val()){
		$("#pwdBtn").attr('disabled',false);
	}else{
		$("#pwdBtn").attr('disabled',true)
	}
});
function pwdChange(){
	$("#pwdChangeForm").attr("action","pwdChange.me").submit();
}
</script>
</body>
</html>