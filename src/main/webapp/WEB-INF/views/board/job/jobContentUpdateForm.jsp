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

<script type="text/javascript" src="${ contextPath }/resources/ckeditor/ckeditor.js"></script>

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
	
	.tdHeader {
	  width   : 180px;
	  height  : 20px;   
	  position: relative;
	  z-index : 1;
	}
 
.tdHeader:before {
  margin : 10px;
  margin-left : 1px;
  content : "";
  position: absolute;
  left    : 0;
  bottom  : 0;
  height  : 25px;
  width   : 83%;
  
}
</style>

</head>
<body>
	<c:set var="board" value="${ boardMap.board }"/>
	<c:set var="jBoard" value="${ boardMap.jBoard }"/>
	<!-- 로그인 유저 처리 -->
	<c:if test="${ empty loginUser }">
		<jsp:forward page="../../member/needLogin.jsp"/>
	</c:if>
	
	<jsp:include page="jobMenubar.jsp"/>
	<h1 align="center">콘텐츠제작자 게시글 수정</h1>
	<hr>
	
	<!-- 작성 영역 -->
	<div class="outer">
		<div class="">
			<form action=updateJobConBoard.jbo method="post" id="insertBoardFrm" enctype="multipart/form-data">
				<!-- 제목영역 -->
				<div>
					<!-- 구인구직 유형 -->
					<table class="table">
						<tr>
							<td class="tdHeader">구인/구직</td>
							<td>
								<select class="form-control" name="jBtype" id="jBtype" disabled="disabled">
									<option value=""><c:out value="${ jBoard.JBtype }"></c:out></option>
								</select>
							</td>
							
						</tr>
						<tr>
							<td class="tdHeader">카테고리</td>
							<td colspan="1">
								<select class="form-control" name="job"  disabled="disabled">
									<option value="${ jBoard.job }"><c:out value="${ jBoard.job }"></c:out>  </option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdHeader"><h3>제목 </h3></td>
							<td style="vertical-align: middle;"><input class="form-control col-lg-12 col-md-12 col-sm-8" type="text" name="bTitle" value="<c:out value="${ board.BTitle }"></c:out>"  placeholder="제목을 입력하세요"></td>
							
						</tr>
						<tr>
							<td  class="tdHeader">마감일</td>
							<td>
								<input class="form-control" type="date" value='<c:out value="${ jBoard.deadLine }"/>' name="deadLine" id="deadLine" readonly="readonly"> 
							</td>
						</tr>
						<tr>
							<td class="tdHeader">건당 포인트</td>
							<td colspan="1">
								<input class="form-control" type="number" name="perprice" min="100" max="1000000" value="<c:out value="${ jBoard.perprice }"/>" placeholder="1000point">
							</td>
						</tr>
						<tr>
							<td class="tdHeader"><h3>계약내용</h3></td>
							<td>
								<textarea class="form-control" wrap="hard" id="contContent" name="contContent" rows="5" required placeholder="ex)10분 영상 편집 기준 건당 0000포인트"><c:out value="${ jBoard.contContent }"/></textarea>
								<p>* 계약 내용은 상세히 작성해 주시기 바랍니다.</p>
							</td>
						</tr>
					</table>
						
						
						<!-- 글쓴이 -->
						<input type="hidden" id="mno" name="bWriter" value="${ loginUser.mno }">
						<!-- 구인구직타입 -->
						<input type="hidden" name="bType" value="JOBCON">
						<input type="hidden" name="jbno" value="${ jBoard.jbno }">
						<input type="hidden" name="bno" value="${ board.bno }">
					<br>
				</div>
				
				<!-- 내용영역 -->
				<div class="contentArea">
					<h3>내용</h3>
					<textarea name="bContent" id="editor" wrap="hard" required placeholder="내용을입력하세요(4자이상)"  style="width: 880px; height: 400px;">
						<c:out value="${ board.BContent }"/>
					</textarea>
				</div>
				<br>
				<!-- 첨부파일 영역 -->
				<div>
					<jsp:include page="attachmentForm.jsp"/>
					
				</div>
				<br>
				<!-- 하단 버튼영역 -->
				<div align="center">
					<input type="button" id="save" value="수정하기" class="btn">
					<button class="btn" onclick="location='jobContentList.jbo'">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
	
	
</body>
<script type="text/javascript">
	    $(function(){
	    	if(${ boardMap.attList != null }){
	    		$("#fileDiv").children().last().remove();
				$("#fileDiv").children().last().remove();
				$("#fileDiv").children().last().remove();
				$("#fileDiv").children().last().remove();
	    	}
	    	$("#addFile").remove();
	    	$("#delFile").remove();
	    	<c:forEach var="att" items="${ boardMap.attList }"  >
	    		var attName = '${ att.originName }';
	    		
				gfv_count1++;
				gfv_count2++;
				var input = "<input class='form-control fileForm' disabled='disabled' type='file' id=file_"+(gfv_count1)+" name=file_"+(gfv_count1)+" style='display : none'  ' onchange='fn_sizeChk(this),fn_getName(this)'>";
				var label = '<label for=file_'+ (gfv_count2) +'><i class="fas fa-file-medical fa-3x"></i></label>';
				var span = 	'<span id="fileName">'+ attName +' </span><br>';
				$("#fileDiv").append(input); 
				$("#fileDiv").append(label); 
				$("#fileDiv").append(span); 
				console.log("gfv_count1 : " + gfv_count1);
				console.log("gfv_count2 : " + gfv_count2);
				
			</c:forEach>
			
	    	
	    	
	    	console.log($("#deadLine"));
	    	
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