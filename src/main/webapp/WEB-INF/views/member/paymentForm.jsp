<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<form >
					<table>
						<tr>
							<td><input type="radio" name="money" value="1000">
								<label>1000 NULL</label>
							</td>
							<td><input type="radio" name="money" value="3000">
								<label>3000 NULL</label>
							</td>
							<td><input type="radio" name="money" value="5000">
								<label>5000 NULL</label>
							</td>	
							<td><input type="radio" name="money" value="10000">
								<label>10000 NULL</label>
							</td>											
						</tr>
						<tr>
							<td><input type="radio" name="money" value="20000">
								<label>20000 NULL</label>
							</td>	
							<td><input type="radio" name="money" value="30000">
								<label>30000 NULL</label>
							</td>	
							<td><input type="radio" name="money" value="40000">
								<label>40000 NULL</label>
							</td>	
							<td><input type="radio" name="money" value="50000">
								<label>50000 NULL</label>
							</td>																								
						</tr>
						<tr>
							<td>
							<label>금액 입력</label>
							</td>	
							<td><input type="number" placeholder="NULL" name="money"></td>
						</tr>
						
					</table>
				</form>
			</div>
			<div class="col-sm-3"></div>>
		</div>
	</div>	
</body>
</html>