<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$(document).ready(function() {
		  $('#inputMessage').focus();
		  
	});

</script>

<br><br>

<%-- <c:set var="title" value="${getUrlParameter('roomId')}"/> --%>

<div id="chat" >
	<div id="main-container">
		
		<div id="top-container">
			<a href="/system/Talklist.co">
				<img class="icon14" src="https://img.icons8.com/fluent-systems-filled/48/000000/left.png">
			</a>
			<input id="talkNm" name="talkNm" class="input1" value="" readonly>
			<img class="icon15" align="right" src="https://img.icons8.com/material-rounded/48/000000/menu.png">
			<img class="icon16" align="right" src="https://img.icons8.com/fluent-systems-filled/48/000000/search.png">
		</div>
		<div id="chat-container" class="kakao1">

		</div>
		<div id="bottom-container">
			<img class="" id="plus" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAACJUlEQVRoge2Zz2rUUBTGv3tytR1mESgyBQtu3Cm6F1zpO4i49AFmITiLEOFAbzYWspiHsNVncO0DKLrRVaku/FOYRWJHL3NdJIVMks5kKMnt1PuDbHLOvfm+c0Iu4QAOx7kQi4Lj8XgjSZKdrsTU0e/3vw6Hw+lZ8VoDzDzwPG9PCPEIwGZr6prxG8AbInoeBMGPcrBigJkHUsp3AG4COBFCfDDGTDoQWkEI4Rtj7iAr4het9T1m/lnMkeVFnuftIRP/loie1Lnukryg+wAeSClfAnhajM91II7jXpqmxwBARDdsiz8lN3EIYKa13mLmk9MYFROn0+kOsnZ9uijiAYCZvwP4CKDned7cR2XOgNb6CgAYY5Lu5DWjoOlq8T7V5K4VzsAilFK7SqndNp/Rdgee5VdruFfINs6AbZwB2zgDtll7A5UfmmUopUI0P117+ZrjhvlxGIZqFT3/XwfyCjWqklIqyddsrfqcpqx9B5wB2zgDtnEGbOMM2Gblk3hF4pb3b9dAGIYv2twfuASv0OUyIKX8CwBCiL4dOWdT0PSneL88HzhCNpO6xcyDjrQtJYqibQC3AaS+7x8VY3MG8snHawCbUspXF8FEFEXbxph9ABsADsoTy8pXiIhGs9nsPoCHUsrDKIreWx7y3UUm/jMRjSo5dQuZ+Vo+UHuM/L/WIimAAyIaBUHwqxxcOuieTCbXpZQL89pCa2183/+2aNDtcJyTf837oRLahVGhAAAAAElFTkSuQmCC">
			<input id="inputMessage" type="text">
			<img class="icon5" id="btn-submit" src="data:image/png;base64,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">
		</div>
	</div>
</div>
<br><br>

<script type="text/javascript">

	var getUrlParameter = function getUrlParameter(sParam) {
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
	

	
	
// var textarea = document.getElementById("messageWindow");
// var webSocket = new WebSocket('ws://ec2-13-125-250-66.ap-northeast-2.compute.amazonaws.com:8080/DevEricServers/webChatServer');

// 로컬에서 테스트할 때 사용하는 URL입니다.
// 	var webSocket = new WebSocket('ws://localhost/system/Talk.co');
	
	
	
// var inputMessage = document.getElementById('inputMessage');

// webSocket.onerror = function(e){
// 	onError(e);
// };
// webSocket.onopen = function(e){
// 	onOpen(e);
// };
// webSocket.onmessage = function(e){
// 	onMessage(e);
// };


// function onMessage(e){
// 	var chatMsg = event.data;
// 	var date = new Date();
// 	var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
// 	if(chatMsg.substring(0,6) == 'server'){
// 		var $chat = $("<div class='chat notice'>" + chatMsg + "</div>");
// 		$('#chat-container').append($chat);
// 	}else{
// 		var $chat = $("<div class='chat-box'><div class='chat'>" + chatMsg + "</div><div class='chat-info chat-box'>"+ dateInfo +"</div></div>");
// 		$('#chat-container').append($chat);
// 	}
	
	
// 	$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
// }
	
	
	var sock = new SockJS("/websockethandler");
	var client = Stomp.over(sock); // 1. SockJS를 내부에 들고 있는 client를 내어준다.

	
		
	var roomId = getUrlParameter('roomId');
	
	$('#talkNm').val(roomId);   
	
	// var roomId = "달찐이이이"+getUrlParameter('roomId');
	var writer = $('#userNm').val();
	var userImg = $('#userImg').val();
	
	
	client.connect({}, function() {
		
		client.send('/publish/chat/join', {}, JSON.stringify({
		chatRoomId : roomId,
		writer : writer }));

		// 4. subscribe(path, callback)로 메시지를 받을 수 있다. callback 첫번째 파라미터의 body로 메시지의 내용이 들어온다.
		client.subscribe('/subscribe/chat/room/' + roomId, function(chat) {
			
			
			var content = JSON.parse(chat.body);
			var conmes = content.message;
			var join = conmes.substring(conmes.indexOf(" "),conmes.indexOf(" ")+8);
			
			if(content.writer == writer){
				return false;
			}
			else if(join==" 입장하셨습니다"){
				console.log("입장입장입장입장입장입장입장입장입장입장입장입장입장입장입장입장입장입장입장입장");
				var $chat = $("<div class='chat notice'>" + content.message + "</div>");
		 		$('#chat-container').append($chat);
		 		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
			}
			else{
					var date = new Date();
					var dateInfo = date.getHours() + ":" + date.getMinutes();
					var $chat = $("<div class='chat-box'><div><img class='img-fluid22' src=" + content.imgUrl + "><div class='chat'>" + content.message 
							+ "</div></div><div class='chat-info chat-box'>"+ content.writer + "_" +dateInfo +"</div></div>");
					$('#chat-container').append($chat);
					$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
			}
			
		});
	
		
	});
	function send(){
		var chatMsg = inputMessage.value;
		if(chatMsg == ''){
			return;
		}
		var date = new Date();
		var dateInfo = date.getHours() + ":" + date.getMinutes();
		var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + 
				chatMsg + "</div><div class='chat-info'>"+ writer + "_" +dateInfo +"</div></div>");
		$('#chat-container').append($chat);
	// 	webSocket.send(chatMsg);
	
		client.send('/publish/chat/message', {}
			,JSON.stringify({
				 chatRoomId: roomId
				,message: chatMsg
				,writer: writer
				,imgUrl: userImg }));
	
		inputMessage.value = "";
		$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight+20);
	}
	

	$(function(){
		$('#inputMessage').keydown(function(key){
			if(key.keyCode == 13){
// 				$('#inputMessage').focus();
				send();
			}
		});
		$('#btn-submit').click(function(){
			send();
		});
		
		
	});
	
	

</script>