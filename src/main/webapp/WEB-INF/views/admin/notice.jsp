<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
<style>
tr>th {
	text-align: center;
	background: #438c31;
	color: white;
}

.col-sm-10>div>table {
	background: #ffffff;
}

#writeBtn {
	text-align:center;
	width: 50px;
    height: 50px;
	border: 1px solid darkgray;
	border-radius : 50%;
	background: #438c31;
	color: white;
	position: fixed;
	padding-top: 15px;
	/* margin-left: auto;
	margin-right: auto; */
	left: 93%;
	top: 85%;
	z-index: 999;
	cursor: pointer;
}
#writeBtn:hover {
	background: white;
	color: black;
}
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
	
	<h1 align="center">공지사항 관리</h1>
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
						<th>제목</th>
						<th>최종 수정 날짜</th>
						<th>조회수</th>
					</tr>
				</thead>	
				<tbody>
				<c:forEach items="${noticeList}" var="notice">
						<tr>
							<td>${notice.bno }	</td>
							<td>${notice.BTitle}</td>	
							<td>${notice.modifyDate}</td>	
							<td>${notice.BCount}</td>	
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
	<div id="writeBtn" onclick="location.href='noticeWrite.ad'">
		<b>글작성</b>
	</div>
</body>
<script>
	$(function() {
			$('li:eq(4)').addClass('active');
			$('#menu4').addClass('active in');
			$('#menu4 a:eq(3)').css('font-weight','bold');
			$('tbody>tr').click(function() {
				var bno = $(this).children().eq(0).html();
				location.href = 'noticeDetail.ad?bno=' + bno
			});
	})
</script>
</html>