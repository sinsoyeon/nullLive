    
var sno;

$(function() {
	$("#logModal").modal("show");
	$("#subscribeArea").hide();
	$("#sponTableArea").hide();
	$("#searchArea").hide();
	$("#myExcTableArea").hide();
	$("#checkId").text('');
	$('#checkId').hide();
});

$("#streamerBtn").click(function() {
	streamer = $("#streamerId").val();
	
	if(streamer==$("#mid").val()){
		$("#checkId").text('본인은 구독할 수 없습니다.');
	}else{
		
		$.ajax({
			url : "selectStreamer.sm",
			type : "post",
			data : {streamer : streamer},
			success : function(data) {
				console.log('ajax실행');
				console.log("data : " + data);
				sno = data.streamerInfo.SNO;

				if (sno == null) {
					$("#checkId").text('조회된 정보가 없습니다.');
				} else {
					$('#checkId').show();
					$("#checkId").text(data.streamerInfo.NICK_NAME+'('+ data.streamerInfo.MID +')');
				}
			}
		});
	}
	
	console.log(streamer);
});

$("#checkId").click(function(){
	if(sno!=null)
	$("#logModal").modal("hide");
	console.log("mno :  " + $("#mno").val() + " , sno : " + sno);
});

	$("button[id=btnAmount]").click(function() {
		if(sno==null){
			alert('스트리머를 선택해주세요.');
			$("#logModal").modal("show");
		}else{
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
										if(data=='success'){
											alert('성공적으로 구독하였습니다!');
										}
									}
								});
							} else {
								alert(rsp.error_msg);
							}
						});
						
					} 
					//장기 구독자
					else {
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
										if(data=='success'){
											alert('성공적으로 구독하였습니다.');
										}else{
											alert('구독 실패!');
										}
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
	}
			});


	$(".subListTab").click(function(){
		var mno = $("#mno").val();
		$("#subscribeArea").show();

		$("#detailSubscribeArea").hide();
		$("#sponTableArea").hide();
		$("#myExcTableArea").hide();

		$(".page-head-line").text('구독 내역');
		subList(1);
		subscribeForMe(1);
	});	
	
	function subList(currentPage){
		var mno = $("#mno").val();
		$.ajax({
			url:"subscribeListView.sm",
			type:"post",
			data :{mno:mno,currentPage:currentPage},
			success:function(data){
				$("#mySubscribeArea > tbody").html('');
				$("#subPaging > ul").html('');
				var mySubscribeList = data.infoMap.listMap;
				
				var subscribeType='';
				var su_period_date = '';

				$.each(mySubscribeList,function(index,value){
					if(value["SU_PERIOD_DATE"]=='X'){
						subscribeType = '장기 구독자';
						su_period_date = "영원히 함께해요"
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
				var $firstButton = $('<li class="page-item" onclick="subList(1);"><a class="page-link"> << </a></li>');
				
				
				$("#subPaging > ul").append($firstButton);
				
				console.log(data.infoMap.pi.maxPage);
				for(var i = 0; i <data.infoMap.pi.maxPage;i++){
					$("#subPaging >ul ").append('<li class="page-item" onclick="subList(' + (i+1) +')"><a class="page-link">' + (i+1) + '</a></li>');
					
					
				};
				
				var $endButton = $('<li class="page-item" onclick="subList('+ data.infoMap.pi.maxPage  +');"><a class="page-link"> >> </a></li>');
				$("#subPaging > ul").append($endButton);
				//subPaging
			}
		});			
	}

	function subscribeForMe(currentPage){
		
		var mno = $("#mno").val();
		
		
		$("#subscribeForMeArea > tbody").html('');
		$("#subForMePaging > ul").html('');
		$.ajax({
			url:"subscribeForMe.sm",
			type:"post",
			data : {mno:mno,currentPage:currentPage},
			success:function(data){
				var forMeList = data.infoMap.forMeList;
					
				
				$.each(forMeList,function(index,value){
					var msg = '';
					
					if(value["MSG"] != null){
						msg = value["MSG"];
					}else{
						msg = '힘내세요 ! 응원해요';
					}
					
					$("#subscribeForMeArea > tbody").append("<tr><td>"
							+value["SUNO"] + "</td><td>"
							+value["NICK_NAME"]+"</td><td colspan='3'>"
							+msg + "</td></tr>"
					);
					
				});
				var $firstButton = $('<li class="page-item" onclick="subscribeForMe(1);"><a class="page-link"> << </a></li>');
				
				
				$("#subForMePaging > ul").append($firstButton);
				
				console.log(data.infoMap.pi.maxPage);
				for(var i = 0; i <data.infoMap.pi.maxPage;i++){
					$("#subForMePaging >ul ").append('<li class="page-item" onclick="subscribeForMe(' + (i+1) +')"><a class="page-link">' + (i+1) + '</a></li>');
					
					
				};
				
				var $endButton = $('<li class="page-item" onclick="subscribeForMe(' + data.infoMap.pi.maxPage  +');"><a class="page-link"> >> </a></li>');
				$("#subForMePaging > ul").append($endButton);
				//subPaging
			}
		});
	}

	$(".sponListTab").click(function() {
		
		$("#subscribeArea").hide();
		$("#detailSubscribeArea").hide();
		
		$("#sponTableArea").show();
		$("#searchArea").show();

		$("#sponTable > tbody").html('');
		
		$(".page-head-line").text('후원 내역');
		$("#textLine").text('후원 내역');
		selectSponList(1);
		sponList(1);
	});
	
	
	function selectSponList(currentPage){
		$("#sponForMeTable > tbody").html('');
		console.log(currentPage);
		var mno = $("#mno").val();

		
		var sponForMeList = [];
		
		$.ajax({
			url : "sponForMeList.sm",
			type:"post",
			data:{
				mno:mno,
				currentPage:currentPage
			},
			success : function(data){
				
				$("#sponForMePaging > ul").html('');
				sponForMeList=data.infoMap.sponForMeList;
				
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
				
				//sponPaging//sponForMePaging
				
				
				var $firstButton = $('<li class="page-item" onclick="selectSponList(1);"><a class="page-link"> << </a></li>');
				$("#sponForMePaging > ul").append($firstButton);
				
				console.log(data.infoMap.pi.maxPage);
				for(var i = 0; i < 5;i++){
					$("#sponForMePaging >ul ").append('<li class="page-item" onclick="selectSponList('+ (i+1) +')"><a class="page-link">' + (i+1) + '</a></li>');
					
					
				};
				
				if(data.infoMap.pi.maxPage >= 6){
					var $lastBtn = $('<li class="page-item" onclick="selectSponList('+ 6  +');"><a class="page-link" id="last"> 6 </a></li>');
					$("#sponForMePaging > ul").append($lastBtn);	
					
				}
				
				var $endButton;
				console.log(currentPage);
				if(currentPage > 6 && currentPage<= data.infoMap.pi.maxPage ){	
					
					$endButton = $('<li class="page-item" onclick="selectSponList('+ (parseInt(currentPage) + 1)  +');"><a class="page-link"> >> </a></li>');
			
				/*	$("#last").val(currentPage);*/
				}else{
					$endButton = $('<li class="page-item" onclick="selectSponList(' + data.infoMap.pi.maxPage  +');"><a class="page-link"> >> </a></li>');
				}
				$("#sponForMePaging > ul").append($endButton);				
			}
		})
		
	}
	
	function sponList(currentPage){
		$("#sponTable > tbody").html('');
		var mno = $("#mno").val();
		$.ajax({
			url : "selectSponList.sm",
			type : "post",
			data : {
				mno : mno,currentPage:currentPage
			},
			success : function(data) {
				$("#sponPaging > ul").html('');
				var sponList = data.infoMap.sponList;

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
				var $firstButton = $('<li class="page-item" onclick="sponList(1);"> <a class="page-link"> << </a></li>');
				
				
				$("#sponPaging > ul").append($firstButton);
				
				console.log(data.infoMap.pi.maxPage);
				for(var i = 0; i <data.infoMap.pi.maxPage;i++){
					$("#sponPaging >ul ").append('<li class="page-item" onclick="sponList('+ (i+1) +')"><a class="page-link">' + (i+1) + '</a></li>');
					
					
				};
				
				var $endButton = $('<li class="page-item" onclick="sponList('+ data.infoMap.pi.maxPage  +')"><a class="page-link"> >> </a></li>');
				$("#sponPaging > ul").append($endButton);				
				}
		});
	}
	
	
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
		$("#culModal").modal('show');		
	});
	
	
	$("#requestBtn").click(function(){
		var mno = $("#mno").val();
		var amount = $("#exc_amount").val();
		
		$.ajax({
			url:"requestExc.sm",
			type:"post",
			data:{mno:mno,amount:amount},
			success:function(data){
			
				
				

				if(data == 'success'){
					alert('환전 신청에 성공하였습니다.'+							
							'상세 정보는 환전 신청 내역을 통해 확인할 수 있습니다.');
					
					loadExcList();
				}
				//환전 신청 내역이랑 연결
			}
		})
	});
	
	
	
