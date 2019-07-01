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
.backBtn {
	color: #fff;
	background-color: #3790dc;
	border-color: #3790dc;
	width: 10%;
}

#myQTableOne tr td {
	border: none;
	border-radius: 8px;
}

#myQTableOne tr:first-child {
	background: #3790dc;
	color: white;
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
		<div class="row" style="padding: 3%; height: 528px;" id="mqDiv">
			<div class="col-md-12">
				<div style=" height: 412px; ">
				<table class="table">
							<thead id="myQThead">
								<tr>
									<th style="display: none;width: 0%;">No.</th>
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
	
	/* 게시판 틀 */
	//나의 문의내역 게시판
	function mQContainer(){
		$mqDiv = $("#mqDiv").css({'background':'white', 'padding':'3%'});;
		$mqDiv.html("");
		
		$mqtable = $("<div class='col-md-12'> <div style=' height: 412px; '> <table class='table'> <thead id='myQThead'> <tr> <th style='display: none;width: 0%;'>No.</th><th style=' width: 20%; '>문의일자</th> <th>제목</th> <th style=' width: 20%; '>답변여부</th> </tr> </thead> <tbody id='myQTbody'> </tbody> </table> </div> <div style=' text-align: center; '> <ul class='pagination' id='mQPaging'> </ul> </div> </div>");
		
		$mqDiv.append($mqtable);		
	}
	
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
				var date = new Date(value.QWRITTENDATE).format('yyyy/MM/dd');
				var refBno = value.AREFBNO;
				
				console.log(data.list);
				console.log(value.MQNO + " " + value.BTITLE + " " + value.BCONTENT + " " + date);
				var $tr = $("<tr onclick='selectOneMQ(this)'>");
				var $noTd = $("<td style='display: none;width: 0%;'>").text(value.MQNO);
				var $dateTd = $("<td>").text(date);
				var $titleTd = $("<td>").text(value.BTITLE);
				var $answerTd = $("<td style='color:#3498db'>");
				
				if(refBno != null){
					$answerTd.text('답변완료');
					$answerTd.css('color','#3498db');
				}else{
					$answerTd.text('답변미완료');
					$answerTd.css('color','#e74c3c');
				}
				
				$tr.append($noTd);
				$tr.append($dateTd);
				$tr.append($titleTd);
				$tr.append($answerTd);
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
				var date = new Date(value.QWRITTENDATE).format('yyyy/MM/dd');
				var refBno = value.AREFBNO;
				
				console.log(data.list);
				console.log(value.MQNO + " " + value.BTITLE + " " + value.BCONTENT + " " + date);
				var $tr = $("<tr onclick='selectOneMQ(this)'>");
				var $noTd = $("<td style='display: none;width: 0%;'>").text(value.MQNO);
				var $dateTd = $("<td>").text(date);
				var $titleTd = $("<td>").text(value.BTITLE);
				var $answerTd = $("<td style='color:#3498db'>");
				
				if(refBno != null){
					$answerTd.text('답변완료');
					$answerTd.css('color','#3498db');
				}else{
					$answerTd.text('답변미완료');
					$answerTd.css('color','#e74c3c');
				}
				
				$tr.append($noTd);
				$tr.append($dateTd);
				$tr.append($titleTd);
				$tr.append($answerTd);
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
	
	//나의문의내역 상세보기
	function selectOneMQ(tr){
		var num = tr.childNodes[0].innerHTML;
		
		console.log(num + "번째 문의 보기!");
		
		$mqDiv = $("#mqDiv").css({'background':'#faebd7a6', 'padding':'5%'});
		$mqDiv.html("");
				
		$mqRow = $("<div class='col-md-12' style='padding:0'>");
		
		$mqtable = $("<div style='height: 412px;'> <table class='table'> <tbody id='myQTableOne'> <tr> <td style='padding-left: 2%;padding-right: 2%;'><b>Q. </b><span><b id='bTitle'></b></span> <span class='pull-right'><b id='qwrittenDate'></b></span></td> </tr> <tr> <td style='height: 100px;padding-top: 2%;padding: 2%;' id='bContent'></td> </tr> <tr style='background:white;'> <td style='height: 220px;padding: 2%;'><b>A. 안녕하세요. 널라이브 고객센터입니다.</b><br><br> <span id='answerSpan'></span> </td> </tr> </tbody> </table> </div>");
		
		$mqpage = $("<button type='button' class='btn pull-right backBtn' onclick='mqbackBtn();'>이전</button>");
		
		$mqRow.append($mqtable);
		$mqRow.append($mqpage);
		
		$mqDiv.append($mqRow);

		$.ajax({
			url:"selectOneMQ.bo",
			type:"get",
			data:{num:num},
			success:function(data){
				
				$.each(data.list, function(index, value){
					var date = new Date(value.QWRITTENDATE).format('yyyy/MM/dd');
					
					console.log(data.list);
					
					$("#bTitle").text(value.BTITLE);
					$("#qwrittenDate").text(date);
					$("#bContent").text(value.BCONTENT);
					$("#answerSpan").text(value.ANSWER);
				});
			}
		});
	}
	
	//공지사항 게시판 상세조회에서 이전버튼 눌렀을 때 
	function mqbackBtn(){
			console.log("이전 버튼 눌렸어용!");
			mQContainer();
			mQLoad();
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