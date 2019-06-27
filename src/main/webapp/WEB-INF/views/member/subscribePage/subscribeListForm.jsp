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
<link rel="stylesheet"
	href="${ contextPath }/resources/css/bootstrap/main.css">
<link rel="stylesheet"
	href="${ contextPath }/resources/css/bootstrap/util.css">
<script src="${ contextPath }/resources/js/external/main.js"></script>
</head>
<body>
	<jsp:include page="sponAndSubscribeNav.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h4 class="page-head-line" id="textLine">구독 내역</h4>
				<br />
				<br />
				
				<h4 style="color:#333333 !important;" id="textLine1">내가 구독한 스트리머</h4>
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
						<c:forEach items="${subList}" var="selectSub" varStatus="status">
							<tr>
								<th scope="row"><c:out value="${status.count}" /></th>
								<td style="text-align: center;"><c:out
										value="${selectSub.NICK_NAME}" /></td>
								<c:if test="${empty selectSub.SU_PERIOD_DATE}">
									<td>장기구독자</td>
								</c:if>
								<c:if test="${!empty selectSub.SU_PERIOD_DATE}">
									<td>정기구독자</td>
								</c:if>
								<td><c:out value="${selectSub.SU_START_DATE}" /></td>
								<td><c:out value="${selectSub.SU_PERIOD_DATE}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<br /><br />
				<h4 style="color:#333333 !important;"id="textLine2">나를 구독한  사용자</h4>				
				<table class="table" id="toSubscribeArea" style="text-align:center" align="center;">
					<thead class="thead-dark"
						style="color: #fff; ! important; background: #333 !important;">
						<tr>
							<th scope="col">구독 번호</th>
							<th scope="col">구독자 이름</th>
							<th scope="col">나에게 보낸 메세지</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${forMList}" var="forMe" varStatus="status">
							<tr>
								<th scope="row"><c:out value="${status.count}" /></th>
								<td style="text-align: center;"><c:out
										value="${forMe.NICK_NAME}" /></td>
								<td colspan="3"><c:out value="${forMe.MSG}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>				
			</div>
		</div>
	</div>

	<script>
		$(function() {
			$(".menu-top-active").css("background", "#3D3D3D");
			$(".sponTab").css("background", "#3D3D3D");
			$(".sponListTab").css("background", "#3D3D3D");
			$(".subListTab").css("background", "#C36464");
		});
		
		
		$(".sponListTab").click(function(){
			var mno = ${loginUser.mno};
			$("#mySubscribeArea").text('');
			$("#toSubscribeArea").text('');		
			$("#textLine1").text('');
			$("#textLine2").text('');
			$("#textLine").text('후원 내역');
			
			
	/* 		$.ajax({
				url:"selectSponList.sm", 
				type:"post",
				data:{mno:mno}, 
				success:function(data){
					alert('ajax 성공');	
				}
			}); */
		})

	</script>
</body>
</html>