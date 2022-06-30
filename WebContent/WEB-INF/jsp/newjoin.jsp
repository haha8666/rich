<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  <title>Make Rich!!</title>
  <link rel="icon" type="image/x-icon" href="/resources2/assets/img/head.ico" />

  <!-- Custom fonts for this template-->
  <link href="/resources3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources3/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<script type="text/javascript">

$(document).ready(function(){
	
});
	 
	function join(){
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		var joinId = $('#loginId').val();
		var joinPass = $('#passWord').val();
		var ReJoinPass = $('#RepassWord').val();
		var joinNm = $('#nickName').val();
		var phoneNum = $('#phoneNum').val();
		
		
		var newimg = "https://i.pinimg.com/originals/c0/bd/dc/c0bddc6ad3193e8e0cb137440ba550c8.gif";
		
		if(joinId == ""){
			alert('Enter Id Please~');
			return;
		}
		if(joinPass == ""){
			alert('Enter PassWord Please~');
			return;
		}
		if(joinNm == ""){
			alert('Enter Name Please~');
			return;
		}
		if(joinPass != ReJoinPass){
			alert('No Same your Password~');
			return;
		}
		if(joinPass.length < 6){
			alert('비밀번호 최소 6자리 입력!!');
			return;
		}
		if(phoneNum == ""){
			alert('휴대폰 번호를 입력하세요!!');
			return;
		}
		if(phoneNum.length != 13){
			alert('올바른 휴대폰 번호를 입력하세요!!');
			return;
		}
		
		
		
		$.ajax
		$.ajax({
	            type: 'post' 
	           ,data:{'joinId' : joinId, 'joinPass' : joinPass, 'joinNm' : joinNm,'imgUrl' : newimg, 'phoneNum': phoneNum}
	           ,url: '/login/joinSave.co'
	           ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	   				xhr.setRequestHeader(header, token);
	           }
	           ,dataType:'json' 
	           ,error: function(data, status, err){
	               alert('err');
	           }
	           ,success: function(jsonData){
	        	   	alert('Success in signing up as a member');
	        	    $("#joinfrm").attr("action", "/");
	       			$("#joinfrm").submit();
	           }
	       });
	   };
	   
	   
	   function inputPhoneNumber(obj) {

		    var number = obj.value.replace(/[^0-9]/g, "");
		    var phone = "";



		    if(number.length < 4) {
		        return number;
		    } else if(number.length < 7) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3);
		    } else if(number.length < 11) {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 3);
		        phone += "-";
		        phone += number.substr(6);
		    } else {
		        phone += number.substr(0, 3);
		        phone += "-";
		        phone += number.substr(3, 4);
		        phone += "-";
		        phone += number.substr(7);
		    }
		    obj.value = phone;
		}
	    

</script>
<body class="bg-gradient-primary">

  <div class="container my-555555">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div>
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
              <form class="user" id="joinfrm" name="joinfrm">
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="loginId" name="loginId" placeholder="Eenter Login ID..">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="nickName" name="nickName" placeholder="Eenter Login Nickname.. ">
                </div>
                <div class="form-group">
                  <input ttype="text" onKeyup="inputPhoneNumber(this);" maxlength="13" class="form-control form-control-user" id="phoneNum" name="phoneNum" placeholder="Eenter your Phone Number (ex : 010-0000-0000)">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="passWord" name="passWord" placeholder="Enter Password..">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="RepassWord" name="RepassWord" placeholder="Enter Repeat Password..">
                  </div>
                </div>
                <a href="javascript:join();" class="btn btn-primary btn-user btn-block">
                  Register Account
                </a>
                <hr>
                <a href="#" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="#" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="/login/login.co">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="/resources3/vendor/jquery/jquery.min.js"></script>
  <script src="/resources3/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources3/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources3/js/sb-admin-2.min.js"></script>

</body>

</html>