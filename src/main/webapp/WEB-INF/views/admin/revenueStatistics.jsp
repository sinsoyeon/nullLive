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
			<br>
			<div id="chart_div1" style="width: 900px; height: 500px;"></div>
			<br>
			<div id="chart_div2" style="width: 900px; height: 500px;"></div>
			<br>
		</div>
	
</body>
<script>

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(revenue);
google.charts.setOnLoadCallback(amountCharge);

function revenue() {
  var data = new google.visualization.arrayToDataTable([
    ['Year', '환전 수수료', '구독 수수료'],
    ['2016년',  1645840,      2654325],
    ['2017년',  2176485,      4606540],
    ['2018년',  5694321,      3526556],
    ['2019년',  4030568,      5456889]
  ]);

  var options = {
    title: 'NullLive 수익 통계',
    hAxis: {title: '기간',  titleTextStyle: {color: '#333'}},
    vAxis: {minValue: 0},
  };

  var chart = new google.visualization.AreaChart(document.getElementById('chart_div1'));
  chart.draw(data, options);
}

function amountCharge() { 
	var amountChargeChart = new google.visualization.DataTable();
	var amountChargeData = new Array();
	$.ajax({
        url: "amountCharge.ad",
        type: "post",
        success: function(data){
        	
        	$.each(data,function(i,value){
        		amountChargeData[i] = 	[value["CHAMOUNT"]+"원",value["COU"]];
        	});
        	
        	console.log(amountChargeData);
        	amountChargeChart.addColumn('string',"CHAMOUNT");
        	amountChargeChart.addColumn('number',"충전 수");
        	amountChargeChart.addRows(amountChargeData);
        	
        	var options = {
				title: '충전 금액대',
				 colors: ['#9575cd'],
        		};
        	
        	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
        	chart.draw(amountChargeChart, options);
        	
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