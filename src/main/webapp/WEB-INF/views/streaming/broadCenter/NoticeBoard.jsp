<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/noticeBoard.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">

			<!-- sidebar -->
			<div class="col-sm-3">
				<jsp:include page="../broadCenter/streamerMenu.jsp" />
			</div>

			<!-- main content -->
			<div class="col-sm-9" style="padding-top: 80px;">
				<h3>방송 공지 게시판</h3>
				<hr>
				<div class="ui form">
					<div class="field">
						<c:if test="${noticeInfo.NOTICE_CONTENT == null }">
							<textarea class="content" style="font-size: 20px;">공지가 없습니다.</textarea>
						</c:if>
						<c:if test="${noticeInfo.NOTICE_CONTENT != null }">
							<textarea class="content" style="font-size: 20px;">${noticeInfo.NOTICE_CONTENT}</textarea> 
						</c:if>
						<input type="text" style="visibility:hidden;" value="${noticeInfo.MNO}" id="mno"/>
					</div>
					<div id="button">
					<button class="ui green button" id="update">수정</button>
					<button class="ui green button" id="delete">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>


<script>
	$("#update").click(function(){
		var content = $(".content").val();
		var mno = ${loginUser.mno};
		
		 $.ajax({
			url:"updateNotice.sm",
			type="get",
			data:{mno:mno, content:content},
			success:function(data){
				$(".content").empty();
				$(".content").text(data.data.NOTICE_CONTENT);
			},
			error:function(){
				alert("공지 업데이트 실패!");
			}
		});  
		
	});


</script>

</body>
</html>