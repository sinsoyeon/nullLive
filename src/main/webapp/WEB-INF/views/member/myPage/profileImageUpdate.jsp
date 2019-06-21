<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
	현재 : <img src="${contextPath}/resources/uploadFiles/${changeName}" alt="${contextPath}/resources/image/profile_sample.PNG"/>
	<div onclick="change();">
	파일 : <img id="fileImage" width="150px" height="180px"/>
	</div>
	<div style="display:none">
		<form id="proImgForm" method="post" enctype="multipart/form-data">
			<input type="text" name="mid" value="${loginUser.mid}"/>
			<input type="file" id="proImgFile" name="proImgFile"/>
		</form>
	</div>
	<button type="button" class="form-control btn btn-primary" onclick="changeProImg()">변경</button>
</body>
<script>
$(function() {
    $("#proImgFile").on('change', function(){
        readURL(this);
    });
});

function change(){
	$("#proImgFile").click();
}

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#fileImage').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}

function changeProImg(){
	$("#proImgForm").attr("action","modifyProImage.me").submit();
}
</script>
</html>