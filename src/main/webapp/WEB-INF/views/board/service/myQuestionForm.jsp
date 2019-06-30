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
#myQThead th{
	text-align:center;
}
#myQTbody tr:hover{
	background:#e2f0d8;
	color: #185819;
	cursor: pointer;
}
#myQTbody td{
	text-align:center;
	text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="serviceMenubar.jsp" />
	</header>
	<div class="container-fluid" style="padding-right: 30px; padding-left: 30px; padding-top: 15px;">
		<div class="row">
			<div class="col-md-5">
				<h2 style="color: #8aad40;">
					<b>MY 문의내역</b>
				</h2>
				<br>
				<p style="color: #999;">
					문의하신 내용과 받아보신 답변을 확인하는 공간입니다.
				</p>
			</div>
			<div class="col-md-7">
				<img alt="myQuestion"
					src="/nullLive/resources/image/myQuestion.png" style=" width: 100%; "/>
			</div>
		</div>
		<div class="row" style="padding: 3%; height: 528px;">
			<div class="col-md-12">
				<div style=" height: 412px; ">
				<table class="table">
							<thead id="myQThead">
								<tr>
									<th style=" width: 20%; ">문의일자</th>
									<th>제목</th>
									<th style=" width: 20%; ">답변여부</th>
								</tr>
							</thead>
							<tbody id="myQTbody">
								
							</tbody>
						</table>
						</div>
						<div style=" text-align: center; ">
							<ul class="pagination" id="mQPaging">
								
							</ul>
						</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		mQLoad();
	});
	
	/* 나의 문의내역 게시판 */
	//나의 문의내역 게시판 조회 및 페이징
	function mQLoad(){
		
		$.ajax({
		url:"selectmQList.bo",
		type:"get",
		success:function(data){
			$tableBody = $("#myQTbody");
			$tableBody.html('');
			
			$.each(data.list, function(index, value){
				var date = new Date(value.writtenDate).format('yyyy/MM/dd');
				
				console.log(value.qno + " " + value.btitle + " " + value.bcontent + " " + date);
				var $tr = $("<tr onclick='selectOneMQ(this)'>");
				var $dateTd = $("<td>").text(date);
				var $titleTd = $("<td>").text(value.btitle);
				
				$tr.append($dateTd);
				$tr.append($titleTd);
				$tableBody.append($tr);
			});
			
			$paging = $("#mQPaging");
			$paging.html('');
			var currentPage = data.pi.currentPage;
            var startPage = data.pi.startPage;
            var endPage = data.pi.endPage;
            var maxPage = data.pi.maxPage;

            //이전
            if(currentPage <= 1){
                $paging.append("<li class='page-item'><a class='page-link'>Previous</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='mQPaging("+ (currentPage -1) + ")'>Previous</a></li>");
            }
			
            //숫자
            for(var i = startPage; i <= endPage; i++){
            	if(i == currentPage){
                	$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
                   
                }else{
                	$paging.append("<li class='page-item'><a class='page-link' onclick='mQPaging("+ i + ")'>" + i + "</a></li>");
                }
            }

			//다음
            if(currentPage >= maxPage){
                $paging.append("<li class='page-item'><a class='page-link'>Next</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='mQPaging("+ (currentPage + 1) + ")'>Next</a></li>");
            }
		}
	});
 	}
	
	//나의 문의내역 게시판 페이징
	function mQPaging(currentPage){
		
		$.ajax({
		url:"selectmQList.bo",
		type:"get",
		data:{currentPage:currentPage},
		success:function(data){
			$tableBody = $("#myQTbody");
			$tableBody.html('');
			
			$.each(data.list, function(index, value){
				var date = new Date(value.writtenDate).format('yyyy/MM/dd');
				
				console.log(value.qno + " " + value.btitle + " " + value.bcontent + " " + date);
				var $tr = $("<tr onclick='selectOneMQ(this)'>");
				var $dateTd = $("<td>").text(date);
				var $titleTd = $("<td>").text(value.btitle);
				
				$tr.append($dateTd);
				$tr.append($titleTd);
				$tableBody.append($tr);
			});
			
			$paging = $("#mQPaging");
			$paging.html('');
			var currentPage = data.pi.currentPage;
            var startPage = data.pi.startPage;
            var endPage = data.pi.endPage;
            var maxPage = data.pi.maxPage;

            //이전
            if(currentPage <= 1){
                $paging.append("<li class='page-item'><a class='page-link'>Previous</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='mQPaging("+ (currentPage -1) + ")'>Previous</a></li>");
            }
			
            //숫자
            for(var i = startPage; i <= endPage; i++){
            	if(i == currentPage){
                	$paging.append("<li class='page-item'><a class='page-link'>" + i + "</a></li>");
                   
                }else{
                	$paging.append("<li class='page-item'><a class='page-link' onclick='mQPaging("+ i + ")'>" + i + "</a></li>");
                }
            }

			//다음
            if(currentPage >= maxPage){
                $paging.append("<li class='page-item'><a class='page-link'>Next</a></li>");
            }else{
            	$paging.append("<li class='page-item'><a class='page-link' onclick='mQPaging("+ (currentPage + 1) + ")'>Next</a></li>");
            }
		}
	});
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