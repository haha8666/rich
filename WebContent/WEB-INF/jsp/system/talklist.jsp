<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<br><br>
	
<form id="talkfrm" name="talkfrm">
	<div class="talk-list">
		<div class="talk-header">
			<div class="talk_up">
				<span class="font-weight-bold text-primary2 chatt">종목토론방</span>
				<a href="/system/profile.co"><img class="icon0" align="right" src="https://img.icons8.com/fluent-systems-regular/60/000000/settings.png"/></a>			
				<a href="/system/mylounge.co"><img class="icon9" align="right" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADcAAAA3CAYAAACo29JGAAAABmJLR0QA/wD/AP+gvaeTAAAEo0lEQVRoge3aa6gWRRgH8J+ek8p7NK3UvEDZTSm6SReSwi9hZAUWQTeCQAukqA8RBkVFEhUESUFBENUXsw9Gd0K6gacbmFhEkFJmNy21PHqsjNK3DzPrrsf3su95d99zDvSHYXZn93nm/+zMPDPzzDJy0I1erEXXEHMpHNNRjWl6HoHRpdIpFqPqXNfFSDKuZXSXpLcLc3AyTsCxGIce7M6kH/EFtpRBokjj5uAqLMB5mNCCbB/W4028qiBjc/XdBhiPG7EUZ9V4vh3f4Sf8jb1C61UEpzAL02rIrcfTWBnlYAZ+jtczsbUZucEaV8EdWIajMuUb8Zrgsj/Fzhy6puBcXIwzB3DahhXYYBDGDQaLhJZI3HIfnsTpZVSWwYxMnTPyCLQy5ibgGVwf7/vxeEx7WtBTDxM19t4TB1z/1eDdA4LDyoXZ+Er65VbLOZHmxCcZ3UWlj/JUPFdwDFX8ITiQorEpB9lW08ZmDuVsfIBJwgC+TJiXikaPMBc2wlShhWGe8MEb4ddGD2dKHcdmnNicY6lo2aHUQzc+jop24JS2qbWPWsbdLcyHLS0j74tK/sX8Agm2g1rGvR7vb8+rZBb2RaHlBRNsB7WMWx7v9+C4PEpWRoFNGFM8x0GjlnEVYR1axXPNFBwvdMUqri6H46BRz6FcG8v2aeJxH5W22nDb69Uzrgvfx/IHGinYHF+6sySC7aDRVHBvLP+6nvBpGeGhntNqYYywfdrscF8wW8p9Zi3hJdIuOVzRpX7ka6vA/+DyMDuuki3L5+XwKgT7Y6qFZKE8NynIGpd0xY0lkOoEfoj51KQga1yyX9rVMTrFYkfMpyQFWePGxXxfx+gUi2TDPCkpyBqX7FyP7BidYpH0vINRgaxxSXc8pmN0ikXCuy8pyBr3bczP6BidYpF4+4MOMWvcupifo/14ZqcxWjoFfFnrhWnCHFIVtvEjCecLvPfLBHmzLfcLPozX13WOVyG4JuafCXbUxFLhC+xyaJxwOKOC3+TYkY8XJsMq7i+fVyG4S+DbL8c0tizz8qxyebWNqYLrr+KhPAIVfBMF3jG8PecrAs9tWjgymy/1nA+Ww6tt3Cbdw13ZqvDDUfCAckLo7eBy/CPwe3YwCkZhlTR+uaQwau1hIf4UePVi7GAVVfCutAXvMbRj8CbhpLUqnFm0vQ4eKx24VbxVhNIW0SOcDSYc1uHoopR34xGh9apCvOLUopQ3waXSqFxVGCo9ZVS0UDqQF5RRQQYX4j2pUf24tcwKJ0iniFp/L7SLybhFWCNmDxLf0IEFxSXS0HUtL9WDl/AYbhD+Tqh33nCEEJS6Qlhd9EpD+Ul6DxcVR78xno+VrqnxbCzeHkAu2Yb8LmyGN8R8q7R7D0zb8ZTy/444BBUhPlHF4gHPJuN96Zy4RogO5zm77hOWecuFlVFhvxu28qvGYmHM7cbLmfJFeEI4IdqPm/FCfDYRJwlue5Kwau8XJuGdghfcYYgxXvh7pyosy7oEz7lW2gI7Y9mIwwqpEb2CIdmutVqbh/BDhXkO92KJx1yFC4aOWmM0Wyd24UVh3OwVPNkWIdbSa+SG3v/HsMZ/bPxkm3yHsyAAAAAASUVORK5CYII="></a>
				<img class="icon8" align="right" src="https://img.icons8.com/ios-glyphs/60/000000/search.png"/>
			</div>
		</div>
				
		<div class="talk kakao1" style="overflow-x:hidden">
<!-- 			<br> -->
			<c:forEach var="i" items="${InFo}">	
				<div class="listStyle1">
					<a href="/system/Talk.co?roomId=${i.eqNm}">
						<span class="rig"> &nbsp;${i.eqNm} 대화방</span>
					</a>
				</div>
<!-- 					<hr> -->
			</c:forEach>
			
		</div>
		<div class="talk-bottom">
			<div class="talk_down">
				<img class="icon10" align="left" src="https://img.icons8.com/pastel-glyph/60/000000/person-male.png"/>
				<img class="icon11" align="left" src="https://img.icons8.com/ios-glyphs/60/000000/filled-topic.png"/>
				<img class="icon12" align="right" src="https://img.icons8.com/ios/60/000000/hashtag.png"/>
				<img class="icon13" align="right" src="https://img.icons8.com/ios/60/000000/ellipsis.png"/>
			</div>
		</div>
	</div>
</form>

<br><br>

<script type="text/javascript">

	function gotalk(e){
		var roomid = e.id;
		$("#talkfrm").attr("action", "/system/Talk.co?roomId="+roomid);
	  	$("#talkfrm").submit();
	}

	

</script>