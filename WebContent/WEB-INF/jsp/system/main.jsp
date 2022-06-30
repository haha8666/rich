<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

	$(document).ready(function(){
		$('#addTalk1').hide();
		$('#addTalk2').hide();
		$('#addTalk3').hide();
		$('#hash').hide();
	});
	function show(){
		$('#addTalk1').show();
		$('#addTalk2').show();
		$('#addTalk3').show();
		$('#send').hide();
		$('#info').hide();
		$('#hash').show();
	}
	
	
	document.cookie = "safeCookie1=foo; SameSite=Lax"; 
	document.cookie = "safeCookie2=foo";
	document.cookie = "crossCookie=bar; SameSite=None; Secure";


</script>
<div class="RICH page">
<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>	

	<br><br>
	<span class="ti">인기 종목</span>
	<br>
	<c:forEach var="i" items="${InFo}" end="8">
		<div class="card1 border-left-success shadow h-100 py-1">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div class="text-2xl font-weight-bold text-success text-uppercase">${i.eqNm} (${i.eqId})</div>
						<c:if test="${i.upDown eq '+'}">
							<div class="h4 mb-0 font-weight-bold text-gray-900">
								<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAABmJLR0QA/wD/AP+gvaeTAAAArklEQVRIie3UsQ0CMQyF4T8I0DEAG9BRMACjUTMSxdEzAAUdG7ACkik4CQnkI3Gcq/ykVE782U3AGIFOoLO+r0FPAv1kuMByQGU4Z4HV1Gh7fARth2eg/ngB6ocb0Hq8ArXjDmg57ojm4w1QFU9f8BHYAU9lti2wUWp34KbU5sA1wWF0cy3y/pu1rfqSXjPTBA4JOOCAAw44YDd4Yaz9JP2/8onAHlgr5UeCS26vF5oDMg7uXa5SAAAAAElFTkSuQmCC">
								<fmt:formatNumber value="${i.eqVal}" pattern="###,###,###" /> 
							</div>
							<div class="upp" >&nbsp;${i.upDown}${i.bfChg} (${i.upDown}${i.bfPer})</div>
						</c:if>
						<c:if test="${i.upDown eq '-'}">
							<div class="h4 mb-0 font-weight-bold text-gray-900"> 
								<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAABmJLR0QA/wD/AP+gvaeTAAAAp0lEQVRIie3VsQ0CMQyF4T8IoVuABW6BG4DRqNmHgobmOgZgjhsBJNMgpCsc4sS5yk9yEb3IX7okTJETcFTKBdLDtq8cnkFEmdmyaWeUX5VdM+yWgAMOOOCAA1azXx/lAkzAW7k/ZnaNINeM84R0Vno5gNwyn33t3EGGzKO74CWoO25B3fAatBlvQatxD9SMe6LFeA/0L94TVfEt0B8+fMEt0RVejX4Aeh0z4CoBvL8AAAAASUVORK5CYII=">
								<fmt:formatNumber value="${i.eqVal}" pattern="###,###,###" />
							</div>
							<div class="downn">&nbsp;${i.upDown}${i.bfChg} (${i.upDown}${i.bfPer})</div>
						</c:if>
						<c:if test="${empty i.upDown }">
							<div class="h4 mb-0 font-weight-bold text-gray-900"> 
								<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAABmJLR0QA/wD/AP+gvaeTAAABA0lEQVRIie3TPW4CMRCG4W8WBwgdd6Cjo8gNQoVER79X4ATpI1GgQLuKFDfbAQUC7sBB0vMPOykiYFfix7vyWELibS37kUc28OyR6mv9GQRBMc0ezwYcEdWW+cKwE4avTmFi3gN4L+z2A1PcChzLGLcNG+MSsBEuBd/FJeGbOHV1+Jbjwwco2mY+nlEFUeX6Ok1Lu3XT9/31Cf76/mmQ8kaZUfNmmxfVbLdaK0B+1PESY3cJJ3DXMADi8mLBjmGalrb/j8whfEYBQEUq/5vjw9j5d8qMxeppPQGofnk1edNjwqO+jArD11FB+DYqBN9HBWAz1BrMRCoNag32mOdp0GdO+wOn+ZOQd1ztmwAAAABJRU5ErkJggg==">
								<fmt:formatNumber value="${i.eqVal}" pattern="###,###,###" />
							</div>
							<div class="samee">&nbsp;${i.upDown}${i.bfChg} (${i.upDown}${i.bfPer})</div>
						</c:if>
					</div>
					<div class="col-auto" onclick="javascript:"><i class="fas fa-won-sign fa-2x text-gray-500"></i></div>
				</div>
				<div id=TimeStandard class="text-xs mt-2" style="text-align:right"> ${i.reTime } 기준 </div>
			</div>
		</div>
	</c:forEach>
	<hr>
	
<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>	
	<span class="ti">추천 영상</span>
	<br><br>
	<div class="uouo1">
<!-- 		<br><br> -->
<!-- 		<div class="col1"> -->
<!--	 		<video src="https://www.youtube.com/watch?v=9huosf0S2po&ab_channel=%EC%96%B8%EC%BB%A4%EB%A8%BC%EB%AE%A4%EC%A7%81UNCOMMONMUSIC" width="640" controls autoplay></video> -->
<!--	 		<iframe width="560" height="315" src="https://www.youtube.com/embed/SO0lS48Bs_E" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
<!--	 		<object width="560" height="315" data="https://www.youtube.com/embed/SO0lS48Bs_E" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></object> -->
<!-- 			<embed width="700" height="394" src="https://www.youtube.com/embed/SO0lS48Bs_E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></embed> -->
<!-- 			<br> -->
<!-- 			카카오 2020.11.08. <br> -->
<!-- 			if(kakao)2020이 곧 시작됩니다. <br> -->
<!-- 			2020년 11월 18일 수요일 더 나은 세상을 위한 카카오 컨퍼런스, if(kakao)2020이 시작됩니다. <br> -->
<!-- 		</div> -->
	</div>
	<br><hr>
	
<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>
	<div class="news">
		<span class="ti">뉴스/공시</span>
		<br><br>
		<div class="talk_menu">
			<br>
			<div style="font-weight: 700; font-size: 2rem;">
				<img class="icon3" src="https://img.icons8.com/fluent-systems-filled/48/000000/left.png"> 
				&nbsp;&#32;NEWS
				<img class="icon2" align="right" src="https://img.icons8.com/material-rounded/48/000000/menu.png">
				<img class="icon1" align="right" src="https://img.icons8.com/fluent-systems-filled/48/000000/search.png">
			</div>
		</div>
		<div class="news_talk kakao" style="overflow-x:hidden">
			<hr style="color:#9ABBFD; background-color:#9ABBD3; width:70em;">
			<div>
				<img class="char1" src="https://img.hankyung.com/photo/201907/AA.19998517.1.jpg">
				<div class="balloon_01">
					<a class="dodo1" href="https://finance.naver.com/item/news_read.nhn?article_id=0003827110&office_id=011&code=003490&sm=title_entity_id.basic" target="_blank">
						<strong>[특징주]아시아나항공, 대한항공의 인수 공식화에 급등</strong>
					</a>
					<br><br>
					<div class="popo1">아시아나항공(020560)이 대한항공의 인수 공식화에 급등세가 이어지고 있다. 17일 오전 9시 13분 현재 아시아나항공은 전거래일보다 19.21% 오른 6,640원에 거래되고 있다. 아시아나항공을 비롯해 금호선업(13.66%), 에어부산(11.91%), 금호산업우(10.17%) 등 금호아시아나그룹 계열사 주가가 초강세다.</div>
					<img class="momo3" src="https://imgnews.pstatic.net/image/011/2020/11/17/0003827110_001_20201117091903709.jpg?type=w540">		
				</div>
			</div>
			<br>
			<div>
				<div class="balloon_02">
					<a class="dodo1" href="https://finance.naver.com/news/news_read.nhn?article_id=0003827271&office_id=011&mode=LSS2D&type=0&section_id=101&section_id2=258&section_id3=&date=20201117&page=6" target="_blank">
						<strong>집값은 계속 올랐다. 지금 부동산 관심 가져야 하는 이유</strong>
					</a>
					<br><br>
					<div class="popo1">단군이래 부동산은 계속 올라왔다는 말이 있을 정도로 집값은 꾸준히 올라왔다. 한 부동산 전문가는 "정부가 지속적으로 대책을 내놓고 있지만, 전셋값 상승도 동반되고 있어 당분간 집값 상승세는 계속될 것"이라며 "집값은 꾸준히 오르기 때문에 내집마련은 하루라도 빨리 하는 것이 이득"이라고 조언했다.</div>
					<img class="momo2" src="https://imgnews.pstatic.net/image/011/2020/11/17/0003827271_001_20201117112737290.jpg?type=w540">		
				</div>
				<img class="char2" src="https://newsimg.sedaily.com/2020/08/10/1Z6IXOHDJM_3.jpg">
			</div>
		<!-- 	<br> -->
			<div>
				<img class="char1" src="https://img.hankyung.com/photo/201907/AA.19998517.1.jpg">
				<div class="balloon_01">
					<a class="dodo1" href="https://finance.naver.com/news/news_read.nhn?article_id=0003823416&office_id=011&mode=search&query=%C7%CA%B7%CE%BD%C3%BD%BA&page=1" target="_blank">
						<strong>[특징주]백신 개발 기대감에 코로나19 진단키트 약세</strong>
					</a>
					<br><br>
					<div class="popo1">미국 제약업체 화이자의 코로나19 백신이 임상 3상에서 일부 효능을 보였다는 소식에 국내 증시에 상장된 진단키트주가 10일 장 초반 약세다. 그간 코로나19 확산 기대감에 주가가 강세를 이어왔던 이들 종목이 이날 일제히 약세를 보인 배경은 코로나19 백신 개발 기대감 때문으로 풀이된다.</div>
					<img class="momo1" src="https://imgnews.pstatic.net/image/011/2020/11/10/0003823416_001_20201110100410646.jpg?type=w540">		
				</div>
			</div>
			<br>
			<div>
				<div class="balloon_02">
					<a class="dodo1" href="https://finance.naver.com/news/news_read.nhn?article_id=0003827738&office_id=011&mode=search&query=%C6%AF%C2%A1%C1%D6&page=7" target="_blank">
						<strong>[특징주]코로나19 항체치료제 생산···삼성바이오 2%대 강세</strong>
					</a>
					<br><br>
					<div class="popo1">미국 제약사 일라이릴리의 신종 코로나바이러스 감염증(코로나19) 항체 치료제를 생산한다고 밝힌 삼성바이오로직스(207940)가 강세다. 18일 오전 9시 10분 기준 삼성바이오로직스는 전 거래일 대비 2.07% 오른 79만원에 거래되고 있다.</div>
					<img class="momo2" src="https://imgnews.pstatic.net/image/011/2020/11/18/0003827738_001_20201118091322323.jpg?type=w540">		
				</div>
				<img class="char2" src="https://newsimg.sedaily.com/2020/08/10/1Z6IXOHDJM_3.jpg">
			</div>
		<!-- 	<br> -->
			<div id="addTalk3">
				<img class="char1" src="https://img.hankyung.com/photo/201907/AA.19998517.1.jpg">
				<div class="balloon_01">
					<a class="dodo1" href="https://finance.naver.com/news/news_read.nhn?article_id=0004530353&office_id=014&mode=search&query=%C6%AF%C2%A1%C1%D6&page=7" target="_blank">
						<strong>[특징주]빅히트, 호실적·BTS 컴백 기대감…6%대 상승</strong>
					</a>
					<br><br>
					<div class="popo1">3·4분기 호실적을 낸 빅히트가 오는 20일 BTS 컴백 기대감으로 주가가 강세를 보이고 있다. 17일 오후 3시 5분 기준 빅히트 주가는 전일 대비 1만500원(6.12%) 오른 18만2000원에 거래되고 있다.</div>
					<img class="momo1" src="https://imgnews.pstatic.net/image/014/2020/11/17/0004530353_001_20201117150906515.jpg?type=w540">		
				</div>
			</div>
			<br>
			<div id="addTalk1">
				<div class="balloon_02">
					<a class="dodo1" href="https://finance.naver.com/news/news_read.nhn?article_id=0001754307&office_id=016&mode=search&query=%C6%AF%C2%A1%C1%D6&page=1" target="_blank">
						<strong>[특징주] 한온시스템 ‘테슬라’ 급등세에 동반 상승</strong>
					</a>
					<br><br>
					<div class="popo1">전날 미국 증시에서 전기차 기업 테슬라 주가가 급등하면서, 국내 관련주 한온시스템 주가도 장중 급등세를 이어가고 있다. 한온시스템은 자동차 열 관리 시스템에서 일본 덴소에 이어 세계시장 점유율 2위를 차지하고 있는 기업이다.</div>
					<img class="momo2" src="https://imgnews.pstatic.net/image/016/2020/11/19/20201119000658_0_20201119143713635.jpg?type=w540">		
				</div>
				<img class="char2" src="https://newsimg.sedaily.com/2020/08/10/1Z6IXOHDJM_3.jpg">
			</div>
			<div id="addTalk2">
				<img class="char1" src="https://img.hankyung.com/photo/201907/AA.19998517.1.jpg">
				<div class="balloon_01">
					<a class="dodo1" href="https://finance.naver.com/news/news_read.nhn?article_id=0002445214&office_id=119&mode=search&query=%C7%CA%B7%CE%BD%C3%BD%BA&page=1" target="_blank">
						<strong>필로시스헬스케어 "검체채취키트 매출 본격적으로 증가"</strong>
					</a>
					<br><br>
					<div class="popo1">필로시스헬스케어 관계자는 "검체채취키트의 본격적인 매출이 10월부터 증가하고 있어 올 4분기부터 실적 개선이 가능할 것"이라며 "이를 통해 관리종목 탈피 후 시장에서 새로이 인정받는 회사로 거듭날 수 있도록 최선을 다할 것"이라고 말했다.</div>
					<img class="momo1" src="https://imgnews.pstatic.net/image/119/2020/11/20/0002445214_001_20201120145807282.jpeg?type=w540">		
				</div>
			</div>
			
		</div>
		
		<div class="chatting">
			<img class="icon6" id="plus" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAACJUlEQVRoge2Zz2rUUBTGv3tytR1mESgyBQtu3Cm6F1zpO4i49AFmITiLEOFAbzYWspiHsNVncO0DKLrRVaku/FOYRWJHL3NdJIVMks5kKMnt1PuDbHLOvfm+c0Iu4QAOx7kQi4Lj8XgjSZKdrsTU0e/3vw6Hw+lZ8VoDzDzwPG9PCPEIwGZr6prxG8AbInoeBMGPcrBigJkHUsp3AG4COBFCfDDGTDoQWkEI4Rtj7iAr4het9T1m/lnMkeVFnuftIRP/loie1Lnukryg+wAeSClfAnhajM91II7jXpqmxwBARDdsiz8lN3EIYKa13mLmk9MYFROn0+kOsnZ9uijiAYCZvwP4CKDned7cR2XOgNb6CgAYY5Lu5DWjoOlq8T7V5K4VzsAilFK7SqndNp/Rdgee5VdruFfINs6AbZwB2zgDtll7A5UfmmUopUI0P117+ZrjhvlxGIZqFT3/XwfyCjWqklIqyddsrfqcpqx9B5wB2zgDtnEGbOMM2Gblk3hF4pb3b9dAGIYv2twfuASv0OUyIKX8CwBCiL4dOWdT0PSneL88HzhCNpO6xcyDjrQtJYqibQC3AaS+7x8VY3MG8snHawCbUspXF8FEFEXbxph9ABsADsoTy8pXiIhGs9nsPoCHUsrDKIreWx7y3UUm/jMRjSo5dQuZ+Vo+UHuM/L/WIimAAyIaBUHwqxxcOuieTCbXpZQL89pCa2183/+2aNDtcJyTf837oRLahVGhAAAAAElFTkSuQmCC"> 
			<span id="info"># 더 많은 정보 보기</span> 
			<img class="icon4" align="right" src="data:image/png;base64,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">
			<img class="icon7" id="hash" align="right" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAACzklEQVRoge2YTWvUQBjH/88khNKDp+pBQQQXVvGl1o/ioXfPvh+Ehc3CwLJbBRXqJ/C84FdRWxWLXUTQm3oQpJSayeNhk3W6TdeZJ4l2cX+XzbPwy8w/M0kmA8yZ839DVZ6s2+0+IqIbzLze6XRaHl6fiO4x8+NOpxP7tKn8u1mM1nqRiO4AWCCim57e/cy769tuZQHCMLwMIMzKj65eFEXLEi+nsgAArljHr1wlY4zIy6ksABGJOiL1cmoZAWb26YjUA1BRgMFgEDDzpbw2xjh1ZDAYBAAu+no2lQQYDodNAIsAQESftdZfXbytra1zuQfgk6tnU0kAZranwUvnxpUqNf+BigKkaVp6/gNwDm5TSQAiWrFKnwBSb0xVT6HxlQzD0Kcjy/mB5AkETFkL5esTAAuSE9fALoAncRy37T8LR4CZiYhu4eh0Hhj15fbkn4UBiIgBPMUo9VFhF6M+7aP0crrX6z1n5msAQETX2+32szq9SUrfxMw8fpIYY5wfhVJvklIBtNbHAJzJyr00Td/V6RVRKkAURSv4PQ3faq336vSKKBUgTVP7ReQ8DaReEWXvgWXreOMveAcoG2B8JZVSPldS6h1AHEBrHQE4n5WslNqs0zsMcQCl1AUAUVZ+aLVa3+v0Dj2fVAyCYDwNiMh5Gki9wzjwJp6VRVzOvhGYpUVczr4As7SIyxEt5rrd7lkiGmbltziOl1y8tbW1hjFmOyu/xHF8QtK+jegmntiMeuHqJUlS+ht4EulTSNoR0e7FNKQBRB/j9sgppUTfwJOUHgGfj3F794KI/k0ArfUSgFNZudNsNt+7eP1+/zgzn8y9RqOxPVVwxDtAEARXrXJzdXXVuHjGmPHVZ+YNV+9PeAeoYhu9qvkPyO6BKrYRZzuAdBeuCEmA09lvkqbpa4H3M0mSN4J2C5EEWAfwA8ADrfWOwHvo6c2ZM2cKvwAzohlRkXrynwAAAABJRU5ErkJggg==">
			<img class="icon5" id="send" align="right" onclick="show()" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFEAAABRCAIAAAAl7d1hAAAABmJLR0QA/wD/AP+gvaeTAAAIA0lEQVR4nO2beVATVxzH34ZsNpCQcCqXARNQsK3WC28ZtVjkqmDrPVitx7SO2mltGVtbbW3VepRprba21RarQyVyRCAKUVHHq+j0mOJIkcsDvCrZcAUwR/9IJyLs8fYwiQOf/+Adu9/se+/32+97i1gbR4JehsDZN+AE+jT3Dvo09w76NPcOhM6+Ad64WmHMK8SLSgwtrZbUJK/17waiKEJY89nWbLWCy3+05hbgeYV4ZXW7/f/l14wIAjamBxG2Qp7FPMxksp4535JXpNdoDbcbOgnrPBfpXn5hCGHRs/Scje0WXWlTXhFecNzwsNFEXVnmSbpUPQOa24yWk2ea1Rq9Ros3NZshWyVMl5MVua7mh42mohKDWqPXnW7q6LAybZ6a5E1W5HKab9zqzC/CC4sNp883m0yMpdqIUGFRg8Rkpa6iuaauo+C4Qa3RXyhrsbJU+phXk0kfMnC65qsVRrVGn52nv1bZTl8bmpREL4pSJ2i2R5r8Irz+ziMuXSEI6DkoQoJEo16UULRynOb2DouutLmwGNdoDfcecJIKAMAwZOwo6ZnzzT2LUhK9EOIE7H+euubWNsups81qjT6/CG9ugY001AQHouvXBr7z4W3C0pQEqoENnp7mfx+atDqDWqMvKW3q7OS8KHVh0jjptzsViXOrjO2WnqW+PsJJ46TUPfCsmZdIQ8HyRX4ZmwckzKmqu0mccibPkAuFlCObL81XK4yFxYaC4wZeIg0hYkywZ4di8QLfNetunT5HMI1tpCRQRSkbnDTbIs3hXH3FdT4jTU9CgkS5vyhHD5ccUjd+vfc+WTWpRBA7xZO2N8aazWbrxcutao0+56ieY6SBZPJ4afZPyv7+6J9/ty1/+wZFzfhYuRijd0FgNdsjTb4Wv/+A5p2GR5Yv8vtmmwJFkUa9KTWtps1IsG7ZoU5F7NBoxg1m3emmguMGHiMNJGJM8N2XikXzfAEAZrN1/rLa2hsdFPUxDImPJX2X6gqp5jaj5a21N7NyGvmNNJAow7DcA6phz7vb/kzfWF98qom6ydRJMpmnG0znpJrf33A7M+sh/F3yyPQpsqwfB/p4/39vWTmNO3ffo20FObABhe9ZUkrzuz4NEASkrwnQZofbBf9Vbly6mmrdsuHmhiTPgBrYgOI5hwSJrldTzR/ekUoE+78Je+2VxwG2UW9KTaumXrdsjI+W9PdHIS9E+py3bgj2kkNND14IV2IXSyK7CjabrfOW1tbUQf3u8AMbUGiOHiG5fDLqhSHu8H2xJm6arOxE1PNRT1zrg00N8PNrZjwfmgEA4UrsQnHk7Jn02RxrbBO48Ndwb68nxlReIb59113ITkYM8xgYisFflCZrkUoEh/cr92aEku0JcEEqEah/Vm7dEOzm9kTn1yrbX19ZB5+30748dgNqv2r5Ij9dbkQ/fz5fwiJU2CVd5Kwe7qQeNyfPr4L3dAGlxUkI7B5dzATPK6eiRg+n8lzgiY+Vl52Iei6y+2JhsYCFK2qrahjEiwgVNmQwqcVJCIN9yQHBorPaQUsW+DG6QDdsE7ggK5wwKHy0uV6rMzDqsOdIoYXZXqwYE+zbFbo3I1QkYjO9PaVuOZmqrRuCBUSX1WjxLRmw65YdRlHKBss9unOXWmYvrrlzj8G75CCVOO+gimwc/lPVHj2tgtE0BgAEB6K3yodSO349YbnnPnGs9Epp1LjRsNM78WV52clIMsHNLeaUhdVMBQMAUhK9mQoGXM4ZBAWgpUcHr17Rj7qabQJrDoXLZcRZncUC5i+rZefpM41SNjidrcAw5KstAzL3hLmLifuRebrlHiCdwDY+2dZQWMxs3bLh6yOcPJ7G4iSEh/MkaXN9zx0bHDpA1O3/g8PFl3SRMykfxdFj+Gc77rC7blIcvcVJCD9naEYM87hyKmrq5Mf+W1Kc/LcTkRSbgwCAyur2tDfrLPRvTcSwG9iAx3NDfr7C4iMR6WsCBAKQviYg/yDpBLZhW7cMTSz9JqlEEDtFxq4t/+dJ6m52him6j/NuWK0gNa06vwhnfZVZSd5HMpXs2vJ/PoxWMABg0/Y7XAQDAFKTWA5s4JRzQyWlTfGzq8xm9tYiiiL3K4extjQcfQ7wenXHnCU1XAQDAF6KkXHxcByquaXVkppWjRu4+uQscuyuOE6z1QreWFVXfs3IsR+BACTFwVqcxD1wvAN4tmTczc7Xc+9nwhhpQD9Yi5MQB2muu9n58ZYGXrqiTuxgcJDmMIVo5VJ/XrpiZHES4rixvXNTSMwE+s1haoYP9VCGMbA4CXGcZqEQObx/YEgQfcZCAescuysOjVX9/dEjmUoMY28bc0m/7Dg6JxkzUvJ9Rii7tuFKrKdVygInfI+RNtd3WRob85SFxUmIc75B2b1dMXEsY4uDY/plxzmaURTJ/kkZFMAgtQgORKNH8LOj4LRvjQL7o+qflfA++cwEmlOc8Djz+6rx0dLtn4RAVoY57AaJk78pW72i3+IFvrTVfLyFMRPYWJyEOP87uj07FKOGe1DXYW1xEuJ8zWJMkJOp8vej2ujlJf2y43zNAABFiCjrByXZk/RwZ29xEuISmgEA02I8P19P/KnfjJfkHu583qeraAYAvLcqgPDsCl+piB0X0owgYN+usG6nh1AU9hQnPC6kGQAglQhyD6i6epoLZ/t0O1LEHVf8Lrbs99Z1n9bXNzyaPlX2xcZgsk1P1rii5qeNa41tx9CnuXfQp7l30Ke5d/Afde6bE/tXZwYAAAAASUVORK5CYII=">
		</div>
	</div>
	<br><br>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------>
	
</div>