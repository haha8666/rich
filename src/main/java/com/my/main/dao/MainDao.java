package com.my.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface MainDao {
	public List<Map<String, Object>> selectStudentAttend(Map<String, Object> reqMap);


	/**
	 * 회원가입 정보저장
	 * @method : joinSave
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public List<Map<String, Object>> joinSave(Map<String, Object> reqMap);


	/**
	 * 프로필 이미지 수정
	 * @method : profileImgSave
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> profileImgSave(Map<String, Object> reqMap);


	/**
	 * 프로필 수정
	 * @method : profileSave
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> profileSave(Map<String, Object> reqMap);


	/**
	 * userId 값 가져오기
	 * @method : getUserId
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> getUserId(Map<String, Object> reqMap);

	/**
	 * sms핸드폰 번호 가져오기
	 * @method : getUserPhone
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> getUserPhone(Map<String, Object> reqMap);

	/**
	 * selectUser 값 가져오기
	 * @method : selectUser
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> selectUser(Map<String, Object> reqMap);

	/**
	 * 메인화면 주식 정보 가져오기
	 * @method : getEquitiesInfo
	 * @author : mhLee
	 * @create : 2020-11-13
	 * @return
	 */
	public List<Map<String, Object>> getEquitiesInfo(Map<String, Object> reqMap);

	/**
	 * 주식정보 가져오기
	 * @method : getEquitieData
	 * @author : seBong
	 * @create : unknown
	 * @param reqMap
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getEquitieData(Map<String, Object> reqMap);


	public List<Map<String, Object>> getCosData(Map<String, Object> reqMap);

	public List<Map<String, Object>> getTodayData(Map<String, Object> reqMap);

	/**
	 * 마이라운지 관심 종목 정보 가져오기
	 * @method : getUserEquitiesData
	 * @author : mh.Heo
	 * @create : 2020-11-23
	 * @return
	 */
	public List<Map<String, Object>> getUserEquitiesData(Map<String, Object> reqMap);

//	public Map<String, String> getEquitiesInfo2(Map<String, String> reqMap);

}
