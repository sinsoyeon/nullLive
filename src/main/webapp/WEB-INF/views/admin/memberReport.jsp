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
	
	<h1 align="center">일반회원 신고 관리</h1>
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
						<th>번호</th>
						<th>구분</th>
						<th>신고자</th>
						<th>닉네임</th>
						<th>누적 신고 횟수</th>
						<th>신고 날짜</th>
						<th>처리 현황</th>
					</tr>
				</thead>	
				<tbody>
				<c:set var = "listSize" value = "${streamerReportList.size() }" />
				<c:forEach items="${streamerReportList}" var="board" varStatus="number">
					<tr>
						<td>
						<c:set var = "index" value = "${number.index}" />
						<c:set var = "number1" value = "${listSize-index}" />
						<c:out value="${number1}"/> 
						</td>
						<td>${board.reportType}</td>	
						<td>${board.mid1}</td>	
						<td>${board.mid2}</td>	
						<td>${board.cou}</td>	
						<td>${board.writtenDate}</td>	
						<td>${board.staDetail}</td>	
					</tr>
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
			$('#menu1 a:eq(2)').css('font-weight','bold');
			$('td').click(function() {
				location.href='memberReportDetail.ad';
			});
	})
</script>
</html>