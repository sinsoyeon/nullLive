<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body::-webkit-scrollbar {
	display: none;
}

tbody tr:hover {
	background: #e2f0d8;
	color: #185819;
	cursor: pointer;
}
tbody .center{
	text-align:center;
}

.pagination li:hover{
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="serviceMenubar.jsp" />
	</header>
	<div class="container-fluid"
		style="padding-right: 30px; padding-left: 30px; padding-top: 15px;">
		<div class="row">
			<div class="col-md-4">
				<h2 style="color: #8aad40;">
					<b>무엇을</b>
				</h2>
				<h2 style="color: #8aad40;">
					<b>도와드릴까요?</b>
				</h2>
				<div class="input-group" style="margin-top: 20px; width: 240px;">
					<input type="text" class="form-control" id="searchFaq"
						placeholder="Search" style="border: 1px solid #8aad40;"> 
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit" style="background: #6e9a13; border: 1px solid #8aad40;">
							<i class="glyphicon glyphicon-search" style="color: white;"></i>
						</button>
					</div>
				</div>
				<div>
				<img alt="faq" src="/nullLive/resources/image/faqImg.png"
						style="width: 35%;margin-left: 38%;margin-top: 12px;position: absolute;">
				</div>
				<p style="color: #999; margin-top: 120px;">
					NullLive 서비스에<br> 대해 궁금하신 점이 있으세요?<br> 고객센터를 통해 궁금증을
					해결하세요.
				</p>

			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-2">
						<h3>
							<b>FAQ</b>
						</h3>
					</div>
					<div class="col-md-7">
						<p style="color: #999; padding-top: 8%;">자주 묻는 질문입니다.</p>
					</div>
					<div class="col-md-3">
						<div class="form-group" style="padding-top: 14%;margin-bottom: 0;">
							<select class="form-control" id="faqCondition">
								<option value="1">전체</option>
								<option value="2">회원정보</option>
								<option value="3">방송/시청하기</option>
								<option value="4">선물/후원</option>
								<option value="5">결제</option>
								<option value="6">기타</option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div style="height: 240px;">
							<table class="table">
								<thead>
									<tr>
										<th style=" width: 10%; ">No.</th>
										<th style=" width: 40%; ">질문</th>
										<th>답변</th>
									</tr>
								</thead>
								<tbody id="faqTable">
									
								</tbody>
							</table>
						</div>
						<div id="pagingArea" align="center">
							<ul class="pagination" id="fPaging">
							
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<hr>

		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
						<h3>
							<b>공지사항</b>
						</h3>
					</div>
					<div class="col-md-10">
						<p style="color: #999; padding-top: 3%;">알려드립니다.</p>
					</div>
				</div>
				<div style="height: 240px;">
					<table class="table">
						<thead>
							<tr>
								<th style=" width: 7%; ">No.</th>
								<th style=" width: 33%; ">제목</th>
								<th style=" width: 40%; ">내용</th>
								<th style=" width: 13%;text-align: center;">작성일</th>
								<th style=" text-align: center;">조회수</th>
							</tr>
						</thead>
						<tbody id="noticeTable">
							<tr>
								<td>1</td>
								<td>TB - Monthly</td>
								<td>Default</td>
								<td class="center">01/04/2012</td>
								<td class="center">0</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="pagingArea" align="center">
					<ul class="pagination" id="nPaging">
					
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		var searchCondition = $("#faqCondition").val();
		fLoad(searchCondition);
		
		//FAQ 게시판 카테고리 검색
		$("#faqCondition").change(function(){
			var condition = $(this).val();
			
			console.log(condition);
			$.ajax({
				url:"searchFaq.bo",
				type:"get",
				data:{condition:condition},
				success:function(data){
					console.log(typeof(condition));
					$tableBody = $("#faqTable");
					$tableBody.html('');
					$.each(data.list, function(index, value){
						console.log(value.fno + " " + value.BTitle + " " + value.BContent);
						var $tr = $("<tr onclick='selectOneF(this)'>");
						var $noTd = $("<td>").text(value.fno);
						var $titleTd = $("<td>").text(value.BTitle);
						var $contentTd = $("<td>").text(value.BContent);
						
						$tr.append($noTd);
						$tr.append($titleTd);
						$tr.append($contentTd);
						$tableBody.append($tr);
					});
					
					$paging = $("#fPaging");
					$paging.html('');
					var currentPage = data.pi.currentPage;
		            var startPage = data.pi.startPage;
		            var endPage = data.pi.endPage;
		            var maxPage = data.pi.maxPage;
		            var pi = data.pi;
		            console.log(condition);
		            
		            //이전
		            if(currentPage <= 1){
		                $paging.append("<li class='page-item'><a class='page-link'>Previous</a></li>");
		            }else{
		            	$paging.append("<li class='page-item'><a class='page-link' onclick='fPaging("+ (currentPage -1) + "," + condition +")'>Previous</a></li>");
		            }
					
		            //숫자
		            for(var i = startPage; i <= endPage; i++){
		            	if(i == currentPage){
		                	$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
		                   
		                }else{
		                	$paging.append("<li class='page-item'><a class='page-link' onclick='fPaging("+ i + "," + condition + ")'>" + i + "</a></li>");
		                }
		            }

					//다음
		            if(currentPage >= maxPage){
		                $paging.append("<li class='page-item'><a class='page-link'>Next</a></li>");
		            }else{
		            	$paging.append("<li class='page-item'><a class='page-link' onclick='fPaging("+ (currentPage + 1) + "," + condition + ")'>Next</a></li>");
		            }
				},
				error:function(){
					console.log("실패!");
				}
			});
			
		});
		
		
	});
	
	//FAQ 게시판 조회 및 페이징
	function fLoad(condition){		
		var condition = condition;
		
		$.ajax({
		url:"searchFaq.bo",
		type:"get",
		success:function(data){			
			$tableBody = $("#faqTable");
			$tableBody.html('');
			$.each(data.list, function(index, value){
				console.log(value.fno + " " + value.BTitle + " " + value.BContent);
				var $tr = $("<tr onclick='selectOneF(this)'>");
				var $noTd = $("<td>").text(value.fno);
				var $titleTd = $("<td>").text(value.BTitle);
				var $contentTd = $("<td>").text(value.BContent);
				
				$tr.append($noTd);
				$tr.append($titleTd);
				$tr.append($contentTd);
				$tableBody.append($tr);
			});
			
			$paging = $("#fPaging");
			$paging.html('');
			var currentPage = data.pi.currentPage;
            var startPage = data.pi.startPage;
            var endPage = data.pi.endPage;
            var maxPage = data.pi.maxPage;
            
            //이전
            if(currentPage <= 1){
                $paging.append("<li class='page-item'><a class='page-link'>Previous</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='fPaging("+ (currentPage -1) + "," + condition +")'>Previous</a></li>");
            }
			
            //숫자
            for(var i = startPage; i <= endPage; i++){
            	if(i == currentPage){
                	$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
                   
                }else{
                	$paging.append("<li class='page-item'><a class='page-link' onclick='fPaging("+ i + "," + condition + ")'>" + i + "</a></li>");
                }
            }

			//다음
            if(currentPage >= maxPage){
                $paging.append("<li class='page-item'><a class='page-link'>Next</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='fPaging("+ (currentPage + 1) + "," + condition + ")'>Next</a></li>");
            }
		}
	});
 	}
	
	//FAQ 게시판 페이징
	function fPaging(currentPage, condition){
		console.log("fppaging"+currentPage);
		var condition = "";
		$.ajax({
			url:"searchFaq.bo",
			type:"get",
			data:{currentPage:currentPage, condition:condition},
			success:function(data){
				$tableBody = $("#faqTable");
				$tableBody.html('');
				$.each(data.list, function(index, value){
					console.log(value.fno + " " + value.BTitle + " " + value.BContent);
					var $tr = $("<tr onclick='selectOneF(this)'>");
					var $noTd = $("<td>").text(value.fno);
					var $titleTd = $("<td>").text(value.BTitle);
					var $contentTd = $("<td>").text(value.BContent);
					
					$tr.append($noTd);
					$tr.append($titleTd);
					$tr.append($contentTd);
					$tableBody.append($tr);
				});
				
				$paging = $("#fPaging");
				$paging.html('');
				var currentPage = data.pi.currentPage;
	            var startPage = data.pi.startPage;
	            var endPage = data.pi.endPage;
	            var maxPage = data.pi.maxPage;
	            
	          	//이전
	            if(currentPage <= 1){
	                $paging.append("<li class='page-item'><a class='page-link'>Previous</a></li>");
	            }else{
	            	$paging.append("<li class='page-item'><a class='page-link' onclick='fPaging("+ (currentPage -1) + "," + condition + ")'>Previous</a></li>");
	            }
				
	            //숫자
	            for(var i = startPage; i <= endPage; i++){
	            	if(i == currentPage){
	                	$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
	                   
	                }else{
	                	$paging.append("<li class='page-item'><a class='page-link' onclick='fPaging("+ i + "," + condition + ")'>" + i + "</a></li>");
	                }
	            }

				//다음
	            if(currentPage >= maxPage){
	                $paging.append("<li class='page-item'><a class='page-link'>Next</a></li>");
	            }else{
	            	$paging.append("<li class='page-item'><a class='page-link' onclick='fPaging("+ (currentPage + 1) + "," + condition + ")'>Next</a></li>");
	            }
			},
			error:function(){
				console.log("실패!");
			}
		});
	}
	</script>
</body>
</html>