<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/streamer/updateProfile.css">
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
			<div class="col-sm-9" style="padding-top: 80px;">
				<h3>프로필 수정</h3>
				<hr>
					<label>방송국 주소</label><br>
					<div class="ui input" style="width:600px;">
						<input type="text" id="" />
					</div>
					<br> <br> 
					<label>닉네임 변경</label><br>
					<div class="ui input" id="">
						<input type="text" />
						<button class="ui green button">중복확인</button>
						<button class="ui green button">변경</button>
					</div>
					<br> <br> 
					<label>프로필 이미지</label><br> 
					<div class="profile">
					<div class="profileArea">
					<img src="${ contextPath }/resources/image/bbashong.png"
						class="img-circle" alt="Cinque Terre" id="profileImg">
					<h3>빠숑</h3>
					<h5>@bbashong</h5>
					</div>
					<div>
						<button class="ui green button" style="float:right;">이미지 찾기</button>
						<button class="ui green button" style="float:right;">변경</button>
					</div>
					</div>
					<br> <br> <br> <br><br><br>
					<label>인삿말</label><br>
					<div class="ui input" style="height: 100px;">
						<input type="text" id=""/>
					</div>
					<br> <br>
					<label>스트리밍 번호</label><br>
					<div class="ui input" style="width: 600px;">
						<input type="text" id="" value="@SFSADG52"/>
					</div> 
					<button class="ui green button" style="float:right;">변경</button>

</body>
</html>