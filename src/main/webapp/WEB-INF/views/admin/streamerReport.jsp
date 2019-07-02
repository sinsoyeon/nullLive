<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
	
	<h1 align="center">스트리머 신고 관리</h1>
<div class="row" align="center">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div align="right" style="margin-bottom: 5px;">
			<input type="text"> <button>검색</button>
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
						<th>누적 신고수</th>
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
		<button><</button>
		<button>1</button>
		<button>2</button>
		<button>3</button>
		<button>4</button>
		<button>5</button>
		<button>></button>
	</div>
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