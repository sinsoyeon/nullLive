<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NullLive</title>
<style type="text/css">
/* Hot 영역 스크롤바 */
::-webkit-scrollbar {height: 13px; }
::-webkit-scrollbar-track {  background: none; }
::-webkit-scrollbar-thumb {  background: none; border-radius:8px;}
::-webkit-scrollbar-thumb:hover {background: #e2f0d8;}
/* 사이드 바 */
body::-webkit-scrollbar {
	display: none;
}

.sidebar {
	position: fixed;
	z-index: 9;
	top: 0;
	left: 0;
	bottom: 0;
	background: #e2f0d869;
	font-family: 'Montserrat', sans-serif;
	font-weight: lighter;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar ul li {
	position: relative;
	height: 75px;
}

.sidebar ul li:hover {
	cursor:pointer;
}

.sidebar ul li a {
	text-decoration: none;
	color: #333;
}

.sidebar ul li a:hover {
	color: #4a8522;
}

.sidebar ul li a i {
	text-align: center;
	width: 70px;
}

.sidebar ul li a span {
	font-size: 16px;
	padding-left: 17px;
	line-height: 50px;
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
				<!-- sidebar -->
				<nav class="sidebar" style="margin-top: 50px; width: 210px;">
					<ul style="margin-top: 15px;">
						<c:if test="${empty sessionScope.loginUser}">
							<li><a href="needLogin.me"><i class="fas fa-star fa-lg"></i> <span>즐겨찾기</span></a></li>
						</c:if>
						<c:if test="${!empty sessionScope.loginUser}">
							<li><a href="favorite.st"><i class="fas fa-star fa-lg"></i> <span>즐겨찾기</span></a></li>						
						</c:if>
						
						<li onclick="live();"><a><i class="fas fa-play fa-lg"></i> <span>LIVE</span></a></li>
						
						<li onclick="vod();"><a><i class="fas fa-video fa-lg"></i> <span>VOD</span></a></li>
						
						<li><a href="jobMain.jbo"> <i class="fas fa-mouse-pointer fa-lg"></i> <span>소통센터</span></a></li>
						
						<li><a href="serviceMain.bo"> <i class="fas fa-headphones fa-lg"></i> <span>고객센터</span></a></li>
					</ul>
				</nav>
			</div>

			<!-- Hot -->
			<div class="col-md-10" style="padding-left: 55px; padding-top: 28px;">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-2">
									<span style="font-size: 18px;">HOT &nbsp;<i
										class="fas fa-crown" style=" color: gold; "></i></span>
								</div>
								<div class="col-md-10"
									style="padding-top: 4px; margin-bottom: 0px;">
									<ul style="list-style: none; padding: 0;">
										<li class="active" style="float: left; padding-right: 4%;"><a
											data-toggle="pill" href="#hLive">LIVE</a></li>
										<li><a data-toggle="pill" href="#hVod">VOD</a></li>
									</ul>
								</div>
							</div>

							<!-- HOT 방송목록 영역 -->
							<div class="tab-content">

								<!-- HOT LIVE -->
								<div id="hLive" class="tab-pane fade in active" style="overflow-y: hidden;">
									<div class="row" style="height: 200px;margin-top: 1%;display: block;white-space: nowrap;">
										<table id="hLiveT">
											<tbody>
												<tr><td id="hotDivL"></td></tr>
											</tbody>
										</table>
									</div>
								</div>

								<!-- HOT VOD -->
								<div id="hVod" class="tab-pane fade" style="overflow-y: hidden;">
									<div class="row" style="height: 200px;margin-top: 1%;display: block;white-space: nowrap;">
										<table id="hVodT">
											<tbody>
												<tr><td id="hotDivV"></td></tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
					</div>

					<br>

					<!-- 전체 -->
					<!-- 전체는 HOT에서 방송 div 가져와야 함 -->
					<div class="row">
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-1">
									<span style="font-size: 17px;">전체</span>
								</div>
								<div class="col-md-3">
									<div class="form-group"
										style="margin-top: -3%; margin-bottom: 0; width: 70%;">
										<select class="form-control" id="bCategory">
											<option value="1">-카테고리-</option>
											<option value="2">캠방</option>
											<option value="3">게임</option>
											<option value="4">음악</option>
											<option value="5">야방</option>
											<option value="6">취미</option>
											<option value="7">펫방</option>
											<option value="8">스포츠</option>
											<option value="9">라디오</option>
											<option value="0">기타</option>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<ul style="list-style: none; padding: 0; margin-top: 1%;">
										<li class="active" style="float: left; padding-right: 10%;"><a
											data-toggle="pill" href="#aLive">LIVE</a></li>
										<li><a data-toggle="pill" href="#aVod">VOD</a></li>
									</ul>
								</div>
								<div class="col-md-4">
									<div class="btn-group" style=" float: right; margin-bottom: 6%; margin-top: -2%; ">
									  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									    <i class="fas fa-bars"></i>
									  </button>
										<ul class="dropdown-menu" role="menu" style="margin-left: -192%;min-width: 0;">
									    <li style="cursor:pointer;" onclick="viewer();"><a>시청인원순</a></li>
									    <li style="cursor:pointer;" onclick="recommendation();"><a>추천인원순</a></li>
									  </ul>
									</div>
								</div>
							</div>

							<div class="tab-content">
								<!-- 전체 LIVE -->
								<div id="aLive" class="tab-pane fade in active">
									<div class="row" style="margin-top: 1%;">
										<ul id="allDivL" style="list-style:none; padding-left:0px;">
										</ul>
									</div>
								</div>
								<!-- 전체 VOD -->
								<div id="aVod" class="tab-pane fade">
									<div class="row" style="margin-top: 1%;">
										<ul id="allDivV" style="list-style:none; padding-left:0px;">
										</ul>
									</div>
								</div>
							</div>


						</div>
					</div>
					<!-- 전체 끝 -->
					
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		//HOT 방송 목록 불러오기
		hotLiveLoad();
		hotVodLoad();
		
		//전체 방송 목록 불러오기
		var searchCondition = $("#bCategory").val();
		
		allLiveLoad(searchCondition);
		allVodLoad(searchCondition);
		
		//전체 방송 목록 카테고리 검색 (Live)
		$("#bCategory").change(function(){
			var condition = $(this).val();
			
			console.log("카테고리" + condition);
			$.ajax({
				url:"searchAllLive.st",
				type:"get",
				data:{condition:condition},
				success:function(data){
					$allDivL = $("#allDivL");
					$allDivL.html('');
					
					console.log(data.list);
					
					$.each(data.list, function(index, value){
						var countViewers = $fn(value.countViewers);
						var streamerAddress = value.broadAddress;
						var smno = value.mno;
						
						$li = $("<li>");
						$div = $("<div class='col-md-4'>");
						$thumbnailDiv = $("<div class='thumbnail'>");
						$img = $("<img src='/nullLive/resources/image/broadlive.png' class='t-img' style='width: 100%; height: 120px;' onclick='onbroad(\"" + streamerAddress + "\");'>");
						$pTitle = $("<p style='margin-top: 2%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'> <strong style='text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>").text("[생] "+value.bTitle);
						$pNickName = $("<p class='s-name' style='margin-bottom: 0; font-size: 12px; display: inline; color: #3498db;' onclick='goBroadCenter(\"" + smno + "\")'>").text(value.nickName);
						$pViewers = $("<p style='font-size: 11px; color: #999; display: inline; float: right; margin-top: 1%; margin-right: 1%;'>");
						$icon = $("<i class='fas fa-user-friends'>");
						$span = $("<span class='format-number'>").text(countViewers + "명 시청");
						
						$li.append($div);
						$div.append($thumbnailDiv);
						$thumbnailDiv.append($img);
						$thumbnailDiv.append($pTitle);
						$thumbnailDiv.append($pNickName);
						$thumbnailDiv.append($pViewers);
						$pViewers.append($icon);
						$pViewers.append($span);
						
						$allDivL.append($li);
					});
				}
			});
			
		});
		//->끝
		
		//전체 방송 목록 카테고리 검색 (Vod)
		$("#bCategory").change(function(){
			var condition = $(this).val();
			
			console.log("카테고리 : " + condition);
			$.ajax({
				url:"searchAllVod.st",
				type:"get",
				data:{condition:condition},
				success:function(data){
					$allDivV = $("#allDivV");
					$allDivV.html('');
					
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
						$span = $("<span class='format-number'>").text(countViewers + "명 시청");
						
						$li.append($div);
						$div.append($thumbnailDiv);
						$thumbnailDiv.append($img);
						$thumbnailDiv.append($pTitle);
						$thumbnailDiv.append($pNickName);
						$thumbnailDiv.append($pViewers);
						$pViewers.append($icon);
						$pViewers.append($span);
						
						$allDivV.append($li);
					});
				}
			});
			
		});
		//-> 끝
	});
	//-> onLoad function 끝
	
	/*사이드바 클릭*/
	function live(){
		$("#aVod").removeClass("in active");
		$("#aLive").addClass("in active");
		$("#hVod").removeClass("in active");
		$("#hLive").addClass("in active");
		hotLiveLoad();
		var searchCondition = $("#bCategory").val();
		allLiveLoad(searchCondition);
	}
	function vod(){
		$("#aLive").removeClass("in active");
		$("#aVod").addClass("in active");
		$("#hLive").removeClass("in active");
		$("#hVod").addClass("in active");
		hotVodLoad();
		var searchCondition = $("#bCategory").val();
		allVodLoad(searchCondition);
	}
	//->사이드바 끝
	
	/* HOT 방송 목록 */
	//HOT 실시간 방송 조회
	function hotLiveLoad(){
		
		$.ajax({
		url:"hotLiveList.st",
		type:"get",
		success:function(data){
			$hotDivL = $("#hotDivL");
			$hotDivL.html('');
			
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
				
				$hotDivL.append($div);
			});
			
		}
	});
 	}
	
	//HOT VOD 방송 조회
	function hotVodLoad(){
		
		$.ajax({
		url:"hotVodList.st",
		type:"get",
		success:function(data){
			$hotDivL = $("#hotDivV");
			$hotDivL.html('');
			
			console.log(data.list);
			
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
				
				$hotDivL.append($div);
			});
			
		}
	});
 	}
	
	/* 전체 방송 목록 */
	//전체 방송 목록 조회 (Live)
	function allLiveLoad(condition){		
		var condition = condition;
		
		$.ajax({
		url:"searchAllLive.st",
		type:"get",
		success:function(data){			
			$allDivL = $("#allDivL");
			$allDivL.html('');
			
			console.log(data.list);
			
			$.each(data.list, function(index, value){
				var countViewers = $fn(value.countViewers);
				var streamerAddress = value.broadAddress;
				var smno = value.mno;
				
				$li = $("<li>");
				$div = $("<div class='col-md-4'>");
				$thumbnailDiv = $("<div class='thumbnail'>");
				$img = $("<img src='/nullLive/resources/image/broadlive.png' class='t-img' style='width: 100%; height: 120px;' onclick='onbroad(\"" + streamerAddress + "\");'>");
				$pTitle = $("<p style='margin-top: 2%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'> <strong style='text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>").text("[생] "+value.bTitle);
				$pNickName = $("<p class='s-name' style='margin-bottom: 0; font-size: 12px; display: inline; color: #3498db;' onclick='goBroadCenter(\"" + smno + "\")'>").text(value.nickName);
				$pViewers = $("<p style='font-size: 11px; color: #999; display: inline; float: right; margin-top: 1%; margin-right: 1%;'>");
				$icon = $("<i class='fas fa-user-friends'>");
				$span = $("<span>").text(countViewers + "명 시청");
				
				$li.append($div);
				$div.append($thumbnailDiv);
				$thumbnailDiv.append($img);
				$thumbnailDiv.append($pTitle);
				$thumbnailDiv.append($pNickName);
				$thumbnailDiv.append($pViewers);
				$pViewers.append($icon);
				$pViewers.append($span);
				
				$allDivL.append($li);
			});
		}
	});
 	}
	
	//전체 방송 목록 조회 (Vod)
	function allVodLoad(condition){		
		var condition = condition;
		
		$.ajax({
		url:"searchAllVod.st",
		type:"get",
		success:function(data){			
			$allDivV = $("#allDivV");
			$allDivV.html('');
			
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
				
				$allDivV.append($li);
			});
		}
	});
 	}
	
	/* 전체 방송 정렬 */
	function viewer(){
		var condition = $("#bCategory").val();
		console.log("카테고리 : " + condition);
		
		var al = $("#aLive").attr("class");
		
		console.log(al);
		console.log(typeof(al));
		
		var isLV = "";
		
		if(al == "tab-pane fade in active"){
			isLV = "live";
		}else{
			isLV = "vod";
		}
		
		console.log("LIVE or VOD : " + isLV);
		
		$.ajax({
			url:"sortAllbyViewer.st",
			type:"get",
			data:{condition:condition, isLV:isLV},
			success:function(data){
				//Live방송 일 때
				if(isLV == "live"){
					$allDivL = $("#allDivL");
					$allDivL.html('');
					
					console.log(data.list);
					
					$.each(data.list, function(index, value){
						var countViewers = $fn(value.countViewers);
						var streamerAddress = value.broadAddress;
						var smno = value.mno;
						
						$li = $("<li>");
						$div = $("<div class='col-md-4'>");
						$thumbnailDiv = $("<div class='thumbnail'>");
						$img = $("<img src='/nullLive/resources/image/broadlive.png' class='t-img' style='width: 100%; height: 120px;' onclick='onbroad(\"" + streamerAddress + "\");'>");
						$pTitle = $("<p style='margin-top: 2%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'> <strong style='text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>").text("[생] "+value.bTitle);
						$pNickName = $("<p class='s-name' style='margin-bottom: 0; font-size: 12px; display: inline; color: #3498db;' onclick='goBroadCenter(\"" + smno + "\")'>").text(value.nickName);
						$pViewers = $("<p style='font-size: 11px; color: #999; display: inline; float: right; margin-top: 1%; margin-right: 1%;'>");
						$icon = $("<i class='fas fa-user-friends'>");
						$span = $("<span>").text(countViewers + "명 시청");
						
						$li.append($div);
						$div.append($thumbnailDiv);
						$thumbnailDiv.append($img);
						$thumbnailDiv.append($pTitle);
						$thumbnailDiv.append($pNickName);
						$thumbnailDiv.append($pViewers);
						$pViewers.append($icon);
						$pViewers.append($span);
						
						$allDivL.append($li);
					});
				}else{
					$allDivV = $("#allDivV");
					$allDivV.html('');
					
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
						
						$allDivV.append($li);
					});
				}
			}
		});
	}
	
	function recommendation(){
		var condition = $("#bCategory").val();
		console.log("카테고리 : " + condition);
		
		var al = $("#aLive").attr("class");
		
		console.log(al);
		console.log(typeof(al));
		
		var isLV = "";
		
		if(al == "tab-pane fade in active"){
			isLV = "live";
		}else{
			isLV = "vod";
		}
		
		console.log("LIVE or VOD : " + isLV);
		
		$.ajax({
			url:"sortAllbyRec.st",
			type:"get",
			data:{condition:condition, isLV:isLV},
			success:function(data){
				//Live방송 일 때
				if(isLV == "live"){
					$allDivL = $("#allDivL");
					$allDivL.html('');
					
					console.log(data.list);
					
					$.each(data.list, function(index, value){
						var countViewers = $fn(value.countViewers);
						var streamerAddress = value.broadAddress;
						var smno = value.mno;
						
						$li = $("<li>");
						$div = $("<div class='col-md-4'>");
						$thumbnailDiv = $("<div class='thumbnail'>");
						$img = $("<img src='/nullLive/resources/image/broadlive.png' class='t-img' style='width: 100%; height: 120px;' onclick='onbroad(\"" + streamerAddress + "\");'>");
						$pTitle = $("<p style='margin-top: 2%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'> <strong style='text-overflow: ellipsis; overflow: hidden; white-space: nowrap;'>").text("[생] "+value.bTitle);
						$pNickName = $("<p class='s-name' style='margin-bottom: 0; font-size: 12px; display: inline; color: #3498db;' onclick='goBroadCenter(\"" + smno + "\")'>").text(value.nickName);
						$pViewers = $("<p style='font-size: 11px; color: #999; display: inline; float: right; margin-top: 1%; margin-right: 1%;'>");
						$icon = $("<i class='fas fa-user-friends'>");
						$span = $("<span>").text(countViewers + "명 시청");
						
						$li.append($div);
						$div.append($thumbnailDiv);
						$thumbnailDiv.append($img);
						$thumbnailDiv.append($pTitle);
						$thumbnailDiv.append($pNickName);
						$thumbnailDiv.append($pViewers);
						$pViewers.append($icon);
						$pViewers.append($span);
						
						$allDivL.append($li);
					});
				}else{
					$allDivV = $("#allDivV");
					$allDivV.html('');
					
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
						
						$allDivV.append($li);
					});
				}
			}
		});
	}
	//-> 정렬 끝
	
	/* 방송으로 이동하기 */
	//Live 방송
	function onbroad(streamerAddress){
		if("${loginUser.mid}" == ""){
			location.href="needLogin.me";
		}else{
		console.log("스트리머 주소(Live) : " + streamerAddress);
		window.open('isAvailToEnter.st?streamerAddress=' + streamerAddress,'new','width=1024,height=768,menubar=no, status=no, toolbar=no');
		}
	};
	//Vod 방송
	function broad(streamerAddress){
		if("${loginUser.mid}" == ""){
			location.href="needLogin.me";
		}else{
			console.log("스트리머 주소(VOD) : " + streamerAddress);
		}
	}
	
	/* 스트리머 페이지로 이동하기 */
	function goBroadCenter(smno){
		if("${loginUser.mid}" == ""){
			location.href="needLogin.me";
		}else{
		location.href = "main.st?smno=" + smno;
		}
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