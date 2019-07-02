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
		border: solid 1px black;
	}
	.dateArea {
		float: right;
	}
	.boardInfoHeader, .writerInfoArea {
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
</style>

</head>
<body>
	<jsp:include page="jobMenubar.jsp"/>
	<h1 align="center">매니저 구인구직 게시판</h1>
	<hr>
	
	<!-- 구인구직 상세 보기 -->
	<div class="outer">
		<!-- 프로필 영역 -->
		<div class="divTest col-lg-3" align="center">
			<div class="profileImg" align="center">
				<img alt="" src="${contextPath}/resources/uploadFiles/profile_image/${hmap.imgSource}" width="100%" height="170px">
				<c:if test="${empty hmap.imgSource}">
					<div class="profileEmpty">
					<br><br><br>
					이미지가 없습니다.
					</div>
				</c:if>
				<label><c:out value="${ hmap.nickName }"/></label><br>
				<label><i class="fas fa-ban"></i></label> &nbsp;
				<label><i class="far fa-envelope"></i></label>
				
			</div>
		</div>
		<!-- 게시글 정보 영역 -->
		<div class="divTest col-lg-9">
			<div><h2><c:out value="${ hmap.bTitle }"/></h2></div>
		</div>
		<div class="boardInfoArea" >
			
			<div class="boardInfoHeader col-lg-1 col-md-2 col-xs-2">글번호</div>
			<div class="boardInfoHeader col-lg-1 col-md-2 col-xs-2">조회수</div>
			<div class="boardInfoHeader col-lg-1 col-md-2 col-xs-2">구분</div>
			<div class="boardInfoHeader col-lg-2 col-md-2 col-xs-2">등록일시</div>
			<div class="boardInfoHeader col-lg-2 col-md-2 col-xs-2">마감일시</div>
			<div class="boardInfoHeader col-lg-2 col-md-2 col-xs-2">마감여부 </div>
			
			<div class="divTest col-lg-1 col-md-2">
				<c:out value="${ hmap.bno }"/>
			</div>
			<div class="divTest col-lg-1 col-md-2">
				<c:out value="${ hmap.bCount }"/>
			</div>
			<div class="divTest col-lg-1 col-md-2">
				<c:out value="${ hmap.jBType }"/>
			</div>
			<div class="divTest col-lg-2 col-md-2">
				<c:set var="writtenDate" value="${ hmap.writtenDate }" />
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
				<c:set var="deadline" value="${ hmap.deadline }" />
				<fmt:formatDate value="${deadline}" pattern="yyyy-MM-dd" />
			</div>
			<div class="divTest col-lg-2 col-md-2">
				<c:out value="${ hmap.staDetail }"/> 
			</div>
		</div>
		<hr>
		<!-- 게시자 정보 영역 -->
		<div class="writerInfoArea col-lg-9">
			<div>게시자 정보</div>
		</div>
		<button class="btn btn-info btn-xs">상세정보</button>
		<!-- 버튼영역  -->
		<div class="btnArea col-lg-12 col-md-12 col-xs-12" align="center">
			<br><br>
			<button class="btn btn-success btn-sm">지원하기</button>
			<button class="btn btn-primary btn-sm">목록으로</button>
			<button class="btn btn-primary btn-sm">수정하기</button>
			<br><br>
		</div>
		<!-- 게시글  -->
		<div class="contentArea col-lg-12">
			<c:out value="${ hmap.bContent }" escapeXml="false"/>
		
		</div>
		
		<!-- 지원하기 버튼 -->
		<div class="btnArea col-lg-12" align="center">
		<br><br>
			<button class="btn btn-success btn-lg">지원하기</button>
		</div>
	
		<br><br><br><br><br><br>
		<hr>
		<br><br><br><br>
		<!-- 지원 현황 영영 -->
		<div>
			<div>
				<h4><b>지원현황</b></h4>
				<hr>
			</div>
			
			<!-- 지원 현황 테이블 -->
			<table align="center" class="col-lg-12">
				<tr>
					<th>ID</th>
					<th>일자</th>
					<th>지원서보기</th>
					<th>승낙하기</th>
				</tr>
				<tr>
					<td>bj인효</td>
					<td>2019-06-04</td>
					<td>지원서</td>
					<td>승낙하기</td>
				</tr>
			</table>
			
		</div>
		
		<br><br><br><br>
	</div>
</body>
</html>