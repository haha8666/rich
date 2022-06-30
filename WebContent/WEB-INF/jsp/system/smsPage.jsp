<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="card-body p-0">
    <!-- Nested Row within Card Body -->
    <div class="row">
      <div class="col-lg-7">
        <div class="p-5">
          <div class="text-center">
            <h1 class="h4 text-gray-900 mb-4">Send SMS</h1>
          </div>
          <form class="user" id="smsForm" name="smsForm">
            <div class="form-group">
            <li>보낼사람 :</li>
              <input type="text" class="form-control form-control-user" id="from" name="from" placeholder=" 전화번호 입력 ( '-' 포함 )">
            </div>
             <li>메시지 내용 :</li>
            <div class="form-group">
              <textarea class="form-control form-control-user" name="text" id="text" placeholder=" 보낼 내용 입력 "></textarea>
            </div>
			<div>
			<button onclick="sendSMS('sendSms')" >전송하기</button>
          </div>
          </form>
        </div>
      </div>
    </div>
  </div>

<script type="text/javascript">



	/**
	 * SMS전송
	 */
    function sendSMS(pageName){
    	
    	var from = $('#from').val();
    	var text = $('#text').val();
    	
    	if(from == ""){
			alert('전화번호를 입력해주세요.');
			return;
		}
    	if(from.length != 13){
			alert('유효한 전화번호를 입력해주세요');
			document.smsForm.from.value = "";
			return;
		}
		if(text == ""){
			alert('보낼 내용을 입력해주세요.');
			return;
		}
    	if(text.length > 50){
    		alert('메시지 크기는 60byte를 넘을 수 없습니다.');
    		document.smsForm.text.value = "";
    		return;
    	}
    	else{
    		
    		$.ajax({
	            type: 'post' 
	           ,data:{'from' : from, 'text' : text}
	           ,url: '/sendSms.do'
	           ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	   				xhr.setRequestHeader(header, token);
	           }
	           ,dataType:'json' 
	           
	       });
    	 
        $("#smsForm").attr("action","/"); //위에 있는 폼태그를 컨트롤러로 전송한다.
        $("#smsForm").submit();
    	
    	}
    	
    	
    }
    
    
//     /**
// 	 * 벨리데이션 체크
// 	 */
//     function checkValidate(){
    	
//     	var from = $('#from').val();
//     	var text = $('#text').val();
    	
//     	if(from == ""){
// 			alert('전화번호를 입력해주세요.');
// 			return;
// 		}
//     	if(from.length != 13){
// 			alert('유효한 전화번호를 입력해주세요');
// 			document.smsForm.from.value = "";
// 			return;
// 		}
// 		if(text == ""){
// 			alert('보낼 내용을 입력해주세요.');
// 			return;
// 		}
//     	if(text.length > 50){
//     		alert('메시지 크기는 60byte를 넘을 수 없습니다.');
//     		document.smsForm.text.value = "";
//     		return;
//     	}
    	
    	
//     }
    
</script>
    