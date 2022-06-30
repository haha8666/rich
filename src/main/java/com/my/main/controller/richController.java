package com.my.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.main.service.RichService;
import com.my.security.SecurityUserDetail;

@Controller
public class richController {
	
	@Autowired
	private RichService richService;
	
	/**
	 * 관심종목 추가하기
	 * @method : equtitesDataSave
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/rich/equtitesDataSave.co")
	@ResponseBody
	public Map<String, Object> equtitesDataSave(@RequestParam Map<String, Object> reqMap, Authentication authentication ) throws IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		String url = reqMap.get("url").toString();
		String userId = reqMap.get("userId").toString();
		String num = reqMap.get("number").toString();
		int tint = parseInt(num);
		Document doc = Jsoup.connect(url).get();// 검색 결과에 따른 html 코드 가져오기
		Elements ATags = doc.select("a[class=js-inner-all-results-quote-item row]");				// a 태그의 클래스
		List<String> list = new ArrayList<String>();												// ArrayList 선언
		for(Element a : ATags) list.add(a.attr("abs:href"));										// list에 href의 절대 주소 입력
		String[] href = list.toArray(new String[list.size()]);										// ArrayList -> String

		for(int i=0;i<href.length;i++){
			System.out.print(i+1+".");
			System.out.println(href[i]);	
		}
		
		
		Document doc1 = Jsoup.connect(href[tint]).get();// 검색 결과에 따른 html 코드 가져오기
		
		String today_val = doc1.getElementById("last_last").text();									// 주가
		String chg_val = doc1.getElementById("fl_header_pair_chg").text();							// 전일 대비 변동 값
		String chg_pch = doc1.getElementById("fl_header_pair_pch").text();							// 전일 대비 변동 퍼센트
		String comp_code = doc1.getElementsByClass("float_lang_base_1 relativeAttr").text();			// 회사,코드
		
		String eqNum = comp_code.substring(comp_code.lastIndexOf("(")+1);
		String neweqNum = eqNum.substring(0,6);
		
		int idx = comp_code.indexOf("("); 
		String eqNm = comp_code.substring(0,idx-1);
		
		String eqUrl = "https://finance.naver.com/item/main.nhn?code="+neweqNum; //종목 url
		String eqHref = href[tint];
		
		map.put("userId", userId);   //userID
		map.put("eqNm", eqNm);      //주식 이름
		map.put("eqNum", neweqNum);  //주식 고유 아이디
		map.put("eqUrl", eqUrl);		//주식 종목 url
		map.put("eqHref", eqHref);		//주식 종목 url
		
		
		
		//마이라운지 종목 추가 시 메인 배치 바로 안돌기 때문에 추가 값 메인 DB에 바로 넣어주기!!
		String newChg_val = chg_val.substring(1);
		String newChg_pch = chg_pch.substring(1);
		
		String updown = chg_val.substring(0,1);
		String val = today_val.replace(",","");
		int bf_val = 0;
		int newval = Integer.parseInt(val);
		int toVal = Integer.parseInt(newChg_val);
		
		 if(chg_val.equals("0")){
			 updown = "";
			 bf_val = Integer.parseInt(today_val);
         }else
         {
	        	 if(updown.equals("+")){
	        		 bf_val = newval - toVal;
	        	 }else if(updown.equals("-")){
	        		 bf_val = newval + toVal;
	        	 }
         }
		
		map1.put("eqNm", eqNm);      //주식 이름
		map1.put("eqNum", neweqNum);  //주식 고유 아이디
		map1.put("eqVal", newval);   //주식 가격
		map1.put("bfVal", bf_val);    //전일 가격
		map1.put("bfChg", toVal);    //전일 대비 변동 가격
		map1.put("bfPer", newChg_pch);   //전일 대비 퍼센트
		map1.put("upDown", updown);   //+,-
		//마이라운지 종목 추가 시 메인 배치 바로 안돌기 때문에 추가 값 메인 DB에 바로 넣어주기!!
		
		
		System.out.println("정보 정보  userId : "+userId);
		System.out.println("정보 정보1  num : "+num);
		System.out.println("정보 정보1  eqNm : "+eqNm);
		System.out.println("정보 정보1  eqNum : "+neweqNum);
		System.out.println("정보 정보1  parseInt(num) : "+tint);
		System.out.println("정보 정보1  eqUrl : "+eqUrl);
		System.out.println("정보 정보1  eqHref : "+eqHref);
		System.out.println("정보 정보2  url : "+url);
		System.out.println("금일 주가 : " + today_val);
		System.out.println("전일 대비 변동 : " + chg_val + " (" + chg_pch + ")");
		
		map.put("result", richService.userEquitiesDataSave(map));
		map1.put("result", richService.setEquitiesUserData(map1));
		
		return map;
	}

	 private int parseInt(String num) {
		// TODO Auto-generated method stub
		int a = 0;
		
		if(num.equals("1"))a = 1;
		else if(num.equals("2"))a = 2;
		else if(num.equals("3"))a = 3;
		else if(num.equals("4"))a = 4;
		else if(num.equals("5"))a = 5;
		else if(num.equals("6"))a = 6;   
		else if(num.equals("7"))a = 7;
		else if(num.equals("8"))a = 8;
		else if(num.equals("9"))a = 9;
		else if(num.equals("10"))a = 10;
		else if(num.equals("11"))a = 11;
		else if(num.equals("12"))a = 12;
		else if(num.equals("13"))a = 13;
		else if(num.equals("14"))a = 14;
		else if(num.equals("15"))a = 15;
		
		return a;
	}

		
	/**
	 * 주식 리스트 검색 
	 * @method : search
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws IOException 
	 * @throws Exception 
	 */
 	@SuppressWarnings("unchecked")
	@RequestMapping("/rich/serch.co")
	@ResponseBody
	public JSONObject search(@RequestParam Map<String, Object> reqMap, Authentication authentication) throws IOException {
//			Map<String, Object> map = new HashMap<String, Object>();
		JSONObject json = new JSONObject();
		String serchNm = (String) reqMap.get("serchId").toString();
		
		Document doc = Jsoup.connect("https://kr.investing.com/search/?q=" + serchNm).get();		// 검색 결과에 따른 html 코드 가져오기
//			Document doc = Jsoup.connect("https://search.naver.com/search.naver?query=" + serchNm).get();// 검색 결과에 따른 html 코드 가져오기
		String url = "https://kr.investing.com/search/?q=" + serchNm;
		String sear = doc.getElementsByClass("js-inner-all-results-quotes-wrapper newResultsContainer quatesTable").text();	// 검색 시 출력 값
//			String sear = doc.getElementsByClass("nkindic_tit _svp_content").text();	// 검색 시 출력 값
		System.err.println(sear);
		String[] ch1 = sear.split("equities");														// equities 기준으로 자르기
		for(int i=0;i<ch1.length;i++){
			System.out.print(i+1+".");
			System.out.println(ch1[i]);	
			json.put(i, ch1[i]);
		}
		System.out.println(json);
		int a = json.size();
		json.put("size", a);
		json.put("url", url);
		
		return json;
	}
	
	
	/**
	 * 관심종목 삭제
	 * @method : deluserEquitiesData
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/rich/delData.co")
	@ResponseBody
	public Map<String, Object> delData(@RequestParam Map<String, Object> reqMap, Authentication authentication ) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", richService.deluserEquitiesData(reqMap));
		
		richService.delEquitiesAlrim(reqMap);  //종목 알림 삭제 하기
		
		return map;
	}
	
	/**
	 * 종목 알림 설정 제거
	 * @method : delAlrimdata
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/rich/delAlrimdata.co")
	@ResponseBody
	public Map<String, Object> delAlrimdata(@RequestParam Map<String, Object> reqMap, Authentication authentication ) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		richService.delEquitiesAlrim(reqMap);  //종목 알림 삭제 하기
		
		return map;
	}
	
	/**
	 * 종목 알림 정보 가져오기
	 * @method : getEquitiesAlrim
	 * @create : 2020-12-01
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked") //ajax 통신 값 받기 위해 꼭 넣기!!
	@RequestMapping("/rich/getEquitiesAlrim.co")
	public @ResponseBody JSONObject getEquitiesAlrim(@RequestParam Map<String, Object> reqMap, Authentication authentication ) throws Exception{
		JSONObject json = new JSONObject();
		
		json.put("result", richService.getEquitiesAlrim(reqMap));
		
		return json;
	}
	
	/**
	 * 종목 알림 설정
	 * @method : setEquitiesAlrim
	 * @create : 2020-12-01
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/rich/setEquitiesAlrim.co")
	@ResponseBody
	public Map<String, Object> setEquitiesAlrim(@RequestParam Map<String, Object> reqMap, Authentication authentication ) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", richService.setEquitiesAlrim(reqMap));
		
		return map;
	}
	
	
	/**
	 * 알림 설정 화면
	 * @method : alrimPopup
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/popup/alrimPopup.co")
	public String alrimPopup(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
		
		model.addAllAttributes(reqMap);
		
		return "popup/alrim";
	}

	

}
