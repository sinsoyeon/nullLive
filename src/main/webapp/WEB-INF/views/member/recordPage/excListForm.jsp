<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty loginUser}">
		<h1>잘못된 경로로 접근하셨습니다.</h1>
	</c:if>
	<c:if test="${!empty loginUser }">
		<jsp:include page="recordPageNavbar.jsp"/>
		<div class="row">
			<div class="col-md-3"></div>
			
			<div class="col-md-8">
				<input type="hidden" value="${loginUser.mno}" id="mno" />	
				<div id="myExcTableArea">
		
					<h4 style="color: #333333 !important;" id="textLine1">포인트 환전 신청 내역</h4>
					<table class="table" id="myExcTable">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">환전 신청 번호</th>
								<th scope="col">환전 신청 금액</th>
								<th scope="col">환전 신청 날짜</th>
								<th scope="col">발생 수수료</th>
								<th scope="col">처리 상태</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					
					
					<h4 style="color: #333333 !important;" id="textLine1">정산 신청 내역</h4>
					<table class="table" id="">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">정산 헤더 1</th>
								<th scope="col">정산 헤더 2</th>
								<th scope="col">정산 헤더 3</th>
								<th scope="col">정산 헤더 4</th>
								<th scope="col">정산 헤더 5</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>					
				</div>
						
			</div>
			
			
			<div class="col-md-1"></div>
		</div>		
		
		
		<!-- 상세 정보 조회용 모달 -->
		<div id="selectModal" class="modal fade" role="dialog"
			style="z-index: 99999;">
			<div class="modal-dialog" role="document" style="z-index: 99999;">

				<div class="modal-content" style="z-index: 99999;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="text-align: center;"
							id="searchHeader">스트리머 검색</h4>
					</div>
					<div class="modal-body">
						<div id="bodyArea" align="center">
							<h4>스트리머 아이디를 입력하세요!</h4>
							
							<table id="detailTable">
								<tbody></tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	<script>
		$(function(){
			// tableName : myExcTable
			var mno = ${loginUser.mno};

			$("#myExcTable > body").html('');
			
			$.ajax({
				url:"selectExcList.sm",
				type:"post",
				data:{mno:mno},
				success:function(data){
					var excList = data.excList;
					var totalAmount = 0 ;
					$.each(excList,function(index,value){
					console.log(excList);
					
					if(value["EXC_STATUS"]=='N'){
					totalAmount += value["EXC_AMOUNT"];
					}
					
					$("#myExcTable > tbody").append('<tr id="myTr"><td>' + value["EXCNO"] + '</td><td>'
															  + value["EXC_AMOUNT"] + '</td><td>' 
															  + value["APPLICATION_DATE"] + '</td><td>'
															  + value["EXC_FEE"] + '</td><td>'
															  + value["EXC_STATUS"] + '</td></tr>')		
															  
					});
					
					$("#myExcTable > tbody > #myTr").click(function(){
						alert($(this).children("td").eq(0).text());
						
						
						if($(this).children("td").eq(4).text()=='N'){
							selectOneExc(mno,$(this).children("td").eq(0).text());
						}
						
					});
					
					//<div class="alert alert-warning" role="alert">...</div>
					$("#myExcTable > tbody").append('<tr><td colspan="5"><div class="alert alert-warning" role="alert">' 
														+ '${loginUser.nickName} 님의 환전 신청으로 묶인 포인트는 ' + totalAmount 
														+ ' NULL POINT 입니다. 취소는 정보를 클릭해주세요.</div></td></tr>');
				}
			})
		});
		
		function selectOneExc(mno,excno){
			alert('mno :' + mno + ' / excno : ' + excno );
			
			$.ajax({
				url:"selectOneExc.sm",
				type:"post",
				data:{mno:mno,excno:excno},
				success:function(data){
					alert('ajax 접속 성공!');
					//"detailTable"
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
														+ '<label>' + data.excMap.EXC_STATUS + '</label></td></tr>'
														+ '<tr><td> <button id="okBtn"> 확인 </button>'
														+ '<button id="cancleBtn">취소</button></td></tr>'
													)
					
					
													
					
					
					$("#selectModal").modal("show");
					
				}
			})
		}
	</script>
	
	<script type="text/javascript" src="${contextPath}/resources/js/streamer/exchangeJs.js"></script>
</body>
</html>