package com.kh.nullLive.streaming.model.service;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.exception.EnterStreamingException;
import com.kh.nullLive.streaming.model.vo.BroadHis;

public interface StreamingService {

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 시작
	 */
	void startStreaming(BroadHis broadHis);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 종료
	 */
	void endStreaming(String mid);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 5.
	 * Comment : 스트리머 주소 가져오기
	 */
	String getStreamerAddress(int mno);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 스트리밍 시청 시작
	 * @throws EnterStreamingException 
	 */
	BroadHis enterStream(Member loginUser, String streamerAddress) throws EnterStreamingException;

	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 시청 종료
	 */
	void exitStreaming(String mid, String bhno);

	int checkBlackList(Member loginUser, String streamerAddress);

	
	
}
