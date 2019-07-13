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
			<div id="chart_div2"  style="width: 900px; height: 500px;"></div>
			<br>
		</div>
	
</body>
<script>

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(bestCategory);
google.charts.setOnLoadCallback(hourlyViewingTime);
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
				title: '방송 인기 카테고리',
				is3D: true,
				slices: {  0: {offset: 0.2},
         			 },
        		};
        	
        	var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
        	chart.draw(bestCategoryChart, options);
        	
       		}
        });
	}

function hourlyViewingTime() { 
	var HVTChart = new google.visualization.DataTable();
	var HVTData = new Array();
	var topColumn = 0;
	var countValue = 0;
	$.ajax({
        url: "hourlyViewingTime.ad",
        type: "post",
        success: function(data){
        	
        	$.each(data,function(i,value){
        		HVTData[i] = 	[value["TIME"]+"시",value["COU"]];
        		
        		if(countValue < value["COU"]){
        			countValue = value["COU"];
        			topColumn = i;
        		}
        	});
        	
        	HVTChart.addColumn('string',"TIME");
        	HVTChart.addColumn('number',"시청 인원");
        	HVTChart.addRows(HVTData);
        	
        	var options = {
				title: '시간대별 시청 시간대',
				hAxis: {title: 'TIME',  titleTextStyle: {color: '#333'}},
				vAxis: {minValue: 0},
				crosshair: {
			          color: '#000',
			          trigger: 'selection'
			        }
        		};
        	
        	var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));
        	chart.draw(HVTChart, options);
        	chart.setSelection([{row: topColumn, column: 1}]);
        	
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