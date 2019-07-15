<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/communityBoardDetail.css">
<style>
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">


			<!-- sidebar -->
			<div class="col-sm-3">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>

			<div class="col-sm-9" style="padding-top: 80px;">
				<h1 align="center">게시판 상세 보기</h1>
				<hr><br>
				
				<table align="center" class="table">
					<tr>
						<td class="head" colspan="2" style="width:15%;">카테고리</td>
						<td colspan="3" style="width:35%;">${communityDetail.BTYPE}</td>
						<td class="head" colspan="2" style="width:15%;">조회수</td>
						<td colspan="3" style="width:85%;">${communityDetail.BCOUNT }</td>
					</tr>
					<tr>
						<td class="head" colspan="2" style="width:15%;">작성자</td>
						<td colspan="3" style="width:35%;">${communityDetail.NICK_NAME}</td>
						<td class="head" colspan="2" style="width:15%;">작성일</td>
						<td colspan="3" style="width:85%;">${communityDetail.WRITTEN_DATE }</td>
					</tr>
					<tr>
						<td class="head" colspan="2">제목</td>
						<td colspan="8" id="title">${communityDetail.BTITLE }</td>
					</tr>
					<tr>
						<td class="content" colspan="10" id="content"><p style="min-height:200px;">${communityDetail.BCONTENT}</td>
					</tr>
				</table>
				<br><br>
				
				<div class="buttonArea">
					<c:if test="${communityDetail.BWRITER eq loginUser.mno }">
						<button class="ui green button" id="delete">삭제</button>
						<button class="ui green button" id="update">수정</button>
					</c:if>
				</div>
				<br><br><br>
				<br><br><br>
				<table align="center">
					<tr>
						<td><textarea cols="60" rows="5"></textarea></td>
						<td>
							<button>등록하기</button>
						</td>
					</tr>
					<tr>
						<td colspan="2"><b></b></td>
					</tr>
				</table>
				
				<input type="text" id="bno" value="${communityDetail.BNO}" hidden/>
				
				<%-- <c:if test="${ rCount > 0 }">
		<table align="center">
			<c:forEach var="r" items="${b.replyList }">
				<tr>
					<td width="100px">${ r.userName }</td>
					<td width="300px">${ r.rContent }</td>
					<td width="100px">${ r.createDate }</td>
				</tr>
			</c:forEach>
		</table>	
		</c:if> --%>
			</div>
		</div>
	</div>
	
	
	
	<script>
		$("#update").click(function(){
			var title = $("#title").text();
			var content = $("#content").text();
			var bno = $("#bno").val();
			
			
			console.log("t:" + title + "c: " + content + "b: " + bno);
			
			location.href="moveUpdateCommu.st?title="+title+"&content="+content+"&bno="+bno;
		});		
		
		
		$("#delete").click(function(){
			var bno = $("#bno").val();
			var smno = ${broadCenter.mno};
			
			$.ajax({
				type:"post",
				url:"deleteCommunityDetail.st",
				data:{bno:bno},
				success:function(data){
					if(data.data>0){
						alert("게시물을 삭제했습니다.");
						location.href='communicationBoard.st?smno='+smno;
					}else{
						alert("게시물 삭제에 실패했습니다.");
					}
				},
				error:function(data){
					console.log("삭제 실패! " + data);
				}
			});
			
		});
		
	</script>

</body>
</html>