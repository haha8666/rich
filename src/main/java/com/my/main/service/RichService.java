package com.my.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.main.dao.RichDao;

@Service
public class RichService {
	
	
	@Resource
	private RichDao richDao;

//	public List<Map<String, Object>> selectStudentAttend(Map<String, Object> reqMap){
//		return mainDao.selectStudentAttend(reqMap);
//	}
	
	
//	/**
//     * 회원가입 저장
//     * @method : joinSave
//     * @author : mh.Heo
//     * @create : 2020-10-14
//     * @param reqMap
//     * @return
//     * @throws Exception
//     */
//	public List<Map<String, Object>> joinSave(Map<String, Object> reqMap){
//		return mainDao.joinSave(reqMap);
//	}
	
	
	/**
	 * 관심 종목 추가하기
	 * @method : userEquitiesDataSave
	 * @author : mh.Heo
	 * @create : 2020-10-14
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> userEquitiesDataSave(Map<String, Object> reqMap){
		return richDao.userEquitiesDataSave(reqMap);
	}
	
	/**
	 * 관심 종목 삭제하기
	 * @method : deluserEquitiesData
	 * @author : mh.Heo
	 * @create : 2020-10-14
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> deluserEquitiesData(Map<String, Object> reqMap){
		return richDao.deluserEquitiesData(reqMap);
	}
	
	/**
	 * 종목 알림 삭제하기 
	 * @method : delEquitiesAlrim
	 * @author : mh.Heo
	 * @create : 2020-10-14
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> delEquitiesAlrim(Map<String, Object> reqMap){
		return richDao.delEquitiesAlrim(reqMap);
	}
	
	/**
	 * 종목 알림 정보 가져오기
	 * @method : getEquitiesAlrim
	 * @author : mh.Heo
	 * @create : 2020-10-14
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> getEquitiesAlrim(Map<String, Object> reqMap){
		return richDao.getEquitiesAlrim(reqMap);
	}
	
	/**
	 * 종목 알림 설정
	 * @method : setEquitiesAlrim
	 * @author : mh.Heo
	 * @create : 2020-10-14
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> setEquitiesAlrim(Map<String, Object> reqMap){
		return richDao.setEquitiesAlrim(reqMap);
	}
	
	/**
	 * 관심 종목 추가하기
	 * @method : insEquitiesData
	 * @author : mh.Lee
	 * @create : 2020-12-01
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> insEquitiesData(Map<String, Object> reqMap){
		return richDao.insEquitiesData(reqMap);
	}

	/**
	 * 배치 URL 가져오기
	 * @method : getEquitiesUrl
	 * @author : mh.Lee
	 * @create : 2020-12-02
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEquitiesUrl(Map<String, Object> reqMap){
		return richDao.getEquitiesUrl(reqMap);
	}
	
	/**
	 * 알림 가격 비교하기
	 * @method : compAlrim
	 * @author : mh.Heo
	 * @create : 2020-12-02
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> compAlrim(Map<String, Object> reqMap){
		return richDao.compAlrim(reqMap);
	}
	
	/**
	 * 종목 추가시 메인데이터 값 변환
	 * @method : setEquitiesUserData
	 * @author : mh.Heo
	 * @create : 2020-12-07
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> setEquitiesUserData(Map<String, Object> reqMap){
		return richDao.setEquitiesUserData(reqMap);
	}
}
