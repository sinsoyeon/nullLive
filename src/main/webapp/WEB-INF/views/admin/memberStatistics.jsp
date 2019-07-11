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
			<div id="donutchart" style="width: 900px; height: 500px;"></div>
			<br>
			<div id="curve_chart" style="width: 900px; height: 500px;"></div>
		</div>
	
</body>
<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);
google.charts.setOnLoadCallback(drawVisualization);
function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Task', 'Hours per Day'],
      ['카테고리1', 11],
      ['카테고리2', 2],
      ['카테고리3', 2],
      ['카테고리3', 2],
      ['카테고리4', 7]
    ]);

    var options = {
      title: '방송 카테고리 통계',
      pieHole: 0.4,
    };

    var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
    chart.draw(data, options);
}
function drawVisualization() {
    var data = google.visualization.arrayToDataTable([
      ['Year', '남성', '여성'],
      ['00시~',  1000,	400   ],
      ['03시~',  1170,	460  ],
      ['06시~',  660,	1120  ],
      ['09시~',  1030,	540   ],
      ['12시~',  300,	1010   ],
      ['15시~',  1500,	900  ],
      ['18시~',  200,	1000   ],
      ['21시~',  1050,	300   ]
    ]);

    var options = {
      title: '시청 시간대 통계',
      curveType: 'function',
      legend: { position: 'bottom' }
    };
	
    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

    chart.draw(data, options);
  }

	$(function() {
			$('li:eq(2)').addClass('active');
			$('#menu2').addClass('active in');
			$('#menu2 a:eq(1)').css('font-weight','bold');
	})
</script>
</html>