<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<td class="title" colspan="8">
							<div class="ui input" style="width:100%;">
								<input type="text" id="title"/>	
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="10" class="head">내용</td>
					</tr>
					<tr>
						<td colspan="10"><textarea id="content" style="min-height:200px; width:100%;"></textarea></td>
					</tr>
				</table>
				<br>
					<button id="write" class="ui green button write">등록</button>
				
			</div>
		</div>
	</div>
	
	
	<script>
		$("#write").click(function(){
			var mno = ${loginUser.mno};
			var title = $("#title").val();
			var content = $("#content").val();
			var bcno = ${broadCenter.bcno};
			
			
			/* var map = new Map();
			map.put("mno", mno);
			map.put("title", title);
			map.put("content", content);
			map.put("bcno", bcno); */
			v
			var param = [];
			var map = {mno:mno, title:title, content:content, bcno:bcno}
			
			param.push(map);
			
			var jsonData = JSON.stringify(param);
			
			
			console.log("jsonData: " + jsonData);
			
			location.href='insertCommunityDetail.bc?jsonData='+jsonData;
		
			
		});
		
	</script>
	
	
</body>
</html>