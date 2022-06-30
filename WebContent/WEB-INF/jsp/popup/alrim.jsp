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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>



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
  <!-- Custom fonts for this template-->
  <link href="/resources3/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="/resources3/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">  
			<br>
<%-- 			<sec:authentication property="principal.nickname"/> --%>
			<h1 class="popuptext1"> 알림 설정 POPUP</h1>
			<h1 class="popuptext1">종목명 : <label for="info1"></label></h1>
			  
			  	<span class="popuptext1">알림 금액 설정 : </span><label class="popuptext1" for="labelprice"></label><label class="popuptext1">원</label><br>
			  	<span class="popuptext1">기준점 : </span><label class="popuptext1" for="labelstd"></label>
			  	<br><br>
		  <form id="alrimfrm" name="alrimfrm">
			  <div>
			  	<span class="popuptext2">알림 금액 설정 : </span>
				  <input class="setprice1" id="alrimPrice" name="alrimPrice" type="text" value=""/>
				  <br>
				  <br>
				  <h3 class="popuptext2">기준점</h3>
				  <div class="custom-control custom-radio">
						<input type="radio" name="radio" id="jb-radio-1" class="custom-control-input" value="UP">
						<label class="custom-control-label" for="jb-radio-1">이상</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="radio" id="jb-radio-2" class="custom-control-input" value="DOWN">
						<label class="custom-control-label" for="jb-radio-2">이하</label>
					</div>
				  <br>
			  </div>
		  </form>
		  <br>
				  <a id="btnadd" class="btn btn-info" onclick="javascript:upDateinformation();">추가</a>
				  <a id="btndel" class="btn btn-info" onclick="javascript:DelAlrim();">삭제</a>
				  <a id="btnup" class="btn btn-info" onclick="javascript:upDateinformation();">수정</a>
				  <a id="btnsave" class="btn btn-info" onclick="javascript:SaveAlrim();">저장</a>
			  
	</div>
  <br><br>
  
</body>
<script type="text/javascript">


var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$.ajaxSetup({
	beforeSend : function(xhr) {
		xhr.setRequestHeader(header, token);
	} })

	
$(document).ready(function(){
	
// 	setDisabled();
// 	setAbled()
	getEqAlrimData();
	
});
// if($('#mode').val()=="NEW"){
// 	$('#jobSeCd').attr('abled','abled'); 
// 	$('#reAgreYnY').attr('abled','abled'); 
// 	$('#reAgreYnN').attr('abled','abled'); 
// }else if($('#mode').val()=="UPD"){
// 	$('#jobSeCd').attr('disabled','disabled');
// 	$('#reAgreYnY').attr('disabled','disabled');
// 	$('#reAgreYnN').attr('disabled','disabled');
// }
	

	var getUrlParameter = function getUrlParameter(sParam) { //get url 가져오기
	    var sPageURL = window.location.search.substring(1),
	        sURLVariables = sPageURL.split('&'),
	        sParameterName,
	        i;
	
	    for (i = 0; i < sURLVariables.length; i++) {
	        sParameterName = sURLVariables[i].split('=');
	
	        if (sParameterName[0] === sParam) {
	            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
	        }
	    }
	};
	

var data;

// 	function setDisabled(){	//처음 락 상태
// 		$("input:radio[name='radio']").attr('disabled',true);
// 		$('#alrimPrice').attr('disabled',true);
// 	}
	
// 	function setAbled(){	//수정으로 변경
// 		$("input:radio[name='radio']").attr('disabled',false);
// 		$('#alrimPrice').attr('disabled',false);
// 	}
	
	function getEqAlrimData(){ //종목 알림 정보 가져오기
			
			var eqNum = getUrlParameter('eqNum');
			var userId = getUrlParameter('userId');
		
			$.ajax({
		        type: 'post' 
		       ,data:{'eqNum' : eqNum, 'userId' : userId}/*$("#afrm").serialize()*/
		       ,url: '/rich/getEquitiesAlrim.co'
		    	   ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		   				xhr.setRequestHeader(header, token);
		           }
		       ,async: false
		       ,dataType:'json' 
		       ,error: function(data, status, err){
		           alert("err");
		       }
		       ,success: function(jsonData){
		   			data = jsonData.result;
		   			
		   			var a = data.eqNm;
		   			var b = data.alrimPrice;
// 		   			var bb = b+"원";
		   			var c = data.alrimStd;
		   			$("label[for = 'info1']").text(a);
		   			$('#alrimPrice').val(b);
		   			$("label[for = 'labelprice']").text(b);
		   			
		   			if(c=="UP"){
		   				$("input:radio[id='jb-radio-1']").prop('checked', true); 
		   				$("label[for = 'labelstd']").text("↑이상");
		   				$('#alrimfrm').hide();
		   				
		   				$('#btnadd').hide();
		   				$('#btnsave').show();
		   				$('#btndel').show();
		   				$('#btnup').show();
		   				
		   			}else if(c=="DOWN"){
		   				$("input:radio[id='jb-radio-2']").prop('checked', true); 
		   				$("label[for = 'labelstd']").text("↓이하");
		   				$('#alrimfrm').hide();
		   				
		   				$('#btnadd').hide();
		   				$('#btnsave').show();
		   				$('#btndel').show();
		   				$('#btnup').show();
		   				
		   				
		   			}else{
		   				$("input:radio[id='jb-radio-2']").prop('checked', false);
		   				$("input:radio[id='jb-radio-2']").prop('checked', false);
		   				$("label[for = 'labelstd']").text("설정안함");
		   				
		   				$('#alrimfrm').hide();
		   				
		   				$('#btnadd').show();
		   				$('#btnsave').show();
		   				$('#btndel').hide();
		   				$('#btnup').hide();
		   			}
		       }
		   });
			 
	}
	
	function SaveAlrim(){ //종목 알림 정보 저장 및 업데이트
			
			var eqNum = getUrlParameter('eqNum');
			var userId = getUrlParameter('userId');
			var alrimPrice = $('#alrimPrice').val();
			var alrimStd = alrimfrm.radio.value;
			
			if(alrimPrice==""){
				alert("알림 가격을 입력해주세요.");
				return false;
			}
			else if(alrimStd==""){
				alert("기준점을 선택해주세요.");
				return false;
			}
			else{
				
					var result = confirm("알림 설정을 저장하시겠습니까?");
					
					if(result){
						$.ajax({
					        type: 'post' 
					       ,data:{'eqNum' : eqNum, 'userId' : userId, 'alrimPrice' : alrimPrice ,'alrimStd':alrimStd}/*$("#afrm").serialize()*/
					       ,url: '/rich/setEquitiesAlrim.co'
					    	   ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
					   				xhr.setRequestHeader(header, token);
					           }
					       ,async: false
					       ,dataType:'json' 
					       ,error: function(data, status, err){
					           alert("err");
					       }
					       ,success: function(jsonData){
					           alert("알림 설정 완료");
					           self.close();
					           
					       }
					   });
					}
					else{
						return true;
					}
			
			}
			
			
			
	}
	
	
	function DelAlrim(){ //종목 알림 정보 삭제
		
		var eqNum = getUrlParameter('eqNum');
		var userId = getUrlParameter('userId');
		var alrimPrice = $('#alrimPrice').val();
		var alrimStd = alrimfrm.radio.value;
		
			
				var result = confirm("해당 종목 알림을 삭제 하시겠습니까?");
				
				if(result){
					$.ajax({
				        type: 'post' 
				       ,data:{'eqNum' : eqNum, 'userId' : userId}/*$("#afrm").serialize()*/
				       ,url: '/rich/delAlrimdata.co'
				    	   ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				   				xhr.setRequestHeader(header, token);
				           }
				       ,async: false
				       ,dataType:'json' 
				       ,error: function(data, status, err){
				           alert("err");
				       }
				       ,success: function(jsonData){
				           alert("알림 삭제완료");
				           self.close();
				           
				       }
				   });
				}
				else{
					return true;
				}
		
		
		
}
	
	
	function upDateinformation(){//종목 알림 정보 저장 및 업데이트
		
		
		$('#alrimfrm').show();
		
		
		
	} 
		
		
		

</script>
</html>
