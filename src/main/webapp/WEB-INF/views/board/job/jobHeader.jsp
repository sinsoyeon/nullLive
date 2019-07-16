<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.titleArea{
		margin-top : 20px;
		margin-bottom : 10px;
		padding-top : 50px;
		padding-bottom : 50px;
		padding-left : 50px;
		background: #e2f0d869;
		border-radius: 15px;
	}
</style>
</head>
<body>
	<div class="titleArea">
		<h1><b>구인구직게시판</b></h1><br>
		<c:set var="listBType" value="${ list[0].bType.trim() }"/>
		<c:set var="detailBType" value="${ boardMap.board.BType }"/>
			<c:if test="${ listBType eq 'JOBCON' || detailBType eq 'JOBCON' }">
				<h4><b>콘텐츠제작자 게시판</b></h4>
			</c:if>
			<c:if test="${ listBType eq 'JOBMNG' || detailBType eq 'JOBMNG' }">
				<h4><b>매니저 게시판</b></h4>
			</c:if>
		<p>방송의 클라스를 높여줄 직원을 구하는 게시판</p>		
	</div>
</body>
</html>