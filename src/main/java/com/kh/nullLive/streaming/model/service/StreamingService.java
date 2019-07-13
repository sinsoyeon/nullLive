package com.kh.nullLive.streaming.model.service;

import java.util.ArrayList;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.exception.EnterStreamingException;
import com.kh.nullLive.streaming.model.vo.BroadHis;
import com.kh.nullLive.streaming.model.vo.BroadList;

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

	/*정언 메인페이지*/
	//메인페이지 Hot Live 방송 목록 개수
	int getHotLiveListCount();
	
	//메인페이지 Hot Live 방송 목록 조회
	ArrayList<BroadList> selectHotLiveList();
	
	//메인페이지 Hot Vod 방송 목록 개수
	int getHotVodListCount();
	
	//메인페이지 Hot Vod 방송 목록 조회
	ArrayList<BroadList> selectHotVodList();
	
	//메인페이지 All Live 방송 목록 개수
	int getAllLiveListCount();
	
	//메인페이지 All Live 방송 목록 조회
	ArrayList<BroadList> selectAllLiveList();

	/**
	 * Author : ryan
	 * Date : 2019. 7. 13.
	 * Comment : 방송 정보 가져오기(제한 여부)
	 */
	BroadHis getStreamingInfo(String streamerAddress);


	
	//메인페이지 All Vod 방송 목록 개수 
	int getAllVodListCount();
	
	//메인페이지 All Vod 방송 목록 조회
	ArrayList<BroadList> selectAllVodList();
	
	//검색한 All Live 방송 목록 개수
	int getSearchAllLiveCount(int condition);

	//검색한 All Live 방송 목록 조회
	ArrayList<BroadList> searchAllLiveList(int condition);

	//검색한 All Vod 방송 목록 개수
	int getSearchAllVodCount(int condition);

	//검색한 All Vod 방송 목록 조회
	ArrayList<BroadList> searchAllVodList(int condition);

}