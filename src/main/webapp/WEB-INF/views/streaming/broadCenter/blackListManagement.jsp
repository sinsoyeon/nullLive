<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/blackListManagement.css">
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
				<input type="hidden" id="mno" value="${loginUser.mno}" />
				<h3>블랙리스트 관리</h3>
				<hr>
				<div class="ui category search">
				<label>현재 블랙리스트 목록</label>
					<div class="ui icon input">
						<input class="prompt" type="text"> <i
							class="search icon"></i>
					</div>
					<div style="float:right;">
						현재 블랙리스트 수:
						<label></label>
					</div>
				</div>
				<div class="ui input">
					<input type="text" id="blackList" style="height: 80px;" />
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
				<br> <label>블랙리스트 상세 조회</label>
				<table class="blackListDetail">
					<tr>
						<th></th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>벤 날짜</th>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>bashongMon</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>bashongMon</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>bashongMon</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
					</tr>
				</table>
				<br>
				<button class="ui green button">벤 해제</button>
				<button class="ui green button">귓속말</button>
				<br>
				<br>
				<button class="ui green button" id="update">업데이트</button>

			</div>
		</div>



	</div>

<script>


</script>


</body>
</html>