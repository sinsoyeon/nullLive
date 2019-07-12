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
			<div id="chart_div" style="width: 900px; height: 500px;"></div>
			<br>
			<div id="chart_div1" style="width: 900px; height: 500px;"></div>
		</div>
	
</body>
<script>

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(hourlyViewingTime);
function hourlyViewingTime() { 
	var HVTChart = new google.visualization.DataTable();
	var HVTData = new Array();
	$.ajax({
        url: "hourlyViewingTime.ad",
        type: "post",
        success: function(data){
        	
        	$.each(data,function(i,value){
        		HVTData[i] = 	[value["COU"], value["TIME"]];
        	});
        	
        	console.log(HVTData);
        	
        	monthChart.addColumn('number',"COU");
        	monthChart.addColumn('number',"TIME");
        	monthChart.addRows(HVTData);
        	
        	var options = {
        				 title: year+'년도 월별 회원 유입 통계',
        				 vAxis: {title: '가입 인원 수'},
        					seriesType: 'bars',
        					series: {0: {type: 'line'}}
        		};
        	
        	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        	chart.draw(HVTChart, options);
        	
       		}
        });
	}

$(function() {
	$('li:eq(2)').addClass('active');
	$('#menu2').addClass('active in');
	$('#menu2 a:eq(2)').css('font-weight','bold');
})
</script>
</html>