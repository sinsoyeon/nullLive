<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.questionContext{
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
 form .answertData{
 visibility :  hidden;
 }
 .btn.btn-success{
	padding-top: 2px;
    padding-bottom: 2px;
    margin-bottom: 2px;
}
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>

	<h1 align="center">공지사항 관리</h1>
	<hr>
	<h3 align="center">공지사항 작성</h3>
	<div class="row" align="center">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div align="right" style="margin-bottom: 5px;">
				<br>
			</div>
			<div id="contentBackground">
				<div id="titleBar" style="text-align: center;">
					<input id='insertTitle' type="text" style="color:black; width: 70%; border-top:0px; border-left: 0px; border-right: 0px;" placeholder='제목을 입력하세요' autofocus>
				</div>
				
				<br>
				<div id="inContent">
				<br>
					<br>
					<div style="padding-bottom: 20px; padding-left: 50px; padding-right: 50px;">
						<textarea id='insertContent' autofocus placeholder='내용을 입력하세요'></textarea>	
					</div>
					<div style="padding-bottom: 50px; padding-left: 50px; padding-right: 50px;">
						<input type="button" style="float: left;" onclick="history.back();" value='뒤로가기' class="btn btn-success">
						<button style="float: right;" onclick="insertNotice()" class="btn btn-success">등록</button> 
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
	$('#menu4 a:eq(3)').css('font-weight','bold');
	setTimeout(function() { 
		$('html, body').animate({ scrollTop: $(document).height()},2000);
		}, 120)
        
});

function insertNotice() {
	
	var bTitle = $("#insertTitle").val();
	var bContent = $("#insertContent").val();
	
	if(bTitle != '' && bContent != ''){
		location.href='insertNotice.ad?bTitle='+bTitle+'&bContent='+bContent
	}else{
		alert("모든 내용을 기입하지 않았습니다. 다시 확인해주세요.");
	}
	
	
	
};
</script>
</html>