<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	.tableArea {
		width:650px;
		height:350px;
		margin:0 auto;
		
	}
	
	td,th{
		border: 1px solid black;
		text-align: center;
	}
	
	.btnArea{
		margin-left : auto;
		margin-right: auto;
		float: right;
	}
	.pagingArea{
		margin-left : auto;
		margin-right: auto;
	}
	
	.searchArea{
		margin-left : auto;
		margin-right: auto;
		width:650px;
	}
		
	
</style>

</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	<h1 align="center">콘텐츠제작자 구인구직 게시판</h1>
	<div class="outer">
		<!-- 콘텐츠제작자 리스트 테이블 -->
		<div class="tableArea" align="center">
			<hr>
			<table align="center" class="col-lg-12">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>구분</th>
					<th>등록일</th>
					<th>마감일</th>
					<th>마감여부</th>
				</tr>
				<tr onclick="location.href='jobContentDetail.jsp'">
					<td>1</td>
					<td>최병욱</td>
					<td>썸네일제작자구함</td>
					<td>구인</td>
					<td>2019-06-19</td>
					<td>2019-06-30</td>
					<td>모집중</td>
				</tr>
			</table>
		</div>
		
		<!-- 하단 버튼영역 -->
		<div class="btnArea">
			<button class="btn" >내가 쓴 글</button>
			<button class="btn"  onclick="location.href='jobContentInsertForm.bd'">글쓰기</button>
		</div>
		<br><br><br>
		<!-- 페이징 영역 -->
		<!-- <div class="pagingArea" align="center">
			<button class="btn">이전</button>
			<button class="btn">1</button>
			<button class="btn">2</button>
			<button class="btn">다음</button>
		</div> -->
		<div>
			<ul class="pager">
				<li class="previous"><a href="#">Previous</a></li>
				<li class="next"><a href="#">Next</a></li>
			</ul>
		</div>
		<br>		
		<!-- 검색바 영역 -->
		<div class="searchArea" align="center">
			<label>작성자 </label>
			<input type="checkBox">
			<label>내용</label>
			<input type="checkBox">
			<label>제목</label>
			<input type="checkBox">
			<input type="search">
			<button class="btn">검색하기</button>
		</div>
		
	</div>
</body>
</html>