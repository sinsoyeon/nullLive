<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style>
.nav-tabs{
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
	border: 2px solid black;
	z-index:1 !important;
}

.nav-tabs>li {
	float: right;
	z-index:9999 !important;
}
.dropdown-menu>li{
	background-color:black !important;
	color:black;
	z-index:9999 !important;
}

.dropdown-menu{
	background-color:black !important;
	color:black;
	z-index:9999 !important;
}


.nav-tabs li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
		z-index:9999 !important;
}

/* Change the link color to #111 (black) on hover */
.nav-tabs li a:hover {
	background-color: #111;
}


.nav-tabs{
	
}

</style>
</head>
<body>

<div id="btn-group">
		<ul class="nav nav-tabs">
			<li role="presentation" class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" onclick="location.href='chartView.sm'" role="button" aria-expanded="false"> 구독/후원 
			
				</a>
				<li>
				<li>
				<a class="dropdown-toggle" data-toggle="dropdown" onclick="location.href='recomView.sm'" role="button" aria-expanded="false"> 추천별 통계			
				</a>		
			</li>			
		</ul>
		
</div>

<script>
	
</script>
</body>
</html>