<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/partnerManagement.css">
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">

			<!-- sidebar -->
			<div class="col-sm-3">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>

			<!-- main content -->
			<div class="col-sm-9" style="padding-top: 80px;">
				<h3 style="font-weight:bold; font-size:30px;">매니저 설정</h3>
				<hr>
				<div class="partnerArea">
					<label>현재 매니저 목록</label><br>
					<div class="partnerBox" style="overflow:scroll; width:230px; height:130px;" >
					<table>
						<c:forEach var="manager" items="${partnerList}">
							<tr>
								<td><c:if test="${manager.PTYPE eq '매니저' }">
										<c:out value="${manager.NICK_NAME}" />
									</c:if></td>
							</tr>
						</c:forEach>
					</table>
					</div>
					<br> 
					 <label>현재 편집자 목록</label>
					 <div class="partnerBox" style="overflow:scroll; width:230px; height:130px;">
						<table>
							<c:forEach var="editor" items="${partnerList}">
								<tr>
									<td><c:if test="${editor.PTYPE eq '편집자' }">
											<c:out value="${editor.NICK_NAME}" />
										</c:if></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<br> <br>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios"
						id="exampleRadios1" value="option1" checked> <label
						class="form-check-label" for="exampleRadios1">매니저 </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios"
						id="exampleRadios2" value="option2"> <label
						class="form-check-label" for="exampleRadios2">편집자</label>
				</div>
				
				<div class="ui category search">
					<div class="ui icon input">
						<input class="prompt" type="text" style="width: 600px;"> <i
							class="search icon"></i>
					</div>
				</div>
				<br>
				<br> <label>매니저 상세 조회</label>
				<div class="partnerTable">
				<table class="table">
					<thead class="thead-light">
						<tr class="table-success"
							style="background: #446600 !important; color: white;">
							<th scope="col"></th>
							<th scope="col">아이디</th>
							<th scope="col">닉네임</th>
							<th scope="col">시작 날짜</th>
							<th style="visibility: hidden;"></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="manager" items="${partnerList}">
						<c:if test="${manager.PTYPE eq '매니저' }">
						<tr>
							<td><input type="checkbox" /></td>
							<td><c:out value="${manager.MID}" /></td>
							<td><c:out value="${manager.NICK_NAME}" /></td>
							<td><c:out value="${manager.C_SDATE}" /></td>
							<td style="visibility: hidden;" class="tableMno">${manager.MNO}</td>
						</tr>
						</c:if>
					</c:forEach>	
					</tbody>
				</table>
				</div>

				<br>
				<button class="ui green button">삭제</button>
				<br>
				<br> <label>편집자 상세 조회</label>
				<div class="partnerTable">
				<table class="table">
					<thead class="thead-light">
						<tr class="table-success"
							style="background: #446600 !important; color: white;">
							<th scope="col"></th>
							<th scope="col">아이디</th>
							<th scope="col">닉네임</th>
							<th scope="col">시작 날짜</th>
							<th style="visibility: hidden;"></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="editor" items="${partnerList}">
						<c:if test="${editor.PTYPE eq '편집자' }">
						<tr>
							<td><input type="checkbox" /></td>
							<td><c:out value="${editor.MID}" /></td>
							<td><c:out value="${editor.NICK_NAME}" /></td>
							<td><c:out value="${editor.C_SDATE}" /></td>
							<td style="visibility: hidden;" class="tableMno">${editor.MNO}</td>
						</tr>
						</c:if>
					</c:forEach>	
					</tbody>
				</table>
				</div>
				<br>
				<button class="ui green button">삭제</button>
				<br>
				<br>
				<br>
				<!-- <button class="ui green button" id="update">업데이트</button> -->
				
				<label class="subtitle">회원 상세정보 조회</label>
						<br>
						<div>
							<br>
								<table class="memberDetailInfo">
									<tr>
										<td class="partnerDetailInfoTd">아이디</td>
										<td class="partnerId"></td>
										<td class="partnerDetailInfoTd">닉네임</td>
										<td class="partnerNickName"></td>
									</tr>
									<tr>
										<td class="partnerDetailInfoTd">시작 일자</td>
										<td class="partnerSdate"></td>
										<td class="partnerDetailInfoTd">유형</td>
										<td class="partnerType"></td>
									</tr>
									<tr>
										<td class="partnerDetailInfoTd">계약금</td>
										<td class="partnerPrice"></td>
										<td class="partnerDetailInfoTd">연락처</td>
										<td class="partnerPhone"></td>
									</tr>
								</table>
								<br> <br> <br>
								
							</div>
				
			</div>
		</div>


	</div>



<script>
	$(".table tbody td").click(function(){
		var mno = $(this).parent().children().eq(4).text();
		
		console.log("m:" + mno); 
		
		 $.ajax({
			url:"partnerDetail.sm",
			data:{mno:mno},
			dataType: "json",
			contentType:"application/json;charset=UTF-8", 
			type:"get",
			success:function(data){
				console.log(data);
				$(".partnerId").text(data.data.MID);
				$(".partnerNickName").text(data.data.NICK_NAME);
				$(".partnerSdate").text(data.data.C_SDATE);
				$(".partnerType").text(data.data.PTYPE);
				$(".partnerPrice").text(data.data.PERPRICE);
				$(".partnerPhone").text(data.data.PHONE);
			},
			error:function(){
				console.log("상세조회 실패!");
			}
		}); 
	});
</script>


</body>
</html>