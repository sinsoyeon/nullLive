<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
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
	td{
		text-align: center;
		height: 30px;
		border-bottom: 1px solid lightgray;
	}
	th{
		border: 1px solid lightgray;
	}
	
	.tableArea {
		width:auto;
		height:auto;
		margin:0 auto;
		
	}
	.btnArea{
		margin-left : auto;
		margin-right: auto;
		float: right;
	}
	.pagingArea{
		margin-left : auto;
		margin-right: auto;
	}
	
	.searchArea{
		margin-left : auto;
		margin-right: auto;
		width:650px;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	<div class="outer">
		<jsp:include page="jobHeader.jsp"/>
			<hr>
			<!-- 공지사항 리스트 -->
			<div class="tableArea" align="center">
			<!--  버튼영역 -->
			<div class="btnArea">
				<button class="btn" onclick="location.href = 'jobNoticeInsertForm.jbo'">글쓰기</button>
			</div>
			<br><br>
			<hr>
			<!-- 리스트 테이블영역 -->
			<jsp:include page="boardListTableFrame.jsp"/>

			<!-- 페이징 영역 -->
			<jsp:include page="pageingFrame.jsp"/>
		
	</div>
	<script>
		//게시판 상세보기
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"#e2f0d8","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"})
			}).click(function(){
				var bno = $(this).parent().children().eq(0).text();
				location.href='selectOneJobNotice.jbo?bno=' + bno ;
			})
		})
	</script>
	
	
</body>
</html>