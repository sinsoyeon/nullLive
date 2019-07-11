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
		height: 50px;
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
			
			<c:if test="${ !empty loginUser }">
				<div class="btnArea">
					<button onclick="selectMyboard()"class="btn">내가 쓴 글</button>
					<button onclick="location.href='jobMngInsertForm.jbo'" class="btn">글쓰기</button>
				</div>
			</c:if>
			
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
							<td><c:out value="${ board.nickName }"/></td>
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
							<td id="staDetail">
								<c:out value="${ board.staDetail}"/>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- 페이징 영역 -->
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
                <li><a onclick='pageNext(${pi.pageStartNum},${pi.total},${pi.listCnt},${pi.pageCnt});'>›</a></li>
                <!--마지막 페이지 이동 -->
                <li><a onclick='pageLast(${pi.pageStartNum},${pi.total},${pi.listCnt},${pi.pageCnt});'>»</a></li>
                
	        </ul>
	        
	        <!-- 선택된 값들을 보낼 form 영역 -->
	        <c:set var="pagingHandler" value="${ jobBoardList.jbo }"/>
	      
	        <c:if test="${ isMyBoardList eq true }">
	        	<c:set var="pagingHandler" value="${ jobMyboard.jbo }"/>
	        </c:if>
	        <form onSubmit="pagingHandler" method="get" id='frmPaging'>
	            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
	            <input type='hidden' name='index' id='index' value='${pi.index}'>
	            <input type='hidden' name='pageStartNum' id='pageStartNum' value='${pi.pageStartNum}'>
	            <input type='hidden' name='listCnt' id='selected' value='${pi.listCnt}'>
	            <input type='hidden' name='bType' value='JOBMNG'>
	            <!-- 페이징 추가 쿼리스트링 -->
	            <!-- 내가 쓴 글 페이징 -->
	        	<input type='hidden' name='url' value='board/job/jobMngList'>
	        </form>
	        
	        
	        <!-- 검색바 영역 -->
	        <br>
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
	</div>
	<script>
		//게시판 상세보기
	/* 	$(function(){
		주석 : 소연))페이징 참고중!!
			 */
			
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"#e2f0d8","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"})
			}).click(function(){
				var bno = $(this).parent().children().eq(0).text();
				location.href='selectOneJobBoard.jbo?bno='+bno ;
			}) 
			//마감 여부에 따른 리스트 변경
			$("#listArea td").each(function(){
				var staDetail = $(this).text().trim();
				//모집완료 , 등록만료글 이벤트 제거
				if( staDetail == "모집완료" || staDetail == "등록만료"){
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
				console.log(staDetail);
				if( bStatus == "모집완료"){
					$(this).css({"background":"darkgray"});
					$(this).find("td").each(function(){
						$(this).unbind("click");
						$(this).unbind("mouseenter");
						$(this).unbind("mouseout");
					});
				}
			});  */
		/* 	console.log(location.href)
		}) */
		//내가 쓴 글 조회
		function selectMyboard(){
			var sub = "bType=JOBMNG&url=board/job/jobMngList";
			location.href="jobMyboard.jbo?"+sub ;
		}
		
	</script>
	
	
</body>
</html>