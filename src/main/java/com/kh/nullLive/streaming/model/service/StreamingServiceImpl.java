package com.kh.nullLive.streaming.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullLive.member.model.exception.UpdateMemberException;
import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.dao.StreamingDao;
import com.kh.nullLive.streaming.model.exception.EnterStreamingException;
import com.kh.nullLive.streaming.model.exception.StreamingException;
import com.kh.nullLive.streaming.model.vo.BroadHis;
import com.kh.nullLive.streaming.model.vo.BroadList;

@Service
public class StreamingServiceImpl implements StreamingService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StreamingDao sd;

	//스트리밍 시작
	@Override
	public HashMap<String,Object> startStreaming(BroadHis broadHis) throws StreamingException {
		int result = sd.startStreaming(sqlSession,broadHis);
		if(result <= 0) {
			throw new StreamingException("방송 시작 실패!");
		}
		HashMap<String,Object> hmap = sd.getStreamingInfo(sqlSession,broadHis); 
		return hmap;
	}

	//스트리밍 종료
	@Override
	public void endStreaming(String mid) {
		int result = sd.endStreaming(sqlSession,mid);
	}

	//스트리머 주소 가져오기
	@Override
	public String getStreamerAddress(int mno) {
		return sd.getStreamerAddress(sqlSession,mno);
	}

	//스트리밍 시청 시작
	@Override
	public HashMap<String, Object> enterStream(Member loginUser, String streamerAddress) throws EnterStreamingException {
		//방송 중인지
		int result = sd.isOnAir(sqlSession,streamerAddress); 
		if(result <= 0) {
			throw new EnterStreamingException("방송 중이 아닙니다.");
		}
		//입장 처리(view_his insert / broad_his.count_viewers update)
		int result1 = sd.enterStream(sqlSession,loginUser,streamerAddress);
		int result2 = sd.updateViewerCount(sqlSession,streamerAddress);
		if(result1 <= 0 || result2 <= 0) {
			throw new EnterStreamingException("방송 입장 도중에 에러가 발생했습니다!");
		}
		//방송 정보 가져오기
		HashMap<String, Object> hmap = sd.getBroadInfo(sqlSession,streamerAddress);
		return hmap;
	}

	//시청 종료
	@Override
	public void exitStreaming(String mid, String bhno) {
		int result = sd.exitStreaming(sqlSession,mid,bhno);
	}

	@Override
	public int checkBlackList(Member loginUser, String streamerAddress) {
		HashMap<String, Object> infoMap = new HashMap<String, Object>();
		infoMap.put("loginUser", loginUser);
		infoMap.put("streamerAddress", streamerAddress);

		return sd.checkBlackList(sqlSession,infoMap);
	}

	/*정언 메인페이지*/
	//메인페이지 Hot Live 방송 목록 개수
	@Override
	public int getHotLiveListCount() {
		return sd.getHotLiveListCount(sqlSession);
	}

	//메인페이지 Hot Live 방송 목록 조회
	@Override
	public ArrayList<BroadList> selectHotLiveList() {
		return sd.selectHotLiveList(sqlSession);
	}

	//메인페이지 Hot Vod 방송 목록 개수
	@Override
	public int getHotVodListCount() {
		return sd.getHotVodListCount(sqlSession);
	}

	//방송 제한 정보 가져오기
	@Override
	public BroadHis getStreamingInfo(String streamerAddress) {
		return sd.getBroadHis(sqlSession, streamerAddress);
	}


	//메인페이지 Hot Vod 방송 목록 조회
	@Override
	public ArrayList<BroadList> selectHotVodList() {
		return sd.selectHotVodList(sqlSession);
	}

	//메인페이지 All Live 방송 목록 조회
	@Override
	public int getAllLiveListCount() {
		return sd.getAllLiveListCount(sqlSession);
	}

	//메인페이지 All Live 방송 목록 조회
	@Override
	public ArrayList<BroadList> selectAllLiveList() {
		return sd.selectAllLiveList(sqlSession);
	}

	//메인페이지 All Vod 방송 목록 개수
	@Override
	public int getAllVodListCount() {
		return sd.getAllVodListCount(sqlSession);
	}

	//메인페이지 All Vod 방송 목록 조회
	@Override
	public ArrayList<BroadList> selectAllVodList() {
		return sd.selectAllVodList(sqlSession);
	}

	//검색한 All Live 방송 목록 개수
	@Override
	public int getSearchAllLiveCount(int condition) {
		return sd.getSearchAllLiveCount(sqlSession, condition);
	}

	//검색한 All Live 방송 목록 조회
	@Override
	public ArrayList<BroadList> searchAllLiveList(int condition) {
		return sd.searchAllLiveList(sqlSession, condition);
	}

	//검색한 All Vod 방송 목록 개수
	@Override
	public int getSearchAllVodCount(int condition) {
		return sd.getSearchAllVodCount(sqlSession, condition);
	}

	//검색한 All Vod 방송 목록 조회
	@Override
	public ArrayList<BroadList> searchAllVodList(int condition) {
		return sd.searchAllVodList(sqlSession, condition);
	}


	//방송 추천
	@Override
	public void recomStreamer(String mid, String streamerAddress) throws StreamingException {
		int result1 = sd.recomStreamer(sqlSession,mid,streamerAddress);
		int result2 = sd.recomBroad(sqlSession,streamerAddress);
		if(result1+result2 <= 1) {
			throw new StreamingException("에러 발생");
		}
	}

	//현재 추천 수 가져오기
	@Override
	public int currRecom(String roomId) {
		return sd.currRecom(sqlSession,roomId);
	}
	//시청자 순으로 정렬한 All Live 방송 조회
	@Override
	public ArrayList<BroadList> sortVAllLiveList() {
		return sd.sortVAllLiveList(sqlSession);
	}

	//시청자 순으로 정렬한 All Vod 방송 조회
	@Override
	public ArrayList<BroadList> sortVAllVodList() {
		return sd.sortVAllVodList(sqlSession);
	}

	//시청자 순으로 정렬한 All Live 방송 조회(조건있음)
	@Override
	public ArrayList<BroadList> sortVAllLiveList2(int condition) {
		return sd.sortVAllLiveList2(sqlSession, condition);
	}

	//시청자 순으로 정렬한 All Vod 방송 조회(조건있음)
	@Override
	public ArrayList<BroadList> sortVAllVodList2(int condition) {
		return sd.sortVAllVodList2(sqlSession, condition);
	}

	//추천 순으로 정렬한 All Live 방송 조회
	@Override
	public ArrayList<BroadList> sortRAllLiveList() {
		return sd.sortRAllLiveList(sqlSession);
	}

	//추천 순으로 정렬한 All Vod 방송 조회
	@Override
	public ArrayList<BroadList> sortRAllVodList() {
		return sd.sortRAllVodList(sqlSession);
	}

	//추천 순으로 정렬한 All Live 방송 조회(조건있음)
	@Override
	public ArrayList<BroadList> sortRAllLiveList2(int condition) {
		return sd.sortRAllLiveList2(sqlSession, condition);
	}

	//추천 순으로 정렬한 All Vod 방송 조회(조건있음)
	@Override
	public ArrayList<BroadList> sortRAllVodList2(int condition) {
		return sd.sortRAllVodList2(sqlSession, condition);
	}

	@Override
	public int subInfoMap(int mno) {
		ArrayList<HashMap<String, Object>> infoList= sd.subInfoMap(sqlSession,mno);

		int result = 0;

		for (int i = 0; i < infoList.size(); i++) {
			result += sd.insertAlarm(sqlSession,infoList.get(i));
		}

		return result;
	}

	//즐겨찾기에서 최근 본 Live 방송 조회
	@Override
	public int getlLiveListCount(int mno) {
		return sd.getlLiveListCount(sqlSession, mno);
	}

	//즐겨찾기에서 최근 본 Live 방송 조회
	@Override
	public ArrayList<BroadList> selectlLiveList(int mno) {
		return sd.selectlLiveList(sqlSession, mno);
	}
	
	//즐겨찾기에서 최근 본 Live 방송 조회
	@Override
	public int getlVodListCount(int mno) {
		return sd.getlVodListCount(sqlSession, mno);
	}

	//즐겨찾기에서 최근 본 Live 방송 조회
	@Override
	public ArrayList<BroadList> selectlVodList(int mno) {
		return sd.selectlVodList(sqlSession, mno);
	}

	//즐겨찾기 한 BJ 개수
	@Override
	public int getfBjListCount(int mno) {
		return sd.getfBjListCount(sqlSession, mno);
	}

	//즐겨찾기 한 BJ 목록
	@Override
	public ArrayList<BroadList> selectfBjList(int mno) {
		return sd.selectfBjList(sqlSession, mno);
	}

	//스트리머 즐겨찾기
	@Override
	public void favoStreamer(HashMap<String, Object> hmap) throws UpdateMemberException {
		int result = sd.isFavoStreamer(sqlSession,hmap);
		if(result > 0) {
			throw new UpdateMemberException("이미 있음");
		}
		result = sd.favoStreamer(sqlSession,hmap);
	}


}