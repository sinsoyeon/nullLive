<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/communicationBoard.css">
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
				<h3>시청자 소통 게시판</h3>
				<hr>
				<div class="ui category search">
					<div class="ui icon input" style="float: right;">
						<input class="prompt" type="text"> <i class="search icon"></i>
					</div>
				</div>
				<br>
				<table class="communiTable">
					<tr>
						<th></th>
						<th>카테고리</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>조회수</th>
						<th>추천수</th>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>유머</td>
						<td>바나나가 웃으면?</td>
						<td>아재개그</td>
						<td>2019/06/21</td>
						<td>10</td>
						<td>0</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>잡담</td>
						<td>오늘자 빠숑이 레전드 짤</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
						<td>200</td>
						<td>45</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>잡담</td>
						<td>빠숑이는 사랑이쥬</td>
						<td>빠숑이가숑숑</td>
						<td>2019/06/21</td>
						<td>103</td>
						<td>12</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>잡담</td>
						<td>빠숑이는 사랑이쥬</td>
						<td>빠숑이가숑숑</td>
						<td>2019/06/21</td>
						<td>103</td>
						<td>12</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>잡담</td>
						<td>빠숑이는 사랑이쥬</td>
						<td>빠숑이가숑숑</td>
						<td>2019/06/21</td>
						<td>103</td>
						<td>12</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>잡담</td>
						<td>빠숑이는 사랑이쥬</td>
						<td>빠숑이가숑숑</td>
						<td>2019/06/21</td>
						<td>103</td>
						<td>12</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>잡담</td>
						<td>빠숑이는 사랑이쥬</td>
						<td>빠숑이가숑숑</td>
						<td>2019/06/21</td>
						<td>103</td>
						<td>12</td>
					</tr>
				</table>
				<!-- 페이징 처리 필요 -->
				<br>
				<button class="ui green button">글작성</button>
				<button class="ui green button">수정</button>
				<!-- 삭제는 스트리머만 가능하게 -->
				<button class="ui green button">삭제</button>
			</div>

		</div>
	</div>

</body>
</html>