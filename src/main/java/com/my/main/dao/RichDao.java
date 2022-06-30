package com.my.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface RichDao {
	
	/**
	 * 회원가입 정보저장
	 * @method : joinSave
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public List<Map<String, Object>> selectStudentAttend(Map<String, Object> reqMap);
	
	
	/**
	 * 관심 종목 추가하기
	 * @method : userEquitiesDataSave
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> userEquitiesDataSave(Map<String, Object> reqMap);
	
	/**
	 * 관심 종목 삭제하기
	 * @method : deluserEquitiesData
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> deluserEquitiesData(Map<String, Object> reqMap);
	
	/**
	 * 종목 알림 삭제하기
	 * @method : delEquitiesAlrim
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> delEquitiesAlrim(Map<String, Object> reqMap);

	/**
	 * 종목 알림 정보 가져오기
	 * @method : setEquitiesAlrim
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> getEquitiesAlrim(Map<String, Object> reqMap);
	
	/**
	 * 종목 알림 설정
	 * @method : setEquitiesAlrim
	 * @author : mhHeo
	 * @create : 2020-10-14
	 * @return
	 */
	public Map<String, Object> setEquitiesAlrim(Map<String, Object> reqMap);
	
	/**
	 * 종목 정보 추가
	 * @method : insEquitiesData
	 * @author : mhLee
	 * @create : 2020-12-01
	 * @return
	 */
	public Map<String, Object> insEquitiesData(Map<String, Object> reqMap);
	
	/**
	 * 배치 URL 가져오기
	 * @method : getEquitiesUrl
	 * @author : mhLee
	 * @create : 2020-12-02
	 * @return
	 */
	public List<Map<String, Object>> getEquitiesUrl(Map<String, Object> reqMap);
	
	/**
	 * 알림 비교하기
	 * @method : compAlrim
	 * @author : mhHeo
	 * @create : 2020-12-02
	 * @return
	 */
	public List<Map<String, Object>> compAlrim(Map<String, Object> reqMap);

	/**
	 * 종목 추가시 메인데이터 값 변환
	 * @method : setEquitiesUserData
	 * @author : mhHeo
	 * @create : 2020-12-07
	 * @return
	 */
	public List<Map<String, Object>> setEquitiesUserData(Map<String, Object> reqMap);

}
