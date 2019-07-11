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
			<b>기간별 회원가입 수</b>
			<select>
				<option>2019년</option>
			</select>
			<div id="chart_div" style="width: 900px; height: 500px;"></div>
			<br>
			<b>1회 충전 금액 통계</b>
			<div id="chart_div1" style="width: 900px; height: 500px;"></div>
		</div>
	
</body>
<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);
google.charts.setOnLoadCallback(drawVisualization1);
function drawVisualization() { 
	var jsonData = $.ajax({
        url: "memberMonthStatistics.ad",
        type: "post",
        data: {userId:userId, statusType:statusType},
        success: function(data){
        	
       		},
        error: function(){
        	alert("실패");
        	}
        }
        
		
	
	/* var data = google.visualization.arrayToDataTable([
			['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
			['2004/05',  165,      938,         522,             998,           450,      614.6],
			['2005/06',  135,      1120,        599,             1268,          288,      682],
			['2006/07',  157,      1167,        587,             807,           397,      623],
			['2007/08',  139,      1110,        615,             968,           215,      609.4],
			['2008/09',  136,      691,         629,             1026,          366,      569.6]
			//addcolom addlows
		]); */
	
	var options = {
			title : 'Monthly Coffee Production by Country',
			vAxis: {title: 'Cups'},
			hAxis: {title: 'Month'}, 
			seriesType: 'function',
			series: {5: {type: 'line'}}
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
			title : 'Monthly Coffee Production by Country',
			vAxis: {title: 'Cups'},
			hAxis: {title: 'Month'}, 
			seriesType: 'bars',
			series: {5: {type: 'line'}}
		};
	
	var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
	chart.draw(data, options);
}

$(function() {
	$('li:eq(2)').addClass('active');
	$('#menu2').addClass('active in');
	$('#menu2 a:eq(2)').css('font-weight','bold');
})
</script>
</html>