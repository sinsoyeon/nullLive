<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/blackListManagement.css">
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
					<div class="ui icon input"></div>
					<div style="float: right;">
						현재 블랙리스트 수:
						<c:out value="${blackCount}"></c:out>
						명 <label></label>
					</div>
				</div>
				<div class="ui input"
					style="overflow: scroll; width: 300px; height: 150px; padding: 10px; background-color: #F6F6F6;">

					<table style="float: center;" id="blackListTable">
						<c:forEach var="black" items="${blackList}" varStatus="status">
							<tr id="blackTr">
								<td><input type="hidden" id="blno" value='${black.BLNO}' />
									<label>${status.count}.<c:out
											value="${black.NICK_NAME}" />(<c:out value="${black.MID}" />)
								</label></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br> <br>

				<div class="row" style="width: 700px;">



					<label>블랙리스트 추가</label> <label style="padding-left: 250px;">블랙리스트
						검색</label>

					<div class="ui icon input"
						style="width: 700px; hieght: 300px; float: left;">
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
				<br> <br>
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
		
		
		$(document).on('click','#searchBtn',function(){
			var searchValue = $('#searchValue').val();
			console.log('실행됨');
			$('#blnoOne').val('');
			
			$.ajax({
				url:"searchBlackList.sm",
				type:"post",
				data:{searchValue:searchValue},
				success:function(data){
					//ajax 처리하기 위해서 tbody를 삭제해줌
					//이유 : 삭제하지 않으면 계속 추가 추가 추가 추가됨(모모링 설문조사하셨을 때 2개가 한 곳에 나왔떤 것처럼 ㅎㅎ)
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
			 			
						//모모링 여기가 input box에 value 담는 거에요
						//jquery 이상해서 
						//가끔 $('이름').val('설정값'); 하면 먹히지 않는 경우가 있어서 아래처럼 했어요 !
			 			$('#blnoOne').attr('value',value["BLNO"]); 
		 			});
				}
			})
			
		});
		
		
		
		
		//1. 체크박스를 누른 뒤 삭제 버튼을 누르면 실행되는 function
		
		$('#deleteBtn').click(function(){
			var checkList = [];
			
			//2. 체크박스가 체크된 개수만큼  반복문을 돌면서 해당 번호를 가져옴 (저는 blackList 테이블 값을 넣었어요)
			// 참고로 #blnOne은 hidden으로 숨겨놓은 input box
			$("input[name='checkBox']:checked").each(function(i){
				checkList.push($(this).parent('td').find('#blnoOne').val());
			})
			
			console.log(checkList);
			
			//체크박스를 서블릿으로 보내는 곳
			$.ajax({
				url:"mutipleDeleteBlack.sm",
				type:"post",
				//체크박스는 [] << 이 형태로 넘어가기 때문에 서블릿 소스도 같이 보내드릴게요~
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