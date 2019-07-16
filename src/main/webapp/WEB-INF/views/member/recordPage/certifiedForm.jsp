<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<style>
	.modal-dialog{
		width:80%;
		height:70%;
		margin:0;
		padding:0;
	}
	.modal-content{
		height:auto;
		min-height:100%;
	}
	.modal {
  	text-align: center;
	}
	@media screen and (min-width: 768px) { 
	  .modal:before {
	    display: inline-block;
	    vertical-align: middle;
	    content: " ";
	    height: 100%;
	  }
	}
	.modal-dialog {
	  display: inline-block;
	  text-align: left;
	  vertical-align: middle; 
	}
</style>
<body onload="openModal()">
	<c:if test="${empty sessionScope.loginUser}">
		<jsp:forward page="../needLogin.jsp" />
	</c:if>
	<header>
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<!-- Modal -->
	<div class="modal fade" id="contractModal" tabindex="-1" role="dialog"
		aria-labelledby="contractModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="contractModalLabel">환전이 처음이신가요?</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="content-body" id="contractArea"
					style="overflow: scroll; height:350px;">
		
<form action="bankCert.st" method="post" id="submitForm">
<input type="text" name="account" placeholder="계좌번호 (-포함)" id="account"/>
<select name="bank_code" id="bank_code">
	<option value="26">신한은행</option>
</select>
<input type="text" name="holder" id="holder" placeholder="예금주"/>
</form>
</div>
				<div class="content-footer" align="center">
					<button type="button" class="btn btn-secondary" onclick="cancel();">취소</button>
					<button type="button" class="btn btn-primary" id="confirmBtn" onclick="next();" disabled="true">다음</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function openModal(){
		 $('#contractModal').modal('show');
	}
	
	function cancel(){
		alert('정보를 입력하지 않으면 환전이 불가능합니다.');
		location.href="myPage.me";
	}
	
	function next(){
		if($("#account").val() != ""){
			if($("#holder").val() != ""){
				$("#submitForm").submit();				
			}else{
				alert('예금주를 입력해야합니다!');
			}
		}else{
			alert('계좌번호를 입력해야합니다.');
		}
	}
</script>
</html>