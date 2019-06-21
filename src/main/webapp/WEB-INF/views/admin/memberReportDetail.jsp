<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
<style>
#contentBackground {
	background: white;
	padding: 3%;
}

#titleBar {
	background: #438c31;
	color: white;
	font-weight: bold;
	font-size: 20px;
	padding: 1%;
	padding-left: 4%;
	border-radius: 7px 7px 7px 7px;
	text-align: left;
	width: 95%;
}

#inContent {
	background: #f6f8fa;
	border-radius: 5px 5px 5px 5px;
	width: 95%;
}

#reportContext {
	background: white;
	border: 1px solid lightgray;
	border-radius: 5px 5px 5px 5px;
	box-shadow: 3px 5px 7px -4px grey inset;
	text-align: left;
	padding-left: 3%;
}
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>

	<h1 align="center">일반회원 신고 관리</h1>
	<h3 align="center">일반회원 신고 처리</h3>
	<div class="row" align="center">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div align="right" style="margin-bottom: 5px;">
				<br>
			</div>
			<div id="contentBackground">
				<div id="titleBar">이사람이 명예훼손 합니다.</div>
				<br>
				<div id="inContent">
				
				<div class="row" align="center"	style="font-weight: bold; font-size: 15px; border-bottom: 1px solid lightgray; width:95% ">
					<div class="col-sm-3">구분</div>
					<div class="col-sm-3">신고자 아이디</div>
					<div class="col-sm-3">해당 회원 아이디</div>
					<div class="col-sm-3">신고 날짜</div>
				</div>
				
				<div class="row" align="center" style="width:95% ">
					<div class="col-sm-3">명예훼손</div>
					<div class="col-sm-3">bbashong</div>
					<div class="col-sm-3">user02</div>
					<div class="col-sm-3">2019.06.21</div>
				</div>
					<div style="padding: 3%;">
						<div id="reportContext"><br><p>기분 드럽네요</p><br></div>
						<div style="padding: 3%;">
							<button style="float: left;" onclick="location.href='memberReportList.ad'">뒤로가기</button>
							<button style="float: right;">처리</button>
							<select style="float: right;">
								<option>영구 정지</option>
								<option>90일 정지</option>
								<option>60일 정지</option>
								<option>30일 정지</option>
								<option>부적합</option>
							</select> 
						</div>
					</div>
					
				</div>
			</div>


		</div>
		<div class="col-sm-1"></div>
	</div>

</body>
<script>
$(function() {
	$('li:eq(1)').addClass('active');
	$('#menu1').addClass('active in');
	$('#menu1 a:eq(2)').css('font-weight','bold');
})
</script>
</html>