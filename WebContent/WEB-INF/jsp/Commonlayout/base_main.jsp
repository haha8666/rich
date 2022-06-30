<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<sec:csrfMetaTags />
<title>Equities Project</title>
<style>
#div_bottom {
	width: 100%;
	height: 100px;
	text-align: center;
	background-color: #ffffff;
	clear: both;
}
</style>
<meta charset="utf-8" />
<%-- <meta name="_csrf" content="${_csrf.token}"/> --%>
<%-- <meta name="_csrf_header" content="${_csrf.headerName}"/> --%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Make Rich!!</title>

<script src="/resources3/js/sockjs.js"></script>
<script src="/resources3/js/stomp.min.js"></script>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<!-- Favicon-->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link rel="icon" type="image/x-icon" href="/resources2/assets/img/head.ico" />
<!-- Font Awesome icons (free version)-->
<link href="/resources3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


<!-- --------------------------------------폰트 추가 추가 추가 시작-------------------------------------->
<!-- ------------------------------------------------------------------------------------------->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Hi+Melody&display=swap" rel="stylesheet">

	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">

	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">



<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dokdo&family=Fugaz+One&family=Gugi&family=Hi+Melody&family=Indie+Flower&family=Jua&family=Nerko+One&family=Press+Start+2P&family=Sigmar+One&family=Single+Day&display=swap"
	rel="stylesheet">
<!-- ------------------------------------------폰트 추가 추가 추가 끝-------------------------------------->
<!-- ------------------------------------------------------------------------------------------->




<!-- Custom styles for this template-->
<link href="/resources3/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
button {
	background: #aff6fe;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 2.4em;
	padding: 0px 0.5em;
	cursor: pointer;
	transition: 800ms ease all;
	border-radius: 3rem;
	font-family : 'Nanum Pen Script';
	/* 	outline: none; */
}



button:hover {
	background: #fff;
	color: #aff6fe;
}

button:before, button:after {
	content: '';
	position: unset;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #aff6fe;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.intro {
	width: 100%;
	height: 30px;
}

.intro h1 {
	font-family: 'Oswald', sans-serif;
	letter-spacing: 2px;
	font-weight: normal;
	font-size: 14px;
	color: #222;
	text-align: center;
	margin-top: 10px;
}

.intro a {
	color: #e74c3c;
	font-weight: bold;
	letter-spacing: 0;
}

.intro img {
	width: 20px;
	heght: 20px;
	margin-left: 5px;
	margin-right: 5px;
	position: relative;
	top: 5px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.button-8 {
	width: 140px;
	height: 50px;
	border: 2px solid #34495e;
	float: left;
	text-align: center;
	cursor: pointer;
	position: relative;
	box-sizing: border-box;
	overflow: hidden;
	margin: 20px 20px 20px 20px;
}

.button-8 a {
	font-family: arial;
	font-size: 16px;
	color: #fff;
	text-decoration: none;
	line-height: 50px;
	transition: all .5s ease;
	z-index: 2;
	position: relative;
}

.eff-8 {
	width: 140px;
	height: 50px;
	border: 70px solid #34495e;
	position: absolute;
	transition: all .5s ease;
	z-index: 1;
	box-sizing: border-box;
}

.button-8:hover .eff-8 {
	border: 0px solid #34495e;
}

.button-8:hover a {
	color: #34495e;
}

#div_index {
	width: 1200px;
	height: 90vh;
	float: left;
	text-align: center;
	position: absolute;
	left: 280px;
	top: 140px
}
</style>
<style>
#div_top {
	width: 100%;
	height: 100px;
	text-align: center;
	background-color: #000000;
}

.bg-gradient-primary {
	background-color: #4e73df;
	background-image: linear-gradient(180deg, #fffef3 10%, #abf6ff 100%);
	background-size: cover
}

<!--
========================
메시지
 
톡
  
관련
 
스타일
 
정의
 
시작
========================
 
-->
<!--
========================
메시지
 
톡
  
관련
 
스타일
 
정의
 
시작
========================
 
-->
}
#messageWindow {
	background: black;
	color: greenyellow;
}

#inputMessage {
	width: 450px;
	height: 60px;
	border:none;
	outline:none;
}

.input1 {
	width: 300px;
	height: 60px;
	border:none;
	outline:none;
	background-color:#ccf9fa;
	font-family: 'Gugi';
	font-size: 2rem;
	font-weight: 600;
	position: relative;
    top: 8px;
    left: 16px;
}

#btn-submit {
	width: 60px;
	height: 60px;
	border: none;
	left:8px;
	top:-1px;
}

#top-container {
	height: 80px;
	margin: auto;
	background-color: #ccf9fa;
}

#main-container {
	width: 586px;
	height: 750px;
/*   	border: 6px solid #85ecf9;   */
  	border: 6px solid #000000;  
	margin: auto;
	background-image: linear-gradient(180deg, #fffef3 10%, #abf6ff 100%);
}

#chat-container {
	vertical-align: bottom;
	height: 600px;
	overflow: scroll;
	overflow-x: hidden;
	background-image: url("https://i.pinimg.com/originals/21/94/82/219482b14912615ad3e0336ec4f9f1ee.jpg");
	background-size: 36rem 38rem;
	border-bottom : 3px solid #000000;
	border-top : 3px solid #000000;
}

#bottom-container {
/* 	margin: 10px; */
	vertical-align: bottom;
	height: 60px;
	padding:0px;
	background-color: #ffffff;
}

.chat {
	font-size: 20px;
	color: black;
	margin: 5px;
	min-height: 20px;
	padding: 5px;
	min-width: 50px;
	text-align: left;
	height: auto;
	word-break: break-all;
	background: #ffffff;
	width: auto;
	font-weight: 700;
	display: inline-block;
	border-radius: 10px 10px 10px 10px;
}

.notice {
	color: #000000;
	font-weight: bold;
	border: none;
	text-align: center;
	background-color: #ffffff;
	display: block;
}

.my-chat {
	text-align: right;
	background: #F7E600;
	border-radius: 10px 10px 10px 10px;
}

.chat-info {
	color: #c922ff;
	font-size: 10px;
	text-align: right;
	padding: 10px;
	padding-top: 0px;
	font-weight: bold;
}

.chat-box {
	text-align: left;
}

.my-chat-box {
	text-align: right;
}
<!--
========================
메시지
 
톡
 
관련
 
스타일
 
정의
 
끝
========================
 
-->
<!--
========================
메시지
 
톡
 
관련
 
스타일
 
정의
 
끝
========================
 
-->
</style>
<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajaxSetup({
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		} })
</script>


<!-- 	<script src="/resources3/vendor/jquery/jquery.min.js"></script> -->
<!--   <script src="/resources3/vendor/jquery-easing/jquery.easing.min.js"></script> -->
<!--   <script src="/resources3/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
<!--   <script src="/resources3/js/sb-admin-2.min.js"></script> -->
<!--   <script src="/resources3/vendor/chart.js/Chart.min.js"></script> -->
<!--   <script src="/resources3/js/demo/chart-area-demo.js"></script> -->
<!--   <script src="/resources3/js/demo/chart-pie-demo.js"></script>	 -->





</head>
<body>
	<div>
		<tiles:insertAttribute name="topMenu" />
	</div>
	<div class="bg-gradient-primary">
		<div class="container">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	<div>
		<tiles:insertAttribute name="hadanPage" />
	</div>







	<script src="/resources3/vendor/jquery/jquery.min.js"></script>
	<script src="/resources3/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="/resources3/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources3/js/sb-admin-2.min.js"></script>
	
	
	<!-- 	<script src="/resources3/vendor/chart.js/Chart.min.js"></script> -->
	<!-- 	<script src="/resources3/js/demo/chart-area-demo.js"></script> -->
	<!-- 	<script src="/resources3/js/demo/chart-pie-demo.js"></script> -->


</body>
</html>