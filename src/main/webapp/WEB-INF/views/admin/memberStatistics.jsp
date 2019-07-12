<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="UTF-8">
<title>NullLive</title>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
		

		<div align="center">
			<br>
			<b>연도 선택 : </b>
			<select id="year" onchange='yearChange();'>
				<option value="2019" selected>2019년</option>
				<option value="2018">2018년</option>
				<option value="2017">2017년</option>
			</select>
			<div id="chart_div" style="width: 900px; height: 500px;"></div>
			<br>
			<div id="curve_chart" style="width: 900px; height: 500px;"></div>
		</div>
</body>
<script>
function yearChange() {
	incomingMember();
}

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(incomingMember);
function incomingMember() { 
	var year = $("#year").val();
	var monthChart = new google.visualization.DataTable();
	var monthData = new Array();
	$.ajax({
        url: "memberMonthStatistics.ad",
        type: "post",
        data: {year:year},
        success: function(data){
        	
        	$.each(data,function(i,value){
        		monthData[i] = 	[value["MONTH"]+"월", value["M"], value["F"], (value["M"]+value["F"])/2 ];
        	});
        	
        	monthChart.addColumn('string',"MONTH");
        	monthChart.addColumn('number',"남성");
        	monthChart.addColumn('number',"여성");
        	monthChart.addColumn('number',"평균");
        	monthChart.addRows(monthData);
        	
        	var options = {
        				 title: year+'년도 월별 회원 유입 통계',
        				 vAxis: {title: '가입 인원 수'},
        					seriesType: 'bars',
        					series: {2: {type: 'line'}}
        		};
        	
        	var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        	chart.draw(monthChart, options);
        	
       		}
        });
	}
	$(function() {
			$('li:eq(2)').addClass('active');
			$('#menu2').addClass('active in');
			$('#menu2 a:eq(1)').css('font-weight','bold');
	})
</script>
</html>