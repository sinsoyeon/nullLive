<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<script type="text/javascript" src="resources/js/paging/paging.js"></script>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/communicationBoard.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
	<header style="height: 50px;">
		<jsp:include page="../../common/menubar.jsp" />
	</header>
	<div class="container-fluid">
		<div class="row">

			<!-- sidebar -->
			<div class="col-sm-2">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>

			<!-- main content -->
			<div class="col-sm-10" style="padding-left: 55px; padding-top: 28px;">
				<h3 id="ss">시청자 소통 게시판</h3>
				<hr>
				<c:if test="${firstCheck < 1}">
					<script>
						alert("커뮤니티 게시판을 활성화합니다.");
						location.href="${contextPath}/enableCommunityBoard.st?smno=${broadCenter.mno}";
					</script>
				</c:if>
				
				<c:if test="${firstCheck >= 1}">
				<div class="ui category search">
					<div class="ui icon input" style="float: right;">
						<input class="prompt" type="text"> <i class="search icon"></i>
					</div>
				</div>
				<br>
				<table class="communiTable" id="test">
					<thead>
					<tr>
						<th><input type="checkbox" id="allCheck"/></th>
						<th>글번호</th>	
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>조회수</th>
						<th style="visibility: hidden;"></th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="list" items="${list}">
						<tr>
							<td onclick="event.cancelBubble=true;"><input type="checkbox" class="checkbox" name="checkDelete"/></td>
							<td>${list.RNUM}</td>
							<td>${list.BTITLE}</td>
							<td>${list.MNICK_NAME}</td>
							<td>${list.WRITTEN_DATE}</td>
							<td>${list.BCOUNT}</td>
							<td style="visibility: hidden;" class="bno">${list.BNO}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<!-- 페이징 처리 필요 -->
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
	                <li><a onclick='pageNext(${pi.pageStartNum},${pi.total},${pi.listCnt},${pi.pageCnt});'>›</a></li>
	                <!--마지막 페이지 이동 -->
	                <li><a onclick='pageLast(${pi.pageStartNum},${pi.total},${pi.listCnt},${pi.pageCnt});'>»</a></li>
	                
	        	</ul>
	        </div>
	        
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
	            <input type='hidden' name="smno" value='${broadCenter.mno}'>
	            <!-- 페이징 추가 쿼리스트링 -->
	        </form>
				
				
				<br><br><br>
				<button class="ui green button" id="write" onclick="location.href='moveCommunityDetail.st'">글작성</button>
				
				
				<!-- 삭제는 스트리머만 가능하게 -->
					<c:if test="${loginUser.mno eq broadCenter.mno}">
						<button class="ui green button" id="delete">삭제</button>
					</c:if>
				</c:if>
			</div>

		</div>
	</div>


<script>
	
	//상세보기
	 $(".communiTable").on('click', 'td', function(){
		 var bno = $(this).closest('td').siblings(".bno").text();
		//console.log("비엔오: " + bno);
		
		location.href = "selectCommunityDetail.st?bno="+bno;
	});
	 
	
	 $('#delete').click(function() {
		 var result = confirm('해당 게시물들을 삭제하시겠습니까?'); 
		 
		 if(result){
			var deleteList = "";
			var smno = ${broadCenter.mno}
		
			$("input[name='checkDelete']:checked").each(function() {
				var bbbb = $(this).closest("td").siblings(".bno").text();
				
				
				console.log(bbbb);
				
				if(deleteList == "") {
					deleteList = $(this).closest("td").siblings(".bno").text();
				} else {
					deleteList = deleteList + "," + $(this).closest("td").siblings(".bno").text();
				}
			});
		
			console.log(deleteList);
		
			$.ajax({
				type:"post",
				url:"deleteManyCommu.st",
				data:{list:deleteList},
				success:function(data){
					if(data.data>0){
						alert("선택 게시물을 삭제했습니다.");
						location.href='communicationBoard.st?smno='+smno;
					}else{
						alert("선택 게시물 삭제에 실패했습니다.");
					}
				},
				error:function(data){
					console.log("삭제 실패! " + data);
				}
			});
		
		 }
		
	 });
	
	
	 //전체 체크 선택
	 $("#allCheck").click(function(){
		 $('.checkbox').prop('checked', this.checked);
	 });
	
</script>


</body>
</html>