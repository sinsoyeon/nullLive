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
							<option value="game">게임</option>
							<option value="sport">스포츠</option>
							<option value="outdoor">야방</option>
							<option value="other">기타</option>
						</select>
					</div>
					<br> <br> 
					<label>방송 속성</label><br> 
					<input type="radio" name="broadMethod" id="broadMethod" value="cam" checked/>캠 방송
					<input type="radio" name="broadMethod" id="broadMethod" value="screen"/>스크린 방송<br/>
					<input type="checkbox" id="bAdult" name="bAdult"/> <span>연령 제한 방송</span><br> 
					<input type="checkbox" id="bPwdCheck" name="bPwdCheck"/> <span>패스워드 설정</span>
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
					<div class="ui input" style="height: 100px; width:300px;">
						<%-- <c:if test="${broadInfo.ENDING_COMMENT == null}">
							<input type="text" id="bEndingComment" />
						</c:if> --%>
						<c:if test="${broadInfo.ENDING_COMMENT != null}">
							<input type="text" id="bEndingComment" value="${broadInfo.ENDING_COMMENT}"/>
						</c:if>	
					</div> <br><br><br>
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
      
				<input id="bcno" value="${broadInfo.BCNO}" hidden/>
				<button class="ui green button" type="button" id="startBtn" onclick="startStreaming();">방송시작</button>

		</div>
	</div>
	
	
<script>
$("#btn").click(function(){
	/* var obj = new Object();
	obj.bTitle = $("#bTitle").val();
	obj.bCategory = $("#bCategory").val();
	obj.bPwd = $("#bPwd").val();
	obj.bEndingComment = $("#bEndingComment").val(); */
	
	var bAdult = $('input:radio[name=bAdult]').is(':checked');
	var bPwdCheck = $('input:radio[name=bPwdCheck]').is(':checked');
	var bPwd = '';

	if(bAdult == true){
		bAdult = 'Y';
	}else{
		bAdult = 'N';
	}
	
	if(bPwdCheck == true){
		bPwdCheck = 'Y';
		bPwd = $("#bPwd").val();
	}else{
		bPwdCheck = 'N';
	}
	
	var param = [];
	var data = {
		title : $("#bTitle").val(),
		category : $("#bCategory").val(),
		pwd : bPwd,
		endingComment : $("#bEndingComment").val(),
		bcno : $("#bcno").val(),
		adult : bAdult,
		pwdCheck : bPwdCheck
	};
	
	//param배열에 data 오브젝트를 담는다
	param.push(data);
	
	//param데이터 직렬화
	var jsonData = JSON.stringify(param);
	/* jQuery.ajaxSettings.traditional = true; */
	
	console.log(data);

	   $.ajax({
		type:"post",
		url : "updateSetting.st",
		traditional:true,
		dataType: "json",
		data : { json : jsonData},
		success:function(data){
			console.log("성공인데?" + data)
			/* if(data>0){
				location.href='broadSetting.st';
			} */ 
		},
		error : function(){
			console.log("실패!!!");
		}
		
	});  
	
});

function startStreaming(){
	var strWin = window.open('','newWin','width=1024,height=768,menubar=no, status=no, toolbar=no');
	
	var broadMethodval = $('input[name="broadMethod"]:checked').val();
	console.log(broadMethod);
	var bTitle = $("#bTitle").val();
	var bCategory = $("#bCategory").val();
	var bAdult = $('input:checkbox[name=bAdult]').is(':checked');
	var bPwdCheck = $('input:checkbox[name=bPwdCheck]').is(':checked');
	var bPwd = $("#bPwd").val();
	
	var form = document.createElement('form');
	form.setAttribute('method','post');
	form.setAttribute('action',"startStreaming.st");
	form.setAttribute('target','newWin');
	document.body.appendChild(form);
	
	var broadMethod = document.createElement('input');
	broadMethod.setAttribute('type','hidden');
	broadMethod.setAttribute('name','broadMethod');
	broadMethod.setAttribute('value',broadMethodval);
	form.appendChild(broadMethod);
	var btitle = document.createElement('input');
	btitle.setAttribute('type','hidden');
	btitle.setAttribute('name','btitle');
	btitle.setAttribute('value',bTitle);
	form.appendChild(btitle);
	var bcategory = document.createElement('input');
	bcategory.setAttribute('type','hidden');
	bcategory.setAttribute('name','bcategory');
	bcategory.setAttribute('value',bCategory);
	form.appendChild(bcategory);
	var adult = document.createElement('input');
	adult.setAttribute('type','hidden');
	adult.setAttribute('name','adult');
	adult.setAttribute('value',bAdult);
	form.appendChild(adult);
	var pwdCheck = document.createElement('input');
	pwdCheck.setAttribute('type','hidden');
	pwdCheck.setAttribute('name','pwdCheck');
	pwdCheck.setAttribute('value',bPwdCheck);
	form.appendChild(pwdCheck);
	var pwd = document.createElement('input');
	pwd.setAttribute('type','hidden');
	pwd.setAttribute('name','bpwd');
	pwd.setAttribute('value',bPwd);
	form.appendChild(pwd);
	console.log(form);
	form.submit();
}

</script>




</body>
</html>