<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="UTF-8">
<title>NullLive</title>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
		

		<div align="center">
			<br><div style="display: inline-block;">
			<b>연도 선택 : </b>
			</div>
			<div style="display: inline-block;">
			<select id="year1" onchange='yearChange1();' class='form-control'>
				<option value="2019" selected>2019년</option>
				<option value="2018">2018년</option>
				<option value="2017">2017년</option>
			</select>
			</div>
			<div id="chart_div1" style="width: 900px; height: 500px;"></div>
			<br>
			<div style="display: inline-block;">
			<b>연도 선택 : </b>
			</div>
			<div style="display: inline-block;">
			<select id="year2" onchange='yearChange2();' class='form-control'>
				<option value="2019" selected>2019년</option>
				<option value="2018">2018년</option>
				<option value="2017">2017년</option>
			</select>
			</div>
			<div id="chart_div2" style="width: 900px; height: 500px;"></div>
			<br>
		</div>
	
</body>
<script>

function yearChange1() {
	chargeAndExchange();
}
function yearChange2() {
	revenue();
}

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(chargeAndExchange);
google.charts.setOnLoadCallback(revenue);

function chargeAndExchange() { 
	var year = $("#year1").val();
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
				title: 'NullLive '+year+'년 순이익',
				 colors: ['#4f90c4', '#94d1dc', '#b6d57c'],
        		};
        	
        	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
        	chart.draw(chargeAndExchangeChart, options);
        	
       		}
        });
	}

function revenue() {
	var year = $("#year2").val();
	var revenueChart = new google.visualization.DataTable();
	var revenueData = new Array();
	$.ajax({
        url: "revenue.ad",
        type: "post",
        data: {year:year},
        success: function(data){
        	
        	$.each(data,function(i,value){
        		revenueData[i] = 	[value["MONTH"]+"월", value["EXCHANGE"], value["SUBSCRIPTION"]];
        	});
        	
        	console.log(revenueData);
        	revenueChart.addColumn('string',"MONTH");
        	revenueChart.addColumn('number',"환전 수수료");
        	revenueChart.addColumn('number',"구독 수수료");
        	revenueChart.addRows(revenueData);
        	
        	var options = {
				title: 'NullLive '+year+'년 수수료 통계',
				hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
		        vAxis: {minValue: 0}
        		};
        	
        	var chart = new google.visualization.AreaChart(document.getElementById('chart_div2'));
        	chart.draw(revenueChart, options);
        	
       		}
        });
}


	
$(function() {
	$('li:eq(2)').addClass('active');
	$('#menu2').addClass('active in');
	$('#menu2 a:eq(3)').css('font-weight','bold');
})
</script>
</html>