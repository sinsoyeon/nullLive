<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="listArea">
	<table align="center" class="table col-lg-12">
	<tr>
		<th width="10%">번호</th>
		<th width="10%">작성자</th>
		<th width="50%">제목</th>
		<th width="20%">등록일</th>
		<th width="10%">조회수</th>
	</tr>
	<c:forEach var="board" items="${ blist }">
		<tr>
			<td id="bno">${ board.bno }</td>
			<td>${ board.bwriter }</td>
			<td align="left">${ board.btitle }</td>
			<td>${ board.writtenDate }</td>
			<td>${ board.bcount }</td>
			</tr>
		</c:forEach>
	</table>
</div>
