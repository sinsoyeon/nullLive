package com.kh.nullLive.broadCenter.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nullLive.broadCenter.model.exception.StreamerInsertException;
import com.kh.nullLive.broadCenter.model.exception.StreamerUpdateException;
import com.kh.nullLive.broadCenter.model.vo.BroadCenter;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;

public interface BroadCenterService {

	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment :  최초 방송 약관 동의 처리
	 * @param streamer 
	 * @throws StreamerUpdateException 
	 * @throws StreamerInsertException 
	 */
	int streamerChange(Member loginUser, Streamer streamer) throws StreamerUpdateException, StreamerInsertException;

	/**
	 * Author : ryan
	 * Date : 2019. 7. 2.
	 * Comment : 멤버 재로드
	 */
	Member resetMember(int mno);

	
	//방송국 메인 페이지 정보 조회(정연)
	HashMap<String, Object> selectMainInfo(int mno);

	//방송기능 설정 페이지 정보 조회(정연)
	BroadCenter selectBroadSetting(int mno);
	
}
