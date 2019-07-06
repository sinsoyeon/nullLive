<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="fileDiv">
		<p>
			<input class="form-control" type="file" id="file" name="file_0">
			<a href="#this" class="btn" id="delete" name="delete">삭제</a>
			<input class="form-control" type="file" id="file" name="file_1">
			<a href="#this" class="btn" id="delete" name="delete">삭제</a>
			<input class="form-control" type="file" id="file" name="file_2">
			<a href="#this" class="btn" id="delete" name="delete">삭제</a>
			<input class="form-control" type="file" id="file" name="file_3">
			<a href="#this" class="btn" id="delete" name="delete">삭제</a>
		</p>
	</div>
	
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
		var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>"; 
		$("#fileDiv").append(str); 
		
	}
	function fn_deleteFile(obj){ 
		obj.parent().remove(); 
	}
	</script>
</body>
</html>