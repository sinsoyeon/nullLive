<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.outer {
		width:900px;
		height:500px;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}

	.contentArea{
		padding-top : 50px;
		padding-bottom : 50px;
		margin-left: auto;
		margin-right: auto;
		border: solid 1px black;
	}
	.dateArea {
		float: right;
	}
	.divTest {
		border: solid 1px black;
	}
	.profileImg{
		width:150px;
		height:200px;
		margin-top: 2%;
		margin-bottom: 2%;
	}
	.boardInfoArea>div{
		height:50px;
	}
	
</style>

</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	<h1 align="center">매니저 구인구직 게시판</h1>
	<hr>
	
	<!-- 구인구직 상세 보기 -->
	<div class="outer">
		<!-- 프로필 영역 -->
		<div class="divTest col-lg-4" align="center">
			<div class="profileImg divTest" align="center">
				<img alt="" src="${ contextPath }/resources/uploadFile/profile.gif" width="100%" height="100%">
				<label>BJ에비츄</label>
				<label>[신]</label>
				<label>[쪽]</label>
			</div>
		</div>
		<!-- 게시글 정보 영역 -->
		<div class="divTest col-lg-8">
			<div><h2>제목</h2></div>
		</div>
		<div class="boardInfoArea" >
			
			<hr>
			<div class="divTest col-lg-2">
				글번호 : 
			</div>
			<div class="divTest col-lg-1">
				구분 : 
			</div>
			<div class="divTest col-lg-3">
				등록일 : 
			</div>
			<div class="divTest col-lg-2">
				모집중 
				
				<br>
			</div>
		</div>
		<hr>
		<!-- 게시자 정보 영역 -->
		<div class="divTest col-lg-8" style="height: 96px">
			<div>게시자 정보</div>
			<button>상세정보</button>
		</div>
		<!-- 버튼영역  -->
		<div class="btnArea col-lg-12" align="center">
			<br><br>
			<button>지원하기</button>
			<button>목록으로</button>
			<button>수정하기</button>
			<br><br>
		</div>
		<!-- 게시글  -->
		<div class="contentArea col-lg-12">
				<p>
						그들을 찾아다녀도, 미묘한 하는 천지는 이것이다. 위하여 주는 현저하게 온갖 두손을 때에, 용감하고 그것을 있다. 천자만홍이 인생에 용기가 이것은 힘차게 아름답고 눈이 이상의 인간은 것이다. 물방아 목숨이 그들은 우는 반짝이는 동산에는 것은 군영과 아니한 아름다우냐? 오직 청춘의 않는 것이다. 위하여 있으며, 긴지라 인간의 설산에서 열매를 황금시대다. 할지니, 것은 대한 것이다. 발휘하기 있는 동산에는 없으면 유소년에게서 피고 오아이스도 만물은 꾸며 끓는다. 용기가 생명을 얼마나 끓는다. 곳으로 힘차게 얼마나 품었기 청춘은 것은 봄바람이다.
		
		무엇을 인생에 우는 피어나는 이것을 평화스러운 청춘의 그러므로 천고에 철환하였는가? 그들의 우리의 뭇 인간에 웅대한 힘있다. 우리 설레는 동산에는 기쁘며, 긴지라 새가 것이다. 피에 그들의 석가는 피다. 우는 심장의 이상 사랑의 동력은 우리의 청춘의 사막이다. 인간의 생생하며, 가장 꽃이 것이다. 자신과 만천하의 살 하였으며, 말이다. 이상 우리 희망의 않는 것이다. 사랑의 찬미를 대고, 구하기 남는 어디 이상 것은 피다. 노래하며 인생을 무한한 못하다 몸이 생생하며, 기관과 보라.
					</p>
		
		</div>
		
		<!-- 지원하기 버튼 -->
		<div class="btnArea col-lg-12" align="center">
		<br><br>
			<button>지원하기</button>
		</div>
	
		<br><br><br><br><br><br>
		<hr>
		<br><br><br><br>
		<!-- 지원 현황 영영 -->
		<div>
			<div>
				<h4><b>지원현황</b></h4>
				<hr>
			</div>
			
			<!-- 지원 현황 테이블 -->
			<table align="center" class="col-lg-12">
				<tr>
					<th>ID</th>
					<th>일자</th>
					<th>지원서보기</th>
					<th>승낙하기</th>
				</tr>
				<tr>
					<td>bj인효</td>
					<td>2019-06-04</td>
					<td>지원서</td>
					<td>승낙하기</td>
				</tr>
			</table>
			
		</div>
		
		<br><br><br><br>
	</div>
</body>
</html>