<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
<style>
/*방송 영역 스크롤바 */
::-webkit-scrollbar {
	height: 13px;
}

::-webkit-scrollbar-track {
	background: none;
}

::-webkit-scrollbar-thumb {
	background: none;
	border-radius: 8px;
}

::-webkit-scrollbar-thumb:hover {
	background: #eeeeeea3;
}
/* 방송 목록 */
.s-name:hover{
	cursor: pointer;
    text-decoration: underline;
}
.t-img:hover{
	cursor: pointer;
}
.img-circle:hover{
	cursor: pointer;
}
</style>
</head>
<body>
	<header style="height: 50px;">
		<jsp:include page="../common/menubar.jsp" />
	</header>

	<div class="container-fluid">
		<div class="row">
			<!-- 왼쪽 사이드바 -->
			<div class="col-md-2">
				<jsp:include page="../main/mainNavbar.jsp" />
			</div>

			<div class="col-md-10" style="padding-left: 55px; padding-top: 28px;">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<span style="font-size: 18px;">검색</span><i class="fas fa-search"
								style="font-size: 15px; color: #4a8522ad; margin-left: 1%;"></i>
						</div>
					</div>
					<div class="col-md-12"
						style="padding: 0 15px; border-radius: 15px; margin-top: 13px; border: 0.5px solid #999;">
						<div class="row"
							style="height: 120px; margin-top: 1%; display: block; white-space: nowrap; overflow-y: hidden;">
							<table id="bjT">
								<tbody>
									<tr>
										<td id="bjDiv"><c:forEach var="list"
												items="${streamerList}">
												<div
													style="width: 240px; height: 113px; padding: 0 15px; display: inline-block;">
													<div style="display: inline;">
														<img class="img-circle"
															src="${contextPath}/resources/uploadFiles/profile_image/${list.CHANGE_NAME}"
															style="width: 70px; height: 70px; margin-top: 9%;" onclick="showB(${list.MNO});">
													</div>
													<div style="display: inline-table; margin-left: 5%;">
														<p class="s-name" style="font-size: 12px; color: #3498db;" id="bUser" onclick="goBroadCenter(${list.MNO});">${list.NICK_NAME}</p>
														<p style="font-size: 11px; color: #999;">
															<i class="fas fa-heart" style="color: red"></i> <span
																id="count">${list.RECEIVED_LIKES}</span>명
														</p>
													</div>
												</div>
											</c:forEach></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
							<!-- LIVE -->
							<div class="col-md-12 bl-Div" style=" margin-top: 2%; padding:0;"><span style="font-size: 16px; color: #777; visibility: hidden;" id="blSpan">LIVE</span></div>
							<div class="col-md-12 bl-Div" style="padding: 0; overflow-y: hidden;">
								<div class="row"
									style="height: 200px; margin-top: 1%; display: block; white-space: nowrap;">
									<table id="liveT">
										<tbody>
											<tr>
												<td id="bLiveDiv"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- VOD -->
							<div class="col-md-12 bv-Div" style=" margin-top: 2%; padding:0;"><span style="font-size: 16px; color: #777; visibility: hidden;" id="bvSpan">VOD</span></div>
							<div class="col-md-12 bv-Div" style="padding: 0; overflow-y: hidden;">
								<div class="row"
									style="height: 200px; margin-top: 1%; display: block; white-space: nowrap;">
									<table id="vodT">
										<tbody>
											<tr>
												<td id="bVodDiv"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>


	<script>
		/* 스트리머의 방송 보여주기 */
		function showB(smno){
			console.log("스트리머 : " + smno);
			bLiveLoad(smno);
			bVodLoad(smno);
		}
		
		//LIVE
		function bLiveLoad(smno){
			
			$.ajax({
			url:"showBLive.st",
			type:"get",
			data:{smno:smno},
			success:function(data){
				$bLiveDiv = $("#bLiveDiv");
				$bLiveDiv.html('');
				
				console.log(data.list);
				
				if(data.list == ""){
					$(".bl-Div").hide();
				}else{
					$("#blSpan").css("visibility", "visible");
					$(".bl-Div").show();
				$.each(data.list, function(index, value){
					var countViewers = $fn(value.countViewers);
					var streamerAddress = value.broadAddress;
					var smno = value.mno;
					
					$div = $("<div style='width: 261.48px;padding: 0 15px;display: inline-block;'>");
					$thumbnailDiv = $("<div class='thumbnail'>");
					$img = $("<img src='/nullLive/resources/image/broadhotl.png' class='t-img' style='width: 100%; height: 120px;' onclick='onbroad(\"" + streamerAddress + "\");'>");
					$pTitle = $("<p style='margin-top: 2%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'> <strong style='text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>").text("[생] "+value.bTitle);
					$pNickName = $("<p class='s-name' style='margin-bottom: 0; font-size: 12px; display: inline; color: #3498db;' onclick='goBroadCenter(\"" + smno + "\")'>").text(value.nickName);
					$pViewers = $("<p style='font-size: 11px; color: #999; display: inline; float: right; margin-top: 1%; margin-right: 1%;'>");
					$icon = $("<i class='fas fa-user-friends'>");
					$span = $("<span>").text(countViewers + "명 시청");
					
					$div.append($thumbnailDiv);
					$thumbnailDiv.append($img);
					$thumbnailDiv.append($pTitle);
					$thumbnailDiv.append($pNickName);
					$thumbnailDiv.append($pViewers);
					$pViewers.append($icon);
					$pViewers.append($span);
					
					$bLiveDiv.append($div);
				});
				
			}
			}
		});
	 	}
		//VOD
		function bVodLoad(smno){
			
			$.ajax({
			url:"showBVod.st",
			type:"get",
			data:{smno:smno},
			success:function(data){
				$bVodDiv = $("#bVodDiv");
				$bVodDiv.html('');
				
				console.log(data.list);
				if(data.list == ""){
					$(".bv-Div").hide();
				}else{
					$("#bvSpan").css("visibility", "visible");
					$(".bv-Div").show();
				$.each(data.list, function(index, value){
					var countViewers = $fn(value.countViewers);
					var streamerAddress = value.broadAddress;
					var smno = value.mno;
					
					$div = $("<div style='width: 261.48px;padding: 0 15px;display: inline-block;'>");
					$thumbnailDiv = $("<div class='thumbnail'>");
					$img = $("<img src='/nullLive/resources/image/broadhotv.png' class='t-img' style='width: 100%; height: 120px;' onclick='broad(\"" + streamerAddress + "\");'>");
					$pTitle = $("<p style='margin-top: 2%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'> <strong style='text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>").text(value.bTitle);
					$pNickName = $("<p class='s-name' style='margin-bottom: 0; font-size: 12px; display: inline; color: #3498db;' onclick='goBroadCenter(\"" + smno + "\")'>").text(value.nickName);
					$pViewers = $("<p style='font-size: 11px; color: #999; display: inline; float: right; margin-top: 1%; margin-right: 1%;'>");
					$icon = $("<i class='fas fa-play' style=' font-size: 9px; '>");
					$span = $("<span>").text(countViewers + "명 시청");
					
					$div.append($thumbnailDiv);
					$thumbnailDiv.append($img);
					$thumbnailDiv.append($pTitle);
					$thumbnailDiv.append($pNickName);
					$thumbnailDiv.append($pViewers);
					$pViewers.append($icon);
					$pViewers.append($span);
					
					$bVodDiv.append($div);
				});
				
			}
			}
		});
	 	}
		
		/* 방송으로 이동하기 */
		//Live 방송
		function onbroad(streamerAddress){
			console.log("스트리머 주소(Live) : " + streamerAddress);
			window.open('isAvailToEnter.st?streamerAddress=' + streamerAddress,'new','width=1024,height=768,menubar=no, status=no, toolbar=no');
		};
		
		//Vod 방송
		function broad(streamerAddress){
			console.log("스트리머 주소(VOD) : " + streamerAddress);
		}
		
		/* 스트리머 페이지로 이동하기 */
		function goBroadCenter(smno){
			console.log("스트리머 : " + smno);
			location.href = "main.st?smno=" + smno;
		}
		
		/* 숫자 포맷 */
		// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
		$fn = function (value) {
			// 숫자를 문자열로 형변환한다 
			// 아래의 string 메서드 중 배열로 반환해주는 split 메서드를 사용하기 위해 문자열로 변환한 것이다
			var data = value + "";
			// 문자를 배열로 만들기
			var arrResult = data.split("");
			// 배열 요소를 뒤에서 3자리수마다 콤마 추가하기
			var startIndex = arrResult.length - 3;
			for (var i = startIndex; i > 0; i -= 3) {
				arrResult.splice(i, 0, ",");
				// 0은 기존 배열을 삭제하지 않고 삽입만 하겠다는 의미
			}		
			// 공백없이 문자열로 변환
			return arrResult.join('');
		};
	</script>
</body>
</html>