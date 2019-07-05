<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NullLive</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css">
  <style>
	body {
		background: #f6f8fa;
		font-family: "맑은 고딕";
	}
	body>div>#title{
		background: black; 
		height: 50px;
	}
	
	#home>div, #menu1>div, #menu2>div, #menu3>div, #menu4>div {
		background: #ffffff;
	}
	
	.nav-justified {
		border: 0px;
	}
	
	.nav-tabs.nav-justified>li>a {
		border-bottom: 0px;
		color: black;
		font-size: 18px;
	}
	.btn-group.btn-group-justified>a{
		color: black;
		font-size: 15px;
	}
	
	.nav-tabs.nav-justified>.active>a, .nav-tabs.nav-justified>.active>a:focus, .nav-tabs.nav-justified>.active>a:hover {
    border: 0px;
}
</style>
</head>
<body>
	<div>
		<div align="center" id="title" >
			<div style="float: left; display: inline-block; padding: 15px;">
				<a href="index.jsp" >
					<i class="fas fa-home fa-lg" style="color: #fff;"></i>
				</a>
			</div>
			<div style="display: inline-block;">
				<img src="/nullLive/resources/image/logo.png" style="width: 25px;height: 41px; padding-bottom: 35%">
			</div>
			<div style="display: inline-block;">
				<a style=" text-shadow: 3px 3px 2px #6f8e3085; font-size: 30px; color: #fff; cursor: pointer; " href="main.ad">
					<b>NullLive</b>
				</a>
			</div>
			<div style="float: right; display: inline-block; padding: 15px;">
				<a href="logout.me" >
					<i class="fas fa-sign-out-alt fa-lg" style="color: #fff;"></i>
				</a>
			</div>
		</div>
	</div>
	<br>
<div class="container">

  <ul class="nav nav-tabs nav-justified">
    <li><a data-toggle="tab" href="#home"><span class="glyphicon glyphicon-home"></span>&nbsp;메인</a></li>
    <li><a data-toggle="tab" href="#menu1"><i class="fas fa-users"></i>&nbsp;회원관리</a></li>
    <li><a data-toggle="tab" href="#menu2"><span class="glyphicon glyphicon-stats"></span>&nbsp;통계</a></li>
    <li><a data-toggle="tab" href="#menu3"><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;환전</a></li>
    <li><a data-toggle="tab" href="#menu4"><span class="glyphicon glyphicon-question-sign"></span>&nbsp;고객센터</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade">
      <div class="btn-group btn-group-justified">
		    <a href="main.ad" class="btn btn-link">Null Live</a>
		    <a class="btn btn-link" style="cursor: default"></a>
		    <a class="btn btn-link" style="cursor: default"></a>
		    <a class="btn btn-link" style="cursor: default"></a>
      		<a class="btn btn-link" style="cursor: default"></a>
  		</div>
    </div>
    <div id="menu1" class="tab-pane fade">
     	<div class="btn-group btn-group-justified">
		    <a href="memberList.ad" class="btn btn-link">회원관리</a>
		    <a href="streamerReportList.ad" class="btn btn-link">스트리머 신고</a>
		    <a href="memberReportList.ad" class="btn btn-link">일반회원 신고</a>
		    <a class="btn btn-link" style="cursor: default"></a>
		    <a class="btn btn-link" style="cursor: default"></a>
  		</div>
    </div>
    <div id="menu2" class="tab-pane fade">
      <div class="btn-group btn-group-justified">
    		<a class="btn btn-link" style="cursor: default"></a>
		    <a href="memberStatisticsList.ad" class="btn btn-link">회원 통합 통계</a>
		    <a href="sitesStatisticsList.ad" class="btn btn-link">사이트 통계</a>
		    <a class="btn btn-link" style="cursor: default"></a>
  		</div>
    </div>
    <div id="menu3" class="tab-pane fade">
		<div class="btn-group btn-group-justified">
			<a class="btn btn-link" style="cursor: default"></a> 
			<a class="btn btn-link" style="cursor: default"></a> 
			<a class="btn btn-link" style="cursor: default"></a> 
			<a class="btn btn-link" style="cursor: default"></a> 
			<a class="btn btn-link" style="cursor: default"></a> 
			<a href="exchangeList.ad" class="btn btn-link">회원 환전</a> 
			<a class="btn btn-link" style="cursor: default"></a> 
			<a class="btn btn-link" style="cursor: default"></a>
		</div>
	</div>
    <div id="menu4" class="tab-pane fade">
      <div class="btn-group btn-group-justified">
      	<a class="btn btn-link" style="cursor: default"></a> 
      	<a class="btn btn-link" style="cursor: default"></a> 
      	<a href="FAQList.ad" class="btn btn-link">FAQ 관리</a> 
      	<a href="noticeList.ad" class="btn btn-link">공지사항 관리</a> 
		<a href="questionList.ad" class="btn btn-link">1:1문의 관리</a>
  		</div>
    </div>
  </div>
</div>
</body>
</html>