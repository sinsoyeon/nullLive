<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
  <h3>방송 통계</h3>
  	<div onclick="location.href='streamingStatisticsList.ad'"  data-toggle="tooltip" title="방송 통계 페이지로 이동" id="chart_div1" ></div>
  </div>
  <div class="col-sm-5">
   <h3>수익 통계</h3>
  <div onclick="location.href='revenueStatisticsList.ad'" data-toggle="tooltip" title="수익 통계 페이지로 이동" id="chart_div2">
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
  	<div onclick="location.href='exchangeList.ad'" data-toggle="tooltip" title="환전 페이지로 이동"><h3>환전</h3>
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
  			<c:forEach items="${ExchangeList}" var="exchange" begin="0" end="4" step="1">
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
  				<c:forEach items="${streamerReportList}" var="report" begin="0" end="4" step="1">
					<c:if test="${report.status == 6 }">
					<tr style="background: #eaeaea;">
						<td>${report.reportType}</td>	
						<td>${report.target}</td>	
						<td>${report.cou}</td>	
						<td>완료</td>	
					</tr>
					</c:if>
					<c:if test="${report.status == 5 }">
					<tr>
						<td>${report.reportType}</td>	
						<td>${report.target}</td>	
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
	  			<c:forEach items="${QuestionList}" var="question" begin="0" end="4" step="1">
	  				<c:if test="${question.BStatus == 4}">
	  					<tr>
							<td>${question.questionType}</td>	
							<td>${question.name}</td>	
							<td>${question.BTitle}</td>	
							<td>${question.WDate}</td>
							<td>대기중</td>
						</tr>
					</c:if>
					<c:if test="${question.BStatus == 3}">
	  					<tr  style="background: #eaeaea;">
							<td>${question.questionType}</td>	
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

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(revenue);
google.charts.setOnLoadCallback(bestCategory);
function revenue() {
	  var year = 2019;
		var chargeAndExchangeChart = new google.visualization.DataTable();
		var chargeAndExchangeData = new Array();
		$.ajax({
	        url: "chargeAndExchange.ad",
	        type: "post",
	        data: {year:year},
	        success: function(data){
	        	
	        	$.each(data,function(i,value){
	        		chargeAndExchangeData[i] = 	[value["MONTH"]+"월", value["CHARGE"], value["EXCHANGE"], value["NET_PROFIT"] ];
	        	});
	        	
	        	console.log(chargeAndExchangeData);
	        	chargeAndExchangeChart.addColumn('string',"MONTH");
	        	chargeAndExchangeChart.addColumn('number',"충전");
	        	chargeAndExchangeChart.addColumn('number',"환전");
	        	chargeAndExchangeChart.addColumn('number',"순이익");
	        	chargeAndExchangeChart.addRows(chargeAndExchangeData);
	        	
	        	var options = {
					 colors: ['#4f90c4', '#94d1dc', '#b6d57c'],
					 legend: {position: 'none'}
	        		};
	        	
	        	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
	        	chart.draw(chargeAndExchangeChart, options);
	        	
	       		}
	        });
	  
	}

function bestCategory() { 
	var bestCategoryChart = new google.visualization.DataTable();
	var bestCategoryData = new Array();
	$.ajax({
        url: "bestCategory.ad",
        type: "post",
        success: function(data){
        	
        	$.each(data,function(i,value){
        		bestCategoryData[i] = 	[value["CATEGORY"],value["COU"]];
        	});
        	
        	bestCategoryChart.addColumn('string',"카테고리");
        	bestCategoryChart.addColumn('number',"방송 수");
        	bestCategoryChart.addRows(bestCategoryData);
        	
        	var options = {
				is3D: true,
				slices: {  0: {offset: 0.2},
         			 },
        		};
        	
        	var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
        	chart.draw(bestCategoryChart, options);
        	
       		}
        });
	}

	$(function() {
		$('li:eq(0)').addClass('active');
		$('#home').addClass('active in');
		$('#home a:eq(0)').css('font-weight','bold');
		$('[data-toggle="tooltip"]').tooltip(); 
	})
</script>
</html>