package com.kh.nullLive.streaming.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nullLive.member.model.exception.UpdateMemberException;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.exception.EnterStreamingException;
import com.kh.nullLive.streaming.model.exception.StreamingException;
import com.kh.nullLive.streaming.model.vo.BroadHis;
import com.kh.nullLive.streaming.model.vo.BroadList;

public interface StreamingService {

	/**
	 * Author : ryan
	 * Date : 2019. 7. 3.
	 * Comment : 스트리밍 시작
	 * @return 
	 * @throws StreamingException 
	 */
	HashMap<String, Object> startStreaming(BroadHis broadHis) throws StreamingException;

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
	 * Date : 2019. 7. 16.
	 * Comment : 방송중인지
	 * @throws EnterStreamingException 
	 */
	void isBroading(String streamerAddress) throws EnterStreamingException;
	
	/**
	 * Author : ryan
	 * Date : 2019. 7. 7.
	 * Comment : 스트리밍 시청 시작
	 * @throws EnterStreamingException 
	 */
	HashMap<String, Object> enterStream(Member loginUser, String streamerAddress) throws EnterStreamingException;

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

	/**
	 * @param bhno 
	 * @throws StreamingException 
	 * @Author : ryan
	 * @Date : 2019. 7. 14.
	 * @Comment : 방송 추천
	 */
	void recomStreamer(String mid, String streamerAddress) throws StreamingException;

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 14.
	 * @Comment : 현재 추천 수 가져오기
	 */
	int currRecom(String roomId);

	//시청자 순으로 정렬한 All Live 방송 조회
	ArrayList<BroadList> sortVAllLiveList();

	//시청자 순으로 정렬한 All Vod 방송 조회
	ArrayList<BroadList> sortVAllVodList();

	//시청자 순으로 정렬한 All Live 방송 조회(조건있음)
	ArrayList<BroadList> sortVAllLiveList2(int condition);

	//시청자 순으로 정렬한 All Vod 방송 조회(조건있음)
	ArrayList<BroadList> sortVAllVodList2(int condition);

	//추천 순으로 정렬한 All Live 방송 조회
	ArrayList<BroadList> sortRAllLiveList();

	//추천 순으로 정렬한 All Vod 방송 조회
	ArrayList<BroadList> sortRAllVodList();

	//추천 순으로 정렬한 All Live 방송 조회(조건있음)
	ArrayList<BroadList> sortRAllLiveList2(int condition);

	//추천 순으로 정렬한 All Vod 방송 조회(조건있음)
	ArrayList<BroadList> sortRAllVodList2(int condition);

	int subInfoMap(int mno);

	//즐겨찾기에서 최근 본 Live 방송 개수
	int getlLiveListCount(int mno);

	//즐겨찾기에서 최근 본 Live 방송 조회
	ArrayList<BroadList> selectlLiveList(int mno);

	//즐겨찾기에서 최근 본 Vod 방송 개수
	int getlVodListCount(int mno);

	//즐겨찾기에서 최근 본 Vod 방송 조회
	ArrayList<BroadList> selectlVodList(int mno);

	//즐겨찾기 한 BJ 개수
	int getfBjListCount(int mno);

	//즐겨찾기 한 BJ 목록
	ArrayList<BroadList> selectfBjList(int mno);
	
	//구독 한 BJ 개수
	int getsBjListCount(int mno);

	//구독 한 BJ 목록
	ArrayList<BroadList> selectsBjList(int mno);

	//BJ의 Live 방송 개수
	int getBLiveListCount(int smno);

	//BJ의 Live 방송 목록
	ArrayList<BroadList> selectBLiveList(int smno);

	//BJ의 Vod 방송 개수
	int getBVodListCount(int smno);

	//BJ의 Vod 방송 목록
	ArrayList<BroadList> selectBVodList(int smno);

	/**
	 * @throws UpdateMemberException 
	 * @Author : ryan
	 * @Date : 2019. 7. 16.
	 * @Comment : 스트리머 즐겨찾기
	 */
	void favoStreamer(HashMap<String, Object> hmap) throws UpdateMemberException;

	/**
	 * Author : ryan
	 * Date : 2019. 7. 16.
	 * Comment : 좋아요
	 * @throws UpdateMemberException 
	 */
	void selectedLike(HashMap<String, Object> hmap) throws UpdateMemberException;

	/**
	 * Author : ryan
	 * Date : 2019. 7. 16.
	 * Comment : 방송 중 신고
	 */
	void selectedReport(HashMap<String, Object> hmap);

}