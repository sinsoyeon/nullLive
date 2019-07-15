<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
<style type="text/css">
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
	background: #e2f0d8;
}

/* 방송 목록 */
.s-name:hover{
	cursor: pointer;
    text-decoration: underline;
}
.t-img:hover{
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
				<jsp:include page="mainNavbar.jsp" />
			</div>

			<!-- 즐겨찾기 -->
			<div class="col-md-10" style="padding-left: 55px; padding-top: 28px;">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<span style="font-size: 18px;" id="fTitle">즐겨찾기</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12" style="margin-top: 2%;">
							<ul
								style="list-style: none; padding: 0; display: -webkit-inline-box">
								<li class="active" style="padding-right: 13%;"><a
									data-toggle="pill" href="#fav">즐겨찾기</a></li>
								<li style="padding-right: 13%;"><a data-toggle="pill"
									href="#sub">구독한BJ</a></li>
								<li><a data-toggle="pill" href="#latest">최근본방송</a></li>
							</ul>
						</div>
					</div>

					<div class="tab-content">

						<!-- 즐겨찾기 -->
						<div id="fav" class="tab-pane fade in active">
							<!-- 즐겨찾는 BJ -->
							<div class="col-md-12"
								style="padding: 0 15px; background: #e2f0d869; border-radius: 15px; margin-top: 13px;">
								<div class="row"
									style="height: 120px;margin-top: 1%;display: block;white-space: nowrap;overflow-y: hidden;">
									<table id="fBjT">
										<tbody>
											<tr>
												<td id="fBjDiv">
													
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- LIVE -->
							<div class="col-md-12" style="padding: 0 15px; margin-top: 3%;">
								<span style="font-size: 16px; color: #777;">LIVE</span>
								<div class="row"
									style="height: 200px; margin-top: 1%; display: block; white-space: nowrap;">
									<table id="liveT">
										<tbody>
											<tr>
												<td id="fLiveDiv"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- VOD -->
							<div class="col-md-12" style="padding: 0 15px;">
								<span style="font-size: 16px; color: #777;">VOD</span>
								<div class="row"
									style="height: 200px; margin-top: 1%; display: block; white-space: nowrap;">
									<table id="vodT">
										<tbody>
											<tr>
												<td id="fVodDiv"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- 구독한 BJ -->
						<div id="sub" class="tab-pane fade">
							<!-- 구독한 BJ -->
							<div class="col-md-12"
								style="padding: 0 15px; background: #e2f0d869; border-radius: 15px; margin-top: 13px;">
								<div class="row"
									style="height: 120px; margin-top: 1%; display: block; white-space: nowrap;">
									<table id="sBjT">
										<tbody>
											<tr>
												<td id="sBjDiv"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- LIVE -->
							<div class="col-md-12" style="padding: 0 15px; margin-top: 3%;">
								<span style="font-size: 16px; color: #777;">LIVE</span>
								<div class="row"
									style="height: 200px; margin-top: 1%; display: block; white-space: nowrap;">
									<table id="liveT">
										<tbody>
											<tr>
												<td id="sLiveDiv"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- VOD -->
							<div class="col-md-12" style="padding: 0 15px;">
								<span style="font-size: 16px; color: #777;">VOD</span>
								<div class="row"
									style="height: 200px; margin-top: 1%; display: block; white-space: nowrap;">
									<table id="vodT">
										<tbody>
											<tr>
												<td id="sVodDiv"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- 최근본방송 -->
						<div id="latest" class="tab-pane fade">
							<!-- Live -->
							<div style=" margin-top: 2%; "><span style="font-size: 16px; color: #777;">LIVE</span></div>
							<div class="col-md-12" style="padding: 0; overflow-y: hidden;">
								<div class="row"
									style="height: 200px; margin-top: 1%; display: block; white-space: nowrap;">
									<table id="liveT">
										<tbody>
											<tr>
												<td id="lLiveDiv"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- VOD -->
							<div class="col-md-12" style="padding: 0; margin-top: 2%;">
								<span style="font-size: 16px; color: #777;">VOD</span>
								<div class="row" style="margin-top: 1%;">
									<ul id="lVodDiv" style="list-style: none; padding-left: 0px;">
									</ul>
								</div>
							</div>
						</div>

					</div>
					<!-- tab-content end -->

				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			/* 즐겨찾기 */
			fBjLoad();
			//fLiveLoad();
			//fVodLoad();
			
			/* 최근본방송 */
			latestLiveLoad();
			latestVodLoad();
		});
		//-> onLoad function 끝
		
		/* 즐겨찾기 */
		// 즐겨찾기한 BJ 조회
		function fBjLoad(){
			
			$.ajax({
			url:"fBjList.st",
			type:"get",
			success:function(data){
				$fBjDiv = $("#fBjDiv");
				$fBjDiv.html('');
				
				console.log(data.list);
				
				$.each(data.list, function(index, value){
					var smno = value.mno;
					var countViewers = $fn(value.favCount);
					var gender = value.sGender;
					
					$div = $("<div style='width: 240px; height: 113px; padding: 0 15px; display: inline-block;'>");
					$imgDiv = $("<div style='display: inline;'>");
					$mimg = $("<img class='img-circle' src='/nullLive/resources/image/male.png' style='width: 70px; height: 70px; margin-top: 9%;'>");
					$fimg = $("<img class='img-circle' src='/nullLive/resources/image/female.png' style='width: 70px; height: 70px; margin-top: 9%;'>");
					$pDiv = $("<div style='display: inline-table; margin-left: 5%;'>");
					$pStreamer = $("<p class='s-name' style='font-size: 12px; color: #3498db;' onclick='goBroadCenter(\"" + smno + "\")'>").text(value.nickName);
					$pViewers = $("<p style='font-size: 11px; color: #999;'>");
					$icon = $("<i class='fas fa-star'>");
					$span = $("<span>").text(" " + countViewers + "명");
					
					$div.append($imgDiv);
					$div.append($pDiv);
					
					if(gender == "M"){
						$imgDiv.append($mimg);
					}else{
						$imgDiv.append($fimg);
					}
					
					$pDiv.append($pStreamer);
					$pDiv.append($pViewers);
					$pViewers.append($icon);
					$pViewers.append($span);
					
					$fBjDiv.append($div);
				});
				
			}
		});
	 	}
		
		// Live 조회
		function fLiveLoad(){
			
			$.ajax({
			url:"fLiveList.st",
			type:"get",
			success:function(data){
				$fLiveDiv = $("#fLiveDiv");
				$fLiveDiv.html('');
				
				console.log(data.list);
				
				$.each(data.list, function(index, value){
					var countViewers = $fn(value.countViewers);
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
					
					$fLiveDiv.append($div);
				});
				
			}
		});
	 	}
		
		// Hot 조회
		function fVodLoad(){
			
			$.ajax({
			url:"fVodList.st",
			type:"get",
			success:function(data){
				$fVodDiv = $("#fVodDiv");
				$fVodDiv.html('');
				
				console.log(data.list);
				
				$.each(data.list, function(index, value){
					var countViewers = $fn(value.countViewers);
					
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
					
					$fVodDiv.append($div);
				});
				
			}
		});
	 	}
		
		/* 최근본방송 */
		// LIVE
		function latestLiveLoad(){
			
			$.ajax({
			url:"lLiveList.st",
			type:"get",
			success:function(data){
				$lLiveDiv = $("#lLiveDiv");
				$lLiveDiv.html('');
				
				console.log(data.list);
				
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
					
					$lLiveDiv.append($div);
				});
				
			}
		});
	 	}
		
		// VOD
		function latestVodLoad(){
			
			$.ajax({
			url:"lVodList.st",
			type:"get",
			success:function(data){
				$lVodDiv = $("#lVodDiv");
				$lVodDiv.html('');
				
				console.log(data.list);
				
				$.each(data.list, function(index, value){
					var countViewers = $fn(value.countViewers);
					var streamerAddress = value.broadAddress;
					var smno = value.mno;
					
					$li = $("<li>");
					$div = $("<div class='col-md-4'>");
					$thumbnailDiv = $("<div class='thumbnail'>");
					$img = $("<img src='/nullLive/resources/image/broadvod.png' class='t-img' style='width: 100%; height: 120px;' onclick='broad(\"" + streamerAddress + "\");'>");
					$pTitle = $("<p style='margin-top: 2%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'> <strong style='text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>").text(value.bTitle);
					$pNickName = $("<p class='s-name' style='margin-bottom: 0; font-size: 12px; display: inline; color: #3498db;' onclick='goBroadCenter(\"" + smno + "\")'>").text(value.nickName);
					$pViewers = $("<p style='font-size: 11px; color: #999; display: inline; float: right; margin-top: 1%; margin-right: 1%;'>");
					$icon = $("<i class='fas fa-play' style=' font-size: 9px; '>");
					$span = $("<span>").text(countViewers + "명 시청");
					
					$li.append($div);
					$div.append($thumbnailDiv);
					$thumbnailDiv.append($img);
					$thumbnailDiv.append($pTitle);
					$thumbnailDiv.append($pNickName);
					$thumbnailDiv.append($pViewers);
					$pViewers.append($icon);
					$pViewers.append($span);
					
					$lVodDiv.append($li);
				});
				
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