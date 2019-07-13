package com.kh.nullLive.broadCenter.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.nullLive.broadCenter.model.exception.StreamerInsertException;
import com.kh.nullLive.broadCenter.model.exception.StreamerUpdateException;
import com.kh.nullLive.broadCenter.model.vo.BroadCenter;
import com.kh.nullLive.common.attachment.model.vo.Attachment;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

public interface BroadCenterService {

	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment :  최초 방송 약관 동의 처리
	 * @throws StreamerUpdateException 
	 * @throws StreamerInsertException 
	 */
	int streamerChange(Member loginUser) throws StreamerUpdateException, StreamerInsertException;

	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : 멤버 재로드
	 */
	Member resetMember(int mno);

	
	//방송국 메인 페이지 정보 조회(정연)
	HashMap<String, Object> selectMainInfo(int mno);

	//방송기능 설정 페이지 정보 조회(정연)
	HashMap<String, Object> selectBroadSetting(int mno);

	//방송기능 업데이트 (정연)
	int updateBroadSetting(HashMap<String, Object> broadInfo);

	////매니저 설정 페이지로 이동(정연)
	ArrayList<HashMap<String, Object>> selectpartnerList(int mno);

	//블랙 리스트 조회 (소연)
	ArrayList<HashMap<String, Object>> selectBlackList(int mno);

	//블랙리스트 인원수 조회 (소연)
	int selectBlackListCount(int mno);

	HashMap<String, Object> selectOneBlackList(HashMap<String, Object> infoMap);

	
	//파트너 상세 조회(정연)
	HashMap<String, Object> partnerDetail(int mno) throws StreamerUpdateException;

	//프로필 조회(정연)
	Attachment getProfile(int mno) throws StreamerUpdateException;

	// 방송 공지 게시판 페이지로 이동(정연)
	HashMap<String, Object> selectNoticeBoard(int mno) throws StreamerUpdateException;

	//방송 공지 수정 체크(정연)
	int updateNoticeCheck(HashMap<String, Object> updateInfo);

	//방송 공지 삭제 (정연)
	int deleteNotice(int mno);

	//시청자 소통 개설 여부 확인(정연)
	int firstCheckCommunication(HashMap<String, Object> commuInfo);

	//첫 소통 게시판 활성화(정연)
	int enableCommunityBoard(int mno);

	//소통 게시판 리스트 조회(정연)
	ArrayList<HashMap<String, Object>> selectCommunityList(int mno);

	//스트리머 검색 (정연)
	ArrayList<HashMap<String, Object>> searchStreamer();

	//스르티머 이름 검색(정연)
	ArrayList<HashMap<String, Object>> searchStreamerName(String name);

	

	

	
	
	

	
}
