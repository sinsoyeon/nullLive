<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
<style>
.streamerList tr:hover{
	background:#cfefcf;
}
</style>
</head>
<body>
	<header style="height: 50px;">
		<jsp:include page="../common/menubar.jsp" />
	</header>

	<div class="container-fluid">
		<div class="row">
			<!-- 왼쪽 사이드바 -->
			<div class="col-md-2">
				<jsp:include page="../main/mainNavbar.jsp" />
			</div>
			
			<div class="col-md-10" style="padding-left: 55px; padding-top: 28px;">
				<div class="col-md-12">
					<table class="streamerList">
					<c:forEach var="list" items="${streamerList}">
						<tr>
							<td>${list.NICK_NAME}</td>
							<td style="visibility: hidden;" class="smno">${list.MNO}</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>


<script>
	$(".streamerList tr td").click(function(){
		var smno = $(this).closest('td').siblings('.smno').text();
		//console.log("smno:" + smno);
		
		location.href = "main.st?smno="+smno;
		
	});
</script>


</body>
</html>