package com.kh.nullLive.streaming.model.service;


public interface StreamingService {

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 시작
	 */
	void startStreaming(int mno);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 종료
	 */
	void endStreaming(int mno);

	
	
}