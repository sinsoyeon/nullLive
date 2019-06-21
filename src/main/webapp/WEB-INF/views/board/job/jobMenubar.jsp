<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menu{
		text-align:center;
		width:150px;
		height:50px;
		display:table-cell;
		verical-align:middle;
	}

	.nav{
		width:600px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	
	<br>
	<!-- 메뉴 -->
	<div class="nav">
		<div class="menu" onclick="location.href='index.jsp'">NullLive</div>
		<div class="menu" onclick="location.href='jobNoticeList.bd'">공지사항</div>
		<div class="menu" onclick="location.href='jobMngList.bd'">매니저</div>
		<div class="menu" onclick="location.href='jobContentList.bd'">콘텐츠제작자</div>
	</div>
	<hr>
</body>
</html>