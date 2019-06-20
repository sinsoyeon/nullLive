<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="${ contextPath }/resources/css/soyeonCss.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
			<br /><br />
				<form action="">
					<div id="infoArea">
					
						<p align="center"><i class="fa fa-heart" style="font-size:48px;color:#ed7679"></i>빠숑님에게 별풍선 선물하기</p>
					</div>
				
					<p id="selectNull">보유 중인 NULL POINT : 50000 NULL</p>
					<table id="nullArea">
						<tr>
							<td><input type="radio" name="money" value="1000" id="moneyRadio1">
								<label>1000 NULL</label>
							</td>
							<td><input type="radio" name="money" value="5000" id="moneyRadio2">
								<label>5000 NULL</label>
							</td>	
							<td><input type="radio" name="money" value="10000" id="moneyRadio3">
								<label>10000 NULL</label>
							</td>											
						</tr>
						<tr>
							<td><input type="radio" name="money" value="20000" id="moneyRadio4">
								<label>20000 NULL</label>
							</td>	
							<td><input type="radio" name="money" value="30000" id="moneyRadio5">
								<label>30000 NULL</label>
							</td>		
							<td><input type="radio" name="money" value="50000" id="moneyRadio6">
								<label>50000 NULL</label>
							</td>																								
						</tr>
						<tr>
							<td>
							<label>금액 입력</label>
							</td>	
							<td colspan="2"><input type="number" placeholder="NULL" name="money" id="inputMoney"><label for="">  NULL</label></td>
						</tr>
						
					</table>
					<table>
						
					</table>
					<p id="butn" onclick="payment();">후원하기</p>
				</form>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>	
	
	<script>
		$("input:radio[name=money]").click(function(){			
			console.log($(this).val());
			$("#inputMoney").val("");
			$("#inputMoney").val($(this).val());
			
		});
	
		function payment(){
			window.open("loadPay.me?price="+$("#inputMoney").val(),'결제창','width=1000,height=800,tollbar=no,menubar=no,scrollbars=no,resizable=no')
	      }
		
	</script>
</body>
</html>