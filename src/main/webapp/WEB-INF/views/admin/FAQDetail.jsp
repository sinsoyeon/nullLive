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

.questionContext {
	background: white;
	border: 1px solid lightgray;
	border-radius: 5px 5px 5px 5px;
	box-shadow: 3px 5px 7px -4px grey inset;
	text-align: left;
	padding-left: 3%;
}

textarea {
	margin: 0px;
	width: 98%;
	height: 150px;
	resize: none;
}

form .answertData {
	visibility: hidden;
}

#btnDiv {
	padding-bottom: 50px;
	padding-left: 50px;
	padding-right: 50px;
}

#modify {
	display: none;
	padding-bottom: 50px;
	padding-left: 50px;
	padding-right: 50px;
}

#modify>hr {
	border: none;
	border-top: 3px dotted gray;
	color: #fff;
	height: 1px;
	width: 98%;
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

	<h1 align="center">FAQ 관리</h1>
	<hr>
	<h3 align="center">FAQ 상세보기</h3>
	<div class="row" align="center">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div align="right" style="margin-bottom: 5px;">
				<br>
			</div>
			<div id="contentBackground">
				<div id="titleBar">${FAQDetail.BTitle }</div>
				
				<br>
				<div id="inContent">
					<div class="row" align="center"	style="font-weight: bold; font-size: 15px; border-bottom: 1px solid lightgray; width:95% ">
						<div class="col-sm-3">구분</div>
						<div class="col-sm-3">작성 날짜</div>
						<div class="col-sm-3">수정 날짜</div>
						<div class="col-sm-3">조회수</div>
					</div>
					
					<div class="row" align="center" style="width:95% ">
						<div id='nowBno' style="display: none;">${FAQDetail.bno }</div>
						<div class="col-sm-3">${FAQDetail.questionType }</div>
						<div class="col-sm-3">${FAQDetail.writtenDate }</div>
						<div class="col-sm-3">${FAQDetail.modifyDate }</div>
						<div class="col-sm-3">${FAQDetail.BCount }</div>
					</div>
					<div style="padding: 3%;">
						<div class="questionContext"><br><p>${FAQDetail.BContent }</p><br></div>
					</div>
					<div id='btnDiv'>
						<input type="button" style="float: left;"onclick="history.back();" value='뒤로가기' class="btn btn-success">
						<button style="float: right; margin-left: 10px;" onclick="deleteFAQ()" class="btn btn-success">삭제</button>
						<button style="float: right;" id='modifyBtn' data-toggle="collapse" data-target="#demo" class="btn btn-success">수정</button> 
					</div><div id="demo" class="collapse">
						<div id='modify'>
							<hr>
							<h2>수정</h2>
							<p style="float: left; margin: 1%;">제목</p>
							<input id='modifyTitle' type="text" style="float: left; margin: 1%; width : 80%;" value="${FAQDetail.BTitle }">
							<textarea id='modifyContent' autofocus>${FAQDetail.BContent }</textarea>
							<input type="button" value="적용" style="float: right;" onclick="modifyFAQ()" class="btn btn-success">
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
	$('#menu4 a:eq(2)').css('font-weight','bold');
	$("#modifyBtn").click(function() {
		$('#modify').css("display","block");
		$('html, body').animate({ scrollTop: $(document).height()},1000);
		
	})
})
function modifyFAQ() {
	var modify = confirm("정말 수정하시겠습니까?");
	if(modify){
		alert("수정되었습니다.");
		var bno = $("#nowBno").text();
		var bTitle = $("#modifyTitle").val();
		var bContent = $("#modifyContent").val();
		
		location.href='FAQModify.ad?bno='+bno+'&bTitle='+bTitle+'&bContent='+bContent
		
	}else{
		alert("취소 되었습니다.");
	}
	
}

function deleteFAQ() {
	var deleteFAQ = confirm("정말 삭제하시겠습니까? 삭제후에는 복구가 볼가능 합니다.");
	
	if(deleteFAQ){
		var bno = $("#nowBno").text();
		location.href='deleteFAQ.ad?bno='+bno
		alert("삭제되었습니다.");
	}else{
		alert("취소되었습니다.")
	}
}
</script>
</html>