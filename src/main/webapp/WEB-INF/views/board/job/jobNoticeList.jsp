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
			<div id="listArea">
				<table align="center" class="table col-lg-12">
					<tr>
						<th width="10%">번호</th>
						<th width="10%">작성자</th>
						<th width="50%">제목</th>
						<th width="20%">등록일</th>
						<th width="10%">조회수</th>
					</tr>
					<c:forEach var="board" items="${ blist }">
						<tr>
							<td id="bno">${ board.bno }</td>
							<td>${ board.bwriter }</td>
							<td align="left">${ board.btitle }</td>
							<td>${ board.writtenDate }</td>
							<td>${ board.bcount }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<!-- 페이징 영역 -->
		<div class="pagingArea" align="center">
			
			
			<ul class="pager">
				<c:if test="${ pi.currentPage <= 1 }">
					<li class="previous"><a href="">Previous</a></li>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="blistBack" value="/selectListJobNotice.jbo">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<li class="previous"><a href="${ blistBack }">Previous</a></li>
				</c:if>
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:url var="blistCheck" value="selectListJobNotice.jbo">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<li><a href="${ blistCheck }">${ p }</a></li>
				</c:forEach>
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<li class="next"><a href="">Next</a></li>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="blistEnd" value="selectListJobNotice.jbo">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<li class="next"><a href="${ blistEnd }">Next</a></li>
				</c:if>
			</ul>
		</div>
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