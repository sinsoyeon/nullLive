package com.kh.nullLive.broadCenter.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.broadCenter.model.vo.BroadCenter;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
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
	int insertStreamer(SqlSessionTemplate sqlSession, Member loginUser);

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

	//매니저 설정 페이지로 이동(정연)
	ArrayList<HashMap<String, Object>> selectpartnerList(SqlSessionTemplate sqlSession, int mno);

	ArrayList<HashMap<String, Object>> selectBlackList(SqlSessionTemplate sqlSession, int mno);

	int selectBlackListCount(SqlSessionTemplate sqlSession, int mno);

	HashMap<String, Object> selectOneBlackList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap);

	//파트너 상세 조회(정연)
	HashMap<String, Object> partnerDetail(SqlSessionTemplate sqlSession, int mno);

	//프로필 조회(정연)
	Attachment getProfile(SqlSessionTemplate sqlSession, int mno);

	// 방송 공지 게시판 페이지로 이동(정연)
	HashMap<String, Object> selectNoticeBoard(SqlSessionTemplate sqlSession, int mno);

	//방송 공지 수정 체크(정연)
	int updateNoticeCheck(SqlSessionTemplate sqlSession, HashMap<String, Object> updateInfo);

	//방송 공지 삭제(정연)
	int deleteNotice(SqlSessionTemplate sqlSession, int mno);

	//시청자 소통 개설 여부 확인(정연)
	int firstCheckCommunication(SqlSessionTemplate sqlSession, HashMap<String, Object> commuInfo);

	//첫 소통 게시판 활성화(정연)
	int enableCommunityBoard(SqlSessionTemplate sqlSession, int mno);

	//소통게시판 리스트 조회(정연)
	ArrayList<HashMap<String, Object>> selectCommunityList(SqlSessionTemplate sqlSession, int mno);

	//스트리머 검색(정연)
	ArrayList<HashMap<String, Object>> searchStreamer(SqlSessionTemplate sqlSession);

	ArrayList<HashMap<String, Object>> searchStreamerName(SqlSessionTemplate sqlSession, String name);

}
