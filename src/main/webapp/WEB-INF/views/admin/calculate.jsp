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
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>
	
	<h1 align="center">정산</h1>
<div class="row" align="center">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
	<div>
	<div style="float: left;"><button>정산하기</button></div>
		<div style="margin-bottom: 5px; float: right;">
			<input type="text"> <button>검색</button>
		</div>
	</div>
		<div>
			<table class="table table-hover"  style="text-align: center; ">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
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
						<td><input type="checkbox"></td>
						<td>닉네임<%=i %></td>
						<td>이름<%=i%></td>
						<td>15,000</td>
						<td>2018/06/<%=i+1 %></td>
						<td>
							<%if(i<3){%><button data-toggle="modal" data-target="#myModal">정산하기</button><%}else{%>완료<%} %>
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
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- 다중 정산 -->
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</body>
<script>
	$(function() {
			$('li:eq(3)').addClass('active');
			$('#menu3').addClass('active in');
			$('#menu3 a:eq(5)').css('font-weight','bold');
	})
</script>
</html>