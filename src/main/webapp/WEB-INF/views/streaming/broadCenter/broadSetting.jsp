<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
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
					<div class="ui input"  style="width:600px;">
						<c:if test="${broadInfo.BROAD_TITLE == null}">
							<input type="text" id="bTitle"/>
						</c:if>
						<c:if test="${broadInfo.BROAD_TITLE != null}">
							<input type="text" id="bTitle" value="${broadInfo.BROAD_TITLE}"/>
						</c:if>
					</div>
					<br> <br> 
					<label>방송 카테고리</label><br>
					<div class="ui input">
						<select name="bCategory" id="bCategory" >
							<option>--카테고리--</option>
							<option value="radio">라디오</option>
							<option value="cam">캠방</option>
							<option value="food">먹방</option>
							<option value="pet">펫방</option>
							<option value="music">음악</option>
							<option value="hobby">취미</option>
							<option value="other">기타</option>
						</select>
					</div>
					<br> <br> 
					<label>방송 속성</label><br> 
					<input type="radio" id="bAdult" name="bAdult"/> <span>연령 제한 방송</span><br> 
					<input type="radio" id="bPwdCheck" name="bPwdCheck"/> <span>패스워드 설정</span>
					<div class="ui input" style="width: 250px;">
						<c:if test="${broadInfo.BROAD_PWD == null}">
							<input type="text" id="bPwd" placeholder="비밀번호가 설정되지 않았습니다"/>
						</c:if>
						<c:if test="${broadInfo.BROAD_PWD != null}">		
						<input type="text" id="bPwd" value="${broadInfo.BROAD_PWD}"/>
						</c:if>
					</div>
					<br> <br> 
					<br>
					<label>방송 종료 멘트</label><br>
					<div class="ui input" style="height: 100px; width:150px;">
						<c:if test="${broadInfo.ENDING_COMMENT == null}">
							<input type="text" id="bEndingComment" />
						</c:if>
						<c:if test="${broadInfo.ENDING_COMMENT != null}">
							<input type="text" id="bEndingComment" value="${broadInfo.ENDING_COMMENT}"/>
						</c:if>	
					</div> 
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
							<c:if test="${broadInfo.BH_STATUS eq 'N' || broadInfo.BH_STATUS == null}">	
								<td>방송중이 아닙니다</td>
							</c:if> 
							<c:if test="${broadInfo.BH_STATUS ne 'N'}">	
								<td>방송중입니다</td>
							</c:if>	
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
								<td>${broadInfo.COUNT_VIEWERS}</td>
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
								<td>${broadInfo.BROAD_ADDRESS}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
				<input id="mno" value="${broadInfo.BCNO}" hidden/>
				<button class="ui green button" id="updateBtn">업데이트</button>
		</div>
	</div>
	
	
<script>
$("#updateBtn").click(function(){
	var bTitle = $("#bTitle").val();
	var bCategory = $("#bCategory").val();
	var bAdult = $('input:radio[name=bAdult]').is(':checked');
	var bPwdCheck = $('input:radio[name=bPwdCheck]').is(':checked');
	var bPwd = $("#bPwd").val();
	var bEndingComment = $("#bEndingComment").val();
	
	/* var obj = new Object();
	obj.bTitle = $("#bTitle").val();
	obj.bCategory = $("#bCategory").val();
	obj.bPwd = $("#bPwd").val();
	obj.bEndingComment = $("#bEndingComment").val(); */

	
	var param = [];
	var data = {
		title : $("#bTitle").val(),
		category : $("#bCategory").val(),
		pwd : $("#bPwd").val(),
		endingComment : $("#bEndingComment").val(),
		mno : $("#bcno").val()
	};
	
	//param배열에 data 오브젝트를 담는다
	param.push(data);
	
	//param데이터 직렬화
	var jsonData = JSON.stringify(param);
	/* jQuery.ajaxSettings.traditional = true; */

	
	 $.ajax({
		type:"post",
		url : "updateSetting.st",
		traditional:true,
		dataType: "json",
		data : { json : jsonData },
		success:function(data){
			if(data>0){
				location.href='broadSetting.st';
			} 
		},
		error : function(){
			console.log("실패!!!");
		}
		
	});
	
});



</script>




</body>
</html>