<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

	<br><br>
	
	<input id="todate" name="todate" type="hidden" value="${today}">

	<img class="img-profile rounded-circle1" src=<sec:authentication property="principal.imgUrl"/>>
	<div class="mydnlcl">
		<span class="mypont1"><sec:authentication property="principal.nickname"/>님의</span>
		<span class="mypontM"> M</span>
		<span class="mypontY"> Y</span>
		<span class="mypontL"> L</span>
		<span class="mypontO"> O</span>
		<span class="mypontU"> U</span>
		<span class="mypontN"> N</span>
		<span class="mypontG"> G</span>
		<span class="mypontE"> E</span>
	</div>
<!-- 	<hr class="hr1" color="#d9ffad"><br> -->
	<span class="mypont2">관심 종목 추가</span>
	<hr class="hr1" color="#d9ffad">
	
	<input class="form-control1 mr-sm-2" id="serchId1" name="serchId1" type="text" placeholder="Search" aria-label="Search" onKeyDown="pressEnter()">
	
	<button type="button" class="btn btn-outline-primary" id="zzzBtn" onclick="javascript:serch();">
		<svg class="svg11" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"></path>
			<path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"></path>
		</svg>
    </button>
<!-- 	  <img src="data:image/png;base64,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"> -->
    <br><br>
    
    <div id="addform" name="addform">
	<!-- 관심 종목 검색 리스트 출력 되는 곳 -->
    </div>
    <br><br><br>
    <span class="mypont2">나의 관심 종목</span>
    <hr class="hr1" color="#d9ffad">

	<form id="userform" name="userform">
		<div class="grid1 overflow-auto scroll-test">
			 <c:forEach var="user" items="${userInFo}">
				<div class="container">
					<div class="row row-cols-2">
						<div class="col">
							<div class="shadow1">
								<label class="span1">종목명 : ${user.eqNm}(${user.eqId})</label><br>
								<label class="span2">가격 : ￦<fmt:formatNumber value="${user.eqVal}" pattern="###,###,###" /></label><br>
								<c:if test="${user.upDown eq '+'}">
									<label class="span3red">변동률 : ${user.upDown}${user.bfChg} (${user.upDown}${user.bfPer})</label><br>
								</c:if>
								<c:if test="${user.upDown eq '-'}">
									<label class="span3blue">변동률 : ${user.upDown}${user.bfChg} (${user.upDown}${user.bfPer})</label><br>
								</c:if>
								<c:if test="${user.upDown == null}">
									<label class="span3white">변동률 : ${user.upDown}${user.bfChg} (${user.upDown}${user.bfPer})</label><br>
								</c:if>
								<label class="span4">기준 : ${fn:substring(user.reTime,0,19)}</label>
							</div>
						</div>
						<div class="col">
							<div class="row row-cols-3">
								<div class="col">
									<div>
										<button type="button" class="buttomm2" data-toggle="modal" data-target="#exampleModal" onclick="javascript:colAlrimPopup(this)" value="${user.eqId}">알림 설정</button>
									</div>
								</div>
								<div class="col">			
									<div >
										<button type="button" class="buttomm" onclick="javascript:delData(this);" value="${user.eqId}">삭제</button>
									</div>
								</div>
								<div class="col">									
									<div>
										<button type="button" class="buttomm1" onclick="javascript:void(window.open('${user.eqUrl}', '_blank','width=720, height=620'))">상세 정보 보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><hr class="hr2">
			 </c:forEach>
		</div>
	</form>
	<br><br><br><br>
	
	<span class="mypont2">관심 종목 현황</span>
    <hr class="hr1" color="#d9ffad">
	<table class="table">
		<thead>
			<tr>
				<th scope="col" style="font-size : 2rem; color: #cbb1de; text-align : letter-spacing;">종목이름</th>
				<th scope="col" style="font-size : 2rem; color: #cbb1de; text-align : letter-spacing;">ID</th>
				<th scope="col" style="font-size : 2rem; color: #cbb1de; text-align : letter-spacing;">가격</th>
				<th scope="col" style="font-size : 2rem; color: #cbb1de; text-align : letter-spacing;">변동률</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach var="aa" items="${userInFo}">
				<tr>
					<th scope="row">${aa.eqNm}</th>
					<td>${aa.eqId}</td>
					<td>￦<fmt:formatNumber value="${aa.eqVal}" pattern="###,###,###" /></td>
					<td>${aa.upDown}${aa.bfChg} (${aa.upDown}${aa.bfPer})</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br><br>

<!-- <div id="loading"><img id="loading-image" src="/resources3/img/91.gif" alt="Loading..." /></div> -->
<div id="loading"><img id="loading-image" src="https://devtalk.kakao.com/uploads/default/original/2X/8/8d3426581b592b46157de64b919d4378b504d346.gif" alt="Loading..." /></div>




<!-- 	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"> -->
<!--   	MODAT1 -->
<!-- 	</button> -->
	<!-- --------------------------------- modal 모음 시작 ------------------------------->
	<!-- Modal1 -->
<!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         불라불라 머라구 쿵 불라불라불라불라  -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" id="closeBtn" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<!--         <button type="button" id="saveBtn" class="btn btn-primary">Save changes</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->

<!-- --------------------------------- modal 모음 끝 ------------------------------->


<!-- <div id="map" style="width:1000px; height:500px;"></div> -->


<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33543171dd1f0cfb66b7fddeaed5d2ff&libraries=services"></script> -->
				
<!-- 				3. 실행 스크립트 -->
 				<script charset="UTF-8">
				
				/*var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
	
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
	
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('충청남도 태안군 원북면 옥파로 16', function(result, status) {
	
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
	
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
	
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">ㅋㅋㅋㅋ</div>'
				        });
				        infowindow.open(map, marker);
	
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				}); */
				
			</script>




<script type="text/javascript">


	$(document).ready(function(){
		$('#loading').hide(); //첫 화면 진입시 로딩바 숨김 처리
	});
	
	var list;
	var url;
	function serch(){
		$('#loading').show();
		var serchId = $('#serchId1').val();
		 $.ajax({
	            type: 'post' 
	           ,data:{'serchId' : serchId}/*$("#afrm").serialize()*/
	           ,url: '/rich/serch.co'
	        	   ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		   				xhr.setRequestHeader(header, token);
		           }
	           ,dataType:'json' 
	           ,error: function(data, status, err){
	               alert("err");
	               $('#loading').hide();
	           }
	           ,success: function(jsonData){
        	   		$('#loading').hide();
	        	   	list = jsonData;
					url = jsonData.url;
	        	   	for(var i = 0; i< list.size; i++){
	        	   		console.log(list[i]);
	        	   		$('#addform').append("<div class='alert alert-info' role='alert'><a id=down"
	        	   				+i+" onclick='javascript:popopo(this);'>"+list[i]+"</a></div>");
	        	   		}
	           }
	       });
	}
	
	
	
	function popopo(e){
		
		 var Btnid = e.id;
		 var SerchNm = $('#'+Btnid).text();
		 var userId = $('#userId').val();
		 
		 var result = confirm(SerchNm+'을(를) 관심종목에 추가하시겠습니까?');
		 if(result){
			 $('#loading').show();
	// 		 alert('반 성공'+ SerchNm);
			 var number = Btnid.substring(4);
			 $.ajax({
		            type: 'post' 
		           ,data:{'SerchNm' : SerchNm, 'url' : url, 'userId' : userId, 'number' : number}/*$("#afrm").serialize()*/
		           ,url: '/rich/equtitesDataSave.co'
		        	   ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			   				xhr.setRequestHeader(header, token);
			           }
		           ,dataType:'json' 
		           ,error: function(data, status, err){
		               alert("err");
		               $('#loading').hide();
		           }
		           ,success: function(jsonData){
		       			$('#loading').hide();
		       			alert("추가되었습니다.");
		         		$("#userform").attr("action", "/system/mylounge.co");
		              	$("#userform").submit();
		           }
		       });
		 }
		 else{
			return false;
		 }
		 
		}
	
	function delData(e){
	
		var eqId = e.value;
		var userId = $('#userId').val();
		var result = confirm(eqId+'을(를) 관심종목에서 삭제하시겠습니까?');
		
		if(result){
			 $('#loading').show();
			 $.ajax({
		            type: 'post' 
		           ,data:{'eqNum' : eqId, 'userId' : userId}/*$("#afrm").serialize()*/
		           ,url: '/rich/delData.co'
		        	   ,beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			   				xhr.setRequestHeader(header, token);
			           }
		           ,dataType:'json' 
		           ,error: function(data, status, err){
		               alert("err");
		               $('#loading').hide();
		           }
		           ,success: function(jsonData){
		       			$('#loading').hide();
		       			alert("삭제되었습니다.");
		         		$("#userform").attr("action", "/system/mylounge.co");
		              	$("#userform").submit();
		           }
		       });
			
		}else{
			return true;
		}
		 
		}
	
	function pressEnter(){   //enter key 이벤트
        if(event.keyCode == 13){
            serch();
        }
    }
	
	
	
	
	function colAlrimPopup(e){  //알림 팝업 호출
		
		var userId = $('#userId').val();
		var eqId = e.value;
	
		var popWidth = 500, popHeight = 500;          //팝업 창 사이즈
		var mtWidth = window.outerWidth;               //윈도우width
		var mtHeight = window.outerHeight;       //윈도우height
		var scX = window.screenLeft; //현재 브라우저의 x 좌표(모니터 두 대를 합한 총 위치 기준)
		var scY = window.screenTop; //현재 브라우저의 y 좌표(모니터 두 대를 합한 총 위치 기준)
		var popX = scX + (mtWidth - popWidth) / 2 - 50; //팝업 창을 띄울 x 위치 지정(모니터 두 대를 합한 총 위치 기준)
		var popY = scY + (mtHeight - popHeight) / 2 - 50; //팝업 창을 띄울 y 위치 지정(모니터 두 대를 합한 총 위치 기준)
		 
		window.open('/popup/alrimPopup.co?eqNum=' +eqId+'&userId='+userId , +'_blank',' width=' + popWidth + ', height=' + popHeight + ', left=' + popX + ', top=' + popY);


// 		var result = confirm(eqId+'를 관심종목에서 삭제하시겠습니까?');
		
// 		if(result){
			
			
// 		}else{
// 			return true;
// 		}
		 
		}
	

    
</script>
    