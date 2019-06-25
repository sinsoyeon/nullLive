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
<script type="text/javascript" src="resources/js/paging/paging.js"></script>
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
				<select id="listChange" onchange='listChange();'>
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="50">50</option>
				</select>
				<button class="btn" onclick="location.href = 'jobNoticeInsertForm.jbo'">글쓰기</button>
			</div>
			<br><br>
			<hr>
			<!-- 리스트 테이블영역 -->
			<div id="listArea">
				<table align="center" class="table col-lg-12">
				<tr>
					<th width="10%">번호</th>
					<th width="10%">작성자</th>
					<th width="50%">제목</th>
					<th width="20%">등록일</th>
					<th width="10%">조회수</th>
				</tr>
				<c:forEach var="board" items="${ list }">
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
			<!-- 페이징 영역 -->
			<!-- value에 실행할 handler기입 -->
			<c:set var="pagingMethod" value="/selectListJobNotice.jbo"/>
			<%-- <div class="pagingArea" align="center">
				<ul class="pagination">
					<c:if test="${ pi.currentPage <= 1 }">
						<li class="page-item"><a class="page-link" href="">Previous</a></li>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="blistBack" value="${ pagingMethod }">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ blistBack }">Previous</a></li>
					</c:if>
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:url var="blistCheck" value="${ pagingMethod }">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ blistCheck }">${ p }</a></li>
					</c:forEach>
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<li class="page-item"><a class="page-link" href="">Next</a></li>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="blistEnd" value="${ pagingMethod }">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ blistEnd }">Next</a></li>
					</c:if>
				</ul>
			</div>
				--%>
			<!-- 페이징 area-->
			
	        <ul class="pagination">
	            
                <!--맨 첫페이지 이동 -->
                <li><a onclick='pagePre(${pi.pageCnt+1},${pi.pageCnt});'>«</a></li>
                <!--이전 페이지 이동 -->
                <li><a onclick='pagePre(${pi.pageStartNum},${pi.pageCnt});'>‹</a></li>
	            
	            
	            <!--페이지번호 -->
	            <c:forEach var='i' begin="${pi.pageStartNum}" end="${pi.pageLastNum}" step="1">
	                <li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
	            </c:forEach>
	            
                <!--다음 페이지 이동 -->
                <li><a onclick='pageNext(${pi.pageStartNum},${pi.total},${pi.listCnt},${pi.pageCnt});'>›</a></li>
                <!--마지막 페이지 이동 -->
                <li><a onclick='pageLast(${pi.pageStartNum},${pi.total},${pi.listCnt},${pi.pageCnt});'>»</a></li>
                
	        </ul>
	        <form action="paging.pg" method="get" id='frmPaging'>
	            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
	            <input type='hidden' name='index' id='index' value='${pi.index}'>
	            <input type='hidden' name='pageStartNum' id='pageStartNum' value='${pi.pageStartNum}'>
	            <input type='hidden' name='listCnt' id='selected' value='${pi.listCnt}'>    
	        </form>
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
		// 리스트 갯수 조정
		function listChange(){
			$("#selected").val($("#listChange").val());
			frmPaging();
		}
	</script>
	
	
</body>
</html>