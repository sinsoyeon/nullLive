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
	td{
		text-align: center;
		height: 30px;
		border-bottom: 1px solid lightgray;
	}
	th{
		border: 1px solid lightgray;
	}
	
	.tableArea {
		width:auto;
		height:auto;
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
			<!-- 공지사항 리스트 -->
			<div class="tableArea" align="center">
				<div class="listSelectArea">
					<select id="listChange" class="form-controll" onchange='listChange();'>
						<option contenteditable="true">목록갯수</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select>
				</div>
				<!--  버튼영역 -->
				<c:if test="${ loginUser.isAdmin eq 'Y' }">
					<div class="btnArea">
						<button class="btn" onclick="location.href = 'jobNoticeInsertForm.jbo'">글쓰기</button>
					</div>
				</c:if>
			
			
			<br><br>
			<hr>
			
			<!-- 리스트 테이블영역 -->
			
			<div id="listArea">
				
				<table align="center" class="table col-lg-12">
				<tr>
					<th width="10%">번호</th>
					<th width="10%">작성자</th>
					<th width="50%">제목</th>
					<th width="20%">등록일</th>
					<th width="10%">조회수</th>
				</tr>
				<c:forEach var="board" items="${ list }">
					<tr>
						<td id="bno">${ board.bno }</td>
						
						<td><c:out value="${ board.nickName }"/></td>
						<td><c:out value="${ board.bTitle }"/></td>
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
						<td><c:out value="${ board.bCount }"/></td>
						
						
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
	        <form action="jobNoticeList.jbo" method="get" id='frmPaging'>
	            <!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
	            <input type='hidden' name='index' id='index' value='${pi.index}'>
	            <input type='hidden' name='pageStartNum' id='pageStartNum' value='${pi.pageStartNum}'>
	            <input type='hidden' name='listCnt' id='selected' value='${pi.listCnt}'>    
	        </form>
	        <!-- 페이징 영역 끝 -->
	        
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
			
		})
	</script>
	
	
</body>
</html>