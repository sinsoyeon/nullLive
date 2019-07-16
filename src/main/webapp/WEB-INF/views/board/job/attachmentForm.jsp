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
		display: none;
	}
</style>
<body>
	<div id="fileDiv">
		<input class="form-control fileForm" type="file" id="file" name="file" style="display: none;" onchange="fn_sizeChk(this),fn_getName(this)">		
		<label for="file"><i class="fas fa-file-medical fa-3x"></i></label>
		<span class="fileName"></span><br>
	</div>
	<a href=fn_deleteFile() class='btn' name='delete' id="delFile">삭제</a>
	<a href="#this" class="btn" id="addFile">파일 추가</a>
	<script>
	var gfv_count1 = 1;
	var gfv_count2 = 1;

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
		if(gfv_count1 >= 4){
			alert("첨부파일은 4개이상 첨부하실 수 없습니다");
			return;
		}
		gfv_count1++;
		gfv_count2++;
		var input = "<input class='form-control fileForm'  type='file' id=file_"+(gfv_count1)+"  name=file_"+(gfv_count1)+"  style='display: none;'  onchange='fn_sizeChk(this),fn_getName(this)'>";
		var label = '<label for=file_'+ (gfv_count2) +'><i class="fas fa-file-medical fa-3x"></i></label>';
		var span = 	'<span id="fileName"></span><br>';
		$("#fileDiv").append(input); 
		$("#fileDiv").append(label); 
		$("#fileDiv").append(span); 
		console.log("gfv_count1 : " + gfv_count1);
		console.log("gfv_count2 : " + gfv_count2);
		
		
	}
	function fn_deleteFile(){
		if( 4 < ($("#fileDiv").children().length)){
			$("#fileDiv").children().last().remove();
			$("#fileDiv").children().last().remove();
			$("#fileDiv").children().last().remove();
			$("#fileDiv").children().last().remove();
			gfv_count1--;
			gfv_count2--;
			console.log("gfv_count1 : " + gfv_count1);
			console.log("gfv_count2 : " + gfv_count2);
		}

	}
	function fn_sizeChk(obj){
		console.log($(obj));
		var maxSize = 20971520;
		var size =obj.files[0].size;
		
		if(maxSize < size){
			alert("20MB 이상은 업로드 하실 수 없습니다.");
			$(obj).val("");
		}
	}
	function fn_getName(obj){
		
		
		$(".fileForm").each(function(i){
			var fileValue = $(this).val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명
			console.log($(this).parent().find("span:eq("+i+")").prop("textContent",fileName));
		})	

	}
/* 	$("input[name='file']").change(function(){
		console.log("dd");
		console.log(this)
	}) */
	</script>
</body>
</html>