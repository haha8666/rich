package com.my.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.main.dao.MainDao;

@Service
public class MainService {

	@Resource
	private MainDao mainDao;

	public List<Map<String, Object>> selectStudentAttend(Map<String, Object> reqMap){
		return mainDao.selectStudentAttend(reqMap);
	}


	/**
     * 회원가입 저장
     * @method : joinSave
     * @author : mh.Heo
     * @create : 2020-10-14
     * @param reqMap
     * @return
     * @throws Exception
     */
	public List<Map<String, Object>> joinSave(Map<String, Object> reqMap){
		return mainDao.joinSave(reqMap);
	}


	/**
	 * 프로필 이미지 수정
	 * @method : profileImgSave
	 * @author : mh.Heo
	 * @create : 2020-10-14
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> profileImgSave(Map<String, Object> reqMap){
		return mainDao.profileImgSave(reqMap);
	}

	/**
	 * 프로필  수정
	 * @method : profileSave
	 * @author : mh.Heo
	 * @create : 2020-10-14
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> profileSave(Map<String, Object> reqMap){
		return mainDao.profileSave(reqMap);
	}

	/**
	 * user정보 가져오기
	 * @method : getUserId
	 * @author : mh.Heo
	 * @create : 2020-10-14
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getUserId(Map<String, Object> reqMap){
		return mainDao.getUserId(reqMap);
	}

	/**
	 * sms핸드폰 번호 가져오기
	 * @method : getUserPhone
	 * @author : mh.Heo
	 * @create : 2020-12-10
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getUserPhone(Map<String, Object> reqMap){
		return mainDao.getUserPhone(reqMap);
	}

	/**
	 * 메인화면 주식 정보 가져오기
	 * @method : getEquitiesInfo
	 * @author : mh.Lee
	 * @create : 2020-11-13
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEquitiesInfo(Map<String, Object> reqMap){
		return mainDao.getEquitiesInfo(reqMap);
	}

	/**
	 * 주식정보 가져오기
	 * @method : getEquitieData
	 * @author : seBong
	 * @create : unknown
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEquitieData(Map<String, Object> reqMap){
		return mainDao.getEquitieData(reqMap);
	}

	public List<Map<String, Object>> getCosData(Map<String, Object> reqMap){
		return mainDao.getCosData(reqMap);
	}

	public List<Map<String, Object>> getTodayData(Map<String, Object> reqMap){
		return mainDao.getTodayData(reqMap);
	}

	/**
	 * 마이라운지 관심종목 정보 가져오기
	 * @method : getUserEquitiesData
	 * @author : mh.Heo
	 * @create : 2020-11-23
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getUserEquitiesData(Map<String, Object> reqMap){
		return mainDao.getUserEquitiesData(reqMap);
	}



//	public Map<String, String> getEquitiesInfo2(Map<String, String> reqMap){
//		return mainDao.getEquitiesInfo2(reqMap);
//	}
}
