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
tr>th {
	text-align: center;
	background: #438c31;
	color: #f6f8fa;
}

.col-sm-10>div>table {
	background: #ffffff;
}

#memberPopup {
	display: none;
	width: 520px;
	height: 340px;
	border: 1px solid darkgray;
	background: white;
	position: fixed;
	margin-left: auto;
	margin-right: auto;
	left: 0;
	right: 0;
	top: 30%;
	z-index: 999;
}

#memberPopupBack {
	display: none;
	opacity: 0.5;
	width: 100%;
	height: 100%;
	background: lightgray;
	position: fixed;
	right: 0;
	top: 0%;
	z-index: 998;
}

#closeBtn {
	position: absolute;
	left: 475px;
	top: 0%;
	cursor: pointer;
}

td {
	cursor: pointer;
}

.userContent {
	display: inline-block;
	width: 530px;
}

.userContent.imgInfo {
	background: red;
}

.userContent.ctg {
	background: blue;
}

.userContent.other {
	background: green;
}

.row.userContent>div:nth-child(1) {
	top: 35px;
	height: 170px;
	padding-left: 7%;
}

#profileImg {
	/* max-width: 100%;
height: auto; */
	object-fit: cover;
	border-radius: 50%;
	width: 170px;
	height: 170px;
}

.row.userContent>div:nth-child(2) {
	text-align: right;
	font-weight: bold;
}

.row.userContent>div:nth-child(3) {
	text-align: left;
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
	
	<h1 align="center">회원 관리</h1>
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
						<option value="999999999">ALL</option>
					</select>
				</div>
				<div style="display: inline-block;">
					<input type="text" id="search">
					<button class="btn btn-success">검색</button>
				</div>
				
			</div>
			<div>
		<div id="memberPopupBack">
		</div>
			<div id="memberPopup">
				
					<div><h4><b>회원 정보</b></h4></div>
					<div id="closeBtn">
						<span class="glyphicon glyphicon-remove-sign btn-lg" id="closeBtn2"
							style="padding-left: 0px; padding-right: 0px; padding-bottom: 0px; padding-top: 0px;"></span>
					</div>
					<div class="row userContent">
						<div class="col-sm-4"><img src="${contextPath}/resources/uploadFiles/profile_image/profile_sample.PNG" id='profileImg'></div>
						<div class="col-sm-3"><br>
							<p>아이디 :</p>
							<p>이름 :</p>
							<p>닉네임 :</p>
							<p>가입일자 :</p>
							<p>방송국 :</p>
							<p>신고 횟수 :</p>
							<p>방송 횟수 :</p>
							<p>계정 관리 :</p>
						</div>
						<div class="col-sm-5"><br>
							<div id='userDetailContent'></div>
						</div>
					</div>

				</div>
			<table class="table table-hover"  style="text-align: center; ">
				<thead>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>방송 유무</th>
						<th>가입 날짜</th>
						<th>계정 현황</th>
					</tr>
				</thead>	
				<tbody>
				<c:forEach items="${userList}" var="user" varStatus="number">
					<tr>
						<td>${user.mno}</td>
						<td>${user.mid}</td>	
						<td>${user.name}</td>	
						<td>${user.nickName}</td>	
						<td>${user.isStreamer}</td>	
						<td>${user.enrollDate}</td>	
						<td>${user.mstatus}</td>
					</tr>
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
	
	
	<form action="memberList.ad" method="get" id='frmPaging'>
	      <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
	      <input type='hidden' name='index' id='index' value='${pi.index}'>
	      <input type='hidden' name='pageStartNum' id='pageStartNum' value='${pi.pageStartNum}'>
	      <input type='hidden' name='listCnt' id='selected' value='${pi.listCnt}'>    
	</form>

	<br>
</body>
<script>
var memberId
var memberNo
var memberStatus
var ban
	$(function() {
			$('li:eq(1)').addClass('active');
			$('#menu1').addClass('active in');
			$('#menu1 a:eq(0)').css('font-weight','bold');
			$('tbody>tr').click(function() {
				var mno = $(this).children().eq(0).html();
				var statusType = $(this).children().eq(6).html();
				
				memberId = $(this).children().eq(1).html();
				$.ajax({
		            url: "userDeatil.ad",
		            type: "post",
		            data: {mno:mno, statusType:statusType},
		            success: function(data){
		            	
		            	var mno = data.mno;
		            	var mid = data.mid;
		            	var name = data.name;
		            	var nickName = data.nickName;
		            	var enrollDate = data.enrollDate;
		            	var broadAddress = data.broadAddress;
		            	var report = data.report;
		            	var broCount = data.broCount;
		            	var mStatus = data.memStatus;
		            	var endDay = data.endDay;
		            	var banDay = data.banDay;
		            	var img = data.img;
		            	
		            	memberNo = data.mno;
		            	memberStatus = data.memStatus;
		            	if(banDay == 30){
		            		ban ='B3';
		            	}else if(banDay == 60){
		            		ban ='B6';	
		            	}else if(banDay == 90){
		            		ban ='B9';	
		            	}
		            	
		            	$('#profileImg').attr('src','${contextPath}/resources/uploadFiles/profile_image/'+img);
		            	$('#userDetailContent').append("<p>"+mid+"</p>");
		            	$('#userDetailContent').append("<p>"+name+"</p>");
		            	$('#userDetailContent').append("<p>"+nickName+"</p>");
		            	$('#userDetailContent').append("<p>"+enrollDate+"</p>");
		            	$('#userDetailContent').append("<p>www.null-live/"+broadAddress+".tv</p>");
		            	$('#userDetailContent').append("<p>"+report+"</p>");
		            	$('#userDetailContent').append("<p>"+broCount+"</p>");
		            	
		            	
		            	if(mStatus == 'Y'){
		            		$('#userDetailContent').append("<div style='display: inline-block;'> <select id='choiceStatus'> <option value='Y' selected>활동중</option> <option value='B3'>30일 정지</option> <option value='B6'>60일 정지</option> <option value='B9'>90일 정지</option> <option value='N'>영구정지</option> </select> </div> <div style='display: inline-block;'> <button onclick='userStatusUpdate()'>적용</button> </div>");
		            	}else if(banDay == 30){
							$('#userDetailContent').append("<div style='display: inline-block;'> <p>남은 정지 : "+endDay+"일</p> </div> <div style='display: inline-block;'> <select id='choiceStatus'> <option value='Y'>활동중</option> <option value='B3' selected>30일 정지</option> <option value='B6'>60일 정지</option> <option value='B9'>90일 정지</option> <option value='N'>영구정지</option> </select> </div> <div style='display: inline-block;'> <button onclick='userStatusUpdate()'>적용</button> </div>");
            		    }else if(banDay == 60){
            		      	$('#userDetailContent').append("<div style='display: inline-block;'> <p>남은 정지 : "+endDay+"일</p> </div> <div style='display: inline-block;'> <select id='choiceStatus'> <option value='Y'>활동중</option> <option value='B3'>30일 정지</option> <option value='B6' selected>60일 정지</option> <option value='B9'>90일 정지</option> <option value='N'>영구정지</option> </select> </div> <div style='display: inline-block;'> <button onclick='userStatusUpdate()'>적용</button> </div>");
            		    }else if(banDay == 90){
            		       	$('#userDetailContent').append("<div style='display: inline-block;'> <p>남은 정지 : "+endDay+"일</p> </div> <div style='display: inline-block;'> <select id='choiceStatus'> <option value='Y'>활동중</option> <option value='B3'>30일 정지</option> <option value='B6'>60일 정지</option> <option value='B9' selected>90일 정지</option> <option value='N'>영구정지</option> </select> </div> <div style='display: inline-block;'> <button onclick='userStatusUpdate()'>적용</button> </div>");
            		    }else if(mStatus == 'N'){
            		    	$('#userDetailContent').append("<div> <p>영구 정지</p> </div> <div style='display: inline-block;'> <select id='choiceStatus'> <option value='Y'>활동중</option> <option value='B3'>30일 정지</option> <option value='B6'>60일 정지</option> <option value='B9'>90일 정지</option> <option value='N' selected>영구정지</option> </select> </div> <div style='display: inline-block;'> <button onclick='userStatusUpdate()'>적용</button> </div>");
            		    }
	            		
		            	$('#userDetailContent').append("<p style='visibility: hidden;'>"+mno+"</p>");
		            	
		            },
		            error: function(){
		                alert("상세조회 실패");
		            }
		        });
				
				$('#memberPopup').css("display","block");
				$('#memberPopupBack').css("display","block");
			});
			$('#closeBtn2').click(function() {
				$('#memberPopup').css("display","none");
				$('#memberPopupBack').css("display","none");
				$('#userDetailContent').children().remove();
			});
			$('#memberPopupBack').click(function() {
				$('#memberPopup').css("display","none");
				$('#memberPopupBack').css("display","none");
				$('#userDetailContent').children().remove();
			});
	})
	
	function userStatusUpdate() {
	var choiceStatus = $("#choiceStatus").val();
	
		if (memberStatus == choiceStatus || ban == choiceStatus) {
			alert("현재 상태입니다.");
		} else {
			var select = confirm("정말로 계정상태를 변경하시겠습니까? 확인을 누르시면 변경됩니다. ");
			if (select) {
				location.href = 'userStatusUpdate.ad?mno=' + memberNo + '&choiceStatus=' + choiceStatus
				alert("변경되었습니다.");
			} else {
				alert("취소되었습니다.");
			}
		}
};

$(document).ready(function(){
	  $("#search").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("tbody tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
	
</script>
</html>