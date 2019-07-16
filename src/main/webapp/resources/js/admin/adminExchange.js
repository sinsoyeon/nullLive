var excno;
function excnoThrow(excnoNum) {
	excno = excnoNum;
};
$("#single #exchangeBtn").click(function(){
	
	$.ajax({
		url:"exchange.ad",
		type:"post",
		data:{excno:excno},
		success:function(data){
			
			if(data == 'success'){
				alert('선택 내역을 환전 처리하였습니다.');
			}
			
			$("#single").modal("hide");
			location.href='exchangeList.ad';
		}
	});
});

$("#multiple #allExchange").click(function(){
	var checkList = [] ;
	
	$("input[name='checkExc']:checked").each(function(i){
		checkList.push($(this).val());
	});
	
	console.log(checkList);
	
	$.ajax({
		url:"allExchange.ad",
		type:"post",
		data:{checkList:checkList},
		success:function(data){			
			if(data == 'success'){
				alert('모든 내역을 환전 처리하였습니다.');
				location.href='exchangeList.ad';
			}else{
				alret('환전 처리에 실패하였습니다.');
				location.href='exchangeList.ad';
			}
		},
		error:function(data){
			console.log(data);
		}
	});
	
});