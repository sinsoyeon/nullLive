<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<jsp:include page="../streaming/streamerMenu.jsp" />
			</div>

			<!-- main content -->
			<div class="col-sm-9" style="padding-top: 80px;">
				<h3>방송 기능 설정</h3>
				<hr>
				<main>
				<div class="col-sm-6">
					<label>방송제목</label><br>
					<div class="ui input">
						<input type="text" id="bTitle" />
					</div>
					<br> <br> 
					<label>방송 카테고리</label><br>
					<div class="ui input" id="bCategory">
						<input type="text" />
					</div>
					<br> <br> 
					<label>방송 속성</label><br> 
					<input type="radio" id="bAdult"/> <span>연령 제한 방송</span><br> 
					<input type="radio" id="bPwdCheck"/> <span>패스워드 설정</span>
					<div class="ui input" style="width: 130px;">
						<input type="text" id="bPwd"/>
					</div>
					<br> <br> 
					<label>방송 종료 멘트</label><br>
					<div class="ui input" style="height: 100px;">
						<input type="text" id="bEndingComment"/>
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
		</div>
		</main>

	</div>




</body>
</html>