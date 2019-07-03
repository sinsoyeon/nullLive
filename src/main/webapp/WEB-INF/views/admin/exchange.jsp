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
	
	<h1 align="center">환전</h1>
<div class="row" align="center">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
	<div>
	<div style="float: left;"><button data-toggle="modal" data-target="#multiple">환전하기</button></div>
		<div style="margin-bottom: 5px; float: right;">
			<input type="text"> <button>검색</button>
		</div>
	</div>
		<div>
			<table class="table table-hover"  style="text-align: center; ">
				<thead>
					<tr>
						<th><input type="checkbox" id='check_all'></th>
						<th>번호</th>
						<th>닉네임</th>
						<th>이름</th>
						<th>신청 Null</th>
						<th>신청 날짜</th>
						<th>환전</th>
					</tr>
				</thead>	
				<tbody>
				<c:forEach items="${ExchangeList}" var="exchange" varStatus="number">
				
				<c:if test="${exchange.excStatus eq 'N'}">
					<tr>
						<td id='checkbox'><input type="checkbox" name="checkExc" value="${exchange.excno}"></td>
						<td>${exchange.excno} <input type="hidden" id="excno" value="${exchange.excno}" /></td>
						<td>${exchange.nickName}</td>	
						<td>${exchange.name}</td>	
						<td>${exchange.excAmount}</td>	
						<td>${exchange.applicationDate}</td>	
						<td><input type="button" value="환전하기" data-toggle="modal" data-target="#single"></td>	
					</tr>
				</c:if>
				
				<c:if test="${exchange.excStatus eq 'Y'}">
					<tr style="background: #eaeaea;">
	 					<td><input type="checkbox" disabled></td>
	 					<td>${exchange.excno}</td>
						<td>${exchange.nickName}</td>	
						<td>${exchange.name}</td>	
						<td>${exchange.excAmount}</td>	
						<td>${exchange.applicationDate}</td>	
						<td>환전완료</td>	
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
	
	<!-- 단일 환전 -->
	<div class="modal fade" id="single" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">환전하시겠습니까?</h4>
				</div>
				<div class="modal-body">
					<p>확인을 누르시면 환전 처리 됩니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger " data-dismiss="modal" id="exchangeBtn">확인</button>
					<button type="button" class="btn " data-dismiss="modal">취소</button>
				</div>
			</div>

		</div>
	</div>

	<!-- 다중 환전 -->
	<div class="modal fade" id="multiple" role="dialog">
		<div class="modal-dialog">

			<!--  Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">환전하시겠습니까?</h4>
				</div>
				<div class="modal-body">
					<p>
						확인을 누르면 선택된 목록 <b style="color: red;">모두</b> 환전 됩니다.
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal" id='allExchange'>확인</button>
					<button type="button" class="btn " data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="${contextPath}/resources/js/admin/adminExchange.js"></script>
</body>
<script>
var excno;
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
		/* $('tbody>tr').click(function() {
			excno  = $(this).children().eq(1).html();
		});
		$("#exchange").click(function() {
			location.href='exchange.ad?excno='+excno
		});
		$("#allExchange").click(function() {
			alert("allExchange");
		}); */
		
		
	})
	
	function exchange() {
		
		
		
		return false;
	}
	function allExchange() {
		
		
		
		return false;
	}
	
	
</script>
	
</html>