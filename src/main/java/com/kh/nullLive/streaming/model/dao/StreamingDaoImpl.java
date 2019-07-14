package com.kh.nullLive.streaming.model.dao;

import java.util.ArrayList;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.vo.BroadHis;
import com.kh.nullLive.streaming.model.vo.BroadList;


@Repository
public class StreamingDaoImpl implements StreamingDao {

	//스트리밍 시작
	@Override
	public int startStreaming(SqlSessionTemplate sqlSession, BroadHis broadHis) {
		return sqlSession.insert("Streaming.startStreaming",broadHis);
	}

	//스트리밍 종료
	@Override
	public int endStreaming(SqlSessionTemplate sqlSession, String mid) {
		return sqlSession.update("Streaming.endStreaming",mid);
	}

	//방송 번호 가져오기
	@Override
	public String getStreamerAddress(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("Streaming.getStreamerAdress",mno);
	}

	//방송 중인지
	@Override
	public int isOnAir(SqlSessionTemplate sqlSession, String streamerAddress) {
		return sqlSession.selectOne("Streaming.isOnAir",streamerAddress);
	}

	//방송 입장 처리
	@Override
	public int enterStream(SqlSessionTemplate sqlSession, Member loginUser, String streamerAddress) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("m", loginUser);
		hmap.put("address",streamerAddress);
		return sqlSession.insert("Streaming.enterStream",hmap);
	}

	//시청자 방송 정보 불러오기
	@Override
	public BroadHis getBroadHis(SqlSessionTemplate sqlSession, String streamerAddress) {
		return sqlSession.selectOne("Streaming.getBroadHis",streamerAddress);
	}

	//시청 종료
	@Override
	public int exitStreaming(SqlSessionTemplate sqlSession, String mid, String bhno) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("mid", mid);
		hmap.put("bhno",bhno);
		return sqlSession.update("Streaming.exitStreaming",hmap);
	}

	//누적 시청자수 update
	@Override
	public int updateViewerCount(SqlSessionTemplate sqlSession, String streamerAddress) {
		return sqlSession.update("Streaming.updateViewerCount",streamerAddress);
	}

	@Override
	public int checkBlackList(SqlSessionTemplate sqlSession, HashMap<String, Object> infoMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Streaming.checkBlackList",infoMap);
	}

	//메인페이지 Hot Live 방송 목록 개수
	@Override
	public int getHotLiveListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Streaming.hotLiveListCount");
	}

	//메인페이지 Hot Live 방송 목록 조회
	@Override
	public ArrayList<BroadList> selectHotLiveList(SqlSessionTemplate sqlSession) {
		ArrayList<BroadList> list = (ArrayList) sqlSession.selectList("Streaming.selectHotLiveList");
		
		return list;
	}

	//메인페이지 Hot Vod 방송 목록 개수
	@Override
	public int getHotVodListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Streaming.hotVodListCount");
	}

	//메인페이지 Hot Vod 방송 목록 조회
	@Override
	public ArrayList<BroadList> selectHotVodList(SqlSessionTemplate sqlSession) {
		ArrayList<BroadList> list = (ArrayList) sqlSession.selectList("Streaming.selectHotVodList");
		
		return list;
	}

	//메인페이지 All Live 방송 목록 개수
	@Override
	public int getAllLiveListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Streaming.allLiveListCount");
	}

	//메인페이지 All Live 방송 목록 조회
	@Override
	public ArrayList<BroadList> selectAllLiveList(SqlSessionTemplate sqlSession) {
		ArrayList<BroadList> list = (ArrayList) sqlSession.selectList("Streaming.selectAllLiveList");
		
		return list;
	}

	//메인페이지 All Vod 방송 목록 개수
	@Override
	public int getAllVodListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Streaming.allVodListCount");
	}

	//메인페이지 All Vod 방송 목록 조회
	@Override
	public ArrayList<BroadList> selectAllVodList(SqlSessionTemplate sqlSession) {
		ArrayList<BroadList> list = (ArrayList) sqlSession.selectList("Streaming.selectAllVodList");
		
		return list;
	}

	//검색한 All Live 방송 목록 개수
	@Override
	public int getSearchAllLiveCount(SqlSessionTemplate sqlSession, int condition) {
		String searchCondition = "";

		switch(condition) {
		case 1 : return sqlSession.selectOne("Streaming.allLiveListCount");
		case 2 : searchCondition = "캠방"; break;
		case 3 : searchCondition = "게임"; break;
		case 4 : searchCondition = "음악"; break;
		case 5 : searchCondition = "야방"; break;
		case 6 : searchCondition = "취미"; break;
		case 7 : searchCondition = "펫방"; break;
		case 8 : searchCondition = "스포츠"; break;
		case 9 : searchCondition = "라디오"; break;
		default : searchCondition = "기타"; break;
		}

		return sqlSession.selectOne("Streaming.searchAllLiveCount", searchCondition);
	}

	//검색한 All Live 방송 목록 조회
	@Override
	public ArrayList<BroadList> searchAllLiveList(SqlSessionTemplate sqlSession, int condition) {
		ArrayList<BroadList> list = null;
		
		String searchCondition = "";

		switch(condition) {
		case 1 : return (ArrayList) sqlSession.selectList("Streaming.selectAllLiveList");
		case 2 : searchCondition = "캠방"; break;
		case 3 : searchCondition = "게임"; break;
		case 4 : searchCondition = "음악"; break;
		case 5 : searchCondition = "야방"; break;
		case 6 : searchCondition = "취미"; break;
		case 7 : searchCondition = "펫방"; break;
		case 8 : searchCondition = "스포츠"; break;
		case 9 : searchCondition = "라디오"; break;
		default : searchCondition = "기타"; break;
		}
		
		list = (ArrayList) sqlSession.selectList("Streaming.searchAllLiveList", searchCondition);
		
		return list;
	}

	//검색한 All Vod 방송 목록 개수
	@Override
	public int getSearchAllVodCount(SqlSessionTemplate sqlSession, int condition) {
		String searchCondition = "";

		switch(condition) {
		case 1 : return sqlSession.selectOne("Streaming.allVodListCount");
		case 2 : searchCondition = "캠방"; break;
		case 3 : searchCondition = "게임"; break;
		case 4 : searchCondition = "음악"; break;
		case 5 : searchCondition = "야방"; break;
		case 6 : searchCondition = "취미"; break;
		case 7 : searchCondition = "펫방"; break;
		case 8 : searchCondition = "스포츠"; break;
		case 9 : searchCondition = "라디오"; break;
		default : searchCondition = "기타"; break;
		}

		return sqlSession.selectOne("Streaming.searchAllVodCount", searchCondition);
	}

	//검색한 All Vod 방송 목록 조회
	@Override
	public ArrayList<BroadList> searchAllVodList(SqlSessionTemplate sqlSession, int condition) {
		ArrayList<BroadList> list = null;
		
		String searchCondition = "";

		switch(condition) {
		case 1 : return (ArrayList) sqlSession.selectList("Streaming.selectAllVodList");
		case 2 : searchCondition = "캠방"; break;
		case 3 : searchCondition = "게임"; break;
		case 4 : searchCondition = "음악"; break;
		case 5 : searchCondition = "야방"; break;
		case 6 : searchCondition = "취미"; break;
		case 7 : searchCondition = "펫방"; break;
		case 8 : searchCondition = "스포츠"; break;
		case 9 : searchCondition = "라디오"; break;
		default : searchCondition = "기타"; break;
		}
		
		list = (ArrayList) sqlSession.selectList("Streaming.searchAllVodList", searchCondition);
		
		return list;
	}


	//방송 시작 스트리머 정보 가져오기
	@Override
	public HashMap<String, Object> getStreamingInfo(SqlSessionTemplate sqlSession, BroadHis broadHis) {
		return sqlSession.selectOne("Streaming.getStreamingInfo",broadHis);
	}

	//방송 입장 스트리머 정보 가져오기
	@Override
	public HashMap<String, Object> getBroadInfo(SqlSessionTemplate sqlSession, String streamerAddress) {
		return sqlSession.selectOne("Streaming.getBroadInfo",streamerAddress);
	}

	//방송 추천
	@Override
	public int recomStreamer(SqlSessionTemplate sqlSession, String mid, String streamerAddress) {
		HashMap<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("mid", mid);
		hmap.put("streamerAddress", streamerAddress);
		return sqlSession.update("Streaming.recomStreamer",hmap);
	}

	//현 방송 내 추천
	@Override
	public int recomBroad(SqlSessionTemplate sqlSession, String streamerAddress) {
		return sqlSession.update("Streaming.recomBroad",streamerAddress);
	}

	//현재 방송 추천 수
	@Override
	public int currRecom(SqlSessionTemplate sqlSession, String roomId) {
		return sqlSession.selectOne("Streaming.currRecom",roomId);
	}

	//시청자 순으로 정렬한 All Live 방송 조회
	@Override
	public ArrayList<BroadList> sortVAllLiveList(SqlSessionTemplate sqlSession) {
		ArrayList<BroadList> list = (ArrayList) sqlSession.selectList("Streaming.sortVAllLiveList");
		
		return list;
	}

	//시청자 순으로 정렬한 All Vod 방송 조회
	@Override
	public ArrayList<BroadList> sortVAllVodList(SqlSessionTemplate sqlSession) {
		ArrayList<BroadList> list = (ArrayList) sqlSession.selectList("Streaming.sortVAllVodList");
		
		return list;
	}

	//시청자 순으로 정렬한 All Live 방송 조회(조건있음)
	@Override
	public ArrayList<BroadList> sortVAllLiveList2(SqlSessionTemplate sqlSession, int condition) {
		ArrayList<BroadList> list = null;
		
		String searchCondition = "";

		switch(condition) {
		case 1 : return (ArrayList) sqlSession.selectList("Streaming.sortVAllLiveList");
		case 2 : searchCondition = "캠방"; break;
		case 3 : searchCondition = "게임"; break;
		case 4 : searchCondition = "음악"; break;
		case 5 : searchCondition = "야방"; break;
		case 6 : searchCondition = "취미"; break;
		case 7 : searchCondition = "펫방"; break;
		case 8 : searchCondition = "스포츠"; break;
		case 9 : searchCondition = "라디오"; break;
		default : searchCondition = "기타"; break;
		}
		
		list = (ArrayList) sqlSession.selectList("Streaming.sortVAllLiveList2", searchCondition);
		
		return list;
	}

	//시청자 순으로 정렬한 All Vod 방송 조회(조건있음)
	@Override
	public ArrayList<BroadList> sortVAllVodList2(SqlSessionTemplate sqlSession, int condition) {
		ArrayList<BroadList> list = null;
		
		String searchCondition = "";

		switch(condition) {
		case 1 : return (ArrayList) sqlSession.selectList("Streaming.sortVAllVodList");
		case 2 : searchCondition = "캠방"; break;
		case 3 : searchCondition = "게임"; break;
		case 4 : searchCondition = "음악"; break;
		case 5 : searchCondition = "야방"; break;
		case 6 : searchCondition = "취미"; break;
		case 7 : searchCondition = "펫방"; break;
		case 8 : searchCondition = "스포츠"; break;
		case 9 : searchCondition = "라디오"; break;
		default : searchCondition = "기타"; break;
		}
		
		list = (ArrayList) sqlSession.selectList("Streaming.sortVAllVodList2", searchCondition);
		
		return list;
	}
	
	//추천 순으로 정렬한 All Live 방송 조회
	@Override
	public ArrayList<BroadList> sortRAllLiveList(SqlSessionTemplate sqlSession) {
		ArrayList<BroadList> list = (ArrayList) sqlSession.selectList("Streaming.sortRAllLiveList");
		
		return list;
	}

	//추천 순으로 정렬한 All Vod 방송 조회
	@Override
	public ArrayList<BroadList> sortRAllVodList(SqlSessionTemplate sqlSession) {
		ArrayList<BroadList> list = (ArrayList) sqlSession.selectList("Streaming.sortRAllVodList");
		
		return list;
	}

	//추천 순으로 정렬한 All Live 방송 조회(조건있음)
	@Override
	public ArrayList<BroadList> sortRAllLiveList2(SqlSessionTemplate sqlSession, int condition) {
		ArrayList<BroadList> list = null;
		
		String searchCondition = "";

		switch(condition) {
		case 1 : return (ArrayList) sqlSession.selectList("Streaming.sortRAllLiveList");
		case 2 : searchCondition = "캠방"; break;
		case 3 : searchCondition = "게임"; break;
		case 4 : searchCondition = "음악"; break;
		case 5 : searchCondition = "야방"; break;
		case 6 : searchCondition = "취미"; break;
		case 7 : searchCondition = "펫방"; break;
		case 8 : searchCondition = "스포츠"; break;
		case 9 : searchCondition = "라디오"; break;
		default : searchCondition = "기타"; break;
		}
		
		list = (ArrayList) sqlSession.selectList("Streaming.sortRAllLiveList2", searchCondition);
		
		return list;
	}

	//추천 순으로 정렬한 All Vod 방송 조회(조건있음)
	@Override
	public ArrayList<BroadList> sortRAllVodList2(SqlSessionTemplate sqlSession, int condition) {
		ArrayList<BroadList> list = null;
		
		String searchCondition = "";

		switch(condition) {
		case 1 : return (ArrayList) sqlSession.selectList("Streaming.sortRAllVodList");
		case 2 : searchCondition = "캠방"; break;
		case 3 : searchCondition = "게임"; break;
		case 4 : searchCondition = "음악"; break;
		case 5 : searchCondition = "야방"; break;
		case 6 : searchCondition = "취미"; break;
		case 7 : searchCondition = "펫방"; break;
		case 8 : searchCondition = "스포츠"; break;
		case 9 : searchCondition = "라디오"; break;
		default : searchCondition = "기타"; break;
		}
		
		list = (ArrayList) sqlSession.selectList("Streaming.sortRAllVodList2", searchCondition);
		
		return list;
	}

	@Override
	public ArrayList<HashMap<String, Object>> subInfoMap(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("Streaming.subInfoMap", mno);
	}

	@Override
	public int insertAlarm(SqlSessionTemplate sqlSession, HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Streaming.insertAlarm",hashMap);
	}


}