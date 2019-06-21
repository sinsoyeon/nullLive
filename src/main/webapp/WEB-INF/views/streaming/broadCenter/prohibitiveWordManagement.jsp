<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/prohibitiveWordManage.css">
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
				<h3>금칙어 관리</h3>
				<hr>
				<label>금칙어 추가</label>
				<div class="ui input">
					<input type="text" id="blackList"/>
					<button class="ui green button">추가</button>
				</div>
				<br> <br> 
				<label>블랙리스트 추가</label><br>
				<div class="ui category search">
					<div class="ui icon input">
						<input class="prompt" type="text" style="width: 600px;"> <i
							class="search icon"></i>
					</div>
					<button class="ui green button">추가</button>
				</div>
				<br> <label>금칙어 목록</label>
				<table class="prohibitiveWordList">
					<tr>
						<th></th>
						<th>금칙어</th>
						<th>작성자</th>
						<th>등록날짜</th>
						<th></th>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>보신탕</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
						<td>수정</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>멍멍탕</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
						<td>수정</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>빠숑이 싫어요</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
						<td>수정</td>
					</tr>
				</table>
				<br>
				<button class="ui green button">삭제</button>
				<br>
				<br>
				<button class="ui green button" id="update">업데이트</button>

			</div>
		</div>



	</div>




</body>
</html>