<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="${ contextPath }/resources/css/soyeonCss.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<div align="left">
		<button data-toggle="modal" data-target="#logModal"
			style="width: 150px; height: 150px; background: pink; color: white;">결제테스트</button>
		<button onclick="location.href='subscribeView.me'"style="width: 150px; height: 150px; background: blue; color: white;">정기결제 폼</button>	
		<button onclick="location.href='chartView.sm?'"style="width: 150px; height: 150px; background: blue; color: white;">스트리머 통계 폼</button>					
	</div>

	<div id="logModal" class="modal fade" role="dialog" style="z-index:99999; important">
		<div class="modal-dialog" role="document" style="z-index:99999;">

			<div class="modal-content" style="z-index:99999;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<form action="">
					<div id="infoArea">
					
						<p align="center"><i class="fa fa-heart" style="font-size:48px;color:#ed7679"></i>빠숑님에게 별풍선 선물하기</p>
					</div>
				
					<p id="selectNull">보유 중인 NULL POINT : ${loginUser.point }</p>
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
						<tr>
							<td><label for="">전송할 메시지 : </label></td>
							<td><textarea name="requestMsg" id="requestMsg" cols="30" rows="10"></textarea></td>
						</tr>
					</table>
					
					<p id="butn" onclick="payment();">후원하기</p>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


	<script>
	
			
		$(function(){
			var IMP = window.IMP; // 생략가능
			IMP.init('imp08034800'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		});
	
		$("input:radio[name=money]").click(function(){			
			console.log($(this).val());
			$("#inputMoney").val("");
			$("#inputMoney").val($(this).val());
			
		});
	
		
		function payment(){
			var requestMsg = $("#requestMsg").val();
			var amount = $("#inputMoney").val();
			
	
			if('${loginUser.point}' > amount){		
				insertNP(amount,requestMsg);
			}else{
				importService(amount,requestMsg);
			}
	     }
		
		///여기서부터 추가
		function insertNP(amount,requestMsg){
			var mno = ${loginUser.mno};
			$.ajax({
				url:"insertNP.sm",
				type:"post",
				data:{
					mno:mno,
					sno:4,
					amount:amount
				},
				success:function(data){
					alert('후원 완료!');
					$('#logModal').modal('hide');
					
					var nickName = '${loginUser.nickName}';
					console.log('${loginUser.nickName}');
					loadTTS(nickName,requestMsg);
				}
				
			});
		};
		
		function loadTTS(nickName,requestMsg){
		/* 	$.ajax({
				url:"tts.me",
				type:"post",
				data:{nickName:nickName,requestMsg:requestMsg},
				success:function(data){
					console.log('tts 연동중');
				},
				error:function(data){
					console.log(data);
				}
				
				
			}) */
		};
		
		///여기까지
		function importService(amount,requestMsg){		
			IMP.request_pay({
				 
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : 'nullLive point 충전',
			    amount :10 /*amount*/,
			    buyer_email : '${loginUser.email}',
			    buyer_name : '${loginUser.name}',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 테헤란로',
			    buyer_postcode : '123-456'
			 
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        insertNP(amount);
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		}
		
		</script>
</body>
</html>

