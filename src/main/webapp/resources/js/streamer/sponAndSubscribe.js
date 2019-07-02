    
var sno;

$(function() {
	$("#logModal").modal("show");
	$("#subscribeArea").hide();
	$("#sponTableArea").hide();
	$("#searchArea").hide();
	$("#myExcTableArea").hide();
});

$("#streamerBtn").click(function() {
	streamer = $("#streamerId").val();
	$.ajax({
		url : "selectStreamer.sm",
		type : "post",
		data : {streamer : streamer},
		success : function(data) {
			console.log('ajax실행');
			console.log("data : " + data);
			sno = data;

			if (sno == null) {
				alert('검색정보가 없습니다.');
			} else {
				alert(sno);
			}
		}
	});

	$("#logModal").modal("hide");
	console.log(streamer);
});
	
	$("button[id=btnAmount]").click(function() {
				var amount = $(this).val();
				var mno =$("#mno").val();
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
			});


	$(".subListTab").click(function(){
		var mno = $("#mno").val();
		$("#subscribeArea").show();

		$("#detailSubscribeArea").hide();
		$("#sponTableArea").hide();
		$("#myExcTableArea").hide();

		$(".page-head-line").text('구독 내역');

		$.ajax({
			url:"subscribeListView.sm",
			type:"post",
			data :{mno:mno},
			success:function(data){
				var mySubscribeList = data.listMap;
				subscribeForMe(mySubscribeList);
			}
		});			
	});	

	function subscribeForMe(mySubscribeList){
		var mySubscribeList = mySubscribeList;
		var mno = $("#mno").val();
		
		$("#mySubscribeArea > tbody").html('');
		$("#subscribeForMeArea > tbody").html('');
		
		$.ajax({
			url:"subscribeForMe.sm",
			type:"post",
			data : {mno:mno},
			success:function(data){
				var forMeList = data.forMeList;
				var subscribeType='';
				var su_period_date = '';

				$.each(mySubscribeList,function(index,value){
					if(value["SU_PERIOD_DATE"]=='X'){
						subscribeType = '장기 구독자';
						su_period_date = ""
					} else{
						subscribeType ='정기 구독자';
						su_period_date = value["SU_PERIOD_DATE"];
					} 
					
					$("#mySubscribeArea > tbody").append("<tr><td>"
							+value["SUNO"] + "</td><td>"
							+value["NICK_NAME"] + "</td><td>"
							+ subscribeType + "</td><td>" 
							+ value["SU_START_DATE"] + "</td><td>"
							+ su_period_date  + "</td></tr>"
					);
				});

				$.each(forMeList,function(index,value){
					$("#subscribeForMeArea > tbody").append("<tr><td>"
							+value["SUNO"] + "</td><td>"
							+value["NICK_NAME"]+"</td><td colspan='3'>"
							+value["MSG"] + "</td></tr>"
					);
				});
			}
		});
	}

	$(".sponListTab").click(function() {
		var mno = $("#mno").val();
		
		$("#subscribeArea").hide();
		$("#detailSubscribeArea").hide();
		
		$("#sponTableArea").show();
		$("#searchArea").show();

		$("#sponTable > tbody").html('');
		
		$(".page-head-line").text('후원 내역');
		$("#textLine").text('후원 내역');
		
		var sponForMeList = [];
		
		$.ajax({
			url : "sponForMeList.sm",
			type:"post",
			data:{
				mno:mno
			},
			success : function(data){
				$("#sponForMeTable > tbody").html('');
				sponForMeList=data.sponForMeList;
				
				console.log(sponForMeList);
				
				$.each(sponForMeList, function(index, value) {
					console.log('도는중' + value);
					$("#sponForMeTable > tbody").append(
							"<tr><td>" + (index + 1)+ "</td><td>"
							+ value["NICK_NAME"] + "(" + value["MID"] + ")"
							+ "</td><td>"
							+ value["SPON_AMOUNT"]
							+ "</td><td>"
							+ value["SPON_DATE"]
							+ "</td></tr>");
				});
			}
		})
		
		$.ajax({
			url : "selectSponList.sm",
			type : "post",
			data : {
				mno : mno
			},
			success : function(data) {
				var sponList = data.sponList;

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

	
			}
		});
	});
	
	
	function searchSpon(){
		var mno = $("#mno").val();
		var searchValue = $("#searchValue").val();
		var searchCondition = $("#searchCondition").val();
		
		$("#sponForMeTable > tbody").html('');
		
		$.ajax({
			url:"searchSpon.sm",
			type:"post",
			data:{mno:mno,searchValue:searchValue,searchCondition:searchCondition},
			success:function(data){
				alert('ajax 성공!');
				var searchSponList = data.searchSponList;
				
				$.each(searchSponList, function(index, value) {
					console.log('도는중' + value);
					$("#sponForMeTable > tbody").append(
							"<tr><td>" + (index + 1)+ "</td><td>"
							+ value["NICK_NAME"] + "(" + value["MID"] + ")"
							+ "</td><td>"
							+ value["SPON_AMOUNT"]
							+ "</td><td>"
							+ value["SPON_DATE"]
							+ "</td></tr>");
				});				
			}
		});
		
	}
	
	
	$(".menu-top-active").click(function(){
		$(".sponTab").css("background","#3D3D3D");
		$(".subListTab").css("background","#3D3D3D");
		$(".sponListTab").css("background","#3D3D3D");	
		$(".menu-top-active").css("background","#C36464");
		
		
		$("#logModal").modal("show");
		$("#detailSubscribeArea").show();
		$("#subscribeArea").hide();
		$("#sponTableArea").hide();
		$("#searchArea").hide();
		$("#myExcTableArea").hide();
		
		$(".page-head-line").text('구독 하기');
	});
	
	
	$("#culBtn").click(function(){
		$("#culModal").modal("show");		
	});
	
	
	$("#requestBtn").click(function(){
		var mno = $("#mno").val();
		var amount = $("#exc_amount").val();
		
		$.ajax({
			url:"requestExc.sm",
			type:"post",
			data:{mno:mno,amount:amount},
			success:function(data){
				alert('ajax 성공');

				if(data == 'success'){
					alert('환전 신청에 성공하였습니다.'+							
							'상세 정보는 환전 신청 내역을 통해 확인할 수 있습니다.');
					loadExcList();
				}
				
				//환전 신청 내역이랑 연결
			}
		})
	});
	
	
	
