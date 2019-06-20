<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

	.outer {
		width:900px;
		height:500px;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}

	.contentArea{
		margin-left: auto;
		margin-right: auto;
	}
	.dateArea {
		float: right;
	}
</style>

</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	<h1 align="center">매니저 구인구직게시판</h1>
	<hr>
	
	<!-- 작성 영역 -->
	<div class="outer">
		<div class="">
			<h2>구인구직</h2>
			<!-- 제목영역 -->
			<div>
				<!-- 구인구직 유형 -->
				<div>
					<select>
						<option>구인</option>
						<option>구직</option>
					</select>
				</div>
				<!-- 제목 -->
				<div>
					<h3>제목 </h3>
					<input class="col-lg-12 col-md-12 col-sm-8" type="text" placeholder="제목을 입력하세요">
				</div>
				<br><br><br>
				<!-- 마감일 -->
				<div>
					<h3>마감일</h3>
					<input type="date"> 
				</div>
				<br>
			</div>
			<!-- 내용영역 -->
			<div class="contentArea">
				<h3>내용 </h3>
				<textarea class="col-lg-12 col-md-12 col-sm-8" rows="30" required placeholder="내용을 입력해 주세요"></textarea>
			</div>
			<br>
			<!-- 첨부파일 영역 -->
			<div>
				<h3>첨부파일</h3>
				<input type="file">
				<input type="file">
			</div>
			<br>
			<!-- 하단 버튼영역 -->
			<div align="center">
				<button>등록하기</button>
				<button onclick="location='jobMngList.jsp'">돌아가기</button>
			</div>
		</div>
	</div>
	
	
</body>
</html>