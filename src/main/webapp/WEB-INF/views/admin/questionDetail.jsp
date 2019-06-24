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

#qustionContext{
	background: white;
	border: 1px solid lightgray;
	border-radius: 5px 5px 5px 5px;
	box-shadow: 3px 5px 7px -4px grey inset;
	text-align: left;
	padding-left: 3%;
}
 textarea{
     margin: 0px;
    width: 98%;
    height: 150px;
    resize: none;
 }
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>

	<h1 align="center">1:1문의 관리</h1>
	<hr>
	<h3 align="center">1:1문의 처리</h3>
	<div class="row" align="center">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div align="right" style="margin-bottom: 5px;">
				<br>
			</div>
			<div id="contentBackground">
				<div id="titleBar">방송도중 개인정보 노출</div>
				<br>
				<div id="inContent">
				
				<div class="row" align="center"	style="font-weight: bold; font-size: 15px; border-bottom: 1px solid lightgray; width:95% ">
					<div class="col-sm-6">회원 이름</div>
					<div class="col-sm-6">문의 날짜</div>
				</div>
				
				<div class="row" align="center" style="width:95% ">
					<div class="col-sm-6">송상영</div>
					<div class="col-sm-6">2019.06.24</div>
				</div>
					<div style="padding: 3%;">
						<div id="qustionContext"><br><p>방송도중 개인정보를 노출시켰습니다...어쩌죠...</p><br></div>
						<br>
						<hr style="border: none; border-top: 3px dotted gray; color: #fff; height: 1px; width: 98%;">
						<div align="left"><p>답변 작성</p></div>
						<br>
						<textarea></textarea>
						<div style="padding: 3%;">
							<button style="float: left;" onclick="location.href='questionList.ad'">뒤로가기</button>
							<button style="float: right;">답변</button>
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
	$('li:eq(4)').addClass('active');
	$('#menu4').addClass('active in');
	$('#menu4 a:eq(4)').css('font-weight','bold');
})
</script>
</html>