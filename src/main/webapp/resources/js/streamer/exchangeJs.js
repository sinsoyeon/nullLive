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

function excList(mno){		
	$("#myExcTable > body").html('');
	
	$.ajax({
		url:"selectExcList.sm",
		type:"post",
		data:{mno:mno},
		success:function(data){
			var excList = data.excList;
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
			
			$("#myExcTable > tbody > #myTr").click(function(){						
				
				if($(this).children("td").eq(4).text()=='환전 접수'){
					selectOneExc(mno,$(this).children("td").eq(0).text());
				}
			});
			
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