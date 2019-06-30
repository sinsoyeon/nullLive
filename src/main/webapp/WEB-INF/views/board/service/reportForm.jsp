<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body::-webkit-scrollbar {
   display: none;
}
.form-group {
	float:left;
	width:100%;
}
label{
	float:left;
	width:20%;
}
.rbtn{
    color: #fff;
    background-color: #f35855;
    border-color: #f35855;
    width: 10%;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="serviceMenubar.jsp" />
	</header>
	<div class="container-fluid" style="padding-right: 30px; padding-left: 30px; padding-top: 15px;">
		<div class="row">
			<div class="col-md-5">
				<h2 style="color: #8aad40;">
					<b>신고하기</b>
				</h2>
				<br>
				<p style="color: #999;">
					NullLive 서비스 이용 약관에 기존하여 서비스 운영원칙에<br>
					따라 불량 이용자 처리 규정을 정하고 있습니다.
				</p>
			</div>
			<div class="col-md-7">
				<img alt="report"
					src="/nullLive/resources/image/report.PNG" style=" width: 100%; "/>
			</div>
		</div>
		<div class="row" style=" background: #faebd7a6; padding: 5%; height: 528px;">
			<div class="col-md-12">
				<form role="form" action="insertReport.bo" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="rType">신고유형 </label>
						<select class="form-control" id="rType" name="reportType" style=" width: 40%; ">
							<option value="기타">---------------------- 신고유형선택 ----------------------</option>
							<option value="저작권 침해">저작권 침해</option>
							<option value="청소년 유해">청소년 유해</option>
							<option value="불법/음란">불법/음란</option>
							<option value="명예훼손">명예훼손</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<div class="form-group">

						<label for="rmid"> 아이디 </label> <input
							type="text" class="form-control" id="rmid" name="rmid" style=" width: 40%; " placeholder="신고할 사람의 아이디를 적어주세요."/>
					</div>
					<div class="form-group">

						<label for="email"> 이메일 </label> <input
							type="email" class="form-control" id="email" style=" width: 40%; " value="${loginUser.email }"/>
					</div>
					<div class="form-group">

						<label for="rTitle"> 제목 </label> <input
							type="text" class="form-control" id="rTitle" name="bTitle" style=" width: 80%; "/>
					</div>
					<div class="form-group">

						<label for="rContent"> 내용 </label> 
						<textarea rows="6" cols="30" class="form-control" id="rContent" name="bContent" style=" width: 80%; resize: none; " placeholder="신고내용을 상세히 적어 주시면 감사하겠습니다."></textarea>
					</div>
					<div class="form-group">
						<label for="rInputFile"> 첨부파일 </label> <input
							type="file" class="form-control-file" id="rInputFile" name="rFile"/>
					</div>
					
					<button type="submit" class="btn pull-right rbtn" style=" margin-left: 1%; ">확인</button>
					<button type="button" class="btn pull-right rbtn" onclick="location.href='serviceMain.bo'">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>