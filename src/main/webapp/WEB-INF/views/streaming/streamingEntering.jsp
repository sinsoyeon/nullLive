<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color:black;">
	<c:if test="${badult eq 'Y'}">
		<c:if test="${loginUser.adult eq 'Y'}">
			<c:if test="${bpwd ne null}">
				<script>
					var inPwd = prompt('비밀번호를 입력하세요');
					if(inPwd == '${bpwd}'){
						location.href="enterStreaming.st?streamerAddress="+'${streamerAddress}';
					}else{
						alert('비밀번호가 일치하지 않습니다.');
						window.close();
					}
				</script>
			</c:if>
		</c:if>
		<c:if test="${loginUser.adult ne 'Y'}">
			<script>
				var con = confirm('성인 인증이 필요합니다. 계속하시겠습니까?');
				if(con){
					alert('성인인증 페이지로 이동합니다.');
					window.opener.location.href="updatePage.me";
					window.close();
				}else{
					alert('성인인증 없이 방송을 시청하실 수 없습니다.');
					window.close();
				}
			</script>
		</c:if>
	</c:if>
	<c:if test="${badult ne 'Y'}">
		<c:if test="${bpwd ne null}">
			<script>
				var inPwd = prompt('비밀번호를 입력하세요');
				if(inPwd == '${bpwd}'){
					location.href="enterStreaming.st?streamerAddress="+'${streamerAddress}';
				}else{
					alert('비밀번호가 일치하지 않습니다.');
					window.close();
				}
			</script>
		</c:if>
	</c:if>
</body>
</html>