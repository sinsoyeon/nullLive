
function selectOneExc(mno,excno){
			$("#detailTable > tbody").html('');
			$("#excno").val('');
			$.ajax({
				url:"selectOneExc.sm",
				type:"post",
				data:{mno:mno,excno:excno},
				success:function(data){
					var status = '';
					
					if(data.excMap.EXC_STATUS=='N'){
						status ='환전 접수';
					}else{
						status = '환전 완료';
					}
					
					$("#detailTable > tbody").append(
														'<tr><td><label>환전 신청 번호 : </label>'
														+'<label>'+ data.excMap.EXCNO +'</label></td></tr>'
														+ '<tr><td><label>닉네임 :' + '</label>'
														+ '<label>' + data.excMap.NICK_NAME + '</label></td></tr>'
														+ '<tr><td><label>신청일 : </label>' 
														+ '<label>' + data.excMap.APPLICATION_DATE + '</label></td></tr>'
														+ '<tr><td><label>신청금액 :' + '</label>'
														+ '<label>' + data.excMap.EXC_AMOUNT + '</label></td></tr>'
														+ '<tr><td><label>처리 상태 :' + '</label>'
														+ '<label>' + status + '</label></td></tr>'
														+ '<tr><td> <button id="okBtn"> 확인 </button>'
														+ '<button id="cancelBtn" onclick="cancelExc();">환전 취소</button></td></tr>'
													)
													$("#excno").val(data.excMap.EXCNO);			
				}
			})
			$("#selectModal").modal("show");
		};
		

function chargeList(mno,currentPage){
	$("#chargeTable > tbody").html('');
	
	$.ajax({
		url:"selectChargeList.sm",
		type:"post",
		data:{mno:mno,currentPage:currentPage},
		success:function(data){
			$("#chrgPaging > ul").html('');
			var chargeList = data.infoMap.chargeList;
			
			$.each(chargeList,function(index,value){						
				$("#chargeTable > tbody").append('<tr><td>' + value["CHNO"] + '</td><td>'
														  + value["CHAMOUNT"] + '</td><td>' 
														  + (value["CHAMOUNT"] + value["CHAMOUNT"]*0.1) + '</td><td>'
														  + value["CHDATE"] + '</td><td>'
														  + value["POINT"] + '</td></tr>')		
														  
			});
			
			//paging
			
			var $firstButton = $('<li class="page-item" onclick="chargeList('+ mno + ',' + '1);"><a class="page-link"> << </a></li>');
			
			
			$("#chrgPaging > ul").append($firstButton);
			
			console.log(data.infoMap.pi.maxPage);
			for(var i = 0; i <data.infoMap.pi.maxPage;i++){
				$("#chrgPaging >ul ").append('<li class="page-item" onclick="chargeList('+ mno + ',' + (i+1) +')"><a class="page-link">' + (i+1) + '</a></li>');
				
				
			};
			
			var $endButton = $('<li class="page-item" onclick="chargeList('+ mno + ',' + data.infoMap.pi.maxPage  +');"> <a class="page-link"> >></a> </li>');
			$("#chrgPaging > ul").append($endButton);
			
			
			
			if(chargeList.length==0){
				$("#chargeTable > tbody").append('<tr><td colspan="5"><div class="alert alert-danger" role="alert">충전하신 내역이 없습니다. 충전 후 후원을 통해 스트리머님과 기쁨을 나눠보세요 !</div></td></tr>');
			}else{
			$("#chargeTable > tbody").append('<tr><td colspan="5"><div class="alert alert-warning" role="alert">회원님의 충전 내역입니다.</div></td></tr>');						
			}
		}
		
	});
}

function calList(mno,currentPage){
	$("#calTable > tbody").html('');
	console.log('mno : ' + mno)
	$.ajax({
		url:"selectCulList.sm",
		type:"post",
		data:{mno:mno,currentPage:currentPage},
		success:function(data){
			console.log(data.infoMap);
			$("#clcPaging > ul").html('');
			
			var clcList = data.infoMap.clcList;
			var pi = data.pi;
			console.log(clcList);
			$.each(clcList,function(index,value){
	
			var status ='';
			
			if(value["CLC_STATUS"] == 'Y'){
				status = '정산 완료';
			}else if(value["CLC_STATUS"]=='N' && value["DEC_STATUS"]==null ){
				status = '정산 처리중';
			}else if(value["CLC_STATUS"]=='N' && value["DEC_STATUS"]=='Y' && value["REAPPLY"]=='재신청 완료'){
				status ='재신청 완료';
			}
			else if(value["CLC_STATUS"]=='N' && value["DEC_STATUS"]=='Y' && value["REAPPLY"]==null){
				status = '<button id="decBtn" class="btn btn-primary">거절 이력 보기</button>'
			}
			console.log(value["CLCNO"]);
			$("#calTable > tbody").append('<tr id="myTr"><td><input type="hidden" id="clcno" name="clcno" value="'
					+value["CLCNO"] + 
					'"' + '/>' +value["NICK_NAME"] + '</td><td>'
					+ value["SDATE"] + '</td><td>' 
					+ value["EDATE"] + '</td><td>'
					+ value["CLC_DATE"] + '</td><td>'
					+ value["CLC_AMOUNT"] + '</td><td>'
					+ status +'</td></tr>')
					
			/*	$("#clcno").attr('value',value["CLCNO"]);*/
				console.log($('#clcno').val());
			});
			
			
			//excPaingArea			
			
			var $firstButton = $('<li class="page-item" onclick="calList(0,1);"><a class="page-link"> << </a></li>');
			
			
			$("#clcPaging > ul").append($firstButton);
			
			console.log(data.infoMap.pi.maxPage);
			for(var i = 0; i <data.infoMap.pi.maxPage;i++){
				$("#clcPaging >ul ").append('<li class="page-item" onclick="calList('+ mno + ',' + (i+1) +')"><a class="page-link">' + (i+1) + '</a></li>');
				
				
			};
			
			var $endButton = $('<li class="page-item" onclick="calList('+ mno + ',' + data.infoMap.pi.maxPage  +');"><a class="page-link"> >> </a></li>');
			$("#clcPaging > ul").append($endButton);
		}
	})
}


$(document).on('click','#reqClcBtn',function(){
	console.log('호출됨');
})

$(document).on('click', '#decBtn', function(){
	console.log('호출됨');
	//decTable
	
	/*var clcno = $(this).parent('td').find('#clcno').val();*/
	var mno = $('#mno').val();
	
	var clcno = $(this).parent('td').parent('tr').find('#clcno').val();
	
	
	$.ajax({
		url:"selecOneClc.sm",
		type:"post",
		data:{mno:mno,clcno:clcno},
		success:function(data){
			$('#decTable > tbody').html('');
			var status = '';
			
			$("#decTable > tbody").append(
											'<tr><td><label>신청자 : </label>'
											+'<label>'+ data.clcMap.NICK_NAME +'</label></td></tr>'
											+ '<tr><td><label>스트리머 :' + '</label>'
											+ '<label>' + data.clcMap.NICK_NAME + '('+  data.clcMap.ST_NICK_NAME  +')</label></td></tr>'
											+ '<tr><td><label>신청일 : </label>' 
											+ '<label>' + data.clcMap.CLC_REQ_DATE + '</label></td></tr>'
											+ '<tr><td><label>계약 시작일 : ' + '</label>'
											+ '<label>' + data.clcMap.SDATE + '</label></td></tr>'
											+ '<tr><td><label>계약 종료일 :' + '</label>'
											+ '<label>' + data.clcMap.EDATE + '</label></td></tr>'
											+ '<tr><td><label>정산 요청 금액 :' + '</label>'
											+ '<label>' + data.clcMap.CLC_AMOUNT + '</label></td></tr>'
											+ '<tr><td><label>정산 거부 일자 :' + '</label>'
											+ '<label>' + data.clcMap.DEC_DATE + '</label></td></tr>'
											+ '<tr><td><label>정산 거부 사유 :' + '</label>'
											+ '<label>' + data.clcMap.DEC_REASON + '</label></td></tr>'		
											+ '<tr><td> <button id="reqClcBtn" onclick="reqClc('+mno+','+data.clcMap.DECNO+')"> 정산 요청 </button>'
											+ '<button id="cancelBtn">확인</button></td></tr>'
										)
										$("#decno").val(data.clcMap.DECNO);			
										$("#decModal").modal('show');
										
										
				
			}
		})
});

function reqClc(mno,decno){
	console.log('reqClc 호출됨');
	
	$.ajax({
		url:"reClc.sm",
		type:"post",
		data:{mno:mno,decno:decno},
		success:function(data){
			console.log('ajax 수행 중');
			alert('정산 신청이 완료 되었습니다.');
			$("#decModal").modal('hide');
		}
	});
	
	
}

function excList(mno,currentPage){		
	$("#myExcTable > tbody").html('');
	
	
	var currentPage = currentPage;
	
	console.log(currentPage);
	
	$.ajax({
		url:"selectExcList.sm",
		type:"post",
		data:{mno:mno,currentPage:currentPage},
		success:function(data){
			$("#excPaingArea > ul").html('');
			
			var excList = data.infoMap.excList;
			var pi = data.pi;
			
			var totalAmount = 0 ;
			var status = '';
			var nickName = '';
			
			$.each(excList,function(index,value){
			console.log(excList);
										
			if(value["EXC_STATUS"]=='N'){
			totalAmount += value["EXC_AMOUNT"];
			status='환전 접수';
			
			}else{
				status='환전 완료';
			}

			nickName = value["NICK_NAME"];
			
			$("#myExcTable > tbody").append('<tr id="myTr"><td>' + value["EXCNO"] + '</td><td>'
													  + value["EXC_AMOUNT"] + '</td><td>' 
													  + value["APPLICATION_DATE"] + '</td><td>'
													  + value["EXC_FEE"] + '</td><td>'
													  + status + '</td></tr>')		
													  
			});
			
			
			//excPaingArea			
			$("#myExcTable > tbody > #myTr").click(function(){									
				if($(this).children("td").eq(4).text()=='환전 접수'){
					selectOneExc(mno,$(this).children("td").eq(0).text());
				}
			});
			
			var $firstButton = $('<li class="page-item" onclick="excList(0,1);"><a class="page-link"> << </a></li>');
			
			
			$("#excPaingArea > ul").append($firstButton);
			
			console.log(data.infoMap.pi.maxPage);
			for(var i = 0; i <data.infoMap.pi.maxPage;i++){
				$("#excPaingArea >ul ").append('<li class="page-item" onclick="excList('+ mno + ',' + (i+1) +')"><a class="page-link">' + (i+1) + '</a></li>');
				
				
			};
			
			var $endButton = $('<li class="page-item" onclick="excList('+ mno + ',' + data.infoMap.pi.maxPage  +');"> <a class="page-link"> >></a> </li>');
			$("#excPaingArea > ul").append($endButton);
			
			
			if(totalAmount==0){
				$("#myExcTable > tbody").append('<tr><td colspan="5"><div class="alert alert-danger" role="alert">진행중인 환전 내역이 없습니다.</div></td></tr>');
			}else{
			$("#myExcTable > tbody").append('<tr><td colspan="5"><div class="alert alert-warning" role="alert">' 
												+ nickName +' 님의 환전 신청으로 묶인 포인트는 ' + totalAmount 
												+ ' NULL POINT 입니다. 취소는 정보를 클릭해주세요.</div></td></tr>');						
			}
		}
	});
}

function cancelExc(){
	var mno = $("#mno").val();
	var excno = $("#excno").val();
	
	
	$.ajax({
		url:"cancelExc.sm",
		type:"post",
		data:{mno:mno,excno:excno},
		success:function(data){
			location.href='excView.sm';
			$("#selectModal").modal("hide");				
		}
	})

}