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
		width:850px;
		height:350px;
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
		<!-- 공지사항 리스트 -->
		<div class="tableArea" align="center">
			<hr>
			<table align="center" class="table col-lg-12">
				<tr>
					<th width="10%">번호</th>
					<th width="10%">작성자</th>
					<th width="50%">제목</th>
					<th width="20%">등록일</th>
					<th width="10%">조회수</th>
				</tr>
				<c:forEach var="board" items="${ blist }">
					<tr onclick="selectOneNotice()">
						<td id="bno">${ board.bno }</td>
						<td>${ board.bwriter }</td>
						<td align="left">${ board.btitle }</td>
						<td>${ board.writtenDate }</td>
						<td>${ board.bcount }</td>
					</tr>
				</c:forEach>
			</table>

			
		</div>
		<!-- 하단 버튼영역 -->
		<div class="btnArea">
			<button class="btn" onclick="location.href = 'jobNoticeInsertForm.jbo'">글쓰기</button>
		</div>
		<br><br>
		<!-- 페이징 영역 -->
		<div>
			<ul class="pager">
				<li class="previous"><a href="#">Previous</a></li>
				<li class="next"><a href="#">Next</a></li>
			</ul>
		</div>
	</div>
	<script>
		function selectOneNotice(){
			var bno = $("#bno").text();
			console.log(bno);
			console.log($("#bno"));
			location.href='selectOneJobNotice.jbo?bno=' + bno ;
		}
		$(function(){
			
		})
	</script>
	
	
</body>
</html>