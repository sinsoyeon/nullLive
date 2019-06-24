<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구인구직게시판 메인</title>
<style>
	.outer {
		width:900px;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
		margin-bottom: 500px;
	}
	.noticeArea2{
		padding-top : 25px;
	}
	#more{
		border: 1px solid lightgray;
		padding-left: 0px;
		padding-right: 0px; 
	}
	.boardSelectArea{
		margin-top : 50px;
		margin-bottom: 100px;
		border: 1px soild black;
	}
	.boardSelectArea:hover{
		cursor: pointer;
	}
	.test{
		border: 1px soild black;
	}
	.boardIcon{
		background: #3498db;
		height: 150px;
	}
	.boardTitle{
		background: lightgray;
		height: 220px;
	}
</style>
</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	
	<div class="outer">
		<jsp:include page="jobHeader.jsp"/>
		<div class="noticeArea col-lg-12 col-sm-12">
			<!-- 공지사항 영역 -->
			
			<div class="col-lg-2 col-md-2">
				<h3><b>공지사항</b></h3>
			 </div>  
			<div class="noticeArea2">
				<div class="col-lg-2 col-md-2" style="float: left">
					19-06-02
				</div>
				<div class="col-lg-7 col-md-7">
					[안내] 매니저 / 콘텐츠제작자
				</div>
				<div class="col-lg-1 col-md-1" id="more">
					<a onclick="jobNoticeList()"> 더보기 </a>
				</div>
			</div>
		</div>
		<br><br>
		<hr class="hr">
	
		<!-- 게시판 선택 영역 -->
		<div class="boardSelectArea">
			<!-- 매니저 게시판 선택 -->
			<div class="col-lg-1 col-md-1"></div> 
			<div id="mngBoard " class="col-lg-4 col-md-4">
				<!-- 이미지영역  -->
				<div class="boardIcon">
					
				</div>
				<!-- 글 영역 -->
				<div class="boardTitle" align="center">
					<label >
						<h3><b>매니저<br> 게시판<br></b></h3>
					</label>
					<br><br><br>
					<p>매니저를 구하거나<br>
					일하고싶은 사용자들을 위한 게시판</p>
				</div>
			</div>
			<div class="col-lg-2 col-md-2"></div>
			<!-- 콘텐츠 제작자 게시판 선택 -->
			<div id="conBoard" class="col-lg-4 col-md-4">
				<div class="boardIcon">
				</div>
				<div class="boardTitle" align="center">
					<label>
						<h3><b>콘텐츠<br>제작자<br>게시판</b></h3>
					</label>
					<br><br>
					<p>콘텐츠 제작자를 구하거나<br>
					일하고싶은 사용자들을 위한 게시판</p>
				</div>
			</div>
			<div class="col-lg-1 col-md-1"></div>
		</div>
	</div>
	<script>
		console.log(location.href)
	</script>
	<script>
		/*  매니저 게시판 이동 */
		$("#mngBoard").click(function() {
			console.log("매니저");
			location.href="jobMngList.jbo";
		});
		/*  콘텐츠제작자 게시판 이동 */
		$("#conBoard").click(function(){
			location.href="jobContentList.jbo";
		});

	</script>
</body>
</html>