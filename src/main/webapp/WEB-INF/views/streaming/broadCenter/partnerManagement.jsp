<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/streamer/partnerManagement.css">
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
				<h3 style="font-weight:bold; font-size:30px;">매니저 설정</h3>
				<hr>
				<div class="partnerArea">
					<label>현재 매니저 목록</label><br>
						<table>
							<c:forEach var="manager" items="${partnerList}">
								<c:if test="${manager.PTYPE eq '매니저' }">
									<label><c:out value="${manager.NICK_NAME}" /></label><br>
								</c:if>
							</c:forEach>
						</table>
					<br> <br> <label>현재 편집자 목록</label><br>
					<div class="ui input">
						<table>
							<c:forEach var="editor" items="${partnerList}">
								<tr>
								<td><c:if test="${editor.PTYPE eq '편집자' }">
											<c:out value="${editor.NICK_NAME}"/>
									</c:if>
								</td>	
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<br> <br> 
				<input type="radio" /> <span>매니저</span> 
				<input type="radio" /> <span>편집자</span><br>
				<div class="ui category search">
					<div class="ui icon input">
						<input class="prompt" type="text" style="width: 600px;"> <i
							class="search icon"></i>
					</div>
				</div>
				<br> <label>매니저 상세 조회</label>
				<table class="managerDetail">
					<tr>
						<th></th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>날짜</th>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>bashongMon</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>bashongMon</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>bashongMon</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
					</tr>
				</table>
				<br>
				<button class="ui green button">삭제</button>
				<br>
				<br> <label>편집자 상세 조회</label>
				<table class="managerDetail">
					<tr>
						<th></th>
						<th>아이디</th>
						<th>닉네임</th>
						<th>날짜</th>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>bashongMon</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>bashongMon</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>bashongMon</td>
						<td>빠숑맘</td>
						<td>2019/06/21</td>
					</tr>
				</table>
				<br>
				<button class="ui green button">삭제</button>
				<br>
				<br>
				<br>
				<button class="ui green button" id="update">업데이트</button>

			</div>
		</div>



	</div>




</body>
</html>