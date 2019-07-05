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
	
	<h1 align="center">1:1문의 관리</h1>
<div class="row" align="center">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div align="right" style="margin-bottom: 5px;">
			<input type="text"> <button>검색</button>
		</div>
		<div>
			<table class="table table-hover table-hover"  style="text-align: center; ">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>구분</th>
						<th>이름</th>
						<th>제목</th>
						<th>문의 날짜</th>
						<th>처리 현황</th>
					</tr>
				</thead>	
				<tbody>
				<c:set var = "listSize" value = "${QuestionList.size() }" />
				<c:forEach items="${QuestionList}" var="question" varStatus="number">
					<c:if test="${question.BStatus eq 4}"> 
						<tr>
							<td>${question.bno }	</td>
							<td>${question.questionType}</td>	
							<td>${question.name}</td>	
							<td>${question.BTitle}</td>	
							<td>${question.WDate}</td>	
							<td>대기중</td>	
							<td style="display: none;">${question.BStatus }</td>
						</tr>
					</c:if>
					<c:if test="${question.BStatus eq 3 }">
						<tr style="background: #eaeaea;">
							<td>${question.bno }	</td>
							<td>${question.questionType}</td>	
							<td>${question.name}</td>	
							<td>${question.BTitle}</td>	
							<td>${question.WDate}</td>	
							<td>완료</td>	
							<td style="display: none;">${question.BStatus }</td>
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
			$('li:eq(4)').addClass('active');
			$('#menu4').addClass('active in');
			$('#menu4 a:eq(4)').css('font-weight','bold');
			$('tbody>tr').click(function() {
				var bno = $(this).children().eq(0).html();
				var bStatus = $(this).children().eq(6).html();
				location.href = 'questionDetail.ad?bno=' + bno+'&bStatus=' + bStatus
			});
	})
</script>
</html>