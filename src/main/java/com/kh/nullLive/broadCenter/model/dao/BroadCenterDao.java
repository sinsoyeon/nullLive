package com.kh.nullLive.broadCenter.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.broadCenter.model.vo.BroadCenter;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

public interface BroadCenterDao {


	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : 멤버 isStreamer 수정
	 */
	int isStreamerUpdate(SqlSessionTemplate sqlSession, Member loginUser);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : Streamer 테이블 추가
	 * @param streamer 
	 */
	int insertStreamer(SqlSessionTemplate sqlSession, Member loginUser, Streamer streamer);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : 멤버 재로드
	 */
	Member resetMember(SqlSessionTemplate sqlSession, int mno);

	
	//방송국 메인 페이지 정보 조회(정연)
	HashMap<String, Object> selectMainInfo(SqlSessionTemplate sqlSession, int mno);

	//방송기능설정 페이지 정보 조회(정연)
	HashMap<String, Object> selectBroadSetting(SqlSessionTemplate sqlSession, int mno);

	//방송기능 설정 업데이트 (정연)
	int updateBroadSetting(SqlSessionTemplate sqlSession, HashMap<String, Object> broadInfo);

	ArrayList<HashMap<String, Object>> selectBlackList(SqlSessionTemplate sqlSession, int mno);

	int selectBlackListCount(SqlSessionTemplate sqlSession, int mno);

	HashMap<String, Object> selectOneBlackList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

}
