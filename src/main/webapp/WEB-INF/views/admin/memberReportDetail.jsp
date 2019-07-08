<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
<style>
#contentBackground {
	background: white;
	padding: 3%;
}

#titleBar {
	background: #438c31;
	color: white;
	font-weight: bold;
	font-size: 20px;
	padding: 1%;
	padding-left: 4%;
	border-radius: 7px 7px 7px 7px;
	text-align: left;
	width: 95%;
}

#inContent {
	background: #f6f8fa;
	border-radius: 5px 5px 5px 5px;
	width: 95%;
}

#reportContext {
	background: white;
	border: 1px solid lightgray;
	border-radius: 5px 5px 5px 5px;
	box-shadow: 3px 5px 7px -4px grey inset;
	text-align: left;
	padding-left: 3%;
}
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>

	<h1 align="center">일반회원 신고 관리</h1>
	<h3 align="center">일반회원 신고 처리</h3>
	<div class="row" align="center">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div align="right" style="margin-bottom: 5px;">
				<br>
			</div>
			<div id="contentBackground">
				<div id="titleBar">${reportContent.BTitle}</div>
				<br>
				<div id="inContent">
				
				<div class="row" align="center"	style="font-weight: bold; font-size: 15px; border-bottom: 1px solid lightgray; width:95% ">
					<div class="col-sm-3">구분</div>
					<div class="col-sm-3">신고자 아이디</div>
					<div class="col-sm-3">해당 회원 아이디</div>
					<div class="col-sm-3">신고 날짜</div>
				</div>
				
				<div class="row" align="center" style="width:95% ">
					<div class="col-sm-3"> ${ reportContent.reportType }</div>
					<div class="col-sm-3">${reportContent.writer}</div>
					<div class="col-sm-3">${reportContent.target}</div>
					<div class="col-sm-3">${reportContent.writtenDate}</div>
				</div>
					<div style="padding: 3%;">
						<div id="reportContext"><br><p>${reportContent.BContent }</p><br></div>
						<c:if test="${reportContent.status == 5}">
						<div style="padding: 3%;">
							<button style="float: left;" onclick="history.back();">뒤로가기</button>
							<button style="float: right;" onclick="reportProcess()">처리</button>
							<select style="float: right;" id="choiceStatus">
									<option value="N">영구 정지</option>
									<option value="B9">90일 정지</option>
									<option value="B6">60일 정지</option>
									<option value="B3">30일 정지</option>
									<option value="Y">부적합</option>
							</select> 
						</div>
						<p  id="bno">${reportContent.bno }</p>
						<p  id="mno">${reportContent.mno }</p>
						</c:if>
						<c:if test="${reportContent.status == 6}">
						<div style="padding: 3%;">
								<button style="float: left;" onclick="history.back();">뒤로가기</button>
								<c:choose>
									<c:when test="${ban eq 90 }">
										<div>${ ban } 일 정지</div>
									</c:when>
									<c:when test="${ban eq 60 }">
										<div>${ ban } 일 정지</div>
									</c:when>
									<c:when test="${ban eq 30 }">
										<div>${ ban } 일 정지</div>
									</c:when>
									<c:when test="${reportContent.banNo eq 0 }">
										<div>부적합</div>
									</c:when>
									<c:otherwise>
										<div>영구정지 </div>
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>
					</div>
					
				</div>
			</div>


		</div>
		<div class="col-sm-1"></div>
	</div>

</body>
<script>
$(function() {
	$('li:eq(1)').addClass('active');
	$('#menu1').addClass('active in');
	$('#menu1 a:eq(2)').css('font-weight','bold');
})

function reportProcess() {
	
	var choiceStatus = $("#choiceStatus").val();
	var bno = $("#bno").text();
	var mno = $("#mno").text();
	
	var select = confirm("정말로 계정상태를 변경하시겠습니까? 확인을 누르시면 변경됩니다. ");
	if (select) {
		location.href = 'memberReportProcess.ad?bno=' + bno + '&mno='+mno+ '&choiceStatus=' + choiceStatus
		alert("변경되었습니다.");
	} else {
		alert("취소되었습니다.");
	}
	
}
</script>
</html>