<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	width: 500px;
	height: 320px;
	border: 1px solid darkgray;
	background: white;
	position: absolute;
	margin-left: auto;
	margin-right: auto;
	left: 0;
	right: 0;
	top: 18%;
}

#memberPopupBack {
	display: none;
	opacity: 0.5;
	width: 100%;
	height: 106%;
	background: lightgray;
	position: absolute;
	margin-left: auto;
	margin-right: auto;
	left: 0;
	right: 0;
	top: 0%
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

.row.test>div:nth-child(1) {
	left: 25px;
	top: 35px;
	height: 170px;
}

img {
	/* max-width: 100%;
height: auto; */
	object-fit: cover;
	border-radius: 50%;
	width: 170px;
	height: 170px;
}

.row.test>div:nth-child(2) {
	text-align: right;
	font-weight: bold;
}

.row.test>div:nth-child(3) {
	text-align: left;
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
		<div id="memberPopupBack">
		</div>
			<div id="memberPopup">
				
					<div><h4><b>회원 정보</b></h4></div>
					<div id="closeBtn">
						<span class="glyphicon glyphicon-remove-sign btn-lg" id="closeBtn2"
							style="padding-left: 0px; padding-right: 0px; padding-bottom: 0px; padding-top: 0px;"></span>
					</div>
					<div class="row test">
						<div class="col-sm-4"><img src="resources/image/bbashong.png"></div>
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
							<p>bbashong</p>
							<p>김푸들</p>
							<p>빠숑</p>
							<p>2019.01.01</p>
							<p>www.null-love/bbashong.tv</p>
							<p>1회</p>
							<p>65회</p>
							<div style="display: inline-block;">
								<select>
									<option value="활동">활동</option>
									<option value="정지">정지</option>
								</select>
							</div>
							<div style="display: inline-block;"><button>적용</button></div>

						</div>
					</div>

				</div>
			<table class="table table-hover"  style="text-align: center; ">
				<thead>
					<tr>
						<th>아이디</th>
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
						<td>아이디<%=i %></td>
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


<br>
</body>
<script>
	$(function() {
			$('li:eq(1)').addClass('active');
			$('#menu1').addClass('active in');
			$('#menu1 a:eq(0)').css('font-weight','bold');
			$('td').click(function() {
				$('#memberPopup').css("display","block");
				$('#memberPopupBack').css("display","block");
			});
			$('#closeBtn2').click(function() {
				$('#memberPopup').css("display","none");
				$('#memberPopupBack').css("display","none");
			});
			$('#memberPopupBack').click(function() {
				$('#memberPopup').css("display","none");
				$('#memberPopupBack').css("display","none");
			});
	})
</script>
</html>