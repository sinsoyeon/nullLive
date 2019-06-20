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
	table {
		border:1px solid black;
	}
	td{
		text-align: center;
		border: 1px solid black;
		height: 30px;
	}
	th{
		border: 1px solid black;
	}
	
	.tableArea {
		width:650px;
		height:350px;
		margin:0 auto;
		
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
	<h1 align="center">공지사항</h1>
	<hr>
	<div class="outer">
		<!-- 공지사항 리스트 -->
		<div class="tableArea" align="center">
			<hr>
			<table align="center" class="col-lg-12">
				<tr>
					<th width="10%">번호</th>
					<th width="10%">작성자</th>
					<th width="50%">제목</th>
					<th width="20%">등록일</th>
					<th width="10%">조회수</th>
				</tr>
				<tr onclick="location.href='jobNoticeDetail.jsp'">
					<td height="20px">1</td>
					<td>운영자</td>
					<td align="left">[안내] 구인구직게시판 오픈★</td>
					<td>2019-06-19</td>
					<td>100</td>
				</tr>
			</table>

			
		</div>
		<!-- 하단 버튼영역 -->
		<div class="btnArea">
			<button class="btn" onclick="location.href = 'jobNoticeInsertForm.bd'">글쓰기</button>
		</div>
		<br><br>
		<!-- 페이징 영역 -->
		<!-- <div class="paginArea" align="center">
			<button>이전</button>
			<button>1</button>
			<button>2</button>
			<button>다음</button>
		</div> -->
		<div>
			<ul class="pager">
				<li class="previous"><a href="#">Previous</a></li>
				<li class="next"><a href="#">Next</a></li>
			</ul>
		</div>
	</div>
</body>
</html>