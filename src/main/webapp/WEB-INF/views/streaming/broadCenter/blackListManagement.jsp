<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/blackListManagement.css">
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
				<input type="hidden" id="mno" value="${loginUser.mno}" />
				<h3>블랙리스트 관리</h3>
				<hr>
				<div class="ui category search">
				<label>현재 블랙리스트 목록</label>
					<div class="ui icon input">
						
					</div>
					<div style="float:right;">
						현재 블랙리스트 수: <c:out value="${blackCount}"></c:out>명
						<label></label>
					</div>
				</div>
				<div class="ui input" style="overflow:scroll; width:300px; height:150px; padding:10px; background-color:#F6F6F6;">
					
					<table style="float:center;" id="blackListTable">
						<c:forEach var="black" items="${blackList}" varStatus="status">
							<tr id="blackTr">
								<td>
								<input type="hidden" id="blno" value='${black.BLNO}'/>
								<label>${status.count}.<c:out value="${black.NICK_NAME}" />(<c:out value="${black.MID}" />)</label></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br> <br> 
				
				<div class="row" style="width:700px;">
				
			
					
						<label>블랙리스트 추가</label> 	
					
						<label style="padding-left:250px;">블랙리스트 검색</label>
						
					<div class="ui icon input" style="width:700px; hieght:300px; float:left;">
						<input class="prompt" id="userId" type="text"> <i
							class="search icon"></i>
						<button class="ui green button" id="insertBtn">추가</button>
						
					
					<input class="prompt" type="text" id="searchValue"> <i
							class="search icon"></i> 
						<button class="ui green button" id="searchBtn">검색</button>
					</div>
					
	

				</div>
				<br> <label>블랙리스트 상세 조회</label>
				<table class="blackListDetail">
					<thead>
						<tr>
							<th>선택</th>
							<th>아이디</th>
							<th>닉네임</th>
							<th>벤 날짜</th>
						</tr>
					<thead>
					<tbody>
					
					
					</tbody>

				</table>
				<br>
				<button class="ui green button" id="deleteBtn">벤 해제</button>
				<button class="ui green button">귓속말</button>
				<br>
				<br>
				<button class="ui green button" id="update">업데이트</button>
				<button class="ui green button" id="allDeleteBtn">전체 삭제</button>

			</div>
		</div>



	</div>
	
	<script>
		$("#blackListTable  #blackTr").click(function(){
		 	var blno = $(this).children("td").find("#blno").val();
		 	var mno = ${loginUser.mno};
	
		 	$.ajax({
		 		url:"selectOneBlackList.sm",
		 		type:"post",
		 		data:{blno:blno,mno:mno},//success:function
		 		success:function(data){
		 			$(".blackListDetail > tbody").html('');
		 			$(".blackListDetail > tbody")
		 										.append('<tr><td><input type="checkBox" name="checkBox"><input type="hidden"  id="blnoOne" name="blnoOne"></input></td><td>'
		 												+ data.blackDetail.MID + '</td>'
		 												+ '<td>'+ data.blackDetail.NICK_NAME +'</td>'
		 												+ '<td>' + data.blackDetail.BL_DATE + '</td></tr>');
		 			$('#blnoOne').val(data.blackDetail.BLNO);
		 			$('input[name="checkBox"]').val(data.blackDetail.BLNO);
		 			console.log($('#blnoOne').val());
		 			console.log('check : ' + $('input[name="checkBox"]').val());
		 		},
		 		error:function(data){
		 			alert(data.msg);
		 		}
		 	});
		 	
		});
		
		$('#insertBtn').click(function(){
			if(confirm($("#userId").val() + '님을 블랙리스트에 추가하시겠습니까 ? ')){
				var userId = $("#userId").val();				
					location.href='insertBlackList.sm?userId='+ userId;
			}
		});
		
		$('#update').click(function(){
			location.href='blackListManage.st';
		});
		
		
		$('#allDeleteBtn').click(function(){
			if(confirm('전부 블랙리스트에서 삭제 하시겠습니까?')){
				
				location.href="allDeleteBlackList.sm";
			
			}
		});
		
		
		$('#searchBtn').click(function(){
			var searchValue = $('#searchValue').val();
			$('#blnoOne').val('');
			
			$.ajax({
				url:"searchBlackList.sm",
				type:"post",
				data:{searchValue:searchValue},
				success:function(data){
		 			$(".blackListDetail > tbody").html('');
		 			
		 			
		 			$.each(data.searchList,function(index,value){		 						 			
			 			$(".blackListDetail > tbody")
			 										.append('<tr><td><input type="checkBox"  name="checkBox" id="checkBox">'
			 												+ '<input type="hidden" name="blnoOne" id="blnoOne" value="'  
			 												+ value["BLNO"] + '"'
			 												+ '/>'
			 												+ '</td><td>'
			 												+ value["MID"] + '</td>'
			 												+ '<td>'+ value["NICK_NAME"] +'</td>'
			 												+ '<td>' + value["BL_DATE"] + '</td></tr>');
	
			 			$('#blnoOne').attr('value',value["BLNO"]); 
		 			});
				}
			})
			
		});
		
		
		
		
		$('#deleteBtn').click(function(){
			var checkList = [];
			
			$("input[name='checkBox']:checked").each(function(i){
				checkList.push($(this).parent('td').find('#blnoOne').val());
			})
			
			console.log(checkList);
			
			$.ajax({
				url:"mutipleDeleteBlack.sm",
				type:"post",
				data:{checkList:checkList},
				success:function(data){
					console.log(data);
					
					if(data=='success'){
						alert('블랙리스트 해제 처리가 완료되었습니다.');
						location.href='';
					}
				}
				
			});
		});
	</script>
</body>
</html>