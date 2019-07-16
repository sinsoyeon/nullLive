package com.kh.nullLive.streaming.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.vo.BroadHis;
import com.kh.nullLive.streaming.model.vo.BroadList;

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
	 * @Author : ryan
	 * @Date : 2019. 7. 14.
	 * @Comment : 입장 방송 정보 가져오기
	 */
	HashMap<String, Object> getBroadInfo(SqlSessionTemplate sqlSession, String streamerAddress);

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

	/*정언 메인페이지*/
	//메인페이지 Hot Live 방송 목록 개수
	int getHotLiveListCount(SqlSessionTemplate sqlSession);

	//메인페이지 Hot Live 방송 목록 조회
	ArrayList<BroadList> selectHotLiveList(SqlSessionTemplate sqlSession);

	//메인페이지 Hot Vod 방송 목록 개수
	int getHotVodListCount(SqlSessionTemplate sqlSession);

	//메인페이지 Hot Vod 방송 목록 조회
	ArrayList<BroadList> selectHotVodList(SqlSessionTemplate sqlSession);

	//메인페이지 All Live 방송 목록 개수
	int getAllLiveListCount(SqlSessionTemplate sqlSession);

	//메인페이지 All Live 방송 목록 조회
	ArrayList<BroadList> selectAllLiveList(SqlSessionTemplate sqlSession);

	//메인페이지 All Vod 방송 목록 개수
	int getAllVodListCount(SqlSessionTemplate sqlSession);

	//메인페이지 All Vod 방송 목록 조회
	ArrayList<BroadList> selectAllVodList(SqlSessionTemplate sqlSession);

	//검색한 All Live 방송 목록 개수
	int getSearchAllLiveCount(SqlSessionTemplate sqlSession, int condition);

	//검색한 All Live 방송 목록 조회
	ArrayList<BroadList> searchAllLiveList(SqlSessionTemplate sqlSession, int condition);

	//검색한 All Vod 방송 목록 개수
	int getSearchAllVodCount(SqlSessionTemplate sqlSession, int condition);

	//검색한 All Vod 방송 목록 조회
	ArrayList<BroadList> searchAllVodList(SqlSessionTemplate sqlSession, int condition);

	//방송 시작 스트리머 정보 가져오기
	HashMap<String, Object> getStreamingInfo(SqlSessionTemplate sqlSession, BroadHis broadHis);

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 14.
	 * @Comment : 방송 추천
	 */
	int recomStreamer(SqlSessionTemplate sqlSession, String mid, String streamerAddress);

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 14.
	 * @Comment : 현재 방송내 추천
	 */
	int recomBroad(SqlSessionTemplate sqlSession, String streamerAddress);

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 14.
	 * @Comment : 현재 추천 수 가져오기
	 */
	int currRecom(SqlSessionTemplate sqlSession, String roomId);

	//시청자 순으로 정렬한 All Live 방송 조회
	ArrayList<BroadList> sortVAllLiveList(SqlSessionTemplate sqlSession);

	//시청자 순으로 정렬한 All Vod 방송 조회
	ArrayList<BroadList> sortVAllVodList(SqlSessionTemplate sqlSession);

	//시청자 순으로 정렬한 All Live 방송 조회(조건있음)
	ArrayList<BroadList> sortVAllLiveList2(SqlSessionTemplate sqlSession, int condition);

	//시청자 순으로 정렬한 All Vod 방송 조회(조건있음)
	ArrayList<BroadList> sortVAllVodList2(SqlSessionTemplate sqlSession, int condition);

	//추천 순으로 정렬한 All Live 방송 조회
	ArrayList<BroadList> sortRAllLiveList(SqlSessionTemplate sqlSession);

	//추천 순으로 정렬한 All Vod 방송 조회
	ArrayList<BroadList> sortRAllVodList(SqlSessionTemplate sqlSession);

	//추천 순으로 정렬한 All Live 방송 조회(조건있음)
	ArrayList<BroadList> sortRAllLiveList2(SqlSessionTemplate sqlSession, int condition);

	//추천 순으로 정렬한 All Vod 방송 조회(조건있음)
	ArrayList<BroadList> sortRAllVodList2(SqlSessionTemplate sqlSession, int condition);

	ArrayList<HashMap<String, Object>> subInfoMap(SqlSessionTemplate sqlSession, int mno);

	int insertAlarm(SqlSessionTemplate sqlSession, HashMap<String, Object> hashMap);

	//즐겨찾기에서 최근 본 Live 방송 개수
	int getlLiveListCount(SqlSessionTemplate sqlSession, int mno);

	//즐겨찾기에서 최근 본 Live 방송 조회
	ArrayList<BroadList> selectlLiveList(SqlSessionTemplate sqlSession, int mno);

	//즐겨찾기에서 최근 본 Vod 방송 개수
	int getlVodListCount(SqlSessionTemplate sqlSession, int mno);

	//즐겨찾기에서 최근 본 Vod 방송 조회
	ArrayList<BroadList> selectlVodList(SqlSessionTemplate sqlSession, int mno);

	//즐겨찾기 한 BJ 개수
	int getfBjListCount(SqlSessionTemplate sqlSession, int mno);

	//즐겨찾기 한 BJ 목록
	ArrayList<BroadList> selectfBjList(SqlSessionTemplate sqlSession, int mno);

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 16.
	 * @Comment : 이미 즐겨찾기한 스트리머인지
	 */
	int isFavoStreamer(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	/**
	 * @Author : ryan
	 * @Date : 2019. 7. 16.
	 * @Comment : 스트리머 즐겨찾기
	 */
	int favoStreamer(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 16.
	 * Comment : 좋아요
	 */
	int selectedLike(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

	/**
	 * Author : ryan
	 * Date : 2019. 7. 16.
	 * Comment : 방송 중 신고
	 */
	int selectedReport(SqlSessionTemplate sqlSession, HashMap<String, Object> hmap);

}