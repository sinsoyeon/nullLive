<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">	
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>	
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Gothic+A1|Jua&display=swap" rel="stylesheet">
<style>
.pagination>li>a { border-radius: 50% !important;margin: 0 5px;}
#clcListBtn{cursor:pointer;}


.w3-bar w3-black{
padding-left:460px !important;
margin-top:140px !important;
}
.w3-bar{
	overflow: hidden;
    margin-left: 210px;
}
#pointBtn{
margin-left:276px !important;
border-radius:10px;
}

#clcListBtn{
border-radius:10px;
}

h4{
 font-family: 'Jua', sans-serif !important;
  font-size:30px !important;
}

.row{
margin-top:20px;
}
</style>	
</head>
<body>
	<c:if test="${empty loginUser}">
		<h1>잘못된 경로로 접근하셨습니다.</h1>
	</c:if>
	<c:if test="${!empty loginUser }">
	<header style="height: 50px;">
		<jsp:include page="../../common/menubar.jsp" />
	</header>
		<jsp:include page="../myPage/myPageNavbar.jsp"/>
				  <div class="w3-bar w3-black">
					  <a href="#" class="w3-bar-item w3-button" id="pointBtn">포인트(환전/충전) 기록</a>
					  <a href="#" class="w3-bar-item w3-button" id="clcListBtn">정산 기록</a>
				</div>
		<div class="row">
			<div class="col-md-3"></div>
			
			<div class="col-md-9" style=" padding-right: 6%; ">
				<input type="hidden" value="${loginUser.mno}" id="mno" />	
				<div id="myExcTableArea" align="center">
					
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
					
					<div id="excPaingArea" align="center">
						<ul class="pagination">
						
						</ul>
					</div>
				</div>
				<div id="chargeArea" align="center">
					<h4 style="color: #333333 !important;" id="textLine1">NULL 충전 내역</h4>
					<table class="table" id="chargeTable">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">충전 번호</th>
								<th scope="col">충전 금액</th>
								<th scope="col">결제 금액</th>
								<th scope="col">충전 날짜</th>
								<th scope="col">전체 포인트</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>	
					<div id="chrgPaging" align="center">
						<ul class="pagination">
						
						
						</ul>
					</div>					
				</div>
				<div id="calArea" align="center">
					<h4 style="color: #333333 !important;" id="textLine1">정산 처리 내역</h4>
					<table class="table" id="calTable">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">요청 파트너</th>
								<th scope="col">계약 시작일</th>
								<th scope="col">계약 종료일</th>
								<th scope="col">정산 날짜</th>
								<th scope="col">정산 금액</th>
								<th scope="col">정산 상태</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div id="clcPaging" align="center">
						<ul class="pagination">
						
						
						</ul>
					</div>	
				</div>		
				
				<div id="reqCalArea" align="center">
					<h4 style="color: #333333 !important;" id="textLine1">정산 요청 내역</h4>
					<table class="table" id="reqCalTable">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">나의 스트리머</th>
								<th scope="col">계약 시작일</th>
								<th scope="col">계약 종료일</th>
								<th scope="col">요청 날짜</th>
								<th scope="col">요청 금액</th>
								<th scope="col">처리 상태</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div id="reqClcPaging" align="center">
						<ul class="pagination">
						
						
						</ul>
					</div>	
				</div>														
				
				
				
				<div id="reqCalListArea" align="center">
				<div class="jumbotron">
				  <h1>Hello, ${loginUser.nickName}</h1>
				  <p>스트리머님과의 추억을 시작해보세요.</p>
				  <p><a class="btn btn-primary btn-lg" href="#" id="myStreamer" role="button">나의 스트리머</a></p>
				</div>
					
					<table class="table" id="reqCalListTable">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">나의 스트리머</th>
								<th scope="col">계약 시작일</th>
								<th scope="col">계약 종료일</th>
								<th scope="col">정산 하기</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<div id="reqClcListPaging" align="center">
						<ul class="pagination">
						
						
						</ul>
					</div>	
				</div>														
										
			</div>
			
		</div>		
		
		
		<!-- 상세 정보 조회용 모달 -->
		<div id="selectModal" class="modal fade" role="dialog"
			style="z-index: 99999;">
			<div class="modal-dialog" role="document" style="z-index: 99999;">

				<div class="modal-content" style="z-index: 99999;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="text-align: center;"
							id="searchHeader">상세보기</h4>
					</div>
					<div class="modal-body">
						<div id="bodyArea" align="center">
							<form id="detailForm" action="" method="post">		
							<input type="hidden" id="excno" name="excno"/>
							<input type="hidden" id="mno" value="${loginUser.mno }" name="mno" />	
						
								<table id="detailTable">
									<tbody>
									
									</tbody>
								</table>		
							</form>					
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 정산 거절 이력 상세 정보 조회용 모달 -->
		<div id="decModal" class="modal fade" role="dialog"
			style="z-index: 99999;">
			<div class="modal-dialog" role="document" style="z-index: 99999;">
				<div class="modal-content" style="z-index: 99999;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="text-align: center;"
							id="searchHeader">정산 거절이력</h4>
					</div>
					<div class="modal-body">
						<div id="bodyArea" align="center">
						<input type="hidden" id="decno" />
						<input type="hidden" id="mno" value="${loginUser.mno }" />	
							<table id="decTable">
								<tbody>
								
								</tbody>
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
			
			var params = getUrlParams();
			console.log(params);
			console.log(params.status);
			if(params.status==1){
				console.log('st');
				clcBtnClick();
			}else{
			excList(mno,1);
			chargeList(mno,1);
			$('#calArea').hide();
			$('#reqCalArea').hide();
			$('.jumbotron').hide();
			$('#reqCalListTable').hide();
			$('#reqCalListArea').hide();
			}
			
		
			
			/* calList(mno,1); */
			
			
		
		});
		
		function getUrlParams() {
		    var params = {};
		    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
		    return params;
		} 
		
		
		$('#clcListBtn').click(function(){
			clcBtnClick();
			$(this).css("background","#D5D5D5");
			$('#pointBtn').css("background","#000");
		});
		
		function clcBtnClick(){
				var mno = ${loginUser.mno};
				calList(mno,1);
				reqClcList(mno,1);
				$('#calArea').show();
				$('#reqCalArea').show();
				$('#myExcTableArea').hide();
				$('#chargeArea').hide();	
				$('#reqCalListTable').hide();
				$('#reqCalListArea').hide();
				history.replaceState({}, null, location.pathname);
		}
		
		$('#pointBtn').click(function(){
			var mno = ${loginUser.mno};
			excList(mno,1);
			chargeList(mno,1);
			$('#myExcTableArea').show();
			$('#chargeArea').show();
			$('#calArea').hide();
			$('#reqCalArea').hide();
			$('#reqCalListTable').hide();
			$('.jumbotron').hide();
			$('#reqCalListArea').hide();
			$(this).css("background","#D5D5D5");
			$('#clcListBtn').css("background","#000");
		});
		
		$('#reqClcBtn').click(function(){
			var mno = ${loginUser.mno};
			$('#myExcTableArea').hide();
			$('#chargeArea').hide();
			$('#calArea').hide();
			$('#reqCalListTable').hide();
			$('#reqCalArea').hide();
			$('.jumbotron').show();
			$('#reqCalListArea').show();

		});
		
		$('#myStreamer').click(function(){
			$('#reqCalListTable').show();
			$('.jumbotron').show();
			$('#reqCalListArea').show();
			
			selectMyStreamer(mno,1);
		});

	</script>
	
	<script type="text/javascript" src="${contextPath}/resources/js/streamer/exchangeJs.js"></script>
</body>
</html>