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
		background: #438c31;
		color: white;
	}
	.col-sm-10>div>table{
		background: #ffffff;
	}
	
	.modal-dialog{
	width: 40% !important;
	}
	
	.modal-header, .modal-body{
	text-align: center;
	}
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
	
	<h1 align="center">정산</h1>
<div class="row" align="center">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
	<div>
	<div style="float: left;"><button data-toggle="modal" data-target="#multiple">정산하기</button></div>
		<div style="margin-bottom: 5px; float: right;">
			<input type="text"> <button>검색</button>
		</div>
	</div>
		<div>
			<table class="table table-hover"  style="text-align: center; ">
				<thead>
					<tr>
						<th><input type="checkbox" id='check_all'></th>
						<th>닉네임</th>
						<th>이름</th>
						<th>신청 Null</th>
						<th>신청 날짜</th>
						<th>정산</th>
					</tr>
				</thead>	
				<tbody>
				<% for(int i=0; i<=10; i++){ %>
					<tr>
						<td id='checkbox'><input type="checkbox"></td>
						<td>닉네임<%=i %></td>
						<td>이름<%=i%></td>
						<td>15,000</td>
						<td>2018/06/<%=i+1 %></td>
						<td id='complete'>
							<%if(i<3){%><button data-toggle="modal" data-target="#single" >정산하기</button><%}else{%>완료<%} %>
						</td>					
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
	
	<!-- 단일 정산 -->
	<div class="modal fade" id="single" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">정산하시겠습니까?</h4>
				</div>
				<div class="modal-body">
					<p>확인을 누르시면 정산 처리 됩니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger " data-dismiss="modal">확인</button>
					<button type="button" class="btn " data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>

	<!-- 다중 정산 -->
	<div class="modal fade" id="multiple" role="dialog">
		<div class="modal-dialog">

			<!--  Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">정산하시겠습니까?</h4>
				</div>
				<div class="modal-body">
					<p>
						확인을 누르면 선택된 목록 <b style="color: red;">모두</b> 정산 됩니다.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
					<button type="button" class="btn " data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>

</body>
<script>
	$(function() {
		$('li:eq(3)').addClass('active');
		$('#menu3').addClass('active in');
		$('#menu3 a:eq(5)').css('font-weight', 'bold');
		
		$("#check_all").click(function() {
			var chk = $(this).is(":checked");
			if (chk){
				$("#checkbox input").prop('checked', true);}
			else{
				$("#checkbox input").prop('checked', false);}
		});
	})
	
</script>
</html>