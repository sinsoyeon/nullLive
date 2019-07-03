<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/bootstrap/font-awesome.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
</head>
<body>
		<div class="container-fluid">
	<div class="row">
		<input type="hidden" id="mno" value="${loginUser.mno }" />
		
		<div class="col-sm-3">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>
		<div class="col-sm-9" style="padding-top:100px;">
			 <div id="donutchart" style="width: 900px; height: 500px;"></div>
		</div>

	</div>
	</div>
	
	<script>
		$(function(){
			$('#chartList').css({"background":"#BCE067"});
			selectSubAgeChart();
		});
		
		function selectSubAgeChart(){
			var mno = $("#mno").val();
			$.ajax({
				url:"ageChart.sm",
				type:"post",
				data:{mno:mno},
				success:function(){
					
				}
			});
		
		      google.charts.load("current", {packages:["corechart"]});
		      google.charts.setOnLoadCallback(drawChart);
		      function drawChart() {
		        var data = google.visualization.arrayToDataTable([
		          ['Task', 'Hours per Day'],
		          ['Work',     11],//10대 미만 여자
		          ['Eat',      2],//10대 미만 남자
		          ['Commute',  2],//10~29대 여자
		          ['Test F',  2],//10~29대 남자
		          ['Watch TV', 2],//30~49대 여자
		          ['Test M', 2],//30~49대 남자
		          ['Sleep',    7]//그 이상 토탈
		        ]);

		        var options = {
		          title: 'My Daily Activities',
		          pieHole: 0.4,
		        };

		        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
		        chart.draw(data, options);
		      }	
		}
	</script>
</body>
</html>