<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<form role="form">
					<div class="form-group">

						<label for="rType"> 신고유형 </label> 
						<div class="dropdown">

							<button class="btn btn-default dropdown-toggle" type="button"
								id="rType" data-toggle="dropdown" style=" width: 40%; ">------------- 신고유형선택 -------------<span class="caret" style="float: right;margin-top: 2.5%;"></span></button>
							<ul class="dropdown-menu" style=" left: 20%; width: 40%; ">
								<li><a href="#">저작권 침해</a></li>
								<li><a href="#">청소년 유해</a></li>
								<li><a href="#">불법/음란</a></li>
								<li><a href="#">명예훼손</a></li>
								<li><a href="#">기타</a></li>
							</ul>
						</div>
					</div>
					<div class="form-group">

						<label for="userId"> 아이디 </label> <input
							type="text" class="form-control" id="userId" style=" width: 40%; "/>
					</div>
					<div class="form-group">

						<label for="email"> 이메일 </label> <input
							type="email" class="form-control" id="email" style=" width: 40%; "/>
					</div>
					<div class="form-group">

						<label for="rTitle"> 제목 </label> <input
							type="text" class="form-control" id="rTitle" style=" width: 80%; "/>
					</div>
					<div class="form-group">

						<label for="rContent"> 내용 </label> 
						<textarea rows="6" cols="30" class="form-control" id="rContent" style=" width: 80%; resize: none; " placeholder="신고내용을 상세히 적어 주시면 감사하겠습니다."></textarea>
					</div>
					<div class="form-group">
						<label for="rInputFile"> 첨부파일 </label> <input
							type="file" class="form-control-file" id="rInputFile" />
					</div>
					
					<button type="submit" class="btn pull-right rbtn" style=" margin-left: 1%; ">확인</button>
					<button type="button" class="btn pull-right rbtn" onclick="location.href='serviceMain.bo'">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>