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
		    <li><a href="" id="subBtn">연령대 별 구독자</a></li>
		    <li><a href="#" id="sponBtn">연령대 별 후원자</a></li>    
		    <li><a href="#" id="allBtn">최근 3개월 전체 분포</a></li>    
		  </ol>
		</div>
			
		<div class="col-sm-9" style="padding-top:160;z-index:1 !important; ">

		<div id="donutchart" style="width:700px; height: 400px; float:left; padding-top:-100px;"></div> 

		</div>

	</div>
	</div>
	
	<script>
		$(function(){
			$('#chartList').css({"background":"#BCE067"});
		});
		
	     google.charts.load("current", {packages:["corechart"]});
	     google.charts.setOnLoadCallback(selectSubAgeChart);
		
		function selectSponAgeChart(){
			
			$("#donutchart").html('');
			
			var mno = $("#mno").val();
			var myAgeData = new Array();
			var result;
			$.ajax({
				url:"ageChart.sm",
				type:"post",
				data:{mno:mno},
				success:function(data){
					$.each(data.ageChartData,function(index,value){
						var gender;
						
						if(value["GENDER"]=='F') gender = '여성'; else gender = '남성';
						
						myAgeData[index] = [value["연령대"]+gender,value["인원수"]]
					});
					
					drawChart(myAgeData,"나이/연령대별 후원자","Data",0)
				}
			});
		   }	
		
		
		function selectSubAgeChart(){	
			var mno = $("#mno").val();
			var sponAgeData = new Array();
			var result;
			$.ajax({
				url:"sponAgeChart.sm",
				type:"post",
				data:{mno:mno},
				success:function(data){
					
					$.each(data.sponAgeChart,function(index,value){
						var gender;
						
						if(value["GENDER"]=='F') gender = '여성'; else gender = '남성';
						
						sponAgeData[index] = [value["연령대"]+gender,value["인원수"]]
					});
					
					drawChart(sponAgeData,"나이/연령대별 구독자","Data",0);
				}
			});	
		}
		
	      function selectAllChart(){
	          var mno = $("#mno").val();
	          var result;
	          var sponData = new Array();
	          var subData  = new Array();
	          $.ajax({
	             url:"selectAllChart.sm",
	             type:"post",
	             data:{mno:mno},
	             success:function(data){
	             /*    sponData = data.selectAllChart; */
	                
	                $.each(data.selectAllChart,function(i,value){
	                   sponData[i] = {
	                               SPON_MONTH : value["SPON_MONTH"]+'/'+value["SPON_WEEK"],
	                               SPON_COUNT : value["SPON_COUNT"]
	                             };
	                });
	                
	             console.log(sponData);
	                
	                //원하는 양식 : 월을 기준으로 후원자 및 구독자  [월/주] , 구독자 수 , 후원자 수          
	                $.ajax({
	                   url:"selectSubChart.sm",
	                   type:"post",
	                   data:{mno:mno},
	                   success:function(data){
	                   /*  subData = data.selectAllSubChart; */
	                   
	                                  
	                   $.each(data.selectAllSubChart,function(i,value){
	                      subData[i] = 
	                                  {
	                                  SUB_MONTH:value["SU_MONTH"]+'/'+value["SUB_WEEK"],
	                                     SUB_COUNT:value["SUB_COUNT"]}      
	                               ;
	                      });
	                      selectAllChartDraw(sponData,subData,'최근 6개월 집계'); 
	                   }
	                   
	                });
	                
	                
	             }
	          });
	                  
	       }
	       
	       function selectAllChartDraw(sponData,subData,title){
	    	    var tempData = new Array();
	            var totalData = [];
	            var sponArray = 0;
	            var subArray = 0;
	            var newArray = new Array();
	            console.log('selectAllChartDraw');
	            
	            $.each(sponData,function(index,value){
	               tempData.push(sponData[index].SPON_MONTH);
	            }); 
	            
	            $.each(subData,function(index,value){
	               tempData.push(subData[index].SUB_MONTH);
	            }); 
	            
	   	        totalData = tempData.reduce(function(a,b){
	               if (a.indexOf(b) < 0 ) a.push(b);
	               return a;
	             },[]);
	   	        
	   	        
	   	        for(var i=0; i<totalData.length; i++){
	   	        	sponArray=0;
	   	        	subArray=0;
	   	        	
		            $.each(sponData,function(index,value){
		              	if(totalData[i] == sponData[index].SPON_MONTH){
		              		sponArray = sponData[index].SPON_COUNT;
		              		
		              	}
		            	
		            }); 
		            
		            $.each(subData,function(index,value){
		              	if(totalData[i] == subData[index].SUB_MONTH){
		              		subArray = subData[index].SUB_COUNT;
		              		
		              	}
		            }); 
		            
	   	        	
	   	        	newArray[i] = [totalData[i],sponArray,subArray];
	   	        }
	   	        
	 			
	
	   }//selectAllChartDraw 끝		
		
      function drawChart(data,title,vaxis_title,type) {
	    	var chartData = new google.visualization.DataTable();
	        
	        chartData.addColumn("string","연령대");
	        chartData.addColumn("number","인원수");
	        
	        chartData.addRows(data);

	        var options = {
	          title: title,
	          pieHole: 0.4,
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
	        
	        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	        chart.draw(chartData, options);
	      }
	      
	     
		
		
	$("#sponBtn").click(function(){
	     google.charts.load("current", {packages:["corechart"]});
	     google.charts.setOnLoadCallback(selectSponAgeChart);
		
	})
	
	$("#subBtn").click(function(){
	     google.charts.load("current", {packages:["corechart"]});
	     google.charts.setOnLoadCallback(selectSubAgeChart);
	     

	});
	
	
	$("#allBtn").click(function(){
	     google.charts.load("current", {packages:["corechart"]});
	     google.charts.setOnLoadCallback(selectAllChart);
	})
	</script>
</body>
</html>
