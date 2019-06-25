
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagingArea" align="center">
	<ul class="pagination">
		<c:if test="${ pi.currentPage <= 1 }">
			<li class="page-item"><a class="page-link" href="">Previous</a></li>
		</c:if>
		<c:if test="${ pi.currentPage > 1 }">
			<c:url var="blistBack" value="/selectListJobNotice.jbo">
				<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
			</c:url>
			<li class="page-item"><a class="page-link" href="${ blistBack }">Previous</a></li>
		</c:if>
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			<c:url var="blistCheck" value="selectListJobNotice.jbo">
				<c:param name="currentPage" value="${ p }"/>
			</c:url>
			<li class="page-item"><a class="page-link" href="${ blistCheck }">${ p }</a></li>
		</c:forEach>
		<c:if test="${ pi.currentPage >= pi.maxPage }">
			<li class="page-item"><a class="page-link" href="">Next</a></li>
		</c:if>
		<c:if test="${ pi.currentPage < pi.maxPage }">
			<c:url var="blistEnd" value="selectListJobNotice.jbo">
				<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
			</c:url>
			<li class="page-item"><a class="page-link" href="${ blistEnd }">Next</a></li>
		</c:if>
	</ul>
</div>
