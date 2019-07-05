<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/bootstrap/font-awesome.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

</head>
<body>
		<div class="container-fluid">
	<div class="row"  style="z-index:10 !important;">
		
		
		<input type="hidden" id="mno" value="${loginUser.mno }" />
		
		<div class="col-sm-3">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />		

		</div>
		
		<div style="padding-top:50px; text-align:center;" >
			<jsp:include page="../streamer/chartNav.jsp" />	
							<ol class="breadcrumb">
				    <li><a href="" id="subBtn">주간 추천 통계</a></li>
				    <li><a href="#" id="monthlyRecom">월별 추천 통계</a></li>    
			  </ol>	
		</div>
			
		<div class="col-sm-9" style="padding-top:160;z-index:1 !important; ">

				
		<div id="donutchart" style="width: 800px; height: 500px; float:left; padding-top:-100px;"></div> 

		</div>

	</div>
	</div>
	
	<script>
	
	     
	     
		$(function(){
		});
		
			google.charts.load("current", {packages:["corechart"]});
		     google.charts.setOnLoadCallback(weeklyRecom);
		
		
		//주간 추천 통계
		function weeklyRecom(){
			var mno = $("#mno").val();
			var result = new Array();
			$.ajax({
				url:"recom.sm",
				type:"post",
				data:{mno:mno,type:1},
				success:function(data){
					console.log(data.weeklyRecomList);
					$.each(data.weeklyRecomList,function(index,value){
						result[index] = [value["MONTH"]+'/'+value["WEEK"],value["SUM"]];
					});
					
					console.log(result);
				drawChart(result,"주별 추천 통계","Data",1);
				}
			});
		   }
		
		$("#monthlyRecom").click(function(){
			var mno = $("#mno").val();
			var returnResult = new Array();
			$.ajax({
				url:"recom.sm",
				type:"post",
				data:{mno:mno,type:2},
				success:function(data){
					console.log(data.weeklyRecomList.length);
					var index = 0;
					
					$.each(data.weeklyRecomList,function(i,value){
						returnResult[i] = [value["MONTH"]+'월',value["SUM"]];
						
						index++;
					});
					drawChart(returnResult,"월별 추천 통계","Data",2);
				}
			});
		})
		
		
		
	      function drawChart(data,title,vaxis_title,type) {
		    	var chartData = new google.visualization.DataTable();
		        
		        chartData.addColumn("string","차트");
		        chartData.addColumn("number","추천수(단위 :1,날짜:월/주)");
		        
		        chartData.addRows(data);
		        
		        
		        var options = {
		          title: title,
		          tooltip:{textStyle : {fontSize:13}, showColorCode : false},
	               animation: { //차트가 뿌려질때 실행될 애니메이션 효과
	                   startup: true,
	                   duration: 1000,
	                   easing: 'linear' },
		          legend:{
		        	  position:'top',
		        	 titlePosition:'in'
		        		 
		          }
		        };
		        
		        if(type==2){
		        var chart = new google.visualization.ColumnChart(document.getElementById('donutchart'));
		        chart.draw(chartData, options);
		        }else if(type==1){
		        	var chart = new google.visualization.LineChart(document.getElementById('donutchart'));
			        chart.draw(chartData, options);
		        }
		        
		      }		
		
	</script>
</body>
</html>