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
	<div class="row">
		<div class="col-sm-3">
			<jsp:include page="../common/streamerMenu.jsp" />
		</div>

		<div class="col-sm-6">
			<div class="container">
				<div class="col-sm-5">
				<h3>방송 기능 설정</h3>
				<hr>
				<label>방송제목</label><br>
				<div class="ui input">
					<input type="text"/>
				</div>
				<br><br>
				<label>방송 카테고리</label><br>
				<div class="ui input">
					<input type="text"/>
				</div>
				<br><br>
				<label>방송 속성</label><br>	
				<input type="radio" />
				<span>연령 제한 방송</span><br>
				<input type="radio" />
				<span>패스워드 설정</span>
				<div class="ui input" style="width:150px">
					<input type="text"/>
				</div>
				<br><br>
				<label>방송 종료 멘트</label><br>
				<div class="ui input" style="height:80px">
					<input type="text"/>
				</div><br><br>
				<label>다시보기 자동 저장</label><br>
				<input type="radio" />
				<span>사용 함</span>
				<input type="radio" />
				<span>사용 안 함</span><br><br>
				<label>호스팅 사용</label><br>
				<input type="radio" />
				<span>사용 함</span>
				<input type="radio" />
				<span>사용 안 함</span>
				</div>
				<div class="col-sm-5">
					<h1>d</h1>
				</div>
				
				
				
			</div>
		</div>
	</div>
</body>
</html>