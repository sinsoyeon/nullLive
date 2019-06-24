<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
		padding-top : 50px;
		padding-bottom : 50px;
		margin-left: auto;
		margin-right: auto;
		border: solid 1px black;
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
	
	<!-- 공지 상세 보기 -->
	<div class="outer">
		<!-- 제목영역 -->
		<div>
			<!-- 제목 -->
			<div>
				<div class="dateArea">
					<b>${ board.writtenDate }</b>
				</div>
				<h3><b>${ board.btitle }</b></h3>
			</div>
			<br>
		</div>
		<!-- 내용영역 -->
		<div class="contentArea">
			${ board.bcontent }
		</div>
		<br>
		<!-- 첨부파일 영역 -->
		
		<div>
			<label>첨부파일</label>
		</div>
		
		
		<!-- 하단 버튼영역 -->
		<div align="center">
			<button onclick="location.href='#'">수정하기</button>
			<button onclick="location.href='jobNoticeList.jsp'">목록으로</button>
		</div>
	</div>
	
	
</body>
</html>