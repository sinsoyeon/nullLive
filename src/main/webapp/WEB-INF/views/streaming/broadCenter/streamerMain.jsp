<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
<script src="${contextPath}/resources/js/streaming/main.js"></script>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/streamerMain.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<!-- sidebar -->
			<div class="col-sm-2">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>
			
			<!-- main content -->
			<div class="col-sm-10" style="padding-left: 55px;">
				<div id="main">
					<table class="headInfo">
						<tr>
							<th>즐겨찾기 수 : </th>
							<c:if test="${mainInfo.FSNO == null}">
								<td>0</td>
							</c:if>
							<c:if test="${mainInfo.FSNO != null}">
								<td>${mainInfo.FSNO}</td>
							</c:if>
							<th>구독자 수 :</th>
							<c:if test="${mainInfo.SHSNO == null}">
								<td> 0 </td>
							</c:if>
							<c:if test="${mainInfo.SHSNO != null}">
								<td>${mainInfo.SHSNO}</td>
							</c:if>
						</tr>
					</table><br><br>

					<div class="introBox">
						<label style="font-size: 25px; font-wight: bold;">인사말</label><br><br>
						<div class="intro">
							<br> <label>${mainInfo.BCINTRO}</label>
						</div>
					</div>
					<br><br><br>
					<div class="broadStatus">
					<label>방송 상태:</label>
					<label>방송 전</label><br>
					<label>현재 시청자 수:</label>
					<label>200</label>
					
					<!-- 방송화면 삽입-->
					<br><br>
					<button class="ui green button" id="button" onclick="location.href='start.st'">방송 시작</button>
																	
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>