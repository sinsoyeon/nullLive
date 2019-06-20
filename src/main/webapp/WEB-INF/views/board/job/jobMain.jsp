<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	<h1>구인구직게시판 </h1>
	
	
	<hr>
	<div>
		공지사항 : 19-06-02 [안내] 매니저 / 콘텐츠제작자 <a href="jobNoticeList.bd">+더보기 </a>
	</div>
	<hr>

	<!-- 게시판 선택 영역 -->
	<div>
		<!-- 매니저 게시판 선택 -->
		<div>
			<a href="jobMngList.bd">매니저 게시판 </a>
		</div>
		<!-- 콘텐츠 제작자 게시판 선택 -->
		<div>
			<a href="jobContentList.bd">콘텐츠 제작자 게시판</a>
		</div>
	</div>
	<script>
		console.log(location.href)
	</script>
</body>
</html>