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
		

function chargeList(mno){
	$("#chargeTable > body").html('');
	
	$.ajax({
		url:"selectChargeList.sm",
		type:"post",
		data:{mno:mno},
		success:function(data){
			var chargeList = data.chargeList;
			
			$.each(chargeList,function(index,value){						
				$("#chargeTable > tbody").append('<tr><td>' + value["CHNO"] + '</td><td>'
														  + value["CHAMOUNT"] + '</td><td>' 
														  + (value["CHAMOUNT"] + value["CHAMOUNT"]*0.1) + '</td><td>'
														  + value["CHDATE"] + '</td><td>'
														  + value["POINT"] + '</td></tr>')		
														  
			});
			if(chargeList.length==0){
				$("#chargeTable > tbody").append('<tr><td colspan="5"><div class="alert alert-danger" role="alert">충전하신 내역이 없습니다. 충전 후 후원을 통해 스트리머님과 기쁨을 나눠보세요 !</div></td></tr>');
			}else{
			$("#chargeTable > tbody").append('<tr><td colspan="5"><div class="alert alert-warning" role="alert">회원님의 충전 내역입니다.</div></td></tr>');						
			}
		}
		
	});
}

function calList(mno,currentPage){
	$("#calTable > body").html('');
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
			}else if(value["CLC_STATUS"]=='N' && value["DEC_STATUS"]==null){
				status = '정산 접수 완료';
			}else{
				status = '<button id="decBtn" class="btn btn-primary">거절 이력 보기</button>'
			}
			console.log(value["CLCNO"]);
			$("#calTable > tbody").append('<tr id="myTr"><td><input type="text" id="clcno" name="clcno" value="'
					+value["CLCNO"] + 
					'"' + '/></td><td>' +value["NICK_NAME"] + '</td><td>'
					+ value["SDATE"] + '</td><td>' 
					+ value["EDATE"] + '</td><td>'
					+ value["CLC_DATE"] + '</td><td>'
					+ value["CLC_AMOUNT"] + '</td><td>'
					+ status +'</td></tr>')
					
			/*	$("#clcno").attr('value',value["CLCNO"]);*/
				console.log($('#clcno').val());
			});
			
			
			//excPaingArea			
			
			var $firstButton = $('<li class="pagination" onclick="calList(0,1);"> << </li>');
			
			
			$("#clcPaging > ul").append($firstButton);
			
			console.log(data.infoMap.pi.maxPage);
			for(var i = 0; i <data.infoMap.pi.maxPage;i++){
				$("#clcPaging >ul ").append('<li class="pagination" onclick="calList('+ mno + ',' + (i+1) +')">' + (i+1) + '</li>');
				
				
			};
			
			var $endButton = $('<li class="pagination" onclick="calList('+ mno + ',' + data.infoMap.pi.maxPage  +');"> >> </li>');
			$("#clcPaging > ul").append($endButton);
		}
	})
}


$(document).on('click', '#decBtn', function(){
	console.log('호출됨');
	//decTable
	
	/*var clcno = $(this).parent('td').find('#clcno').val();*/
	var mno = $('#mno').val();
	
	console.log($(this).parent('#myTr').find('#clcno').val());
	
	$('#decModal').html('');
	
	$.ajax({
		url:"selecOneClc.sm",
		type:"post",
		data:{mno:mno,clcno:clcno},
		success:function(data){
			console.log(data.clcMap);
		}
	});
	
});

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
			
			var $firstButton = $('<li class="pagination" onclick="excList(0,1);"> << </li>');
			
			
			$("#excPaingArea > ul").append($firstButton);
			
			console.log(data.infoMap.pi.maxPage);
			for(var i = 0; i <data.infoMap.pi.maxPage;i++){
				$("#excPaingArea >ul ").append('<li class="pagination" onclick="excList('+ mno + ',' + (i+1) +')">' + (i+1) + '</li>');
				
				
			};
			
			var $endButton = $('<li class="pagination" onclick="excList('+ mno + ',' + data.infoMap.pi.maxPage  +');"> >> </li>');
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