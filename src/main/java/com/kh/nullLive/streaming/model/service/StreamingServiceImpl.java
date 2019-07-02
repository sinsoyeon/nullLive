package com.kh.nullLive.streaming.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nullLive.member.model.vo.Member;
import com.kh.nullLive.streamer.model.vo.Streamer;
import com.kh.nullLive.streaming.model.dao.StreamingDao;
import com.kh.nullLive.streaming.model.exception.StreamerInsertException;
import com.kh.nullLive.streaming.model.exception.StreamerUpdateException;

@Service
public class StreamingServiceImpl implements StreamingService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StreamingDao sd;

	//최초 방송 약관 동의 처리
	@Override
	public int streamerChange(Member loginUser, Streamer streamer)
			throws StreamerUpdateException, StreamerInsertException {
		int result = 0;
		result = sd.isStreamerUpdate(sqlSession,loginUser);
		
		if(result <= 0) {
			throw new StreamerUpdateException("업데이트 실패!");
		}else {
			result = sd.insertStreamer(sqlSession,loginUser,streamer);
			if(result <= 0) {
				throw new StreamerInsertException("스트리머 추가 실패!");
			}
		}
		return result;
	}

	//멤버 재로드
	@Override
	public Member resetMember(int mno) {
		return sd.resetMember(sqlSession,mno);
	}
	
}
