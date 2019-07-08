<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	#fileDiv{
	}
	.fileForm{
		width : 250px;
		height: 35px;

	}
</style>
<body>
	<div id="fileDiv">
		<input class="form-control fileForm" type="file" id="file" name="file_0">		
	</div>
	<a href=fn_deleteFile() class='btn' name='delete'>삭제</a>
	<a href="#this" class="btn" id="addFile">파일 추가</a>
	<script>
	var gfv_count = 1;
	$(function(){	
		$("#addFile").on("click",function(e){
			e.preventDefault(); 
			fn_addFile();
		})
		
		//삭제 버튼 
		$("a[name='delete']").on("click", function(e){ 
			e.preventDefault(); 
			fn_deleteFile($(this));
		}); 
	})
	function fn_addFile(){ 
		var str = "<input class='form-control fileForm' type='file' name='file_'+(gfv_count++)+'>";
					/* <a href='#this' class='btn' name='delete'>삭제</a>";  */
		$("#fileDiv").append(str); 
		
	}
	function fn_deleteFile(){
		if( 1 < ($("#fileDiv").children().length)){
			$("#fileDiv").children().last().remove();
		}

	}
	</script>
</body>
</html>