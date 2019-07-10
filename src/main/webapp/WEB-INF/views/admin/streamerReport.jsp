<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/paging/paging.js"></script>
<title>NullLive</title>
<style>
tr>th{
		text-align: center;
		background: #438c31;
		color: white;
	}
	.col-sm-10>div>table{
		background: #ffffff;
	}
	
.btn.btn-success{
	padding-top: 2px;
    padding-bottom: 2px;
    margin-bottom: 2px;
}
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
	
	<h1 align="center">스트리머 신고 관리</h1>
<div class="row" align="center">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
			<div align="right" style="margin-bottom: 5px;">
				<div class="listSelectArea" style="display: inline-block;">
					<select id="listChange" class="form-controll" onchange='listChange();'>
						<option contenteditable="true">목록갯수</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
				</div>
				<div style="display: inline-block;">
					<input type="text">
					<button class="btn btn-success">검색</button>
				</div>
		</div>
		<div>
			<table class="table table-hover"  style="text-align: center; ">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>구분</th>
						<th>제목</th>
						<th>신고자</th>
						<th>대상자</th>
						<th>누적 신고</th>
						<th>신고 날짜</th>
						<th>처리 현황</th>
					</tr>
				</thead>	
				<tbody>
				<c:forEach items="${streamerReportList}" var="board" varStatus="number">
					<c:if test="${board.status == 6 }">
					<tr style="background: #eaeaea;">
						<td>${board.bno}</td>
						<td>${board.reportType}</td>	
						<td>${board.BTitle}</td>
						<td>${board.writer}</td>	
						<td>${board.target}</td>	
						<td>${board.cou}</td>	
						<td>${board.writtenDate}</td>	
						<td>완료</td>	
					</tr>
					</c:if>
					<c:if test="${board.status == 5 }">
					<tr>
						<td>${board.bno}</td>
						<td>${board.reportType}</td>	
						<td>${board.BTitle}</td>
						<td>${board.writer}</td>	
						<td>${board.target}</td>	
						<td>${board.cou}</td>	
						<td>${board.writtenDate}</td>	
						<td>대기중</td>	
					</tr>
					</c:if>
				</c:forEach>
				
				</tbody>
			</table>
		</div>
		
	</div>
	<div class="col-sm-1"></div>
	</div>
	<div align="center">
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
			<li><a
				onclick='pageNext(${pi.pageStartNum},${pi.total},${pi.listCnt},${pi.pageCnt});'>›</a></li>
			<!--마지막 페이지 이동 -->
			<li><a
				onclick='pageLast(${pi.pageStartNum},${pi.total},${pi.listCnt},${pi.pageCnt});'>»</a></li>

		</ul>
	</div>
	<form action="streamerReportList.ad" method="get" id='frmPaging'>
	      <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
	      <input type='hidden' name='index' id='index' value='${pi.index}'>
	      <input type='hidden' name='pageStartNum' id='pageStartNum' value='${pi.pageStartNum}'>
	      <input type='hidden' name='listCnt' id='selected' value='${pi.listCnt}'>    
	</form>
</body>
<script>
	$(function() {
			$('li:eq(1)').addClass('active');
			$('#menu1').addClass('active in');
			$('#menu1 a:eq(1)').css('font-weight','bold');
			$('tbody>tr').click(function() {
				var bno = $(this).children().eq(0).html();
				location.href = 'streamerReportDetail.ad?bno=' + bno
			});
			
	})
</script>
</html>