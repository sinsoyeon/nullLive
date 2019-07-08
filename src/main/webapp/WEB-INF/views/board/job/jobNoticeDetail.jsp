<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.outer {
		width:900px;
		height:500px;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}

	.contentArea{
		padding-top : 50px;
		padding-bottom : 50px;
		margin-left: auto;
		margin-right: auto;
		border: solid 1px black;
	}
	.dateArea {
		float: right;
	}
</style>

</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	<h1 align="center">공지사항</h1>
	<hr>
	
	<!-- 공지 상세 보기 -->
	<div class="outer">
		<!-- 제목영역 -->
		<div>
			<!-- 제목 -->
			<div>
				<div class="dateArea">
					<b>${ board.writtenDate }</b>
				</div>
				<h3><b>${ board.BTitle }</b></h3>
			</div>
			<br>
		</div>
		<!-- 내용영역 -->
		<div class="contentArea">
			${ board.BContent }
		</div>
		<br>
		<!-- 첨부파일 영역 -->
		
		<div>
			<label>첨부파일</label>
			<br>
			<c:forEach var="row" items="${attList}">
				<input type="hidden" id="attno" value="${row.attno }">
				<a href="#this" name="file">${row.originName }</a><br>
			</c:forEach>
		</div>



		
		<!-- 하단 버튼영역 -->
		<div align="center">
			<c:if test="${ loginUser.isAdmin eq 'Y' }">
				<button onclick="location.href='#'">수정하기</button>
			</c:if>
			<button onclick="location.href='jobNoticeList.jbo'">목록으로</button>
		</div>
	</div>
	<script>
		$("a[name='file']").on("click", function(e){
			//파일 이름
			e.preventDefault(); 
			fn_downloadFile($(this));
		});

		function fn_downloadFile(obj){
			var attno = obj.parent().find("#attno").val();
			console.log(attno);
			location.href="jobBoardDownloadFile.jbo?attno="+attno;
		}

	</script>
	
	
</body>
</html>