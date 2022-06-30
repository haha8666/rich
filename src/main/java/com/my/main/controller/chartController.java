package com.my.main.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.main.service.MainService;
import com.my.security.SecurityUserDetail;

@Controller
public class chartController {

	@Autowired
	private MainService mainService;

	@RequestMapping("/system/chartPage.co")
	public String chartPage(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();

		String userno = user.getUserId();

		reqMap.put("userId", user.getUserId());
		List<?> eqdata = mainService.getUserEquitiesData(reqMap);

		model.addAttribute("eqdata", eqdata);
		model.addAllAttributes(reqMap);

		return "system/chart";
	}

	@SuppressWarnings("unchecked") //추가
	@RequestMapping("/system/chart.co")
	@ResponseBody  //추가
	public JSONObject chart(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		SecurityUserDetail user = (SecurityUserDetail) authentication.getPrincipal();
		List<Map<String, Object>> list = mainService.getEquitieData(reqMap);

		JSONObject json = new JSONObject();

		int size = list.size();// 추가

		json.put("list", list);
		json.put("size", size); // 추가

		return json;
	}

	@SuppressWarnings("unchecked") //추가
	@RequestMapping("/system/cos.co")
	@ResponseBody  //추가
	public JSONObject cos(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {

		JSONObject json = new JSONObject();

		reqMap.put("eqId", "015487");
		System.out.println("reqMapreqMapreqMapreqMapreqMap"+reqMap);
		List<Map<String, Object>> CospData = mainService.getCosData(reqMap);
		reqMap.remove("eqId");
		reqMap.put("eqId", "015488");
		List<Map<String, Object>> CosdData = mainService.getCosData(reqMap);
		System.out.println(reqMap);

		json.put("cospdata", CospData);
		json.put("cosddata", CosdData);

		return json;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/system/todaydata.co")
	@ResponseBody
	public JSONObject todaydata(Model model,@RequestParam Map<String, Object> reqMap, Authentication authentication) {
		System.out.println("reqMap");
		JSONObject json = new JSONObject();

		List<Map<String, Object>> TodayData = mainService.getTodayData(reqMap);

		json.put("todaydata", TodayData);

		return json;
	}



}
