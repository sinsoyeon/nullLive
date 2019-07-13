<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
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
				<c:if test="${firstCheck < 1}">
					<script>
						alert("커뮤니티 게시판을 활성화합니다.");
						location.href="${contextPath}/enableCommunityBoard.st?mno=${loginUser.mno}";
					</script>
				</c:if>
				
				<c:if test="${firstCheck >= 1}">
				<div class="ui category search">
					<div class="ui icon input" style="float: right;">
						<input class="prompt" type="text"> <i class="search icon"></i>
					</div>
				</div>
				<br>
				<table class="communiTable">
					<tr>
						<th></th>
						<th>글번호</th>	
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr>
							<td><input type="checkbox" class="checkbox"/></td>
							<td>${list.RNUM}</td>
							<td>${list.BTITLE}</td>
							<td>${list.MNICK_NAME}</td>
							<td>${list.WRITTEN_DATE}</td>
							<td>${list.BCOUNT}</td>
						</tr>
					</c:forEach>
				</table>
				<!-- 페이징 처리 필요 -->
				<br>
				<button class="ui green button">글작성</button>
				<button class="ui green button">수정</button>
				<!-- 삭제는 스트리머만 가능하게 -->
				
					<c:if test="${loginUser.mno == list.mno}">
						<button class="ui green button">삭제</button>
					</c:if>
				</c:if>
			</div>

		</div>
	</div>

</body>
</html>