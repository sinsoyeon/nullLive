<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style type="text/css">
input[type="checkbox"]#menu_state {
	display: none;
}

input[type="checkbox"]:checked ~ .sidebar {
	width: 210px;
}

input[type="checkbox"]:checked ~ .sidebar label[for="menu_state"] i::before
	{
	content: "\f053";
}

input[type="checkbox"]:checked ~ .sidebar ul {
	width: 100%;
}

input[type="checkbox"]:checked ~ .sidebar ul li a span {
	opacity: 1;
	transition: opacity 0.25s ease-in-out;
}

input[type="checkbox"]:checked ~ main {
	left: 210px;
}

.sidebar {
	position: fixed;
	z-index: 9;
	top: 0;
	left: 0;
	bottom: 0;
	background: #fcf8e3d1;
	color: #6f8e30;
	width: 50px;
	font-family: 'Montserrat', sans-serif;
	font-weight: lighter;
	transition: all 0.15s ease-in-out;
}

.sidebar label[for="menu_state"] i {
	cursor: pointer;
    position: absolute;
    top: 50%;
    right: -8px;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
    background: #fff;
    font-size: 10px;
    color: #555;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 18px;
    width: 18px;
    border-radius: 50%;
    transition: width 0.15s ease-in-out;
    z-index: 1;
}

.sidebar label[for="menu_state"] i::before {
	margin-top: 2px;
	content: "\f054";
}

.sidebar label[for="menu_state"] i:hover {
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
}

.sidebar ul {
	overflow: hidden;
	display: block;
	width: 50px;
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.sidebar ul li {
	position: relative;
	height: 65px;
}

.sidebar
 
ul
 
li
:not
 
(
:last-child
 
){
border-bottom
:
 
none
;


}
.sidebar ul li.active a {
	background: #4c515d;
	color: #fff;
}

.sidebar ul li a {
	position: relative;
	display: block;
	white-space: nowrap;
	text-decoration: none;
	color: #333;
	height: 50px;
	width: 100%;
	transition: all 0.15s ease-in-out;
}

.sidebar ul li a:hover {
	color: #6f8e30;
}

.sidebar ul li a * {
	height: 100%;
	display: inline-block;
}

.sidebar ul li a i {
	text-align: center;
	width: 50px;
	z-index: 999999;
}

.sidebar ul li a i.fas {
	line-height: 50px;
}

.sidebar ul li a span {
    font-size: 16px;
	padding-left: 25px;
	opacity: 0;
	line-height: 50px;
	transition: opacity 0.1s ease-in-out;
}

main {
	position: absolute;
	transition: all 0.15s ease-in-out;
	top: 0;
	left: 50px;
}

main header {
	position: absolute;
	z-index: -1;
	top: 0;
	left: 0;
	right: 0;
	height: 400px;
	background: url("http://www.blueb.co.kr/SRC2/_image/01.jpg");
	background-size: cover;
	background-position: 50% 50%;
	background-repeat: no-repeat;
}

main section {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	background: #fff;
	padding: 25px;
	font-family: helvetica;
	font-weight: lighter;
	padding: 50px;
	margin: 150px 75px;
	transition: all 0.15s ease-in-out;
}

main section:hover {
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
}

main section h1 {
	padding-top: 0;
	margin-top: 0;
	font-weight: lighter;
}
</style>
</head>
<body>
	<div class="container-fluid">
	<jsp:include page="../common/menubar.jsp" />
	<div class="row">
		<div class="col-md-12">

				<!-- sidebar -->
				<input type="checkbox" id="menu_state" checked>
				<nav class="sidebar" style=" margin-top: 50px; ">
					<label for="menu_state"><i class="fa"></i></label>
					<ul>
						<li><a href="#"> <i class="fas fa-star fa-lg"></i> <span>즐겨찾기</span>
						</a></li>
						<li><a href="#"> <i class="fas fa-play fa-lg"></i> <span>LIVE</span>
						</a></li>
						<li><a href="#"> <i class="fas fa-video fa-lg"></i> <span>VOD</span>
						</a></li>
						<li><a href="#"> <i class="fas fa-mouse-pointer fa-lg"></i>
								<span>소통센터</span>
						</a></li>
						<li><a href="#"> <i class="fas fa-headphones fa-lg"></i>
								<span>고객센터</span>
						</a></li>
						<li><a><i class="fas fa-thumbs-up fa-lg"></i> <span>인기채널</span>
							</a></li>
		        <li data-content="2" class="unread" onclick="location.href='testForm.me'"><a
				  	href="javascript:void(0)"> <i class="fa fa-heart"></i> <span>테스트용 탭</span>
				</a></li>
				<li data-content="2" class="unread" onclick="location.href='start.st'"><a
				  	href="javascript:void(0)"> <i class="fa fa-heart"></i> <span>스트리머 탭</span>
				</a></li>            
					</ul>
				</nav>
				
				<!-- main content -->
				<main style="padding-left: 2%;padding-right: 2%;">

				<h1>Proin sodales velit vel nisi bibendum tempor</h1>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Phasellus tristique massa eget volutpat volutpat. Class aptent
					taciti sociosqu ad litora torquent per conubia nostra, per inceptos
					himenaeos. Sed consectetur turpis nulla, a euismod nisi
					sollicitudin eu. Aliquam elit neque, tristique nec venenatis ut,
					pharetra vitae enim. Fusce non urna in odio euismod finibus eget
					vel tortor. Quisque a purus ipsum. Donec ante nibh, porta eget
					magna non, pharetra sodales ante. Phasellus erat massa, venenatis
					et velit et, tincidunt finibus lorem. Lorem ipsum dolor sit amet,
					consectetur adipiscing elit. Cum sociis natoque penatibus et magnis
					dis parturient montes, nascetur ridiculus mus. Integer luctus
					facilisis bibendum. Integer in arcu pharetra tellus auctor bibendum
					sed sed turpis. Vestibulum imperdiet lacus lectus, vitae ultricies
					nisi eleifend et. Mauris rhoncus nec eros quis dictum. Proin
					sodales velit vel nisi bibendum tempor. Aenean tristique ipsum nec
					dictum vehicula.</p>

				<p>Nullam sed metus a dui auctor sodales quis nec tellus. Duis
					porttitor tortor pulvinar auctor mattis. Sed ultrices urna in augue
					venenatis tempus. Proin fringilla sodales eros. Ut aliquet odio nec
					sagittis dictum. Cras ullamcorper, neque ac imperdiet hendrerit,
					sapien nunc porta sapien, quis maximus nulla purus sit amet lectus.
					Mauris rhoncus lectus non vehicula lacinia. Suspendisse eu mollis
					ex, sit amet ultrices lorem. Cras elit risus, bibendum ut massa
					nec, commodo commodo augue.</p>

				<p>Sed lacinia, ligula id venenatis auctor, libero turpis
					aliquet nunc, sit amet ullamcorper dolor ligula quis felis. Vivamus
					condimentum mi vel felis vehicula, eu placerat lacus semper. Sed
					quis lacinia mauris. Donec aliquam vulputate metus, non imperdiet
					lorem maximus a. Integer eget dignissim erat. Proin id finibus dui,
					pretium consectetur turpis. Vivamus in tincidunt odio, eu iaculis
					nisi. Integer in scelerisque mauris. Vivamus ac eros congue, mattis
					nisl ac, venenatis lacus.</p>

				<p>Nunc viverra vestibulum tempor. Nulla consectetur sit amet
					mauris at rutrum. Mauris eu rhoncus eros. Integer convallis magna
					ac tincidunt laoreet. Proin molestie vitae erat id venenatis. Donec
					eu imperdiet risus. Fusce gravida placerat dui eget sollicitudin.
					Cras leo ligula, laoreet dapibus euismod ut, vehicula sit amet
					nunc. Maecenas in nisl fringilla, aliquet diam ut, facilisis ex. In
					dui risus, porttitor convallis ultricies nec, ornare eu leo.</p>

				</main>
			</div>
		</div>
	</div>
	
</body>
</html>