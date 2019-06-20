<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	<h1 align="center">공지사항</h1>
	<hr>
	
	<!-- 작성 영역 -->
	<div class="outer">
		<div class="">
			<h2>공지사항 작성</h2>
			<form id="form" action="insertJobNotice.bd">
				<!-- 제목영역 -->
				<div>
					<!-- 제목 -->
					<div>
						<h3>제목 </h3>
						<input class="col-lg-12 col-md-12 col-sm-8" id="bTitle" name="bTitle" type="text" placeholder="제목을 입력하세요">
					</div>
					<br>
				</div>
				<!-- 내용영역 -->
				<div class="contentArea">
					<h3>내용 </h3>
					<textarea class="col-lg-12 col-md-12 col-sm-8" id="bContent" name="bContent" rows="30" required placeholder="내용을 입력해 주세요"></textarea>
				</div>
				<br>
				<!-- 첨부파일 영역 -->
				<div>
					<h3>첨부파일</h3>
					<input type="file">
					<input type="file">
				</div>
				<br>
				<div align="center">
					<button type="submit" role="form" method="post" class="btn">등록하기</button>
					<button onclick="location='jobNoticeList.bd'">돌아가기</button>
				</div>
			</form>
			<!-- 하단 버튼영역 -->

		</div>
	</div>
	
	<!-- <script>
		ClassicEditor.create(document.querySelector('#bContent'))
	</script> -->
	<!--  -->
	
</body>
</html>