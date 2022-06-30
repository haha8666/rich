package com.my.main.cron;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.my.main.controller.MainController;
import com.my.main.service.MainService;
import com.my.main.service.RichService;;

//cron 스케줄러 클래스임을 선언하는 어노테이션.
@Component
	public class Scheduler {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private RichService richService;
	
	@SuppressWarnings("unused")
	@Autowired
	private MainController mainController;
	
	//cron 문법으로 스케줄러가 실행되는 주기를 설정.(아래의 cron 스케줄 문법에 자세한 설명)
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Scheduled(cron = "0 0/20 9-15 ? * MON-FRI")
//	@Scheduled(cron = "0 17 13 * * *")
	public void aaa() throws IOException {
		
		 //==================종목 정보 배치 관련 map 정의======================//
		 Map<String, Object> map = new HashMap<String, Object>();
		 ArrayList<List>  list = (ArrayList) richService.getEquitiesUrl(map);
         Map<String, Object> maphref = new HashMap<String, Object>();
         //==================종목 정보 배치 관련 map 정의======================//


         //==================알림 배치 관련 map 정의============================//
         Map<String, Object> checkalrimmap = new HashMap<String, Object>();
         Map<String, Object> codemmap = new HashMap<String, Object>();
         Map<String, Object> delmap = new HashMap<String, Object>();
         Map<String, Object> smsmap = new HashMap<String, Object>();
         //==================알림 배치 관련 map 정의============================//
         
         
	         for(int i=0; i < list.size(); i++)
	         {
	        	//===========================================================================종목 정보 배치 시작===========================================================================//
	        	 maphref = (Map<String, Object>)list.get(i);
	             
	             Document doc = Jsoup.connect(maphref.get("eqHref").toString()).get();
	             String todays_val = doc.getElementById("last_last").text();						// 주가
	             String chg_val = doc.getElementById("fl_header_pair_chg").text();					// 변동 값
	             String chg_pch = doc.getElementById("fl_header_pair_pch").text();					// 변동 퍼센트
	             String comp = doc.getElementsByClass("float_lang_base_1 relativeAttr").text();		// 회사,코드
	 
	             int chgval = 0;
	             int bfval = 0; 
	             String pl_mi;
	             
	             String comp_code = comp.substring(comp.indexOf("(")+1,comp.indexOf(")"));			// 코드
	             String comp_name = comp.substring(0,comp.indexOf("("));							// 회사
	             String subprice = todays_val.replace(",", "");
	             int price = Integer.parseInt(subprice);
	             
	             if(chg_val.equals("0")){
	                 pl_mi = "";
	                 chgval = Integer.parseInt(chg_val);
	             }else{
	                 pl_mi = chg_val.substring(0,1);
	                 if(pl_mi.equals("+")){
	                     chg_val = chg_val.replace("+", "");                        
	                     chg_pch = chg_pch.replace("+", "");            
	                     chgval = Integer.parseInt(chg_val);
	                     bfval = price - chgval;
	                 }else if(pl_mi.equals("-")){
	                     chg_val = chg_val.replace("-", "");
	                     chg_pch = chg_pch.replace("-", "");
	                     chgval = Integer.parseInt(chg_val);
	                     bfval = price + chgval;
	                 }
	             }
	             
	             map.put("eqNm", comp_name);            //주식 이름
	             map.put("eqId", comp_code);            //주식 고유 아이디
	             map.put("eqVal", price);            //현재 주가
	             map.put("bfVal", bfval);            //현재 주가
	             map.put("bfChg", chgval);            //변동가
	             map.put("bfPer", chg_pch);            //전일 대비 퍼센트
	             map.put("upDown", pl_mi);            //+-
	             
	             map.put("result", richService.insEquitiesData(map));
	             //===========================================================================종목 정보 배치 끝===========================================================================//
	             
	             
	             
	             
	             
	             
	             //===========================================================================알림 SMS전송 시작===========================================================================//
	             codemmap.put("eqNum", comp_code);
	             
	             ArrayList<List>  alrimlist = (ArrayList) richService.compAlrim(codemmap);
	             
	             checkalrimmap = (Map<String, Object>)alrimlist.get(0);
	             
	             if(!(checkalrimmap.get("eqNm").toString().equals("No"))){
	     			
	            	 Map<String, Object> alrimmap = new HashMap<String, Object>();
	            		 
		    		 for(int z=0; z< alrimlist.size(); z++){
		    			 
		    			 alrimmap = (Map<String, Object>)alrimlist.get(z);
		    			 System.out.println("알림 정보 알림 정보"+alrimmap);
		    			 
		    			 String alrimPrice = alrimmap.get("eqPrice").toString();
		    			 int newalrimPrice = Integer.parseInt(alrimPrice);
						
			    			if(alrimmap.get("alrimStd").equals("UP")){  //알림 설정기준을 이상으로 했을 시 
								
								if(price >= newalrimPrice){  //알림금액이 이상으로 올랐을 경우
									
									System.out.println("UPUPUPUPUPUPUPUPUUP알림 보내기!!!!!UPUPUPUPUPUPUPUPUPUPUP");
									smsmap.put("userId", alrimmap.get("userId"));
									smsmap = mainService.getUserPhone(smsmap);
									
									String smsText = smsmap.get("userNm").toString()+ "님 "+ alrimmap.get("eqNm").toString()+" 가격이 "+ newalrimPrice +"원 이상되었습니당~!!!";
									smsmap.put("from", smsmap.get("phoneNum"));
									smsmap.put("text",smsText);
									
									System.out.println("받는 번호 : " + smsmap.get("phoneNum"));
									System.out.println("보내는 텍스트 : " + smsText);
									try {
										mainController.sendSms(smsmap);
										System.out.println("UP 알림 보내기 성공~!!~!!");
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
										System.out.println("UP 알림 보내기 실패 ㅠㅠ...");
									}
									
									delmap.put("userId", alrimmap.get("userId"));
									delmap.put("eqNum", alrimmap.get("eqNum"));
									richService.delEquitiesAlrim(delmap);   //알림 보낸 후 알림 정보 삭제
									
								}
								else{
									System.out.println("UPUPUPUPUPUPUPUPUPUPUP알림 아직 아니예요~UPUPUPUPUPUPUPUPUP");
								}
							}
			    			else if(alrimmap.get("alrimStd").equals("DOWN")){ //알림 설정기준을 이하로 했을 시 
								
								if(price <= newalrimPrice){ //알림금액이 이하로 떨어졌을 경우
									
									System.out.println("DOWNDOWNDOWNDOWN 알림 보내기!!!!!DOWNDOWNDOWNDOWNDOWNDOWNDOWN");
									
									smsmap.put("userId", alrimmap.get("userId"));
									smsmap = mainService.getUserPhone(smsmap);
									
									String smsText = smsmap.get("userNm").toString()+ "님 "+ alrimmap.get("eqNm").toString()+" 가격이 "+ newalrimPrice +"원 이하가되었습니당~!!!";
									smsmap.put("from", smsmap.get("phoneNum"));
									smsmap.put("text",smsText);
									
									System.out.println("받는 번호 : " + smsmap.get("phoneNum"));
									System.out.println("보내는 텍스트 : " + smsText);
									try {
										mainController.sendSms(smsmap);
										System.out.println("DOWN 알림 보내기 성공~!!~!!");
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
										System.out.println("DOWN 알림 보내기 실패 ㅠㅠ...");
									}
									
									delmap.put("userId", alrimmap.get("userId"));
									delmap.put("eqNum", alrimmap.get("eqNum"));
									richService.delEquitiesAlrim(delmap);   //알림 보낸 후 알림 정보 삭제
								}
								else{
									System.out.println("DOWNDOWNDOWNDOWN알림 아직 아니예요DOWNDOWNDOWNDOWNDOWNDOWNDOWN");
								}
							}
		    			 
		    		 }
	            	 
	
	             }else if(checkalrimmap.get("eqNm").toString().equals("No")){  //해당 종목에 관한 알림 설정이 없는 경우
	            	 
	            	 System.out.println("해당 종목 알림 정보가 없음!!!!");
	            	 
	             }
	             //===========================================================================알림 SMS전송 끝!===========================================================================//
	 	
			
		}
	
	

	
	
	}
	
	
}

