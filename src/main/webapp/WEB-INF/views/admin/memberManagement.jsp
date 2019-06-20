<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
<style>
tr>th{
		text-align: center;
		background: #00c292;
		color: white;
	}
	.col-sm-10>div>table{
		background: #ffffff;
	}
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
	
	<h1 align="center">회원 관리</h1>
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
						<th>이름</th>
						<th>닉네임</th>
						<th>방송 유무</th>
						<th>가입 날짜</th>
						<th>계정 현황</th>
					</tr>
				</thead>	
				<tbody>
				<% for(int i=0; i<=10; i++){ %>
					<tr>
						<td>이름<%=i%></td>
						<td>닉네임<%=i %></td>
						<td><%if(i<5){%>N<%}else{%>Y<%} %></td>
						<td>2018/06/<%=i+1 %></td>
						<td><%if(i%2==0){%>활동<%}else{%>정지<%} %></td>					
					</tr>
					<%} %>
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
			$('#menu1 a:eq(0)').css('font-weight','bold');
	})
</script>
</html>