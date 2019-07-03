package com.kh.nullLive.broadCenter.model.service;

import com.kh.nullLive.broadCenter.model.exception.StreamerInsertException;
import com.kh.nullLive.broadCenter.model.exception.StreamerUpdateException;
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
	
}
