<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div id="div_top">

	<form id="datafrm" name="datafrm">
		<input name="userId" id="userId" type="hidden" value="<sec:authentication property="principal.userId"/>">
		<input name="userNm" id="userNm" type="hidden" value="<sec:authentication property="principal.nickname"/>">
		<input name="userImg" id="userImg" type="hidden" value="<sec:authentication property="principal.imgUrl"/>">
	</form>

	<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
		<!-- Sidebar Toggle (Topbar) -->
		<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>

		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">
			<a class="navbar-brand js-scroll-trigger" onclick="jacascript: gomain();">KAKAKACO RICH</a>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/">MAIN</a></li>
				<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/system/mylounge.co">MYLOUNGE</a></li>
				<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/system/Talklist.co">TALKING</a></li>
<!--				<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/system/sendSms.co">SENDSMS</a></li> -->
				<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/system/chartPage.co">CHART</a></li>
			</ul>

			<div class="topbar-divider d-none d-sm-block"></div>

			<li class="nav-item dropdown no-arrow">
				<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
					<span class="mr-2 d-none d-lg-inline text-gray-600 small"><strong style="font-size: 18px"><sec:authentication property="principal.nickname"/></strong>님 환영합니다.</span> 
					<img class="img-profile rounded-circle" src=<sec:authentication property="principal.imgUrl"/>>
				</a> <!--               Dropdown - User Information -->
				<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="/system/profile.co"> 
						<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
					</a>
					<div class="dropdown-divider"></div>
					<form action="/logout" method="post" id="frm" name="frm">
						<a class="dropdown-item" href="#" onclick="javascript: frm.submit();" data-toggle="modal" data-target="#logoutModal"> <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout</a>
						<sec:csrfInput />
					</form>
				</div>
			</li>
		</ul>
	</nav>
</div>
<script type="text/javascript">

	$(document).ready(function(){

	});

	function gomain(){
	   	$("#frm").attr("action", "/system/main.co");
		$("#frm").submit();
	   };



</script>

