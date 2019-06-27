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

.mainT tr:hover {
	background: #e2f0d8;
	color: #185819;
	cursor: pointer;
}
.mainT .center{
	text-align:center;
}

.pagination li:hover{
	cursor: pointer;
}

.table {
	table-layout:fixed;
}

.mainT td {
	text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;
}

.table .selectT{
	border:none;
}

#selectFaqT .sLabel{
	width:15%;
}
.backBtn {
	color: #fff;
	background-color: #3790dc;
	border-color: #3790dc;
	width: 10%;
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
						<div id="faqDiv" style="height: 240px; width:634px;">
							<table class="table">
								<thead>
									<tr>
										<th style=" width: 10%; ">No.</th>
										<th style=" width: 40%; ">질문</th>
										<th>답변</th>
									</tr>
								</thead>
								<tbody id="faqTable" class="mainT">
									
								</tbody>
							</table>
						</div>
						<div id="fpagingArea" align="center">
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
				<div id="noticeDiv" style="height: 240px; width:966px;">
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
						<tbody id="noticeTable" class="mainT">
							
						</tbody>
					</table>
				</div>
				<div id="npagingArea" align="center">
					<ul class="pagination" id="nPaging">
					
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		//고객센터 페이지에서 FAQ 게시판 불러오기
		var searchCondition = $("#faqCondition").val();
		fLoad(searchCondition);
		//고객센터 페이지에서 공지사항 게시판 불러오기
		nLoad();
		
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
						console.log(value.fno + " " + value.btitle + " " + value.bcontent);
						var $tr = $("<tr onclick='selectOneF(this)'>");
						var $noTd = $("<td>").text(value.fno);
						var $titleTd = $("<td>").text(value.btitle);
						var $contentTd = $("<td>").text(value.bcontent);
						
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
			
		});
		
		
	});
	
	/* 게시판 틀 */
	//FAQ 게시판
	function fContainer(){
		$fDiv = $("#faqDiv");
		$fNav = $("#fpagingArea");
		$fDiv.html("");
		$fNav.html("");
		
		
		$ftable = $("<table class='table'> <thead> <tr> <th style=' width: 10%; '>No.</th> <th style=' width: 40%; '>질문</th> <th>답변</th> </tr> </thead> <tbody id='faqTable' class='mainT'> </tbody> </table>");
		
		$fpage = $("<ul class='pagination' id='fPaging'> </ul>");
		
		$fDiv.append($ftable);
		
		$fNav.append($fpage);
	}
	
	//공지사항 게시판
	function nContainer(){
		$nDiv = $("#noticeDiv");
		$nNav = $("#npagingArea");
		$nDiv.html("");
		$nNav.html("");
		
		
		$ntable = $("<table class='table'> <thead> <tr> <th style=' width: 7%; '>No.</th> <th style=' width: 33%; '>제목</th> <th style=' width: 40%; '>내용</th> <th style=' width: 13%;text-align: center;'>작성일</th> <th style=' text-align: center;'>조회수</th> </tr> </thead> <tbody id='noticeTable' class='mainT'> </tbody> </table>");
		
		$npage = $("<ul class='pagination' id='nPaging'> </ul>");
		
		$nDiv.append($ntable);
		
		$nNav.append($npage);
	}
	
	/* FAQ 게시판 */
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
				console.log(value.fno + " " + value.btitle + " " + value.bcontent);
				var $tr = $("<tr onclick='selectOneF(this)'>");
				var $noTd = $("<td>").text(value.fno);
				var $titleTd = $("<td>").text(value.btitle);
				var $contentTd = $("<td>").text(value.bcontent);
				
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
		}
	});
 	}
	
	//FAQ 게시판 페이징
	function fPaging(currentPage, condition){
		var condition = condition;
		$.ajax({
			url:"searchFaq.bo",	
			type:"get",
			data:{currentPage:currentPage, condition:condition},
			success:function(data){
				$tableBody = $("#faqTable");
				$tableBody.html('');
				
				$.each(data.list, function(index, value){
					console.log(value.fno + " " + value.btitle + " " + value.bcontent);
					var $tr = $("<tr onclick='selectOneF(this)'>");
					var $noTd = $("<td>").text(value.fno);
					var $titleTd = $("<td>").text(value.btitle);
					var $contentTd = $("<td>").text(value.bcontent);
					
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
	
	//FAQ 게시판 상세보기
	function selectOneF(tr){
		var num = tr.childNodes[0].innerHTML;
		
		console.log(num + "번째 게시글 보기!");
		
		$fDiv = $("#faqDiv");
		$fNav = $("#fpagingArea");
		$fDiv.html("");
		$fNav.html("");
		
		$ftable = $("<div style='height: 240px;background: #faebd7a6;border-radius: 13px;padding: 2.5%;'><table class='table'> <tbody id='selectFaqT'> <tr> <th class='selectT sLabel'>질문</th> <td class='selectT' style='background: white; border-radius: 10px; '><b>Q. </b><span id='fTitle'></span></td> </tr> <tr style='height:10px;'></tr> <tr> <th class='selectT sLabel'>답변</th> <td class='selectT' style=' height: 160px; background: white; border-radius: 10px; '><b>A. </b><span id='fContent' style='text-align: justify; word-break: keep-all'></span></td> </tr> </tbody> </table></div>");
		
		$fpage = $("<div style='height: 79.33px;'><button type='button' class='btn pull-right backBtn' style=' margin-top: 3%; ' onclick='fbackBtn();'>이전</button></div>");
		
		$fDiv.append($ftable);
		
		$fNav.append($fpage);

		$.ajax({
			url:"selectOneF.bo",
			type:"get",
			data:{num:num},
			success:function(data){
				var list = data;
				
				for(var i = 0; i < list.length; i++){
					console.log(list[i].btitle + " " + list[i].bcontent);
					$("#fTitle").text(list[i].btitle);
					$("#fContent").html(list[i].bcontent);
				}
			}
		});
	}
	
	//FAQ 게시판 상세조회에서 이전버튼 눌렀을 때 
	function fbackBtn(){
			console.log("이전 버튼 눌렸어용!");
			fContainer();
			fLoad();
	}
	
	/* 공지사항 게시판 */
	//공지사항 게시판 조회 및 페이징
	function nLoad(){
		
		$.ajax({
		url:"selectNList.bo",
		type:"get",
		success:function(data){
			$tableBody = $("#noticeTable");
			$tableBody.html('');
			
			$.each(data.list, function(index, value){
				var date = new Date(value.writtenDate).format('yyyy/MM/dd');
				
				console.log(value.snno + " " + value.btitle + " " + value.bcontent + " " + date + " " + value.bcount);
				var $tr = $("<tr onclick='selectOneN(this)'>");
				var $noTd = $("<td>").text(value.snno);
				var $titleTd = $("<td>").text(value.btitle);
				var $contentTd = $("<td>").text(value.bcontent);
				var $dateTd = $("<td style='text-align:center;'>").text(date);
				var $countTd = $("<td style='text-align:center;'>").text(value.bcount);
				
				$tr.append($noTd);
				$tr.append($titleTd);
				$tr.append($contentTd);
				$tr.append($dateTd);
				$tr.append($countTd);
				$tableBody.append($tr);
			});
			
			$paging = $("#nPaging");
			$paging.html('');
			var currentPage = data.pi.currentPage;
            var startPage = data.pi.startPage;
            var endPage = data.pi.endPage;
            var maxPage = data.pi.maxPage;

            //이전
            if(currentPage <= 1){
                $paging.append("<li class='page-item'><a class='page-link'>Previous</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='nPaging("+ (currentPage -1) + ")'>Previous</a></li>");
            }
			
            //숫자
            for(var i = startPage; i <= endPage; i++){
            	if(i == currentPage){
                	$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
                   
                }else{
                	$paging.append("<li class='page-item'><a class='page-link' onclick='nPaging("+ i + ")'>" + i + "</a></li>");
                }
            }

			//다음
            if(currentPage >= maxPage){
                $paging.append("<li class='page-item'><a class='page-link'>Next</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='nPaging("+ (currentPage + 1) + ")'>Next</a></li>");
            }
		}
	});
 	}
	
	//공지사항 게시판 페이징
	function nPaging(currentPage){
		
		$.ajax({
		url:"selectNList.bo",
		type:"get",
		data:{currentPage:currentPage},
		success:function(data){
			$tableBody = $("#noticeTable");
			$tableBody.html('');
			
			$.each(data.list, function(index, value){
				var date = new Date(value.writtenDate).format('yyyy/MM/dd');
				
				console.log(value.snno + " " + value.btitle + " " + value.bcontent + " " + date + " " + value.bcount);
				var $tr = $("<tr onclick='selectOneN(this)'>");
				var $noTd = $("<td>").text(value.snno);
				var $titleTd = $("<td>").text(value.btitle);
				var $contentTd = $("<td>").text(value.bcontent);
				var $dateTd = $("<td style='text-align:center;'>").text(date);
				var $countTd = $("<td style='text-align:center;'>").text(value.bcount);
				
				$tr.append($noTd);
				$tr.append($titleTd);
				$tr.append($contentTd);
				$tr.append($dateTd);
				$tr.append($countTd);
				$tableBody.append($tr);
			});
			
			$paging = $("#nPaging");
			$paging.html('');
			var currentPage = data.pi.currentPage;
            var startPage = data.pi.startPage;
            var endPage = data.pi.endPage;
            var maxPage = data.pi.maxPage;
            
            //이전
            if(currentPage <= 1){
                $paging.append("<li class='page-item'><a class='page-link'>Previous</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='nPaging("+ (currentPage -1) + ")'>Previous</a></li>");
            }
			
            //숫자
            for(var i = startPage; i <= endPage; i++){
            	if(i == currentPage){
                	$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
                   
                }else{
                	$paging.append("<li class='page-item'><a class='page-link' onclick='nPaging("+ i + ")'>" + i + "</a></li>");
                }
            }

			//다음
            if(currentPage >= maxPage){
                $paging.append("<li class='page-item'><a class='page-link'>Next</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='nPaging("+ (currentPage + 1) + ")'>Next</a></li>");
            }
		}
	});
 	}
	
	//공지사항 게시판 상세보기
	function selectOneN(tr){
		var num = tr.childNodes[0].innerHTML;
		
		console.log(num + "번째 게시글 보기!");
		
		$nDiv = $("#noticeDiv");
		$nNav = $("#npagingArea");
		$nDiv.html("");
		$nNav.html("");
		
		$ntable = $("<div style='height: 240px;background: #faebd7a6;border-radius: 13px;padding: 2.5%;'> <table class='table'> <tbody id='selectNoticeT'> <tr> <th class='selectT' style=' width: 10%; '>제목</th> <td class='selectT' style=' width: 40%; background: white; border-radius: 10px;' id='nTitle'></td> <th class='selectT' style=' width: 10%; text-align: center;'>작성일</th> <td class='selectT' style='background: white; border-radius: 10px; width: 13%; text-align: center;' id='nDate'></td> <th class='selectT' style=' width: 10%; text-align: center;'>조회수</th> <td class='selectT' style='background: white; border-radius: 10px; width: 13%; text-align: center;' id='nCount'></td> </tr> <tr style='height:10px;'></tr> <tr> <th class='selectT'>내용</th> <td class='selectT' colspan='5' style='background: white; border-radius: 10px; height: 150px; text-align: justify; word-break: keep-all' id='nContent'></td> </tr> </tbody> </table> </div>");
		
		$npage = $("<div style='height: 79.33px;'><button type='button' class='btn pull-right backBtn' style=' margin-top: 2.5%; ' onclick='nbackBtn();'>이전</button></div>");
		
		$nDiv.append($ntable);
		
		$nNav.append($npage);

		$.ajax({
			url:"selectOneN.bo",
			type:"get",
			data:{num:num},
			success:function(data){
				var list = data;
				
				for(var i = 0; i < list.length; i++){
					var nDate = new Date(list[i].writtenDate).format('yyyy/MM/dd');
					console.log(list[i].btitle + " " + list[i].bcontent + " " + nDate + " " + list[i].bcount);
					$("#nTitle").text(list[i].btitle);
					$("#nDate").text(nDate);
					$("#nCount").text(list[i].bcount);
					$("#nContent").html(list[i].bcontent);
				}
			}
		});
	}
	
	//공지사항 게시판 상세조회에서 이전버튼 눌렀을 때 
	function nbackBtn(){
			console.log("이전 버튼 눌렸어용!");
			nContainer();
			nLoad();
	}
	
	//date format 함수  : Date 내장 객체에 format함수 추가
	Date.prototype.format = function(f) {    
	    if (!this.valueOf()) return " ";     
	    
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];    
	    var d = this;         
	    
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {        
	        switch ($1) {            
	           case "yyyy": return d.getFullYear();            
	           case "yy": return (d.getFullYear() % 1000).zf(2);            
	           case "MM": return (d.getMonth() + 1).zf(2);            
	           case "dd": return d.getDate().zf(2);            
	           case "E": return weekName[d.getDay()];            
	           case "HH": return d.getHours().zf(2);            
	           case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);            
	           case "mm": return d.getMinutes().zf(2);            
	           case "ss": return d.getSeconds().zf(2);            
	           case "a/p": return d.getHours() < 12 ? "오전" : "오후";            
	           default: return $1;        
	         }    
	    });
	}; 

	//한자리일경우 앞에 0을 붙여준다.
	String.prototype.string = function(len){
	    var s = '', i = 0; 
	    while (i++ < len) { s += this; } 
	    return s;
	}; 
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
	//->여기까지 Date Format함수!
	</script>
</body>
</html>