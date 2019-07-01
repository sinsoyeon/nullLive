<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		border:1px solid white;
	}
	.tableArea {
		width:850px;
		height:350px;
		margin:0 auto;
		
	}
	th{
		border: 1px solid lightgray;
	}
	td{
		text-align: center;
		height: 30px;
		border-bottom: 1px solid lightgray;
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
	.listSelectArea{
		float: left;
	}
		
	
</style>
<script type="text/javascript" src="resources/js/paging/paging.js"></script>
</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	
	<div class="outer">
		<jsp:include page="jobHeader.jsp"/>
		<hr>					
		
		
		<!-- 매니저 게시판 리스트 테이블 -->
		<div class="tableArea" align="center">
			<!-- 목록 갯수 조정 -->
			<div class="listSelectArea">
				<select id="listChange" class="form-controll" onchange='listChange();'>
					<option contenteditable="true">목록갯수</option>
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="50">50</option>
				</select>
			</div>	
			
			<!-- 버튼영역  -->	
			<div class="btnArea">
				<button class="btn">내가 쓴 글</button>
				<button onclick="location.href='jobMngInsertForm.jbo'" class="btn">글쓰기</button>
			</div>
			<br><br>
			
				
			<div id="listArea">
				<hr>
				<table align="center" class="table col-lg-12">
					<tr>
						<th width="5%">번호</th>
						<th width="10%">작성자</th>
						<th width="40%">제목</th>
						<th width="5%">구분</th>
						<th width="10%">등록일시</th>
						<th width="10%">마감일</th>
						<th width="10%">마감여부</th>
					</tr>
					<c:forEach var="board" items="${ list }">
						<tr>
							<td id="bno"><c:out value="${ board.bno }"/></td>
							<td><c:out value="${ board.bWriter }"/></td>
							<td><c:out value="${ board.bTitle }"/></td>
							<td><c:out value="${ board.jBtype }"/></td>
							<!-- 등록일시 -->
							<td id="writtenDate">
								<c:set var="writtenDate" value="${ board.writtenDate }" />
								<c:set var="nowDate" value="<%= new java.util.Date() %>"/>
								
								<fmt:formatDate value="${writtenDate}" pattern="yyyy-MM-dd" var="wd"/>
								<fmt:formatDate value="${nowDate}" pattern="yyyy-MM-dd" var="nd"/>
								
								<!-- 등록일시 일수가 넘어간경우 날짜를 보여줌 -->
								<c:if test="${ wd < nd }">
									<fmt:formatDate value="${writtenDate}" pattern="yyyy-MM-dd" />
								</c:if>
								<!-- 등록일시가 현재일인 경우 시간을 보여줌 -->
								<c:if test="${ wd >= nd }">
									<fmt:formatDate type="TIME" timeStyle="short" value="${writtenDate}"/>
								</c:if>
								
								
							</td>
							<!-- 마감일 -->
							<td id="deadLine">
								<c:set var="deadLine" value="${ board.deadLine }" />
								<fmt:formatDate value="${deadLine}" pattern="yyyy-MM-dd" />
							</td>
							
							<!-- 마감여부 -->
							<td id="bStatus">
								<c:choose>
									<c:when test="${ board.bStatus eq 500 }">모집중</c:when>
									<c:when test="${ board.bStatus eq 501 }">모집완료</c:when>
									<c:when test="${ board.bStatus eq 502 }">등록만료</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<br><br><br>
		<!-- 페이징 영역 -->
		<!-- <div class="pagingArea" align="center">
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
		<br>		
		<!-- 검색바 영역 -->
		<div class="searchArea" align="center">
			<input type="checkBox">
			<label>작성자 </label>
			<input type="checkBox">
			<label>내용</label>
			<input type="checkBox">
			<label>제목</label>
			<input type="search">
			<button class="btn">검색하기</button>
		</div>
		
	</div>
	<script>
		//게시판 상세보기
		$(function(){
			
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"#e2f0d8","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"})
			}).click(function(){
				var bno = $(this).parent().children().eq(0).text();
				location.href='selectOneJobNotice.jbo?bno='+bno ;
			}) 
			//마감 여부에 따른 리스트 변경
			$("#listArea td").each(function(){
				var bStatus = $(this).text().trim();

				//모집완료 , 등록만료글 이벤트 제거
				if( bStatus == "모집완료" || bStatus == "등록만료"){
					$(this).parent().css({"background":"darkgray"});
					$(this).parent().css({"color":"white"});
					$(this).parent().find("td").each(function (){
						// onclick hover 제거
						$(this).unbind("mouseenter mouseout click");
					});
				}
			});
			
			/* //마감 여부에 따른 리스트 변경
			$("#listArea tr").each(function(){
				var bStatus = $(this).find("td").eq(6).text().trim();
				console.log(bStatus);
				if( bStatus == "모집완료"){
					$(this).css({"background":"darkgray"});
					$(this).find("td").each(function(){
						$(this).unbind("click");
						$(this).unbind("mouseenter");
						$(this).unbind("mouseout");
					});
				}
			});  */
			
		})
	</script>
</body>
</html>