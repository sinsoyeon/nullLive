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

.qustionContext{
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
 form input{
 visibility :  hidden;
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
				<div id="titleBar">${questionContent.BTitle }</div>
				<br>
				<div id="inContent">
				
				<div class="row" align="center"	style="font-weight: bold; font-size: 15px; border-bottom: 1px solid lightgray; width:95% ">
					<div class="col-sm-4">구분</div>
					<div class="col-sm-4">회원 이름</div>
					<div class="col-sm-4">문의 날짜</div>
				</div>
				
				<div class="row" align="center" style="width:95% ">
					<div class="col-sm-4">${questionContent.qustionType }</div>
					<div class="col-sm-4">${questionContent.name }</div>
					<div class="col-sm-4">${questionContent.WDate }</div>
				</div>
					<div style="padding: 3%;">
						<div class="qustionContext"><br><p>${questionContent.BContent }</p><br></div>
						<br>
						<hr style="border: none; border-top: 3px dotted gray; color: #fff; height: 1px; width: 98%;">
						<c:if test="${questionContent.BStatus eq 4 }">
							<div align="left">
								<p>답변 작성</p>
							</div>
							<br>
							<form action="questionAnswer.ad" method="post"
								id='questionAnswer'>
								<textarea id='answer' name='bContent'></textarea>
								<div style="padding: 3%;">
									<button style="float: left;" onclick="location.href='questionList.ad'">뒤로가기</button>
									
									<input name='bTitle' value="${questionContent.BTitle }">
									<input name='qustionType' value="${questionContent.qustionType }"> 
									<input name='bno' value="${questionContent.bno }">
									
									<button style="float: right;" onclick="return questionAnswer()">답변보내기</button>

								</div>
							</form>
						</c:if>
						<c:if test="${questionContent.BStatus eq 3 }">
							<div align="left">
								<p>완료된 답변</p>
							</div>
							<br>
							<div class="qustionContext"><br><p>${questionContent.answer }</p><br></div>
							<div style="padding: 3%;">
							<button style="float: left;" onclick="location.href='questionList.ad'">뒤로가기</button>
						</div>
						</c:if>
						
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

function questionAnswer() {
	var ok =confirm("확인을 누르면 답변이 전송됩니다.");
	if(ok){
		alert("답변이 완료되었습니다.");
		$("#questionAnswer").submit();
	}else{
		alert("취소되었습니다.");
	}
	return false;
}

</script>
</html>