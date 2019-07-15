<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.9.0/css/all.css">
<style>
ul li.unread:after {
	content: attr(data-content);
	position: absolute;
	top: 10px;
	left: 25px;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 15px;
	height: 15px;
	border-radius: 50%;
	color: #fff;
	background: #ef5952;
	font-size: 8px;
}
.logo:hover{
	cursor:pointer;
}

#myAlarmArea{
	width:360px;
}

#paginArea{
background:#f5f5f5; 
width:330px; 
height:30px;
margin-top:-20px;
text-align:center;
}

#upArea{
background:#f5f5f5; 
width:330px; 
height:30px;
margin-top:-11px;
text-align:center;
}

.list-group *{
font-size:12px;
}


#checkBtn{
margin-top:-10px;
}
</style>
</head>
<body>
   <!-- 소연 -->
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />
	<!-- nav -->
	<div class="row" style="display: inline;">
		<div class="col-md-12">
			<nav class="navbar navbar-fixed-top navbar-inverse">
				<div class="container-fluid">

					<div class="navbar-header" style=" width: 160.72px; height: 50px; ">
						<img src="/nullLive/resources/image/logo.png" class="logo" onclick="location.href='index.jsp'" style="width: 164.72px;height: 57px;margin-top: 3px;">
					</div>

					<form class="navbar-form navbar-left" style="margin-left: 2%;">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search" id="search">
							<div class="input-group-btn">
								<button class="btn btn-default" type="button" id="searchBtn">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${empty sessionScope.loginUser}">
					<li><a href="loginPage.me"><i class="fas fa-sign-in-alt fa-lg" style="color: #fff;"></i></a></li>
					<li><a href="join.me"><i class="fas fa-user fa-lg" style="color: #fff;"></i></a></li>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<c:if test="${sessionScope.loginUser.mid ne 'admin'}">
						<li  class="unread" data-content="0" id="count">
							<a href="#">
							<!-- 지구본 알람 작업중(소연 ) -->
							<input type="hidden" id="mno" value="${loginUser.mno}" />
							 <i class="fas fa-globe-asia fa-lg" style="color: #fff;" id="alarmBtn"></i>
							</a>
						</li>
						<li><a href="logout.me"><i class="fas fa-sign-out-alt fa-lg" style="color: #fff;"></i></a></li>
						<li><a href="myPage.me"><c:out value="${sessionScope.loginUser.nickName} 님"/></a></li>
					</c:if>
					<c:if test="${sessionScope.loginUser.mid eq 'admin'}">
						<li><a href="logout.me"><i class="fas fa-sign-out-alt fa-lg" style="color: #fff;"></i></a></li>
						<li><a href="main.ad">관리자 페이지</a></li>
					</c:if>
				</c:if>	
				
			</ul>

				</div>
			</nav>
		</div>
	</div>
	
	<!-- 알람 창 -->
	<div id="myAlarmArea" style="z-index:9999;">
	
		<div class="panel panel-primary">
			<div class="panel-heading">
				<label class="panel-title" style="font-size:20px">알람</label>				
					<button type="button" class="btn btn-default btn-sm" id="checkBtn">
					  <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					</button>
			</div>
			<div class="panel-body">
				<div id="upArea">
					<p>이전으로</p>
				</div>	
				<div class="list-group">

				</div>
			
				<div id="paginArea">
					<input type="hidden" id="maxPage" />
					<input type="hidden" id="currentPage" />
					<p>더 보기</p>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	//색상 : #337ab7
		function main(){
			location.href="index.jsp";
		}
		
		
		//소연
		$(function(){		
			$('#myAlarmArea').hide();
			var mno;
			if('${loginUser.mno}' != ''){
				mno = '${loginUser.mno}';
				
				$.ajax({
					url:"selectCount.sm",
					type:"post",
					data:{mno:mno},
					success:function(data){
						$('#count').attr('data-content',data);
					}
				})
			}
		});
		
		//소연
		$(document).on('click','#alarmBtn',function(event){
			var mno = $('#mno').val();
			   x = event.pageX;
			   y = event.pageY; 
			   
			   console.log(x + '/ ' + 'y');
			   
			   if($('#myAlarmArea').is(':visible')==true){
				   $('#myAlarmArea').hide();
			   }else{			   
				   readMyAlarm(mno,1);
				   myAlarmList(x,y);
			   }
		});
		
		$(document).on('click','#upArea',function(){
			var mno = $('#mno').val();
			var currentPage = parseInt($('#currentPage').val()) -1;
			console.log('upArea: ' + currentPage);
			
			if(currentPage <= 1){
			/* 	$('#upArea').prop("disabled",true); */
				readMyAlarm(mno,1);
			}else{
				readMyAlarm(mno,currentPage);				
			}
		});
		
		//소연
		function myAlarmList(x,y){
			$('#myAlarmArea').css({
			     "left": x - 240
			     ,"top": y + 20
			     , "position": "absolute"
			 }).show();
		}		
		
		//소연
		function readMyAlarm(mno,currentPage){
			$.ajax({
				url:"selectAlarmList.sm",
				type:"post",
				data:{mno:mno,currentPage:currentPage},
				success:function(data){
					console.log('알람 작업중');
					console.log(data.infoMap.myAlarmList);
					
					$(".list-group").html('');
					
					var myAlarmList = data.infoMap.myAlarmList;
					$.each(myAlarmList,function(index,value){
						
					console.log('count : '+value["COUNT"]);
					$('#count').attr('data-content',value["COUNT"]);
					
						var status = '';
						var type = [];
						
						if(value["ALM_STATUS"]=='N'){
							status = '<a href="#" class="list-group-item" style="background:#dff0d8;">'
						}else{
							status = '<a href="#" class="list-group-item">'
						}
						
							if(value["ATYPE"]==1){
							type[0]='방송을 시작했습니다 !';
							type[1] = ' * 방송 보러 가기';
						}else if(value["ATYPE"]==2){
							type[0]='게시글이 등록 되었습니다.'
							type[1]=' * 게시글 조회 하기';
						}
						
							$('.unread').data('content',value["COUNT"]);
						$(".list-group").append(
												'<div id="selectOne">'+status + '<input type="hidden" value="'+ value["MID"] +'" id="mid"/>'
												+ '<input type="hidden" value="'+  value["SMNO"]+'" id="smno"/>'
												+ '<input type="hidden" value="'+ value["ANO"] +'" id="ano"/>' 
												+ '<label style="font-size:14px;">' + value["NICK_NAME"]  + '</label>님이 '+type[0] + '<br/>' 
												+ '시간 : <label style="font-size:12px;"> '+ value["ALM_DATE"] + '</label> <br/>' 
												+ type[1] + '</div>'
											   )								
					});

					
					
					$("#currentPage").val(data.infoMap.pi.currentPage);	
					$("#maxPage").val(data.infoMap.pi.maxPage);
					console.log($("#currentPage").val());
				}				
			});
		};
		
		$(document).on('click','#paginArea',function(){
			var mno = $('#mno').val();
			var currentPage = parseInt($('#currentPage').val()) + 1;
			
			if(currentPage >= $('#maxPage').val()){
				readMyAlarm(mno,$('#maxPage').val());
			}else{
				readMyAlarm(mno,currentPage);				
			}
		});
		
		$(document).on('click','#selectOne',function(){
			//main.st
			var ano = $(this).find('#ano').val();
			var mid = $(this).find('#mid').val();
			var smno = $(this).find('#smno').val();
			console.log(ano);
			console.log(mid);
			
			
			$.ajax({
				url:"updateAlarm.sm",
				type:"post",
				data:{ano:ano,mid:mid},
				success:function(data){
					console.log('updateAlarm 작업중이다 스바꺼');	
					
					if(data.result >0){
						readMyAlarm($('#mno').val(),1);
						
						if(window.confirm('스트리머 페이지로 이동하시겠습니까?')){
							window.open('main.st?smno='+smno,'_blank');
						}
					}
				}
			});
		});
		
		

		$(document).on('click','#checkBtn',function(){
			if(window.confirm('모두 다 읽음 표시 하시겠습니까?')){

			}
		});
	
		$("#searchBtn").click(function(){
			var name = $("#search").val();
				location.href = "searchStreamer.sm?name="+name;
		});
		
		
		//부트스트랩이라 name으로 넘어감..
		$("#search").keydown(function(key){
			if(key.keyCode == 13){
				("#searchBtn").click(function(){
					var name = $("#search").val();
					location.href = "searchStreamer.sm?name="+name;
				});
			}
		});	
	</script>
</body>
</html>