<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
<style>
	.col-sm-5>div,.col-sm-10>div{
		background: #ffffff;
		cursor: pointer;
	}
	tr>th{
		text-align: center;
		background: #438c31;
		color: white;
	}
</style>
</head>
<body>
	<%@ include file="adminMenubar.jsp" %>

<div class="row" align="center">
  <div class="col-sm-1"></div>
  <div class="col-sm-5">
  	<div onclick="location.href='memberStatisticsList.ad'"  data-toggle="tooltip" title="회원 통계 페이지로 이동"><h3>회원 통계</h3>
  	<br>
  	<br>
  	<br> 
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	</div>
  	
  </div>
  <div class="col-sm-5"><div onclick="location.href='sitesStatisticsList.ad'" data-toggle="tooltip" title="사이트 통계 페이지로 이동"><h3>사이트 통계</h3>
  <br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  	<br>
  </div></div>
  <div class="col-sm-1"></div>
</div>
<br>
<div class="row" align="center">
  <div class="col-sm-1"></div>
  <div class="col-sm-5">
  	<div onclick="location.href='calculateList.ad'" data-toggle="tooltip" title="정산 페이지로 이동"><h3>정산</h3>
		<div>
  		<table class="table table-striped"  style="text-align: center;">
  			<thead>
  				<tr>
  					<th>닉네임</th>
  					<th>신청 Null</th>
  					<th>신청 날짜</th>
  				</tr>
  			</thead>
  			<tbody>
  				<tr > 
  					<td>유저33</td>
  					<td>25000</td>
  					<td>2018.06.01</td>
  				</tr>
  				<tr>
  					<td>유저21</td>
  					<td>10000</td>
  					<td>2018.06.04</td>
  				</tr>
  				<tr>
  					<td>유저16</td>
  					<td>15000</td>
  					<td>2018.06.16</td>
  				</tr>
  				<tr>
  					<td>유저31</td>
  					<td>20000</td>
  					<td>2018.06.19</td>
  				</tr>
  				<tr>
  					<td>유저11</td>
  					<td>30000</td>
  					<td>2018.06.24</td>
  				</tr>
  			</tbody>
  		</table>
  	</div>  	
  	</div>
  </div>
	<div class="col-sm-5">
		<div onclick="location.href='streamerReportList.ad'" data-toggle="tooltip" title="신고관리 페이지로 이동"><h3>스트리머 신고 관리</h3>
		
		<div>
  		<table class="table table-striped"  style="text-align: center;">
  			<thead>
  				<tr>
  					<th style="text-align: center;">구분</th>
  					<th style="text-align: center;">닉네임</th>
  					<th style="text-align: center;">처리현황</th>
  				</tr>
  			</thead>
  			<tbody>
  				<tr > 
  					<td>저작권 침해</td>
  					<td>BJ디즈이니</td>
  					<td>미확인</td>
  				</tr>
  				<tr > 
  					<td>저작권 침해</td>
  					<td>BJ마벌</td>
  					<td>미확인</td>
  				</tr>
  				<tr > 
  					<td>명예훼손</td>
  					<td>BJ욕쟁이할범</td>
  					<td>미확인</td>
  				</tr>
  				<tr > 
  					<td>불법/음란</td>
  					<td>BJ토토</td>
  					<td>처리</td>
  				</tr>
  				<tr > 
  					<td>명예훼손</td>
  					<td>BJ드립</td>
  					<td>처리</td>
  				</tr>
  			</tbody>
  		</table>
  	</div>  	
		
		</div>
	</div>
  <div class="col-sm-1"></div>
</div>
<br>
<div class="row" align="center">
  <div class="col-sm-1"></div>
  <div class="col-sm-10">
  	<div onclick="location.href='questionList.ad'" data-toggle="tooltip" title="문의관리 페이지로 이동"><h3>1:1 문의 내역</h3>
  
  <div>
  		<table class="table table-striped"  style="text-align: center;">
  			<thead>
  				<tr>
  					<th style="text-align: center;">구분</th>
  					<th style="text-align: center;">이름</th>
  					<th style="text-align: center;">제목</th>
  					<th style="text-align: center;">날짜</th>
  					<th style="text-align: center;">답변</th>
  				</tr>
  			</thead>
  			<tbody>
  				<tr> 
  					<td>방송</td>
  					<td>송상영</td>
  					<td>방송문의 입니다.</td>
  					<td>2019.06.19</td>
  					<td>대기중</td>
  				</tr>
  				<tr> 
  					<td>회원</td>
  					<td>주두원</td>
  					<td>회원관련 문의입니다.</td>
  					<td>2019.06.13</td>
  					<td>대기중</td>
  				</tr>
  				<tr> 
  					<td>이용</td>
  					<td>조웅인</td>
  					<td>이용관련 문의요</td>
  					<td>2019.06.11</td>
  					<td>대기중</td>
  				</tr>
  				<tr> 
  					<td>기타</td>
  					<td>박철진</td>
  					<td>궁금합니다.</td>
  					<td>2019.06.08</td>
  					<td>완료</td>
  				</tr>
  				<tr> 
  					<td>정지</td>
  					<td>이하경</td>
  					<td>정지 풀어주세요...</td>
  					<td>2019.06.03</td>
  					<td>완료</td>
  				</tr>
  			</tbody>
  		</table>
  	</div> 
  
  	</div>
  </div>
  <div class="col-sm-1"></div>
</div>
<br>
<br>
</body>

<script>
	$(function() {
		$('li:eq(0)').addClass('active');
		$('#home').addClass('active in');
		$('#home a:eq(0)').css('font-weight','bold');
		$('[data-toggle="tooltip"]').tooltip(); 
	})
</script>
</html>