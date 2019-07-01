<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	display: block;
}
</style>
</head>
<body>
	<jsp:include page="sponAndSubscribeNav.jsp" />
	<div class="container">
	
		<div class="row">

			<div class="col-md-3"></div>
			<div class="col-md-6">
				<br /> <br />

				<div id="detailSubscribeArea">
					<h4 class="page-head-line">구독하기</h4>
					<ul>
						<li>
							<div id="subscribeArea2">
								<div id="subscribeArea1">
									<span id="sub1">자동 구독권</span> <span id="sub2">30일권</span>
								</div>
								<div id="sub3">
									<span id="desc">좋아하는 스트리머를 매달 구독합니다.</span>
								</div>
								<div class="btn_buy">
									<button onclick="" id="btnAmount" value="3300">3,300원</button>
								</div>
							</div>
						</li>
						<li>
							<div id="subscribeArea2">
								<div id="subscribeArea1">
									<span id="sub1">정기 구독권</span> <span id="sub2">3개월권</span>
								</div>
								<div id="sub3">
									<span id="desc">좋아하는 스트리머를 3달간 구독합니다.</span>
								</div>
								<div class="btn_buy">
									<button onclick="" id="btnAmount" value="19">9,900원</button>
								</div>
							</div>

						</li>
						<li>
							<div id="subscribeArea2">
								<div id="subscribeArea1">
									<span id="sub1">정기 구독권</span> <span id="sub2">6개월권</span>
								</div>
								<div id="sub3">
									<span id="desc">좋아하는 스트리머를 6달간 구독합니다.</span>
								</div>
								<div class="btn_buy">
									<button onclick="" id="btnAmount" value="25">19,800원</button>
								</div>
							</div>
						</li>
						<li>
							<div id="subscribeArea2">
								<div id="subscribeArea1">
									<span id="sub1">정기 구독권</span> <span id="sub2">12개월권</span>
								</div>
								<div id="sub3">
									<span id="desc">좋아하는 스트리머를 12달간 구독합니다.</span>
								</div>
								<div class="btn_buy">
									<button onclick="" id="btnAmount" value="30">39,600원</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<br />

				<!-- 구독 내역 조회용 Div -->
				<div id="subscribeArea">
					<h4 class="page-head-line" id="textLine">구독 내역</h4>
					<br /> <br />

					<h4 style="color: #333333 !important;" id="textLine1">내가 구독한
						스트리머</h4>
					<table class="table" id="mySubscribeArea">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">구독 번호</th>
								<th scope="col">스트리머 이름</th>
								<th scope="col">이용중인 구독권</th>
								<th scope="col">구독 시작일</th>
								<th scope="col">구독 종료일</th>
							</tr>
						</thead>
						<tbody>
			
						</tbody>
					</table>

					<br /> <br />
					<h4 style="color: #333333 !important;" id="textLine2">나를 구독한
						사용자</h4>
					<table class="table" id="subscribeForMeArea"
						style="text-align: center" align="center;">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">구독 번호</th>
								<th scope="col">구독자 이름</th>
								<th scope="col">나에게 보낸 메세지</th>
							</tr>
						</thead>
						<tbody>
					
						</tbody>
					</table>
				</div>


				<!-- 스폰 조회용 Div -->
				<div id="sponTableArea">
					<table class="table" id="sponTable" style="text-align: center">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">후원 번호</th>
								<th scope="col">스트리머 이름</th>
								<th scope="col">후원 금액</th>
								<th scope="col">후원 날짜</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>

			</div>
		</div>


		<div class="col-md-3"></div>
	</div>

	<div id="logModal" class="modal fade" role="dialog"
		style="z-index: 99999;">
		<div class="modal-dialog" role="document" style="z-index: 99999;">

			<div class="modal-content" style="z-index: 99999;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<div id="bodyArea">
						<h4>스트리머 아이디를 입력하세요!</h4>
						<input type="hidden" id="sno" /> <label for="">아이디</label> <input
							type="text" id="streamerId" />
					</div>
					<button id="streamerBtn">선택</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		var sno;

		$(function() {
			$("#logModal").modal("show");
			$("#subscribeArea").hide();
			$("#sponTableArea").hide();
		})

		$("#streamerBtn").click(function() {
			streamer = $("#streamerId").val();
			$.ajax({
				url : "selectStreamer.sm",
				type : "post",
				data : {
					streamer : streamer
				},
				success : function(data) {
					console.log('ajax실행');
					console.log("data : " + data);
					sno = data;

					if (sno == null) {
						alert('검색정보가 없습니다.');
					} else {
						alert(sno)
					}
				}
			});

			$("#logModal").modal("hide");
			console.log(streamer);
		})

		$("button[id=btnAmount]").click(
			function() {
				var amount = $(this).val();
				var mno = $
				{
					loginUser.mno
				}
				;
				var IMP = window.IMP; // 생략가능
				IMP.init('imp08034800'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

				if (amount == 3300) {
					IMP.request_pay({
						pay_method : 'phone', // 'phone'만 지원됩니다.
						merchant_uid : 'merchant_'
								+ new Date().getTime(),
						name : '최초인증결제',
						amount : 10,
						customer_uid : 'gildong_0001_1234',
						buyer_email : 'iamport@siot.do',
						buyer_name : '아임포트',
						buyer_tel : '02-1234-1234'
					}, function(rsp) {
						if (rsp.success) {
							$.ajax({
								url : "subscribe.sm", // 서비스 웹서버
								method : "POST",
								data : {
									amount : amount,
									mno : mno,
									sno : sno
								},
								success : function(data) {
									alert('ajax접속 성공!')
								}
							});
						} else {
							alert(rsp.error_msg);
						}
					});

				} else {
					IMP.request_pay({
						pg : 'inicis', // version 1.1.0부터 지원.
						pay_method : 'card',
						merchant_uid : 'merchant_'
								+ new Date()
										.getTime(),
						name : '주문명:결제테스트',
						amount : amount,
						buyer_email : 'iamport@siot.do',
						buyer_name : '구매자이름',
						buyer_tel : '010-1234-5678',
						buyer_addr : '서울특별시 강남구 삼성동',
						buyer_postcode : '123-456',
						m_redirect_url : 'https://www.yourdomain.com/payments/complete'
					},
					function(rsp) {
						if (rsp.success) {
							var msg = '결제가 완료되었습니다.';
							$.ajax({
								url : "monthlySubscribe.sm", // 서비스 웹서버
								method : "POST",
								data : {
									amount : amount,
									mno : mno,
									sno : sno
								},
								success : function(
										data) {
									alert('ajax접속 성공!');
								}
							});
						} else {
							var msg = '결제에 실패하였습니다.';
							msg += '에러내용 : '
									+ rsp.error_msg;
						}
						alert(msg);
					});
				}
			})
			
			
		$(".subListTab").click(function(){
			var mno = ${loginUser.mno};
			$("#subscribeArea").show();
			$("#detailSubscribeArea").hide();
			$("#sponTableArea").hide();
			
			$("#textLine1").text('');
			$("#textLine2").text('');
			$("#textLine").text('구독 내역');
			
			$.ajax({
				url:"subscribeListView.sm",
				type:"post",
				data :{mno:mno},
				success:function(data){
					console.log(data);
					var mySubscribeList = data.listMap;
					console.log(mySubscribeList);
					subscribeForMe(mySubscribeList);
				}
			});			
		})	
		
		function subscribeForMe(mySubscribeList){
			var mySubscribeList = mySubscribeArea;
			var mno = ${loginUser.mno};
			
			$.ajax({
				url:"subscribeForMe.sm",
				type:"post",
				data : {mno:mno},
				success:function(data){
					var forMeList = data.forMeList;
					var subscribeType='';
					var su_period_date = '';
					
					
					$.each(mySubscribeList,function(index,value){
						if(isEmptyObject(value["SU_PERIOD_DATE"])){
							subscribeType = '장기 구독자';
 						} else{
 							subscribeType ='정기 구독자';
 							su_period_date = value["SU_PERIOD_DATE"];
 						}
				
						 $("#mySubscribeArea > tbody").appned("<tr><td>"
								 						+value["SUNO"] + "</td><td>"
								 						+value["NICK_NAME"] + "</td><td>"
								 						+ subscribeType + "</td><td>" 
								 						+ value["SU_START_DATE"] + "</td><td>"
								 						+ su_period_date  + "</td></tr>"
						);
					});
					
					$.each(forMeList,function(index,value){
						 $("#subscribeForMeArea > tbody").appned("<tr><td>"
														+value["SUNO"] + "</td><td>"
														+value["NICK_NAME"]+"</td><td colspan='3'>"
														+value["MSG"] + "</td></tr>"
						 );
					})
				}
			});
		}
			
		$(".sponListTab").click(function() {
					var mno = ${loginUser.mno};
					$("#subscribeArea").hide();
					$("#detailSubscribeArea").hide();
					$("#textLine1").text('');
					$("#textLine2").text('');
					$("#textLine").text('후원 내역');
					$.ajax({
						url : "selectSponList.sm",
						type : "post",
						data : {
							mno : mno
						},
						success : function(data) {
							console.log(data);
							var sponList = data.sponList;

							console.log(sponList);

							$.each(sponList, function(index, value) {
								$("#sponTable > tbody").append(
										"<tr><td>" + (index + 1)+ "</td><td>"
												+ value["NICK_NAME"]
												+ "</td><td>"
												+ value["SPON_AMOUNT"]
												+ "</td><td>"
												+ value["SPON_DATE"]
												+ "</td></tr>");
							});
							$("#sponTableArea").show();
						}
					});
				})
	</script>
</body>
</html>
