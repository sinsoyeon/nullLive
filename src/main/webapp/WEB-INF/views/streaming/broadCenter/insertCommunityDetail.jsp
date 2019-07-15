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
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">


			<!-- sidebar -->
			<div class="col-sm-3">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>

			<div class="col-sm-9" style="padding-top: 80px;">
				<h1 align="center">게시판 작성</h1>
				<hr><br>
				
				<table align="center" class="table">
					<tr>
						<td colspan="2" class="head">제목</td>
						<c:if test="${title != null}">
							<td class="title" colspan="8">
							<div class="ui input" style="width:100%;">
								<input type="text" id="title" value="${title }"/>	
							</div>
						</td>
						</c:if>
						<c:if test="${title == null}">
						<td class="title" colspan="8">
							<div class="ui input" style="width:100%;">
								<input type="text" id="title"/>	
							</div>
						</td>
						</c:if>
					</tr>
					<tr>
						
						<td colspan="10" class="head">내용</td>
					</tr>
					<tr>
						<c:if test="${content != null}">
						<td colspan="10"><textarea id="content" style="min-height:200px; width:100%;">${content}</textarea></td>
						</c:if>
						<c:if test="${content == null}">
						<td colspan="10"><textarea id="content" style="min-height:200px; width:100%;"></textarea></td>
						</c:if>
					</tr>
				</table>
				<br>
					
					<c:if test="${ update == null}">
					<button id="write" class="ui green button write">등록</button>
					</c:if>
					
					<c:if test="${ update != null}">
					<button id="update" class="ui green button update">수정</button>
					</c:if>
					
					<input type="text" id="bno" value="${bno}" hidden/>
			</div>
		</div>
	</div>
	
	
	<script>
	$("#write").click(function(){
		var mno = ${loginUser.mno};
		var title = $("#title").val();
		var content = $("#content").val();
		var smno = ${broadCenter.mno};
		
		
		/* var map = new Map();
		map.put("mno", mno);
		map.put("title", title);
		map.put("content", content);
		map.put("bcno", bcno); */
		
		var param = [];
		var map = {mno:mno, title:title, content:content, smno:smno}
		
		param.push(map);
		
		var jsonData = JSON.stringify(param);
		
		
		console.log("jsonData: " + jsonData);
		
		
		 $.ajax({
				type:"post",
				url : "insertCommunityDetail.st",
				traditional:true,
				dataType: "json",
				data : { jsonData : jsonData},
				success:function(data){
					console.log("성공인데?" + data)
					if(data.data>0){
						alert("게시물을 등록했습니다.");
						location.href='communicationBoard.st?smno='+smno;
					}else{
						alert("게시물 등록에 실패했습니다.");
					}
				},
				error : function(data){
					console.log("데이터: " + data)
					console.log("실패!!!");
				}
				
			});  
		
	});
	
	
	$("#update").click(function(){
		var title = $("#title").val();
		var content = $("#content").val();
		var bno = $("#bno").val();
		var smno = ${broadCenter.mno};
		
		var param = [];
		var map = {bno:bno, title:title, content:content}
		
		param.push(map);
		
		var jsonData = JSON.stringify(param);
		
		
		console.log("jsonData: " + jsonData);
		
		
		 $.ajax({
				type:"post",
				url : "updateCommunityDetail.st",
				traditional:true,
				dataType: "json",
				data : { jsonData : jsonData},
				success:function(data){
					console.log("성공인데?" + data)
					if(data.data>0){
						alert("게시물을 수정했습니다.");
						location.href='communicationBoard.st?smno='+smno;
					}else{
						alert("게시물 수정에 실패했습니다.");
					}
				},
				error : function(data){
					console.log("데이터: " + data)
					console.log("실패!!!");
				}
				
			}); 
	});
		
	</script>
	
	
</body>
</html>