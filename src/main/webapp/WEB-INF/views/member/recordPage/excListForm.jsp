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
<style>
.pagination>li>a { border-radius: 50% !important;margin: 0 5px;}
</style>	
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
					
					<div id="excPaingArea" align="center">
						<ul class="pagination">
						
						</ul>
					</div>
				</div>
				<div id="chargeArea">
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
					<h4 style="color: #333333 !important;" id="textLine1">정산 신청 내역</h4>
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
							id="searchHeader">환전 상세보기</h4>
					</div>
					<div class="modal-body">
						<div id="bodyArea" align="center">
							<h4>상세보기</h4>
						<input type="hidden" id="excno" />
						<input type="hidden" id="mno" value="${loginUser.mno }" />	
							<table id="detailTable">
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
			excList(mno,1);
			chargeList(mno,1);
			calList(mno,1);
		
		});

	</script>
	
	<script type="text/javascript" src="${contextPath}/resources/js/streamer/exchangeJs.js"></script>
</body>
</html>