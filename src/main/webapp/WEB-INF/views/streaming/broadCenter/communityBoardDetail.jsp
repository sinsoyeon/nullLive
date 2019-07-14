<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Null Live</title>
<style>
.table{
	border:1px solid black;
	width: 50%;
}
.table tr {
	border:1px solid black;
}
.table td {
	border:1px solid black;
}
</style>
</head>
<body>
		<h1 align="center">게시판 상세 보기</h1>
		<table align="center" class="table">
			<tr>
				<td width="100px">글번호</td>
				<td><b></b></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><b></b></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><b></b></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td><b></b></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><b></b></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><p style="height:100px;"><b></b></p></td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td>
					<textarea cols="60" rows="5"></textarea>				
				</td>
				<td>
					<button>등록하기</button>
				</td>
			</tr>
			<tr>
				<td colspan="2"><b></b></td>
			</tr>
		</table>
		<hr>
		<%-- <c:if test="${ rCount > 0 }">
		<table align="center">
			<c:forEach var="r" items="${b.replyList }">
				<tr>
					<td width="100px">${ r.userName }</td>
					<td width="300px">${ r.rContent }</td>
					<td width="100px">${ r.createDate }</td>
				</tr>
			</c:forEach>
		</table>	
		</c:if> --%>
		

</body>
</html>