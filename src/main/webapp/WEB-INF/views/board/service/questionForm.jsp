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
.qbtn{
    color: #fff;
    background-color: #3790dc;
    border-color: #3790dc;
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
					<b>1:1 문의하기</b>
				</h2>
				<br>
				<p style="color: #999;">
					도움말을 통해 충분한 답변이 되지 못한 분들께<br>
					1:1문의를 통해 자세한 답변을 드리고 있습니다.
				</p>
			</div>
			<div class="col-md-7">
				<img alt="question"
					src="/nullLive/resources/image/question.PNG" style=" width: 100%; "/>
			</div>
		</div>
		<div class="row" style=" background: #faebd7a6; padding: 5%; height: 528px;">
			<div class="col-md-12">
				<form role="form">
					<div class="form-group">

						<label for="qType"> 문의유형 </label> 
						<div class="dropdown">

							<button class="btn btn-default dropdown-toggle" type="button"
								id="qType" data-toggle="dropdown" style=" width: 40%; ">------------- 문의유형선택 -------------<span class="caret" style="float: right;margin-top: 2.5%;"></span></button>
							<ul class="dropdown-menu" style=" left: 20%; width: 40%; ">
								<li><a href="#">회원정보</a></li>
								<li><a href="#">방송/시청하기</a></li>
								<li><a href="#">선물/후원</a></li>
								<li><a href="#">결제</a></li>
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

						<label for="qTitle"> 제목 </label> <input
							type="text" class="form-control" id="qTitle" style=" width: 80%; "/>
					</div>
					<div class="form-group">

						<label for="qContent"> 내용 </label> 
						<textarea rows="6" cols="30" class="form-control" id="qContent" style=" width: 80%; resize: none; " placeholder="문의내용을 상세히 적어 주시면 감사하겠습니다."></textarea>
					</div>
					<div class="form-group">
						<label for="qInputFile"> 첨부파일 </label> <input
							type="file" class="form-control-file" id="qInputFile" />
					</div>
					
					<button type="submit" class="btn pull-right qbtn" style=" margin-left: 1%; ">확인</button>
					<button type="button" class="btn pull-right qbtn" onclick="location.href='serviceMain.bo'">취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>