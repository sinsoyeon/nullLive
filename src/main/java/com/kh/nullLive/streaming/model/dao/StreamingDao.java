package com.kh.nullLive.streaming.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.vo.BroadHis;

public interface StreamingDao {

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 시작
	 */
	int startStreaming(SqlSessionTemplate sqlSession, BroadHis broadHis);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 종료
	 */
	int endStreaming(SqlSessionTemplate sqlSession, String mid);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 5.
	 * Comment : 방송 번호 가져오기
	 */
	String getStreamerAddress(SqlSessionTemplate sqlSession, int mno);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 방송 중인지
	 */
	int isOnAir(SqlSessionTemplate sqlSession, String streamerAddress);
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 방송 입장 처리
	 */
	int enterStream(SqlSessionTemplate sqlSession, Member loginUser, String streamerAddress);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 시청자가 방송 정보 가져오기
	 */
	BroadHis getBroadHis(SqlSessionTemplate sqlSession, String streamerAddress);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 시청 종료
	 */
	int exitStreaming(SqlSessionTemplate sqlSession, String mid, String bhno);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 누적 시청자 수 update
	 */
	int updateViewerCount(SqlSessionTemplate sqlSession, String streamerAddress);

	int checkBlackList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	//메인페이지 Hot Live 방송 목록 개수
	int getHotLiveListCount(SqlSessionTemplate sqlSession);
	//메인페이지 Hot Live 방송 목록 조회
	ArrayList<HashMap<String, Object>> selectHotLiveList(SqlSessionTemplate sqlSession);


}
