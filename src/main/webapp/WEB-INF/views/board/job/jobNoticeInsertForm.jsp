<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
	<jsp:include page="contentInsertForm.jsp"/>
	<h1 align="center">공지사항</h1>
	<hr>
	
	<!-- 작성 영역 -->
	<div class="outer">
		<div class="">
			<h2>공지사항 작성</h2>	
			 <form action="insertBoard.jbo" method="post" id="insertBoardFrm" >
				<!-- 제목영역 -->
				<div>
					<!-- 제목 -->
					<div>
						<h3>제목 </h3>
						<input class="form-control col-lg-12 col-md-12 col-sm-8" id="bTitle" name="bTitle" type="text"  required  placeholder="제목을 입력하세요">
						<!-- 임시 게시글 작성자 -->
						<input type="hidden" name="bWriter" value="${ loginUser.mno }">
						<input type="hidden" name="bType" value="JOBNOTICE">
					</div>
					<br>
				</div>
				<!-- 내용 -->
				<h3>내용 </h3>
				
				<div class="contentArea">
					<textarea name="bContent" id="editor" required placeholder="내용을입력하세요(4자이상)"  style="width: 880px; height: 400px;"></textarea>
				</div>
				
				<br>
				<!-- 첨부파일 영역 -->
				<h3>첨부파일</h3>
				<jsp:include page="attachmentForm.jsp"/>
				
				
				<br>
				<div align="center">
					<input type="button" id="save" value="등록하기" class="btn">
					<button class="btn" onclick="location='jobNoticeList.jbo'">돌아가기</button>
				</div>
			</form>

		</div>
	</div>
</body>
</html>

