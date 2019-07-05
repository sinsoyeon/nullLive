<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/streamer/broadSetting.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">

			<!-- sidebar -->
			<div class="col-sm-3">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>

			<!-- main content -->
			<div class="col-sm-9 main" style="padding-top: 80px;">
				<div class="head">
					<h3 style="font-weight:bold; font-size:30px;">방송 기능 설정</h3>
				</div>
				<hr>
				<div class="col-sm-6">
					<label>방송 제목</label><br>
					<div class="ui input">
						<input type="text" id="bTitle" placeholder="${broadCenter.broadTitle}"/>
					</div>
					<br> <br> 
					<label>방송 카테고리</label><br>
					<div class="ui input">
						<input type="text" id="bCategory"  placeholder="${broadCenter.broadCategory}"/>
					</div>
					<br> <br> 
					<label>방송 속성</label><br> 
					<input type="radio" id="bAdult" name="bAdult"/> <span>연령 제한 방송</span><br> 
					<input type="radio" id="bPwdCheck" name="bPwdCheck"/> <span>패스워드 설정</span>
					<div class="ui input" style="width: 130px;">
						<input type="text" id="bPwd" placeholder="${broadCenter.broadPwd}"/>
					</div>
					<br> <br> 
					<label>방송 종료 멘트</label><br>
					<div class="ui input" style="height: 100px;">
						<input type="text" id="bEndingComment" placeholder="${broadCenter.endingComment}"/>
					</div>
					<br> <br> 
					<label>다시보기 자동 저장</label><br> 
					<input type="radio" id="autoSave"/> <span>사용 함</span> 
					<input type="radio" /> <span>사용 안 함</span><br> <br> 
					<label>호스팅 사용</label><br> 
					<input type="radio" /> <span>사용 함</span> 
					<input type="radio" /> <span>사용 안 함</span>
				</div>
				<div class="col-sm-6" style="padding-left:5%;">
				<br><br><br><br>
					<h3>방송 정보</h3>
					<div class="broadInfo">
						<table>
							<tr>
								<td>방송 상태: </td>
								<td>방송 전</td>
							</tr>
							<tr>
								<td>방송 시간: </td>
								<td>-</td>
							</tr>
							<tr>
								<td>현재 시청자: </td>
								<td></td>
							</tr>
							<tr>
								<td>누적 시청자: </td>
								<td></td>
							</tr>
							
						</table>
					</div><br><br><br>
					<h3>인코더 설정</h3>
					<div class="broadEncoder">
						<table>
							<tr>
								<td>스트리밍 고유 번호: </td>
								<td>*******</td>
							</tr>
							<tr>
								<td>서버 URL: </td>
								<td>www.null-live/bbashong.tv</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
				<button class="ui green button" id="updateBtn">업데이트</button>
		</div>
	</div>
	
	
<!-- 
<script>
$("#updateBtn").click(function(){
	var bTitle = $("#bTitle").val();
	var bCategory = $("#bCategory").val();
	var bAdult = $('input:radio[name=bAdult]').is(':checked');
	var bPwdCheck = $('input:radio[name=bPwdCheck]').is(':checked');
	var bPwd = $("#bPwd").val();
	var bEndingComment = $("#bEndingComment").val();
	
	var obj = new Object();
	obj.bTitle = $("#bTitle").val();
	obj.bCategory = $("#bCategory").val();
	obj.bPwd = $("#bPwd").val();
	obj.bEndingComment = $("#bEndingComment").val();

	var jsonData = JSON.stringfy(obj);
	
	console.log("jsonData");
	
	$.ajax({
		type:"post",
		url : updateSetting.st,
		dataType: "json",
		data : {
			 json : jsonData
		},
		success:function(data){
			console.log("성공! 데: " + data); 
		},
		error : function(){
			console.log("실패!!!");
		}
		
	});
	
});



</script>

 -->


</body>
</html>