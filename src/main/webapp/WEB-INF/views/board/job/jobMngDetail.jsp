<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.outer {
		width:900px;
		height:500px;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}

	.contentArea{
		padding-top : 50px;
		padding-bottom : 50px;
		margin-left: auto;
		margin-right: auto;
		border: solid 1px lightgray;
	}
	.dateArea {
		float: right;
	}
	.boardInfoHeader, .writerInfoArea, .profileArea{
		border: solid 1px lightgray;
	}
	.profileImg{
		width:150px;
		height:221px;
		margin-top: 2%;
		margin-bottom: 2%;
	}
	.boardInfoArea>.divTest{
		height:50px;
	}
	.profileEmpty{
		height:140px;
	}
	.boardInfoHeader {
		height:20px;
	}
	.writerInfoArea{
		height:96px;
	}
	.contractArea {
		width: 100%;
		height: 550px;
		border: solid 1px lightgray;
		margin-top : 20px;
		margin-bottom: 50px;
	}
	#conToggle{
		display: none;
	}
	#contractTable{
		display: none;
	}
	th{
		background: #e2f0d8;
	}
</style>

</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	<c:set var="board" value="${ boardMap.board }"/>
	<c:set var="jBoard" value="${ boardMap.jBoard }"/>
	<c:set var="member" value="${ boardMap.member }"/>
	<c:set var="streamer" value="${ boardMap.streamer }"/>
	<c:set var="contBoardList" value="${ boardMap.contBoardList }"/>
	
	<c:set var="jBtype" value="${ boardMap.jBoard.JBtype }"/>
	<c:if test="${ boardMap.boardStatus ne '모집중' }">
		<jsp:forward page="../../common/errorPage.jsp"/>
	</c:if>
	<!-- 구인구직 상세 보기 -->
	<div class="outer">
		<!-- 프로필 영역 -->
		<jsp:include page="jobHeader.jsp"/>
		<hr>
		<div class="profileArea col-lg-3 " align="center">
			<div class="profileImg" align="center">
				<img alt="" src="${contextPath}/resources/uploadFiles/profile_image/${hmap.imgSource}" width="100%" height="170px">
				<c:if test="${empty hmap.imgSource}">
					<div class="profileEmpty">
					<br><br><br>
					이미지가 없습니다.
					</div>
				</c:if>
				<label><c:out value="${ member.nickName }"/></label><br>
				<label><i class="fas fa-ban"></i></label> &nbsp;
				<label><i class="far fa-envelope"></i></label>
				
			</div>
		</div>
		<!-- 게시글 정보 영역 -->
		<div class="divTest col-lg-9">
			<div><h2><c:out value="${ board.BTitle }"/></h2></div>
		</div>
		<div class="boardInfoArea" >
			
			<div class="boardInfoHeader col-lg-1 col-md-2 col-xs-2">글번호</div>
			<div class="boardInfoHeader col-lg-1 col-md-2 col-xs-2">조회수</div>
			<div class="boardInfoHeader col-lg-1 col-md-2 col-xs-2">구분</div>
			<div class="boardInfoHeader col-lg-2 col-md-2 col-xs-2">등록일시</div>
			<div class="boardInfoHeader col-lg-2 col-md-2 col-xs-2">마감일시</div>
			<div class="boardInfoHeader col-lg-2 col-md-2 col-xs-2">마감여부</div>
			
			<div class="divTest col-lg-1 col-md-2">
				<c:out value="${ board.bno  }"/>
			</div>
			<div class="divTest col-lg-1 col-md-2">
				<c:out value="${ board.BCount }"/>
			</div>
			<div class="divTest col-lg-1 col-md-2">
				<c:out value="${ jBoard.JBtype }"/>
			</div> 
			<div class="divTest col-lg-2 col-md-2">
				<c:set var="writtenDate" value="${ board.writtenDate }"
				 />
				<c:set var="nowDate" value="<%= new java.util.Date() %>"/>
				
				<fmt:formatDate value="${writtenDate}" pattern="yyyy-MM-dd" var="wd"/>
				<fmt:formatDate value="${nowDate}" pattern="yyyy-MM-dd" var="nd"/>
				
				<!-- 등록일시 일수가 넘어간경우 날짜를 보여줌 -->
				<c:if test="${ wd < nd }">
					<fmt:formatDate value="${writtenDate}" pattern="yyyy-MM-dd" />
				</c:if>
				<!-- 등록일시가 현재일인 경우 시간을 보여줌 -->
				<c:if test="${ wd >= nd }">
					<fmt:formatDate type="TIME" timeStyle="short" value="${writtenDate}"/>
				</c:if>
				
			</div>
			<div class="divTest col-lg-2 col-md-2">
				<c:set var="deadline" value="${ jBoard.deadLine }" />
				<fmt:formatDate value="${deadline}" pattern="yyyy-MM-dd" />
			</div>
			<div class="divTest col-lg-2 col-md-2">
				<c:out value="${ boardMap.boardStatus }"></c:out>
			</div>
		</div>
		<hr>
		<!-- 게시자 정보 영역 -->
		<div class="writerInfoArea col-lg-9">
			
			<c:if test="${ jBoard.JBtype eq '구인' }">
				<div>게시자 정보(스트리머)</div>
				<div><b>방송시작일 :<c:out value="${ streamer.bstart_date }"/></b></div>
				<div><b>구독자수 :<c:out value="${ boardMap.suCount }"/></b></div>
				<div><b>누적추천수 :<c:out value="${ streamer.cumulative_selection }"/></b></div>
			</c:if>
			<c:if test="${ jBoard.JBtype eq '구직' }">
				<div>게시자 정보(매니저)</div>
				<div><b>가입일 : <c:out value="${ member.enrollDate }"></c:out></b></div>
				<button class="btn btn-info btn-xs" data-toggle="modal" data-target="#detailModal" onclick="fn_showWritterDetail2(${ member.mno })">상세정보</button>
			</c:if>
		</div>
		<!-- 버튼영역  -->
		<div class="btnArea col-lg-12 col-md-12 col-xs-12" align="center">
			<br><br>
			<%-- 로그인된 유저이거나 작성자가 아닌경우 지원하기 버튼을 보여줌 --%>
			<c:if test="${ !empty loginUser && loginUser.mno ne member.mno }">
				<button class="btn btn-success btn-sm" onclick="fn_showContract()">지원하기</button>
			</c:if>
			<%-- 작성자인 경우 수정하기 버튼 활성화 --%>
			<c:if test="${ loginUser.mno eq member.mno  }">
				<button class="btn btn-primary btn-sm">수정하기</button>
			</c:if>
			<button class="btn btn-primary btn-sm"  onclick="location.href='jobBoardList.jbo?bType=JOBMNG&url=board/job/jobMngList'">목록으로</button>
			<br><br>
		</div>
			
			
			
			
			
			
			
		<!-- 게시글  -->
		<div class="contentArea col-lg-12" style="overflow: scroll;">
			<c:out value="${ board.BContent }" escapeXml="false"/>
		</div>
		<!-- 첨부파일 영역 -->
		<div class="attArea">
			<label>첨부파일</label>
			<br>

			<c:forEach var="row" items="${attList}" >
				<div>
					<input type="hidden" class="attno" name="attno" value="${row.attno }">
					<a href="#this" name="file">${row.originName }</a><br>
					<br>
				</div>
			</c:forEach>
		</div>
		
		<!-- 지원서 폼 -->
			<div class="contractArea col-lg-12" id="conToggle" align="center">
				<h2>지원서 작성</h2>
				<form action="insertMngContract.jbo" method="post" id="contractFrm" enctype="multipart/form-data">
					<h3>제목</h3>
					<input class="form-control col-lg-12 col-md-12 col-sm-8" type="text" name="bTitle" id="bTitle" placeholder="제목을 입력하세요">
					<h3>내용</h3>
					<textarea name="bContent" class="col-lg-12" id="editor" required  wrap="hard" placeholder="내용을입력하세요(4자이상)"  style="width: 880px; height: 200px;"></textarea>
					<input type="hidden" value="${ board.bno }" name="refBno">
					<input type="hidden" value="JOBMNGCONT" name="bType">
					<input type="hidden" value="${ jBoard.job }" name="job">
					<input type="hidden" value="${ jBoard.jbno }" name="job">
					<input type="hidden" value="${ member.mno }" name="mno">
					<input type="hidden" value="${ streamer.sno }" name="sno">
					
					<h3>첨부파일</h3>
					<jsp:include page="attachmentForm.jsp"/>
				</form>
				<button class="btn btn-success btn-sm" onclick="fn_ContractSumit()">제출하기</button>
				<!-- 첨부파일 영역 -->
			</div>
			
		<!-- 지원하기 버튼 -->
		<div class="btnArea col-lg-12" align="center">
			<%-- 로그인된 유저이거나 작성자가 아닌경우 지원하기 버튼을 보여줌 --%>
			<c:if test="${ !empty loginUser && loginUser.mno ne member.mno}">
				<button class="btn btn-success btn-lg" onclick="fn_showContract()">지원하기</button>
			</c:if>
		</div>
		
		<br><br><br><br><br><br>
		<hr>
		<br><br><br><br>
		<%-- 작성자인 경우에만 보여줌 --%>
			
		<!-- 지원 현황 영역 -->
		<c:if test="${ loginUser.mno eq member.mno }">
			<div>
				<div>
					<h4><b>지원현황(<c:out value="${ contBoardList.size() }"/>건)</b></h4>
					<button class="btn btn-info btn-xs" onclick="fn_showContractList()">지원현황 보기</button>
					<hr>
				</div>
				
				<!-- 지원 현황 테이블 -->
				<div id="contractTable">
					<table align="center" class="col-lg-12 table">
						<tr>
							<th>ID</th>
							<th>일자</th>
							<th>지원서보기</th>
							<th>승낙하기</th>
						</tr>
						<c:forEach var="list" items="${ contBoardList }">
							<tr>
								<td><a onclick="fn_showWritterDetail(${ list.mno })"  data-toggle='modal' data-target='#detailModal'><c:out value="${ list.nickName }"/></a></td>
								<td>

									<c:set var="writtenDate" value="${ list.writtenDate }" />
									<c:set var="nowDate" value="<%= new java.util.Date() %>"/>
									
									<fmt:formatDate value="${writtenDate}" pattern="yyyy-MM-dd" var="wd"/>
									<fmt:formatDate value="${nowDate}" pattern="yyyy-MM-dd" var="nd"/>
									
									<!-- 등록일시 일수가 넘어간경우 날짜를 보여줌 -->
									<c:if test="${ wd < nd }">
										<fmt:formatDate value="${writtenDate}" pattern="yyyy-MM-dd" />
									</c:if>
									<!-- 등록일시가 현재일인 경우 시간을 보여줌 -->
									<c:if test="${ wd >= nd }">
										<fmt:formatDate type="TIME" timeStyle="short" value="${writtenDate}"/>
									</c:if>
								</td>
								<td>
									<span data-toggle="modal" data-target="#contDetailModal" onclick="return fn_showContractDetail(${list.mno},${ list.bno })">
										<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-envelope"></i></label>
									</span>
								</td>
								
								<td><button class="btn btn-success btn-xs" onclick="fn_contConsent(${list.mno},${ list.bno })">승낙하기</button></td>
								
								
							
							</tr>
							
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- 승낙하기 form -->
			<form action="insertMngContConsent.jbo" method="post" id="contConsentFrm">
				<input type="hidden" value="${ jBoard.jbno }" name="jbno">
				<input type="hidden" value="${ jBtype }" name="jBtype">
				<input type="hidden" value="${ jBoard.job }" name="job">
				<input type="hidden" value="${ board.bno }" name="bno">
				<input type="hidden" value="${ jBoard.contContent }" name="contContent">
				<input type="hidden" value='${ member.mno }' name="mno">
				<c:if test="${ jBtype eq '구인' }">
					<input type="hidden" value="${ streamer }" name="sno">
				</c:if>
				
			</form>
		</c:if>
		<br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	
	
	<!-- 지원자 정보 상세보기 MODAL-->
	  <div class="modal fade" id="detailModal" role="dialog">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title" id="partnerListTitle">정보 상세보기</h4>
	        </div>
	        <div class="modal-body">
	        	<table class="table">
	        		<tbody id="partnerList">
		        		
	        		</tbody>
	        	</table>
	        	
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
	  
		<!-- 지원자 정보 상세보기 MODAL-->
		<div class="modal fade" id="contDetailModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">지원서 보기</h4>
					</div>
					<div class="modal-body">
						<table class="table">
						<colgroup> <col width="15%"/> <col width="35%"/> <col width="15%"/> <col width="35%"/> </colgroup>

							<tr>
								<th scope="row">제목</th>
								<td colspan="3" id="contBTitle"></td>
							</tr>
							<tr>
								<th scope="row">지원자</th>
								<td id="contBWriter"></td>
								<th scope="row">지원일시</th>
								<td id="contWrittenDate"></td>
							</tr>
							<tr>
								<td colspan="4" class="view_text">
									<div id="contBContent" style="overflow: scroll;"></div>
								</td>
							</tr>
							<tr></tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td colspan="3" id="attArea">
									
								</td>
							</tr>
							
						</table>
					</div>
						<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


	
	<script>
		//첨부파일
		$("a[name='file']").on("click", function(e){
			//파일 이름
			e.preventDefault(); 
			fn_downloadFile($(this));
		});
		function fn_downloadFile(obj){
			var attno = obj.parent().find(".attno").val();
			location.href="jobBoardDownloadFile.jbo?attno="+attno;
		}
		//attno을 받아 파일 다운로드
		function fn_downloadFile2(attno){
			location.href="jobBoardDownloadFile.jbo?attno="+attno;
		}
		
		//계약하기
		function fn_ContractSumit(){
			
			//해당 글에 지원 이력이 있는경우 안됨
			<c:forEach var="list" items="${ contBoardList }">
				if(${list.mno eq loginUser.mno}){
					alert("해당글에 이미 지원하셨습니다");
					fn_showContract();
					return;
				}
			</c:forEach>
			var bTitle = $("#bTitle").val();
			var bContent = $("#editor").prop("textLength");

			if(bTitle==""){
				alert("제목을  입력해주세요");
				$("#bTitle").focus();
				return;
			}
			if(bContent<10){
				alert("내용을 10자 이상 입력해주세요");
				$("#editor").focus();
				return;
			}
			
			
			$("#contractFrm").submit();
			alert("성공적으로 지원되셨습니다.");
		}
		//지원서 폼 보여주기
		function fn_showContract(){
			$("#conToggle").toggle('slow');
			$("#bTitle").focus();
		}
		//지원현황 보여주기
		function fn_showContractList(){
			$("#contractTable").toggle('slow');
		}
		//지원서 승낙 submit
		function fn_contConsent(contMno,contBno){
			if(confirm("승낙하시겠습니까?")){
				$("#contConsentFrm").append('<input type="hidden" value='+contMno+' name="contMno">');
				$("#contConsentFrm").append('<input type="hidden" value='+contBno+' name="contBno">');
				if("${ jBtype eq '구인'}"){
					
				}else {
					
				}
				
				
				$("#contConsentFrm").submit();
				alert("성공적으로 처리되었습니다.");
			}
		}
		
		//지원서 보기
		function fn_showContractDetail(mno,bno){
			$.ajax({
				url: "showContractDeatil.jbo",
				type: "get",
				data: {bno:bno, mno:mno},
				success: function(data){
					var bTitle = data.board.btitle;
					var bContent = data.board.bcontent;
					var writtenDate = new Date(data.board.writtendate).format('yyyy/MM/dd');
					var contBWriter = data.member.nickName;
					var attList = data.attList;
					console.log(writtenDate);
					$("#contBContent");
					$("#contBTitle").prop("textContent",bTitle);
					$("#contBContent").prop("textContent","");
					$("#contBContent").append(bContent);
					$("#contWrittenDate").prop("textContent",writtenDate);
					
					$("#contBWriter").prop("textContent","");
					$("#contBWriter").append("<a onclick='fn_showWritterDetail("+ data.member.mno +")' data-dismiss='modal' data-toggle='modal' data-target='#detailModal' id='contBWriter' name='mno'>"+ contBWriter +"</a><br>");
					$("#attArea").prop("textContent","");
					$.each(attList , function(i){
						console.log($("#attName"));
						$("#attArea").append("<input type='hidden' class='attno' name='attno' value="+ attList[i].attno +">");
						$("#attArea").append("<a onclick='fn_downloadFile2("+ attList[i].attno +")' id='attName' name='file'>"+ attList[i].originName +"</a><br>")
		           });
					
				},
				error:function(status){
				}
			});
			return false; 
		}
		//지원자 상세보기
		function fn_showWritterDetail(mno){
			var jBtype = "${jBtype}";
			$.ajax({
				url: "selectWritterDeatil.jbo",
				type: "get",
				data: {mno:mno,jBtype:jBtype},
				success: function(data){
					//구인인 경우 매니저 이력을 보여줌
					$("#partnerList").prop("textContent","");
					$("#partnerListTitle").prop("textContent","지원자 상세정보 보기(최근 매니저 이력 5건)");
					console.log($("#partnerListTitle"));
        			if(jBtype == "구인"){
	        			$("#partnerList").append("<tr><th>파트너닉네임</th><th>시작일</th><th>종료일</th><th>상태</th></tr>");
						$.each(data , function(i){
							var $tr = $("<tr>");
							var cSDate = new Date(data[i].cSDate).format('yyyy/MM/dd');
							var cEDate = new Date(data[i].cEDate).format('yyyy/MM/dd');
							
							$tr.append("<td>"+ data[i].nickName +"</td>");
							$tr.append("<td>"+ cSDate +"</td>");
							
							if(data[i].cEDate == null || data[i].cEDate == 0){
								$tr.append("<td> ~ </td>");
							}else {
								$tr.append("<td>"+ cEDate +"</td>");
							}
							if(data[i].pStatus == 'Y'){
								$tr.append("<td> 계약중 </td>");
							}else {
								$tr.append("<td> 계약완료 </td>");
							}
							
							$("#partnerList").append($tr);
						});
        			}else {
        				var streamer = data[0].streamer;
        				var member = data[0].member;
        				var suCount = data[0].suCount;
        				var bstart_date =  new Date(streamer.bstart_date).format('yyyy/MM/dd');
        				$("#partnerListTitle").prop("textContent","지원자 상세정보 보기(스트리머)");
        				$("#partnerList").prop("textContent","");
        				$("#partnerList").append('<colgroup> <col width="15%"/> <col width="35%"/> <col width="15%"/> <col width="35%"/> </colgroup>');
        				
        				$("#partnerList").append("<tr><th>닉네임</th><td>"+ member.nickName +"</td></tr>");
        				$("#partnerList").append("<tr><th>구독자수</th><td>"+ suCount +"</td></tr>");
        				$("#partnerList").append("<tr><th>방송시작일</th><td>"+ bstart_date +"</td></tr>");
        				
        			}	
				}
			});
		}
		
		
		//작성자 상세보기
		function fn_showWritterDetail2(mno){
			var jBtype = "구인";
			$.ajax({
				url: "selectWritterDeatil.jbo",
				type: "get",
				data: {mno:mno,jBtype:jBtype},
				success: function(data){
					console.log(data);
					//구인인 경우 매니저 이력을 보여줌
					$("#partnerListTitle").prop("textContent","작성자 상세정보 보기(최근 매니저 이력 5건)");
					$("#partnerList").prop("textContent","");
        			$("#partnerList").append("<tr><th>파트너닉네임</th><th>시작일</th><th>종료일</th><th>상태</th></tr>");
					$.each(data , function(i){
						var $tr = $("<tr>");
						var cSDate = new Date(data[i].cSDate).format('yyyy/MM/dd');
						var cEDate = new Date(data[i].cEDate).format('yyyy/MM/dd');
						
						$tr.append("<td>"+ data[i].nickName +"</td>");
						$tr.append("<td>"+ cSDate +"</td>");
					
						if(data[i].cEDate == null || data[i].cEDate == 0){
							$tr.append("<td> ~ </td>");
						}else {
							$tr.append("<td>"+ cEDate +"</td>");
						}
						if(data[i].pStatus == 'Y'){
							$tr.append("<td> 계약중 </td>");
						}else {
							$tr.append("<td> 계약완료 </td>");
						}
						
						$("#partnerList").append($tr);
					});
				}
			});
		}
		
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