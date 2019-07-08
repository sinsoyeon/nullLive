package com.kh.nullLive.streaming.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streaming.model.dao.StreamingDao;
import com.kh.nullLive.streaming.model.exception.EnterStreamingException;
import com.kh.nullLive.streaming.model.vo.BroadHis;

@Service
public class StreamingServiceImpl implements StreamingService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StreamingDao sd;
	
	//스트리밍 시작
	@Override
	public void startStreaming(BroadHis broadHis) {
		int result = sd.startStreaming(sqlSession,broadHis);
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
	public BroadHis enterStream(Member loginUser, String streamerAddress) throws EnterStreamingException {
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
		BroadHis braodHis = sd.getBroadHis(sqlSession,streamerAddress);
		return braodHis;
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

	
}
