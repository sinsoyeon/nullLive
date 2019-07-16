<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/reportBlackListBoard.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
	<header style="height: 50px;">
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<div class="container-fluid">
		<div class="row">

			<!-- sidebar -->
			<div class="col-sm-2">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>

			<!-- main content -->
			<div class="col-sm-10" style="padding-left: 55px; padding-top: 28px;">
				<h3>블랙리스트 제보 게시판</h3>
				<hr>
				<div class="ui category search">
					<div class="ui icon input" style="float: right;">
						<input class="prompt" type="text"> <i class="search icon"></i>
					</div>
				</div>
				<br>
				<table class="reportTable">
					<tr>
						<th></th>
						<th>카테고리</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>신고</td>
						<td>6/21 방송 어그로</td>
						<td>어그로처단</td>
						<td>2019/06/21</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>신고</td>
						<td>6/21 방송 어그로</td>
						<td>어그로처단</td>
						<td>2019/06/21</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>신고</td>
						<td>6/21 방송 어그로</td>
						<td>어그로처단</td>
						<td>2019/06/21</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>신고</td>
						<td>6/21 방송 어그로</td>
						<td>어그로처단</td>
						<td>2019/06/21</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>신고</td>
						<td>6/21 방송 어그로</td>
						<td>어그로처단</td>
						<td>2019/06/21</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>신고</td>
						<td>6/21 방송 어그로</td>
						<td>어그로처단</td>
						<td>2019/06/21</td>
						<td>10</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>신고</td>
						<td>6/21 방송 어그로</td>
						<td>어그로처단</td>
						<td>2019/06/21</td>
						<td>10</td>
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