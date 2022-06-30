package com.my.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.main.service.MainService;
import com.my.main.service.RichService;
import com.my.security.SecurityUserDetail;

@Controller
public class MainController {
			
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainService mainService;
	@Autowired
	private RichService richService;

	/**
	 * 루트화면
	 * @method : main
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/")
	public String main() {
		System.out.println("123123");

		return "redirect:/login/login.co";
	}
	
	/**
	 * 로그인(화면)
	 * @method : login
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/login/login.co")
	public String login(@RequestParam Map<String, Object> reqMap , HttpSession session) {
		
		AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();
		if (trustResolver.isAnonymous(SecurityContextHolder.getContext().getAuthentication())) {
		// 익명
			return "login";
		}
		else { 
		// 로그인한 사용자 
			return "redirect:/system/main.co";
		}
		
		
	}
	
	/**
	 * 회원가입(화면)
	 * @method : mainPage
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/login/joinPage.co")
	public String joinPage(Model model,@RequestParam Map<String, Object> reqMap) {
		logger.info("회원가입 화면 입장");
		logger.info("회원가입 화면 입장");
		logger.info("회원가입 화면 입장");
		logger.info("회원가입 화면 입장");
		
		
		return "newjoin";
	}
	
	
	/**
	 * 메인 페이지(화면)
	 * @method : mainPage
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/system/main.co")
	public String mainPage(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
		
		System.out.println("-------------------- "+user.getNickname()+" 접속"+" --------------------");
		List<?> InFo = mainService.getEquitiesInfo(reqMap);
		
		int len = InFo.size();
		model.addAttribute("InFo",InFo);
		model.addAttribute("len",len);
		model.addAllAttributes(reqMap);
		
		return "system/main";
		
	}

	/**
	 * 톡(메시지 화면)
	 * @method : Talk
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/system/Talk.co")
	public String Talk(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
		reqMap.put("writer", user.getNickname());
		model.addAllAttributes(reqMap);
		
		return "system/Talk";
	}
	
	/**
	 * 톡리스트(화면)
	 * @method : Talklist
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/system/Talklist.co")
	public String Talklist(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
		reqMap.put("writer", user.getNickname());
		List<?> InFo = richService.getEquitiesUrl(reqMap);
		model.addAttribute("InFo",InFo);
		model.addAllAttributes(reqMap);
		
		
		
		return "system/talklist";
	}
	
	/**
	 * 정보 수정화면
	 * @method : profile
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/system/profile.co")
	public String profile(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
		
		reqMap.put("nickName", user.getNickname());
		reqMap.put("loginId", user.getUsername());
		reqMap.put("passWord", user.getPassword());
		reqMap.put("imgUrl", user.getimgUrl());
		
		model.addAllAttributes(reqMap);
		
		
		
		return "system/profile";
	}
	
	/**
	 * sms 전송 화면
	 * @method : sendSms
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/system/sendSms.co")
	public String sendSms(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
		
		model.addAllAttributes(reqMap);
		
		
		
		return "system/smsPage";
	}
	
	
	/**
	 * 마이라운지 화면
	 * @method : mylounge
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/system/mylounge.co")
	public String mylounge(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
		
		reqMap.put("userId", user.getUserId());
		
		List<?> userInFo = mainService.getUserEquitiesData(reqMap);
		List<?> InFo = mainService.getEquitiesInfo(reqMap);
		
		model.addAttribute("InFo",InFo);
		model.addAttribute("userInFo",userInFo);
		model.addAttribute("newuserInFo",userInFo);
		model.addAllAttributes(reqMap);
		
		return "system/mylounge";
	}
	
	
//	/**
//	 * 차트화 화면
//	 * @method : chartPage
//	 * @create : 2020-10-14
//	 * @param model
//	 * @author : MH.Heo
//	 * @throws Exception 
//	 */
//	@RequestMapping("/system/chartPage.co")
//	public String chartPage(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
//		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
//		
//		model.addAllAttributes(reqMap);
//		
//		
//		
//		return "system/chart";
//	}
	

//	@RequestMapping("/system/aaaa")
//	@ResponseBody
//	public Map<String, Object> aaaa(@RequestParam Map<String, Object> reqMap) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("result", mainService.selectStudentAttend(reqMap));
//		return map;
//	}
	
	/**
	 * 회원가입 저장
	 * @method : joinSave
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/login/joinSave.co")
	@ResponseBody
	public Map<String, Object> joinSave(@RequestParam Map<String, Object> reqMap, Authentication authentication ) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(reqMap);
		System.out.println(reqMap);
		System.out.println(reqMap);
		
		map.put("result", mainService.joinSave(reqMap));
		
		return map;
	}
	
	/**
	 * 프로필 이미지 수정
	 * @method : profileImgSave
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/login/profileImgSave.co")
	@ResponseBody
	public Map<String, Object> profileImgSave(@RequestParam Map<String, Object> reqMap, Authentication authentication ) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(reqMap);
		System.out.println(reqMap);
		System.out.println(reqMap);
		
		map.put("result", mainService.profileImgSave(reqMap));
		
		return map;
	}
	
	/**
	 * 프로필 수정
	 * @method : profileSave
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	@RequestMapping("/login/profileSave.co")
	@ResponseBody
	public Map<String, Object> profileSave(@RequestParam Map<String, Object> reqMap, Authentication authentication ) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(reqMap);
		System.out.println(reqMap);
		System.out.println(reqMap);
		
		map.put("result", mainService.profileSave(reqMap));
		
		return map;
	}
	
	
	/**
	 * 문자 전송
	 * @method : sendSms
	 * @create : 2020-10-14
	 * @param model
	 * @author : MH.Heo
	 * @throws Exception 
	 */
	//문자를 보낼때 맵핑되는 메소드
    @RequestMapping("/sendSms.do")
      public String sendSms(@RequestParam Map<String, Object> reqMap) throws Exception {
    	
    	Map<String, Object> map = new HashMap<String, Object>();

        String api_key = "NCS2LAJGL15WYALN"; //위에서 받은 api key를 추가
        String api_secret = "JWB60MCHDN4YFGTELYT00ANN5HETSDKI";  //위에서 받은 api secret를 추가

        com.my.coolsms.Coolsms coolsms = new com.my.coolsms.Coolsms(api_key, api_secret);
        //이 부분은 홈페이지에서 받은 자바파일을 추가한다음 그 클래스를 import해야 쓸 수 있는 클래스이다.
        

        HashMap<String, String> set = new HashMap<String, String>();
        set.put("from", "01086667147"); // 발신번호

        set.put("to", (String)reqMap.get("from")); // 수신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
        set.put("text", (String)reqMap.get("text")); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
        set.put("type", "sms"); // 문자 타입

        System.out.println(set);

        JSONObject result = coolsms.send(set); // 보내기&전송결과받기
        
        map.put("result", "ok");
        

        if ((boolean)result.get("status") == true) {

          // 메시지 보내기 성공 및 전송결과 출력
          System.out.println("성공");
          System.out.println(result.get("group_id")); // 그룹아이디
          System.out.println(result.get("result_code")); // 결과코드
          System.out.println(result.get("result_message")); // 결과 메시지
          System.out.println(result.get("success_count")); // 메시지아이디
          System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
          
          map.put("result", "ok");
        } else {
        	
          // 메시지 보내기 실패
          System.out.println("실패");
          System.out.println(result.get("code")); // REST API 에러코드
          System.out.println(result.get("message")); // 에러메시지
          map.put("result", "no");
        }
        
        return "redirect:/system/main.co";

      }
    
	
//    /**
//	 * jaxt Test
//	 * @method : aa
//	 * @create : 2020-10-14
//	 * @param model
//	 * @author : MH.Heo
//	 * @throws Exception 
//	 */
//	@RequestMapping("/test/aa.co")
//	@ResponseBody
//	public Map<String, Object> aa(@RequestParam Map<String, Object> reqMap, Authentication authentication ) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		String aa = "IK";
//		System.out.println(reqMap);
//		System.out.println(reqMap);
//		System.out.println(reqMap);
//		
//		map.put("result", "OK");
//		
//		return map;
//	}

    
//	@RequestMapping("/username") 
//	@ResponseBody public Map<String, Object> currentUserName(Authentication authentication) { 
//		UserDetails userDetails = (UserDetails) authentication.getPrincipal(); 
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		Map<String, Object> resultmap = new HashMap<String, Object>();
//		
//		map.put("loginId", userDetails.getUsername());
//		
//		resultmap.put("result", mainService.getUserId(map));
//		
//		return resultmap; 
//		
//	}

	
	
	
	
	
//	/**
//	 * 개인정보약관동의 저장
//	 * @method : indinfoAgreementSave
//	 * @create : 2020. 08. 07.
//	 * @author : MH.Heo
//	 */	
//    @SuppressWarnings("unchecked")
//    @RequestMapping({"/member/indinfoAgreementSave.eco"})
//    public @ResponseBody JSONObject indinfoAgreementSave(@RequestParam Map<String, Object> reqMap) throws Exception{
//        Util.paramFilter(reqMap);
//        JSONObject json = new JSONObject();
//   
//        int result = 0;
//        result = userMemberService.indinfoAgreementSave(reqMap);
//        json.put("result", result);
//
//        return json;
//    }
	
	
	
	
}
