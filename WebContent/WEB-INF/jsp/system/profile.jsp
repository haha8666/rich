<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
  <div class="card-body p-0">
    <!-- Nested Row within Card Body -->
    <div class="row">
      <div class="col-lg-7">
        <div class="p-5">
          <div class="text-center">
            <h1 class="textsytle1">USER PROFILE</h1>
          </div>
          <form class="user" id="potofrm" name="potofrm">
            <div class="form-group">
              <input type="email" class="textsize1 form-control form-control-user " id="loginId" name="loginId" value="${loginId}" placeholder="Eenter Login ID..">
            </div>
            <div class="form-group">
              <input type="email" class="form-control form-control-user" id="nickName" name="nickName" value="${nickName}" placeholder="Eenter Login Nickname.. ">
            </div>
            <div class="form-group row">
              <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="password" class="form-control form-control-user" id="passWord" name="passWord" value="${passWord}" placeholder="Enter Password..">
              </div>
              <div class="col-sm-6">
                <input type="password" class="form-control form-control-user" id="RepassWord" name="RepassWord" placeholder="Enter Repeat Password..">
              </div>
            </div><br><br>
            
<!-- &nbsp; -작은,&ensp; -보통 , &emsp;  -큰  -->

		<div class="center">
					<button type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Change character
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="">
                      <img id="poto1" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/c0/bd/dc/c0bddc6ad3193e8e0cb137440ba550c8.gif">
                      <img id="poto2" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/06/e5/61/06e5619ff26ad3a9973602f4d6b77c87.gif">
                      <img id="poto3" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/6a/29/b3/6a29b31ebfc4e7db0e3df53f9ff5cf6c.gif">
                      <img id="poto4" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/19/91/ef/1991efd2ae388fc13b247874339c58d8.gif">
                      <img id="poto5" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/eb/ed/9b/ebed9b2432e54e75b74ad4c3fddee337.gif">
                      <img id="poto6" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/d5/5a/d1/d55ad13cbe94c275873d554b1a4c8c6d.gif">
                      <img id="poto7" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/74/5e/f4/745ef4f0154176a06eedd0838a1b34f2.gif">
                      <img id="poto8" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/ba/cc/20/bacc2027252bae9efaaafaf80c125adb.gif">
                      <img id="poto9" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/f5/c5/e6/f5c5e62bb51c0c068f87df90ed263b73.gif">
                      <img id="poto10" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/c8/6b/46/c86b46f9abeb9d959cfbdc4124af9b52.gif">
                      <img id="poto11" onclick="javascript:poto(this);" class="poto" src="https://i.pinimg.com/originals/40/d6/c4/40d6c4a42257e8fcd55268a3a7cb4bac.gif">
                      <img id="poto12" onclick="javascript:poto(this);" class="poto" src="https://item.kakaocdn.net/do/36e509cee3c0d3e6284e26f4df760bcaf43ad912ad8dd55b04db6a64cddaf76d">
                 </div>
      </div><br><br>
<!--             <a href="javascript:profile();" class="buttonsttle2"> -->
            <a href="javascript:profile();" class="btn btn-primary btn-user btn-block">
              Change Profile
            </a>
          </form>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">

 
 function poto(e){
	 
	 var userId = $('#userId').val();
	 var imgid = e.id;
	 var src;
	 switch(imgid){
		 case "poto1" : src = $('#poto1').attr("src"); break;
		 case "poto2" : src = $('#poto2').attr("src"); break;
		 case "poto3" : src = $('#poto3').attr("src"); break;
		 case "poto4" : src = $('#poto4').attr("src"); break;
		 case "poto5" : src = $('#poto5').attr("src"); break;
		 case "poto6" : src = $('#poto6').attr("src"); break;
		 case "poto7" : src = $('#poto7').attr("src"); break;
		 case "poto8" : src = $('#poto8').attr("src"); break;
		 case "poto9" : src = $('#poto9').attr("src"); break;
		 case "poto10" : src = $('#poto10').attr("src"); break;
		 case "poto11" : src = $('#poto11').attr("src"); break;
		 case "poto12" : src = $('#poto12').attr("src"); break;
	 }
	 
	 var result = confirm(imgid+'로 프로필 이미지를 바꾸시겠습니까?');
	 if(result){
		 
		 $.ajax({
	            type: 'post' 
	           ,data:{'userId' : userId, 'imgUrl' : src}
	           ,url: '/login/profileImgSave.co'
	           ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	   				xhr.setRequestHeader(header, token);
	           }
	           ,dataType:'json' 
	           ,error: function(data, status, err){
	               alert('err');
	           }
	           ,success: function(jsonData){
	        	   	alert('로그인을 다시 하여야 적용됩니다. 로그인 화면으로 이동합니다.');
	        	   	$("#frm").attr("action", "/logout");
	        		$("#frm").submit();
	        	    
	           }
	       });
	 }
	 else{
		 alert('fail');
	 }
	 
 }
 
 function profile(){
	 
	 var userId = $('#userId').val();
	 var loginId = $('#loginId').val();
	 var password = $('#passWord').val();
	 var Repassword = $('#RepassWord').val();
	 var nickName = $('#nickName').val();
	 
	 if(loginId == ""){
			alert('Enter Id Please~');
			return;
		}
		if(password == ""){
			alert('Enter PassWord Please~');
			return;
		}
		if(nickName == ""){
			alert('Enter Name Please~');
			return;
		}
		if(password != Repassword){
			alert('No Same your Password~');
			return;
		}
		if(password.length < 6){
			alert('비밀번호 최소 6자리 입력!!');
			return;
		}
	 
	 var result = confirm('프로필 내용을 바꾸시겠습니까?'); 
	 
	 if(result){
		 
		 $.ajax({
	            type: 'post' 
	           ,data:{'userId' : userId, 'loginId' : loginId, 'password' : password,'nickName' : nickName,}
	           ,url: '/login/profileSave.co'
	           ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	   				xhr.setRequestHeader(header, token);
	           }
	           ,dataType:'json' 
	           ,error: function(data, status, err){
	               alert('err');
	           }
	           ,success: function(jsonData){
	        	   	alert('로그인을 다시 하여야 적용됩니다. 로그인 화면으로 이동합니다.');
	        	   	$("#frm").attr("action", "/logout");
	        		$("#frm").submit();
	        	    
	           }
	       });
	 }
	 
 }
 




</script>

