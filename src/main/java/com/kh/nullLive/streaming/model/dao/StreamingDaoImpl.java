package com.kh.nullLive.streaming.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.vo.BroadHis;


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
	public ArrayList<HashMap<String, Object>> selectHotLiveList(SqlSessionTemplate sqlSession) {
		ArrayList<HashMap<String, Object>>hmap = (ArrayList) sqlSession.selectList("Streaming.selectHotLiveList");
		
		return hmap;
	}

}
