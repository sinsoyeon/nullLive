$(function(){
	/*$("#logModal").modal("hide");*/
})

$("input:radio[name=money]").click(function(){			
console.log($(this).val());
$("#inputMoney").val("");
$("#inputMoney").val($(this).val());
	
});
/*
$('#sponBtn').click(function(){
	 $("#logModal").modal("show");
});*/


function payment(){
	var requestMsg = $("#requestMsg").val();
var amount = $("#inputMoney").val();


if($("#point").val()> amount){		
		insertNP(amount,requestMsg);
	}else{
		importService(amount,requestMsg);
	}
 }


///여기서부터 추가
function insertNP(amount,requestMsg){
	var mno =$("#mno").val();
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
		
		var nickName = $('#nickName').val();
			console.log(nickName);
			loadTTS(nickName,requestMsg);
		}
		
	});
};

/*function loadTTS(nickName,requestMsg){
	if(requestMsg!=null){
		connection.onMessageEvent				
	}
	
	
	$.ajax({
		url:"tts.me",
		type:"post",
		data:{nickName:nickName,requestMsg:requestMsg},
		success:function(data){
			console.log('tts 연동중');
		},
		error:function(data){
			console.log(data);
		}	
	})
};*/

///여기까지



function importService(amount){		
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