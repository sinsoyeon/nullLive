<%@page import="org.apache.maven.model.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>

<style>

	.outer {
		width:900px;
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
	.ContractContentArea{
		margin-bottom: 20px;
	}
</style>

</head>
<body>
	<!-- 로그인 유저 처리 -->
	<c:if test="${ empty loginUser }">
		<jsp:forward page="../../member/needLogin.jsp"/>
	</c:if>
	
	<jsp:include page="jobMenubar.jsp"/>
	<h1 align="center">콘텐츠제작자 구인구직게시판</h1>
	<hr>
	
	<!-- 작성 영역 -->
	<div class="outer">
		<div class="">
			<h2>구인구직</h2>
			<form action=insertJobBoard.jbo method="post" id="insertBoardFrm" enctype="multipart/form-data">
				<!-- 제목영역 -->
				<div>
					<!-- 구인구직 유형 -->
					<div>
						<select class="form-control" name="jBtype" id="jBtype">
							<option value="구인">구인</option>
							<option value="구직">구직</option>
						</select>
					</div>
					<div>
						<select class="form-control" name="job">
							<option value="편집자">편집자</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<!-- 제목 -->
					<div>
						<h3>제목 </h3>
						<input class="form-control col-lg-12 col-md-12 col-sm-8" type="text" name="bTitle" placeholder="제목을 입력하세요">
						<!-- 글쓴이 -->
						<input type="hidden" id="mno" name="bWriter" value="${ loginUser.mno }">
						<!-- 구인구직타입 -->
						<input type="hidden" name="bType" value="JOBCON">
					</div>
					<br><br><br>
					<!-- 마감일 -->
					<div>
						<h3>마감일</h3>
						<input class="form-control" type="date" name="deadLine"> 
					</div>
					<div>
						<h3>건당 포인트</h3>
						<input type="number" name="perprice" min="100" max="1000000">포인트
					</div>
					<br>
				</div>
				<!-- 계약내용 -->
				<div class="ContractContentArea">
					<h3>계약내용</h3>
					<textarea class="form-control col-lg-12 col-md-12 col-sm-8" wrap="hard" id="contContent" name="contContent" rows="5" required placeholder="ex)10분 영상 편집 기준 건당 0000포인트"></textarea>
					<p>* 계약 내용은 상세히 작성해 주시기 바랍니다.</p>
				</div>
				
				<!-- 내용영역 -->
				<div class="contentArea">
					<h3>내용</h3>
					<textarea name="bContent" id="editor" wrap="hard" required placeholder="내용을입력하세요(4자이상)"  style="width: 880px; height: 400px;"></textarea>
				</div>
				<br>
				<!-- 첨부파일 영역 -->
				<div>
					<h3>첨부파일</h3>
					<jsp:include page="attachmentForm.jsp"/>
				</div>
				<br>
				<!-- 하단 버튼영역 -->
				<div align="center">
					<input type="button" id="save" value="등록하기" class="btn">
					<button class="btn" onclick="location='jobContentList.jbo'">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
	
	
</body>
<script type="text/javascript">
	    $(function(){
	        var obj = [];              
	        nhn.husky.EZCreator.createInIFrame({
	            oAppRef: obj,
	            elPlaceHolder: "editor",
	            sSkinURI: "./resources/editor/SmartEditor2Skin.html",
	            htParams : {
	                bUseToolbar : true,            
	                bUseVerticalResizer : true,    
	                bUseModeChanger : true,
	            }
	        });
	        $("#save").click(function(){ 
				var bTitle = $("#bTitle").val();
				var contContent = $("#contContent").prop("textLength");
				
				var jBtype = $("#jBtype").val();
				console.log(jBtype);
			
				
				if(bTitle==""){
					alert("제목을 입력해주세요");
					return;
				}
				console.log(contContent);
				if(contContent=="" || contContent<=10){
					alert("계약내용을 10자 이상 입력해주세요");
					return;
				}
				
				
				if(jBtype =="구인"){
					var mno = $("#mno").val();
					$.ajax({
						url: "selectStreamerCheck.jbo",
						type: "get",
						data: {mno:mno},
						success: function(data){
							if(data.Streamer == "" || data.Streamer == null){
								alert("스트리머만 구인글을 등록할 수 있습니다");
								return;
							}else {
								obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []); 
								$("#insertBoardFrm").submit();
							}
						}
					})
				}else {
					obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []); 
					$("#insertBoardFrm").submit();
				}
			})
	    });
	</script>
</html>