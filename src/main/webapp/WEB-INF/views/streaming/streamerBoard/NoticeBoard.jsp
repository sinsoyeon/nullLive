<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/noticeBoard.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
				<h3>방송 공지 게시판</h3>
				<hr>
				<div class="ui form">
					<div class="field">
						<textarea style="font-size: 20px;">6/21(금) 방송은 쉬어 갑니당~</textarea>
					</div>
					<div id="button">
					<button class="ui green button" id="buttonImg">수정</button>
					<button class="ui green button" id="buttonImg">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>