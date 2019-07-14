<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<style>
#contentArea {
	padding-left: 200px;
}
#streamerPartnerArea{
	background: #e9e9e9;
	margin: 2%;
}
#streamerPartnerTable, #streamerPartnerTable tr>th{
text-align: center;
}

#selectClcList tr>th,td{
text-align:center;
}

.blinking{
    animation:blink 0.8s ease-in-out infinite alternate;
    background: red;
    color: white;
    border: 0;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}


#btnArea{
	float:right;
	padding-right:40px;
}

</style>
</head>
<body>
	<c:if test="${empty sessionScope.loginUser}">
		<jsp:forward page="../needLogin.jsp" />
	</c:if>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<jsp:include page="myPageNavbar.jsp" />
	<!-- Main -->
	<div id="contentArea" class="container-fluid" >
		<div id='streamerPartnerArea' align="center">
		<br>
			<h2>나와 함께 일 하는 스트리머</h2>
		<br>
				<table class="table" id="streamerPartnerTable">
					<thead class="thead-light">
						<tr class="table-success"
							style="background: #446600 !important; color: white;">
							<th scope="col">ON AIR</th>
							<th scope="col">스트리머</th>
							<th scope="col">계약 금액</th>
							<th scope="col">계약 시작 날짜</th>
							<th scope="col">계약 종료 날짜</th>
							<th scope="col">나의 직책<th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${partner}" var="p" >
							<tr>
							<c:if test="${p.onair eq 'N'}">
								<td>OFF</td>
							</c:if>
							<c:if test="${p.onair ne 'N'}">
								<td><button class="image blinking" disabled>ON AIR</button></td>
							</c:if>
								<td>${p.SNnick}</td>
								<td>${p.perprice}</td>
								<td>${p.startDate}</td>
								<td>${p.endDate}</td>
								<td>${p.ptype}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${empty partner}">
							현재 파트너가 없습니다.
				</c:if>
				<br>
				
		</div>

				
			<div id="selectClcList" style="width:90%; float:center; background: #e9e9e9;
			margin-left:50px;" align="center">
			
				<h2 style="padding-top:40px;">정산 가능 내역 확인</h2>
				<br /><br /><br />
				<table class="table" id="myClcList">
					<thead class="thead-light"						>
						<tr style="text-align:center; background: #446600 !important; color: white;">
							<th scope="col">스트리머 </th>
							<th scope="col">나의 파트너 타입</th>
							<th scope="col">계약 시작일</th>
							<th scope="col">건당 금액</th>
							<th scope="col">정산 가능 상태</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>	
				
				<div style="padding-top:20px; font-size:12px;" class="alert alert-danger" role="alert">
					유의해주세요 ! <br/>
					정산 요청이 승인 되면 묶인 포인트는 파트너님께로 적립이 됩니다.  <br/>
					스트리머님이 거절하게 되면, 파트너님은 나의 정산 내역을 통해 재신청을 할 수 있습니다.  <br/>
					정산을 진행하실 때 건당 금액을 확인하여 정산 요청 금액을 입력 해주세요. <br/>
					정확하지 않은 정산 요청을 할 시에 불이익이 있을 수 있습니다. <br/>
				</div>
				<div id="myClcListPaging" align="center">
					<ul class="pagination">
					
					
					</ul>
				</div>					
			</div>
			
			<div id="btnArea">
				<button type="button" id="showClcBtn">정산하기</button>		
			</div>	
	</div>
	<script>
		$('#showClcBtn').click(function(){
			$('#streamerPartnerArea').hide();
			var mno = ${loginUser.mno};
			selectClc(mno,1);
			$('#selectClcList').show();
		});
		
		
		$(function(){
			$('#selectClcList').hide();
			$('#streamerPartnerArea').show();
		});
		
		
		function selectClc(mno,currentPage){
			$.ajax({
				url:"selectMyConList.sm",
				type:"post",
				data:{mno:mno,currentPage:currentPage},
				success:function(data){
					console.log(data.infoMap.possibleList);
					
					$('#myClcList > tbody').html('');

					$('#myClcListPaging > ul').html('');
					var possibleList = data.infoMap.possibleList;
					
					$.each(possibleList,function(index,value){
						
						var status = '';
						
						if(value["정산가능여부"] == "정산 가능"){
							status ="<button  type='button' id='insertClc' class='btn btn-primary'> 정산 신청 </button>"
						}else{
							status = value["정산가능여부"];
						}
						
						
						
						$('#myClcList > tbody').append(
												'<tr><td><input type="hidden" id="pno" value="' +  value["PNO"] +'"/>' 
											  + '<input type="hidden" id="sno" value="' +  value["SNO"] +'"/>' 
										      + value["NICK_NAME"] + '('  +  value["MID"]  +')</td><td>'
											  + value["PTYPE"] + '</td><td>'
											  + value["SDATE"] + '</td><td>' 
											  + value["PERPRICE"] + '</td><td>'											
											  + status + '</td></tr>'
						)
						console.log('pno  확인 : ' + $('#pno').val());
					});
					
					//paging					
					var $firstButton = $('<li class="page-item" onclick="selectClc('+ mno + ',' + '1);"><a class="page-link"> << </a></li>');
					
					
					$("#myClcListPaging > ul").append($firstButton);
					
					console.log(data.infoMap.pi.maxPage);
					for(var i = 0; i <data.infoMap.pi.maxPage;i++){
						$("#myClcListPaging >ul ").append('<li class="page-item" onclick="selectClc('+ mno + ',' + (i+1) +')"><a class="page-link">' + (i+1) + '</a></li>');
						
						
					};
					
					var $endButton = $('<li class="page-item" onclick="selectClc('+ mno + ',' + data.infoMap.pi.maxPage  +');"> <a class="page-link"> >></a> </li>');
					$("#myClcListPaging > ul").append($endButton);	
					
					$('#showClcBtn').hide();
				}
				
			});
		}
		
		$(document).on('click','#insertClc',function(){
			var mno = ${loginUser.mno};
			
			var pno= $(this).parent('td').parent('tr').parent('#myClcList > tbody').find('#pno').val();
			var sno= $(this).parent('td').parent('tr').parent('#myClcList > tbody').find('#sno').val();
			
			var amount = window.prompt('신청하실 정산 금액을 입력하세요 !');
			
			location.href='insertClc.sm?mno='+ mno + '&pno='+ pno + '&sno=' + sno  + '&amount=' + amount;			
		});
	</script>
</body>
</html>