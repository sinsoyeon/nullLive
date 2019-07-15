<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- ckeditor -->
<script type="text/javascript" src="${ contextPath }/resources/ckeditor/ckeditor.js"></script>
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
	<!-- 로그인 유저 처리 -->
	<c:if test="${ empty loginUser }">
		<jsp:forward page="../../member/needLogin.jsp"/>
	</c:if>
	<jsp:include page="jobMenubar.jsp"/>
	<h1 align="center">매니저 구인구직게시판</h1>
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
					<!-- 제목 -->
					<div>
						<h3>제목 </h3>
						<input class="form-control col-lg-12 col-md-12 col-sm-8" type="text" name="bTitle" id="bTitle" placeholder="제목을 입력하세요">
						<!-- 글쓴이 -->
						<input type="hidden" name="bWriter" value="${ loginUser.mno }" id="mno">
						<!-- 구인구직타입 -->
						<input type="hidden" name="bType" value="JOBMNG">
						<!-- 직종 -->
						<input type="hidden" name="job" value="매니저">
						<!-- 매니저는 계약조건이 없음 -->
						<input type="hidden" name="contContent" value="EMPTY">
					</div>
					<br><br><br>
					<!-- 마감일 -->
					<div>
						<h3>마감일</h3>
						<input class="form-control" id="deadLine" type="date" name="deadLine"> 
					</div>
					<br>
				</div>
				<h3>내용 </h3>
				<!-- 내용영역 -->
				<div class="contentArea">
					 <textarea name="bContent" id="editor" required placeholder="내용을입력하세요(4자이상)" wrap="hard" style="width: 880px; height: 400px;"></textarea>
				</div>
				<br>
				<!-- 첨부파일 영역 -->
					<h3>첨부파일</h3>
					<jsp:include page="attachmentForm.jsp"/>
				<br>
				<!-- 하단 버튼영역 -->
				<div align="center">
					<input type="button" id="save" value="등록하기" class="btn">
					<button class="btn" onclick="location='jobMngList.jbo'">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
	
	
	
</body>
<script type="text/javascript">
	    $(function(){
	        $("#save").click(function(){ 
				var bTitle = $("#bTitle").val();        	
				if(bTitle==""){
					alert("제목을 입력해주세요");
					return;
				}
				var jBtype = $("#jBtype").val();
				console.log(jBtype);
				
				if(jBtype =="구인"){
					var mno = $("#mno").val();
					console.log(mno);
					$.ajax({
						url: "selectStreamerCheck.jbo",
						type: "get",
						data: {mno:mno},
						success: function(data){
							if(data.Streamer == "" || data.Streamer == null){
								alert("스트리머만 구인글을 등록할 수 있습니다");
								return;
							}else {
								$("#insertBoardFrm").submit();
							}
						}
					})
				}else {
					$("#insertBoardFrm").submit();
				}
				
				
			})
	    });
	    //에디터 
	    var editorConfig = {
	   		uploadUrl: "${pageContext.request.contextPath }/fileupload.jbo",
	   	    filebrowserUploadUrl : "${pageContext.request.contextPath }/fileupload.jbo", //이미지만 업로드
	   	    extraPlugins : 'uploadimage',
	   };
	    CKEDITOR.editorConfig = function(config) {
    	  
    	  config.extraPlugins = 'inserthtml';
    	  config.toolbar = 'Basic';
    	}
	   	    
	   	    
	   CKEDITOR.on('dialogDefinition', function( ev ){
	   	   var dialogName = ev.data.name;
	   	   var dialogDefinition = ev.data.definition;
	
	   	   switch (dialogName) {
	   	       case 'image': //Image Properties dialog
	   	   //dialogDefinition.removeContents('info');
	   	   dialogDefinition.removeContents('Link');
	   	   dialogDefinition.removeContents('advanced');
	   	           break;
	   	       }
	   	});
	
   	  	 window.onload = function(){
   	        ck = CKEDITOR.replace("editor", editorConfig);
   	   	};
	    
	    
       
	</script>



</html>