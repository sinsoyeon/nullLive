<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);
google.charts.setOnLoadCallback(drawVisualization1);
function drawVisualization() { 
	var data = google.visualization.arrayToDataTable([
			['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
			['2004/05',  165,      938,         522,             998,           450,      614.6],
			['2005/06',  135,      1120,        599,             1268,          288,      682],
			['2006/07',  157,      1167,        587,             807,           397,      623],
			['2007/08',  139,      1110,        615,             968,           215,      609.4],
			['2008/09',  136,      691,         629,             1026,          366,      569.6]
		]);
	
	var options = {
			vAxis: {title: 'Cups'},
			hAxis: {title: 'Month'}, 
			seriesType: 'bars',
			series: {5: {type: 'line'}},
			height: 300,
			width: 400
		};
	
	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	chart.draw(data, options);
	}
	
function drawVisualization1() { 
	var data = google.visualization.arrayToDataTable([
			['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
			['2004/05',  165,      938,         522,             998,           450,      614.6],
			['2005/06',  135,      1120,        599,             1268,          288,      682],
			['2006/07',  157,      1167,        587,             807,           397,      623],
			['2007/08',  139,      1110,        615,             968,           215,      609.4],
			['2008/09',  136,      691,         629,             1026,          366,      569.6]
		]);
	
	var options = {
			vAxis: {title: 'Cups'},
			hAxis: {title: 'Month'}, 
			seriesType: 'bars',
			series: {5: {type: 'line'}},
			height: 300,
			width: 400
		};
	
	var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
	chart.draw(data, options);
	}
</script>
<title>NullLive</title>
<style>
	.col-sm-5>div,.col-sm-10>div{
		background: #ffffff;
		cursor: pointer;
	}
	tr>th{
		text-align: center;
		background: #438c31;
		color: white;
	}
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>

<div class="row" align="center">
  <div class="col-sm-1"></div>
  <div class="col-sm-5">
  <h3>회원 통계</h3>
  	<div onclick="location.href='memberStatisticsList.ad'"  data-toggle="tooltip" title="회원 통계 페이지로 이동" id="chart_div" >
  	</div>
  	
  </div>
  <h3>사이트 통계</h3>
  <div class="col-sm-5"><div onclick="location.href='sitesStatisticsList.ad'" data-toggle="tooltip" title="사이트 통계 페이지로 이동" id="chart_div1">
  <br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  </div></div>
  <div class="col-sm-1"></div>
</div>
<br>
<div class="row" align="center">
  <div class="col-sm-1"></div>
  <div class="col-sm-5">
  	<div onclick="location.href='calculateList.ad'" data-toggle="tooltip" title="환전 페이지로 이동"><h3>환전</h3>
		<div>
  		<table class="table table-striped"  style="text-align: center;">
  			<thead>
  				<tr>
  					<th>닉네임</th>
  					<th>신청 Null</th>
  					<th>신청 날짜</th>
  					<th>처리 현황</th>
  				</tr>
  			</thead>
  			<tbody>
  			<c:forEach items="${ExchangeList}" var="exchange" begin="1" end="5" step="1">
					<c:if test="${exchange.excStatus eq 'N'}">
						<tr >
							<td>${exchange.nickName}</td>	
							<td>${exchange.excAmount}</td>	
							<td>${exchange.applicationDate}</td>	
							<td>대기</td>
						</tr>
					</c:if>
					<c:if test="${exchange.excStatus eq 'Y'}">
						<tr style="background: #eaeaea;">
							<td>${exchange.nickName}</td>	
							<td>${exchange.excAmount}</td>	
							<td>${exchange.applicationDate}</td>	
							<td>환전 완료</td>
						</tr>
					</c:if>
				</c:forEach>
  			</tbody>
  		</table>
  	</div>  	
  	</div>
  </div>
	<div class="col-sm-5">
		<div onclick="location.href='streamerReportList.ad'" data-toggle="tooltip" title="신고관리 페이지로 이동"><h3>스트리머 신고 관리</h3>
		
		<div>
  		<table class="table table-striped"  style="text-align: center;">
  			<thead>
  				<tr>
  					<th>구분</th>
  					<th>대상자</th>
  					<th>누적 신고 수</th>
  					<th>처리현황</th>
  				</tr>
  			</thead>
  			<tbody>
  				<c:forEach items="${streamerReportList}" var="report" begin="1" end="5" step="1">
					<c:if test="${report.staDetail eq '신고처리' }">
					<tr style="background: #eaeaea;">
						<td>${report.reportType}</td>	
						<td>${report.mid2}</td>	
						<td>${report.cou}</td>	
						<td>완료</td>	
					</tr>
					</c:if>
					<c:if test="${report.staDetail eq '신고접수' }">
					<tr>
						<td>${report.reportType}</td>	
						<td>${report.mid2}</td>	
						<td>${report.cou}</td>	
						<td>대기중</td>	
					</tr>
					</c:if>
				</c:forEach>
  			</tbody>
  		</table>
  	</div>  	
		
		</div>
	</div>
  <div class="col-sm-1"></div>
</div>
<br>
<div class="row" align="center">
  <div class="col-sm-1"></div>
  <div class="col-sm-10">
  	<div onclick="location.href='questionList.ad'" data-toggle="tooltip" title="문의관리 페이지로 이동"><h3>1:1 문의 내역</h3>
  
  <div>
  		<table class="table table-striped"  style="text-align: center;">
  			<thead>
  				<tr>
  					<th>구분</th>
  					<th>이름</th>
  					<th>제목</th>
  					<th>날짜</th>
  					<th>답변</th>
  				</tr>
  			</thead>
  			<tbody>
	  			<c:forEach items="${QuestionList}" var="question">
	  				<c:if test="${question.BStatus == 4}">
	  					<tr>
							<td>${question.qustionType}</td>	
							<td>${question.name}</td>	
							<td>${question.BTitle}</td>	
							<td>${question.WDate}</td>
							<td>대기중</td>
						</tr>
					</c:if>
					<c:if test="${question.BStatus == 3}">
	  					<tr  style="background: #eaeaea;">
							<td>${question.qustionType}</td>	
							<td>${question.name}</td>	
							<td>${question.BTitle}</td>	
							<td>${question.WDate}</td>
							<td>답변 완료</td>
						</tr>
					</c:if>
				</c:forEach>
  			</tbody>
  		</table>
  	</div> 
  
  	</div>
  </div>
  <div class="col-sm-1"></div>
</div>
<br>
<br>
</body>

<script>
	$(function() {
		$('li:eq(0)').addClass('active');
		$('#home').addClass('active in');
		$('#home a:eq(0)').css('font-weight','bold');
		$('[data-toggle="tooltip"]').tooltip(); 
	})
</script>
</html>