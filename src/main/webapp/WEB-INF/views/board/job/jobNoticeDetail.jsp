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
</style>

</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	<h1 align="center">공지사항</h1>
	<hr>
	
	<!-- 공지 상세 보기 -->
	<div class="outer">
		<!-- 제목영역 -->
		<div>
			<!-- 제목 -->
			<div>
				<div class="dateArea">
					<b>19-06-19 22:00</b>
				</div>
				<h3><b>[안내] 공지입니다.</b></h3>
			</div>
			<br>
		</div>
		<!-- 내용영역 -->
		<div class="contentArea">
			<p>
				그들을 찾아다녀도, 미묘한 하는 천지는 이것이다. 위하여 주는 현저하게 온갖 두손을 때에, 용감하고 그것을 있다. 천자만홍이 인생에 용기가 이것은 힘차게 아름답고 눈이 이상의 인간은 것이다. 물방아 목숨이 그들은 우는 반짝이는 동산에는 것은 군영과 아니한 아름다우냐? 오직 청춘의 않는 것이다. 위하여 있으며, 긴지라 인간의 설산에서 열매를 황금시대다. 할지니, 것은 대한 것이다. 발휘하기 있는 동산에는 없으면 유소년에게서 피고 오아이스도 만물은 꾸며 끓는다. 용기가 생명을 얼마나 끓는다. 곳으로 힘차게 얼마나 품었기 청춘은 것은 봄바람이다.

무엇을 인생에 우는 피어나는 이것을 평화스러운 청춘의 그러므로 천고에 철환하였는가? 그들의 우리의 뭇 인간에 웅대한 힘있다. 우리 설레는 동산에는 기쁘며, 긴지라 새가 것이다. 피에 그들의 석가는 피다. 우는 심장의 이상 사랑의 동력은 우리의 청춘의 사막이다. 인간의 생생하며, 가장 꽃이 것이다. 자신과 만천하의 살 하였으며, 말이다. 이상 우리 희망의 않는 것이다. 사랑의 찬미를 대고, 구하기 남는 어디 이상 것은 피다. 노래하며 인생을 무한한 못하다 몸이 생생하며, 기관과 보라.
			</p>
		</div>
		<br>
		<!-- 첨부파일 영역 -->
		
		<div>
			<label>첨부파일</label>
		</div>
		
		
		<!-- 하단 버튼영역 -->
		<div align="center">
			<button>작성하기</button>
			<button onclick="location.href='jobNoticeList.jsp'">목록으로</button>
		</div>
	</div>
	
	
</body>
</html>