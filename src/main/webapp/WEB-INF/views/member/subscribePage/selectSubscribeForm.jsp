<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/bootstrap/main.css">
<link rel="stylesheet"
	href="https://unpkg.com/tachyons@4.8.0/css/tachyons.min.css">
<style>
div {
	display: block;
}
</style>
</head>
<body>
	<jsp:include page="sponAndSubscribeNav.jsp" />
	<div class="container">
		<div class="row">
			<h4 class="page-head-line">구독하기</h4>

			<div class="col-md-1"></div>
			<div class="col-md-10">
				<input type="hidden" value="${loginUser.mno}" id="mno" />
				<div id="detailSubscribeArea">
					<ul>
						<li>
							<div id="subscribeArea2">
								<div id="subscribeArea1">
									<span id="sub1">자동 구독권</span> <span id="sub2">30일권</span>
								</div>
								<div id="sub3">
									<span id="desc">좋아하는 스트리머를 매달 구독합니다.</span>
								</div>
								<div class="btn_buy">
									<button onclick="" id="btnAmount" value="3300">3,300원</button>
								</div>
							</div>
						</li>
						<li>
							<div id="subscribeArea2">
								<div id="subscribeArea1">
									<span id="sub1">정기 구독권</span> <span id="sub2">3개월권</span>
								</div>
								<div id="sub3">
									<span id="desc">좋아하는 스트리머를 3달간 구독합니다.</span>
								</div>
								<div class="btn_buy">
									<button onclick="" id="btnAmount" value="19">9,900원</button>
								</div>
							</div>

						</li>
						<li>
							<div id="subscribeArea2">
								<div id="subscribeArea1">
									<span id="sub1">정기 구독권</span> <span id="sub2">6개월권</span>
								</div>
								<div id="sub3">
									<span id="desc">좋아하는 스트리머를 6달간 구독합니다.</span>
								</div>
								<div class="btn_buy">
									<button onclick="" id="btnAmount" value="25">19,800원</button>
								</div>
							</div>
						</li>
						<li>
							<div id="subscribeArea2">
								<div id="subscribeArea1">
									<span id="sub1">정기 구독권</span> <span id="sub2">12개월권</span>
								</div>
								<div id="sub3">
									<span id="desc">좋아하는 스트리머를 12달간 구독합니다.</span>
								</div>
								<div class="btn_buy">
									<button onclick="" id="btnAmount" value="30">39,600원</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<br />

				<!-- 구독 내역 조회용 Div -->
				<div id="subscribeArea">

					<h4 style="color: #333333 !important;" id="textLine1">내가 구독한
						스트리머</h4>
					<table class="table" id="mySubscribeArea">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">구독 번호</th>
								<th scope="col">스트리머 이름</th>
								<th scope="col">이용중인 구독권</th>
								<th scope="col">구독 시작일</th>
								<th scope="col">구독 종료일</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>

					<h4 style="color: #333333 !important;" id="textLine2">나를 구독한
						사용자</h4>
					<table class="table" id="subscribeForMeArea"
						style="text-align: center" align="center;">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">구독 번호</th>
								<th scope="col">구독자 이름</th>
								<th scope="col">나에게 보낸 메세지</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>


				<!-- 스폰 조회용 Div -->
				<div id="sponTableArea">
					<h4 style="color: #333333 !important;" id="textLine2">내가 후원한
						사용자</h4>
					<table class="table" id="sponTable" style="text-align: center">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">후원 번호</th>
								<th scope="col">후원한 스트리머 이름</th>
								<th scope="col">후원한 금액</th>
								<th scope="col">후원한 날짜</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					<div id="sponPaging"  align="center">
					<ul class="pagination">
					
					
					</ul>
				</div>	

					<button id="culBtn">환전 신청</button>
					<br />
					<h4 style="color: #333333 !important;" id="textLine2">나를 후원
						사용자</h4>
					<table class="table" id="sponForMeTable" style="text-align: center">
						<thead class="thead-dark"
							style="color: #fff; ! important; background: #333 !important;">
							<tr>
								<th scope="col">후원 번호</th>
								<th scope="col">닉네임(아이디)</th>
								<th scope="col">후원받은 금액</th>
								<th scope="col">후원받은 날짜</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					<div id="sponForMePaging" align="center">
					<ul class="pagination">
					
					
					</ul>
				</div>	
					<div id="searchArea" align="center" style="height: 50px;">
						<table style="padding: 100px !important;" id="searchTable">
							<tr>
								<td><label for="">검색 유형 : </label> <select
								name="searchCondition" id="searchCondition">
									<option value="" selected>전체</option>
									<option value="1">닉네임</option>
									<option value="2">아이디</option>
							</select> <input type="text" id="searchValue" placeholder="검색어를 입력해주세요."
								width="400" />
								<button onclick="searchSpon();" id="searchBtn"
									style="width: 100; height: 50; ! important; border: 1px solid black;">검색</button>
							</td>
						</tr>

					</table>
					<br />
			<br />			<br />
			<br />
		
			</div>
		</div>
	</div>
		
			<div class="col-md-1"></div>
		</div>
	</div>
	
	<!-- 스트리머 검색용 모달 -->
	<div id="logModal" class="modal fade" role="dialog"
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
						<br /> <input type="hidden" id="sno" /> 
						<input type="hidden" id="mid" value="${loginUser.mid }" />
						<label for="">아이디</label>
						&nbsp;&nbsp;&nbsp; <input type="text" id="streamerId" />&nbsp;&nbsp;&nbsp;
						<button id="streamerBtn">선택</button>
						
						<div>
							<p id="checkId"></p>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!--  환전에 사용할 모달 -->
	<div id="culModal" class="modal fade" role="dialog"
		style="z-index: 99999;">
		<div class="modal-dialog" role="document" style="z-index: 99999;">

			<div class="modal-content" style="z-index: 99999;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="text-align: center;"
						id="searchHeader">환전 신청</h4>
				</div>
				<div class="modal-body">
					<div id="bodyArea" align="center"
						style="text-align: center !important; align: center;">
						<h4>환전할 포인트를 입력하세요.</h4>
						<br /> <label for="">보유 포인트 : </label> &nbsp;&nbsp;&nbsp; <input
							type="text" placeholder='${loginUser.point }' id="exc_amount" />
						&nbsp;&nbsp;&nbsp;
						<button id="requestBtn">환전 신청</button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${contextPath}/resources/js/streamer/sponAndSubscribe.js"></script>

</body>
</html>
